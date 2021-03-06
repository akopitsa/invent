<?php
/*
 This file is part of the genericobject plugin.

 Genericobject plugin is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 Genericobject plugin is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Genericobject. If not, see <http://www.gnu.org/licenses/>.
 --------------------------------------------------------------------------
 @package   genericobject
 @author    the genericobject plugin team
 @copyright Copyright (c) 2010-2011 Order plugin team
 @license   GPLv2+
            http://www.gnu.org/licenses/gpl.txt
 @link      https://forge.indepnet.net/projects/genericobject
 @link      http://www.glpi-project.org/
 @since     2009
 ---------------------------------------------------------------------- */
 
class PluginGenericobjectObject extends CommonDBTM {

   protected $objecttype;
   
   //Internal field counter
   private $cpt = 0;
   
   static function install() {
   }
   
   static function uninstall() {
   }
   
   static function registerType() {
      global $DB, $LANG, $PLUGIN_HOOKS, $UNINSTALL_TYPES, $ORDER_TYPES;
      
      $class  = get_called_class();
      $item   = new $class();
      $fields = PluginGenericobjectSingletonObjectField::getInstance($class);
      $plugin = new Plugin();

      PluginGenericobjectType::includeLocales($item->objecttype->fields['name']);
      PluginGenericobjectType::includeConstants($item->objecttype->fields['name']);

      $options = array("document_types"         => $item->canUseDocuments(),
                       "helpdesk_visible_types" => $item->canUseTickets(),
                       "linkgroup_types"        => $item->canUseTickets() 
                                                    && isset ($fields["groups_id"]),
                       "linkuser_types"         => $item->canUseTickets() 
                                                   && isset ($fields["users_id"]),
                       "ticket_types"           => $item->canUseTickets(),
                       "infocom_types"          => $item->canUseInfocoms(),
                       "networkport_types"      => $item->canUseNetworkPorts(),
                       "reservation_types"      => $item->canBeReserved(),
                       "contract_types"         => $item->canUseContracts(),
                       "unicity_types"          => $item->canUseUnicity());
      Plugin::registerClass($class, $options);
      if (Session::haveRight($class, "r")) {
         //Change url for adding a new object, depending on template management activation
         if ($item->canUseTemplate()) {
            //Template management is active
            $add_url = "/front/setup.templates.php?itemtype=$class&amp;add=1";
            $PLUGIN_HOOKS['submenu_entry']['genericobject']['options'][$class]['links']['template']
                                                        = "/front/setup.templates.php?itemtype=$class&amp;add=0";
         } else {
            //Template management is not active
            $add_url = Toolbox::getItemTypeFormURL($class, false);
         }
         //Menu management
         $PLUGIN_HOOKS['submenu_entry']['genericobject']['options'][$class]['title']
                                                   = call_user_func(array($class, 'getTypeName'));
         $PLUGIN_HOOKS['submenu_entry']['genericobject']['options'][$class]['page']
                                                   = Toolbox::getItemTypeSearchURL($class, false);
         $PLUGIN_HOOKS['submenu_entry']['genericobject']['options'][$class]['links']['search']
                                                    = Toolbox::getItemTypeSearchURL($class, false);
         $PLUGIN_HOOKS['submenu_entry']['genericobject']['options'][$class]['links']['add']
                                                      = $add_url;
   
         //Add configuration icon, if user has right
         if (Session::haveRight('config', 'w')) {
            $PLUGIN_HOOKS['submenu_entry']['genericobject']['options'][$class]['links']['config'] 
                                        = Toolbox::getItemTypeSearchURL('PluginGenericobjectType',false)."?itemtype=$class";
         }
         
         //Item can be linked to tickets
         if ($item->canUseTickets()) {
            $_SESSION['glpiactiveprofile']['helpdesk_item_type'][] = $class;
         }
         if ($item->canUsePluginUninstall()) {
            array_push($UNINSTALL_TYPES, $class);
         }
         if ($item->canUsePluginOrder()) {
            array_push($ORDER_TYPES, $class);
         }
      }
   }
   
   //Get itemtype name
   static function getTypeName() {
      global $LANG;
      $class    = get_called_class();
      //Datainjection : Don't understand why I need this trick : need to be investigated !
      if(preg_match("/Injection$/i",$class)) {
         $class = str_replace("Injection", "", $class);
      }
      $item     = new $class();
      //Itemtype name can be contained in a specific locale field : try to load it
      PluginGenericobjectType::includeLocales($item->objecttype->fields['name']);
      if(isset($LANG['genericobject'][$class][0])) {
         return $LANG['genericobject'][$class][0];
      } else {
         return $item->objecttype->fields['name'];
      }
   }
   
   
   public function __construct() {
      $class       = get_called_class();
      $this->table = getTableForItemType($class);
      if (class_exists($class)) {
         $this->objecttype = PluginGenericobjectType::getInstance($class);
      }
      $this->dohistory = $this->canUseHistory();
   }
   
   function canCreate() {
      return Session::haveRight(get_called_class(), 'w');
   }

   function canView() {
      return Session::haveRight(get_called_class(), 'r');
   }

   function defineTabs($options=array()) {
      global $LANG;
      $ong = array ();

      if (!$this->isNewItem()) {

         if ($this->canUseNetworkPorts()) {
            $this->addStandardTab('NetworkPort', $ong, $options);
         }

         if ($this->canUseInfocoms()) {
            $this->addStandardTab('Infocom', $ong, $options);
         }

         if ($this->canUseContracts()) {
            $this->addStandardTab('Contract_Item', $ong, $options);
         }

         if ($this->canUseDocuments()) {
            $this->addStandardTab('Document', $ong, $options);
         }

         if ($this->canUseTickets()) {
            $this->addStandardTab('Ticket', $ong, $options);
         }

         if ($this->canUseNotepad() && Session::haveRight("notes", "r")) {
            $this->addStandardTab('Note',$ong, $options);
         }

         if ($this->canBeReserved()) {
            $this->addStandardTab('Reservation', $ong, $options);
         }

         if ($this->canUseHistory()) {
            $this->addStandardTab('Log',$ong, $options);
         }
      }
      return $ong;
   }

   //------------------------ CAN methods -------------------------------------//
   function canUseInfocoms() {
      return ($this->objecttype->canUseInfocoms() || Session::haveRight("infocom", "r"));
   }

   function canUseContracts() {
      return ($this->objecttype->canUseContracts() || Session::haveRight("contract", "r"));
   }

   function canUseTemplate() {
      return $this->objecttype->canUseTemplate();
   }

   function canUseUnicity() {
      return ($this->objecttype->canUseUnicity() || Session::haveRight("config", "r"));
   }

   function canUseDocuments() {
      return ($this->objecttype->canUseDocuments() && Session::haveRight("document", "r"));
   }

   function canUseTickets() {
      return ($this->objecttype->canUseTickets());
   }

   function canUseNotepad() {
      return ($this->objecttype->canUseNotepad() && Session::haveRight("notes", "r"));
   }

   function canBeReserved() {
      return ($this->objecttype->canBeReserved() 
         && (Session::haveRight("reservation_central", "r") 
            || Session::haveRight("reservation_helpdesk", '1')));
   }

   function canUseHistory() {
      return ($this->objecttype->canUseHistory());
   }

   function canUsePluginDataInjection() {
      return ($this->objecttype->canUsePluginDataInjection());
   }

   function canUsePluginPDF() {
      return ($this->objecttype->canUsePluginPDF());
   }

   function canUsePluginOrder() {
      return ($this->objecttype->canUsePluginOrder());
   }

   function canUseNetworkPorts() {
      return ($this->objecttype->canUseNetworkPorts());
   }

   function canUseDirectConnections() {
      return ($this->objecttype->canUseDirectConnections());
   }

   function canUsePluginUninstall() {
      return ($this->objecttype->canUsePluginUninstall());
   }

   function title() {
   }

   function showForm($id, $options=array(), $previsualisation = false) {
      global $LANG, $DB;

      if ($previsualisation) {
         $canedit = true;
         $this->getEmpty();
      } else {
         if ($id > 0) {
            $this->check($id, 'r');
         } else {
            // Create item 
            $this->check(-1, 'w');
            $this->getEmpty();
         }

         $this->showTabs($options);
         $canedit = $this->can($id, 'w');
      }

      if (isset($options['withtemplate']) && $options['withtemplate'] == 2) {
         $template   = "newcomp";
         $datestring = $LANG['computers'][14]." : ";
         $date       = Html::convDateTime($_SESSION["glpi_currenttime"]);
      } else if (isset($options['withtemplate']) && $options['withtemplate'] == 1) {
         $template   = "newtemplate";
         $datestring = $LANG['computers'][14]." : ";
         $date       = Html::convDateTime($_SESSION["glpi_currenttime"]);
      } else {
         $datestring = $LANG['common'][26].": ";
         $date       = Html::convDateTime($this->fields["date_mod"]);
         $template   = false;
      }

      $this->fields['id'] = $id;
      $this->showFormHeader($options);

      if ($previsualisation) {
         echo "<tr><th colspan='4'>".$LANG['genericobject']['config'][8]."</th></tr>";
      }
      
      foreach (PluginGenericobjectSingletonObjectField::getInstance($this->objecttype->fields['itemtype']) 
               as $field => $description) {
         $this->displayField($canedit, $field, $this->fields[$field], $description);
      }
      $this->closeColumn();
      
      if (!$this->isNewID($id)) {
         echo "<tr class='tab_bg_1'>";
         echo "<td colspan='2' class='center'>".$datestring.$date;
         if (!$template && !empty($this->fields['template_name'])) {
            echo "<span class='small_space'>(".$LANG['common'][13]."&nbsp;: ".
                  $this->fields['template_name'].")</span>";
         }
         echo "</td></tr>";
      }
      
      if (!$previsualisation) {
         $this->showFormButtons($options);
         echo "<div id='tabcontent'></div>";
         echo "<script type='text/javascript'>loadDefaultTab();</script>";
      } else {
         echo "</table></div></form>";
      }
   }

   static function getFieldsToHide() {
      return array('id', 'is_recursive', 'is_template', 'template_name', 'is_deleted', 
                   'entities_id', 'notepad', 'date_mod');
   }
   
   function displayField($canedit, $name, $value, $description = array()) {
      global $GO_BLACKLIST_FIELDS;

      $searchoption  = PluginGenericobjectField::getOptionsWithGlobal($name, get_called_class());

      if (!empty($searchoption) 
         && !in_array($name, self::getFieldsToHide())) {

         $this->startColumn();
         echo $searchoption['name'];
         $this->endColumn();
         $this->startColumn();
         switch ($description['Type']) {
            case "int(11)":
               $fk_table = getTableNameForForeignKeyField($name);
               if ($fk_table != '') {
                  $itemtype   = getItemTypeForTable($fk_table); 
                  $dropdown   = new $itemtype();
                  $parameters = array('name' => $name, 'value' => $value, 'comments' => true);
                  if ($dropdown->isEntityAssign()) {
                     $parameters["entity"] = $this->fields['entities_id'];
                  }
                  if ($dropdown->maybeRecursive()) {
                     $parameters['entity_sons'] = true;
                  }
                  if(isset($searchoption['condition'])) {
                     $parameters['condition'] = $searchoption['condition'];
                  }
                  Dropdown::show($itemtype, $parameters);
               } else {
                  $min = $max = $step = 0;
                  if (isset($searchoption['min'])) {
                     $min = $searchoption['min'];
                  } else {
                     $min = 0;
                  }
                  if (isset($searchoption['max'])) {
                     $max = $searchoption['max'];
                  } else {
                     $max = 100;
                  }
                  if (isset($searchoption['step'])) {
                     $step = $searchoption['step'];
                  } else {
                     $step = 1;
                  }
                  Dropdown::showInteger($name, $value, $min, $max, $step);
               }
               break;

            case "tinyint(1)":
               Dropdown::showYesNo($name, $value);
               break;

            case "varchar(255)":
                  Html::autocompletionTextField($this, $name);
               break;

            case "longtext":
            case "text":
               echo "<textarea cols='40' rows='4' name='" . $name . "'>" . $value . 
                     "</textarea>";
               break;

            case "date":
                  Html::showDateFormItem($name, $value, false, true);
                  break;

            case "datetime":
                  Html::showDateTimeFormItem($name, $value, false, true);
                  break;

            default:
            case "float":
                  echo "<input type='text' name='$name' value='$value'>";
                  break;
         }
         $this->endColumn();
      }
   }

   /**
   * Add a new column
   **/
   function startColumn() {
      if ($this->cpt == 0) {
         echo "<tr class='tab_bg_1'>";
      }

      echo "<td>";
      $this->cpt++;
   }

   /**
   * End a column
   **/
   function endColumn() {
      echo "</td>";

      if ($this->cpt == 4) {
         echo "</tr>";
         $this->cpt = 0;
      }

   }

   /**
   * Close a column
   **/
   function closeColumn() {
      if ($this->cpt > 0) {
         while ($this->cpt < 4) {
            echo "<td></td>";
            $this->cpt++;
         }
         echo "</tr>";
      }
   }

   function prepareInputForAdd($input) {

      //Template management
      if (isset ($input["id"]) && $input["id"] > 0) {
         $input["_oldID"] = $input["id"];
      }
      unset ($input['id']);
      unset ($input['withtemplate']);

      return $input;
   }

   function post_addItem() {
      global $DB;
      // Manage add from template
      if (isset ($this->input["_oldID"])) {
         // ADD Infocoms
         $ic = new Infocom();
         if ($this->canUseInfocoms() 
            && $ic->getFromDBforDevice($this->type, $this->input["_oldID"])) {
            $ic->fields["items_id"] = $this->fields['id'];
            unset ($ic->fields["id"]);
            if (isset ($ic->fields["immo_number"])) {
               $ic->fields["immo_number"] = autoName($ic->fields["immo_number"], "immo_number", 1, 
                                                     'Infocom', $this->input['entities_id']);
            }
            if (empty ($ic->fields['use_date'])) {
               unset ($ic->fields['use_date']);
            }
            if (empty ($ic->fields['buy_date'])) {
               unset ($ic->fields['buy_date']);
            }
            $ic->addToDB();
         }

         foreach (array('Document_Item' => 'documents_id', 
                        'Contract_Item' => 'contracts_id') as $type => $fk) {
            $item = new $type();
            foreach ($item->find("items_id='" . $this->input["_oldID"] . "' 
                                 AND itemtype='" . $this->type . "'") as $tmpid => $data) {
               $tmp             = array();
               $tmp['items_id'] = $this->input["_oldID"];
               $tmp['itemtype'] = $type;
               $tmp[$fk]        = $data[$fk];
               $item->add($tmp);
            }
         }
         
         if ($this->canUseNetworkPorts()) {
            // ADD Ports
            $query  = "SELECT `id`
                       FROM `glpi_networkports`
                       WHERE `items_id` = '".$this->input["_oldID"]."'
                          AND `itemtype` = '".get_called_class()."';";
            $result = $DB->query($query);
            if ($DB->numrows($result) > 0) {
               while ($data = $DB->fetch_array($result)) {
                  $np  = new NetworkPort();
                  $npv = new NetworkPort_Vlan();
                  $np->getFromDB($data["id"]);
                  unset($np->fields["id"]);
                  unset($np->fields["ip"]);
                  unset($np->fields["mac"]);
                  unset($np->fields["netpoints_id"]);
                  $np->fields["items_id"] = $this->fields['id'];
                  $portid = $np->addToDB();
                  foreach ($DB->request('glpi_networkports_vlans',
                                        array('networkports_id' => $data["id"])
                          ) as $vlan) {
                     $npv->assignVlan($portid, $vlan['vlans_id']);
                  }
               }
            }
         }

      }
   }

   function cleanDBonPurge() {
      $parameters = array('items_id' => $this->getID(), 'itemtype' => get_called_class());
      $types      = array('Ticket', 'NetworkPort', 'NetworkPort_NetworkPort', 'Computer_Item', 
                          'ReservationItem', 'Document_Item', 'Infocom', 'Contract_Item');
      foreach ($types as $type) {
         $item = new $type();
         $item->deleteByCriteria($parameters);
      }
   }
   
   /**
    * Display object preview form
    * @param type the object type
    */
   public static function showPrevisualisationForm(PluginGenericobjectType $type) {
      global $LANG;
      $itemtype = $type->fields['itemtype'];
      $item     = new $itemtype();
      
      if (Session::haveRight($itemtype, 'r')) {
         $item->showForm(-1, array(), true);
      } else {
         echo "<br><strong>" . $LANG['genericobject']['fields'][9] . "</strong><br>";
      }
   }
   
   function getSearchOptions() {
      return $this->getObjectSearchOptions(false);
   }
   
   function getObjectSearchOptions($with_linkfield = false) {
      global $DB, $GO_FIELDS, $GO_BLACKLIST_FIELDS;
      
      $datainjection_blacklisted = array('id', 'date_mod', 'entities_id');
      $index_exceptions = array('entities_id' => 80, 'is_recursive' => 86, 'date_mod' => 19, 
                                'comment' => 16, 'notepad' => 90, 'name' => 1, 'id' => 2);
      $index   = 3;
      $options = array();
      $table   = getTableForItemType(get_called_class());
      foreach (PluginGenericobjectSingletonObjectField::getInstance(get_called_class()) as $field => $values) {
         $searchoption = PluginGenericobjectField::getOptionsWithGlobal($field, 
                                                                        $this->objecttype->fields['itemtype']);
         
         //Some fields have fixed index values...
         $currentindex = $index;
         if (isset($index_exceptions[$field])) {
            $currentindex = $index_exceptions[$field];
         }
         
         if (in_array($field,array('is_deleted'))) {
            continue;
         }

         $item = new $this->objecttype->fields['itemtype'];

         //Table definition
         $tmp  = getTableNameForForeignKeyField($field);


         if ($with_linkfield) {
            $options[$currentindex]['linkfield'] = $field;
         }

         if ($tmp != '') {
            $itemtype   = getItemTypeForTable($tmp);
            $tmpobj     = new $itemtype();

            //Set table
            $options[$currentindex]['table'] = $tmp;
            
            //Set field
            if ($tmpobj instanceof CommonTreeDropdown) {
               $options[$currentindex]['field'] = 'completename';
            } else {
               $options[$currentindex]['field'] = 'name';
            }

         } else {
            $options[$currentindex]['table'] = $table;
            $options[$currentindex]['field'] = $field;

         }

         $options[$currentindex]['name']  = $searchoption['name'];
         
         //Massive action or not
         if (isset($searchoption['massiveaction'])) {
            $options[$currentindex]['massiveaction'] 
               = $searchoption['massiveaction'];
         }


         //Datainjection option
         if (!in_array($field, $datainjection_blacklisted)) {
            $options[$currentindex]['injectable'] = 1;
         } else {
            $options[$currentindex]['injectable'] = 0;
         }
         
         //Field type
         switch ($values['Type']) {
            default:
            case "varchar(255)":
               if ($field == 'name') {
                  $options[$currentindex]['datatype']      = 'itemlink';
                  $options[$currentindex]['itemlink_type'] = get_called_class();
                  $options[$currentindex]['massiveaction'] = false;
               } else {
                  if (isset($searchoption['datatype']) && $searchoption['datatype'] == 'weblink') {
                     $options[$currentindex]['datatype'] = 'weblink';
                  } else {
                     $options[$currentindex]['datatype'] = 'string';
                  }
               }
               if ($item->canUsePluginDataInjection()) {
                  //Datainjection specific
                  $options[$currentindex]['checktype']   = 'text';
                  $options[$currentindex]['displaytype'] = 'text';
               }
               break;
            case "tinyint(1)":
               $options[$currentindex]['datatype'] = 'bool';
               if ($item->canUsePluginDataInjection()) {
                  //Datainjection specific
                  $options[$currentindex]['displaytype'] = 'bool';
               }
               break;
            case "text":
            case "longtext":
               $options[$currentindex]['datatype'] = 'text';
               if ($item->canUsePluginDataInjection()) {
                  //Datainjection specific
                  $options[$currentindex]['displaytype'] = 'multiline_text';
               }
               break;
            case "int(11)":
               $options[$currentindex]['datatype'] = 'integer';
               if ($item->canUsePluginDataInjection()) {
                  if ($tmp != '') {
                     $options[$currentindex]['displaytype'] = 'dropdown';
                     $options[$currentindex]['checktype']   = 'text';
                  } else {
                     //Datainjection specific
                     $options[$currentindex]['displaytype'] = 'dropdown_integer';
                     $options[$currentindex]['checktype']   = 'integer';
                  }
               }
               break;
            case "float":
                $options[$currentindex]['datatype'] = 'decimal';
               if ($item->canUsePluginDataInjection()) {
                  //Datainjection specific
                  $options[$currentindex]['display']   = 'multiline_text';
                  $options[$currentindex]['checktype'] = 'integer';
               }
               break;
            case "date":
               $options[$currentindex]['datatype'] = 'date';
               if ($item->canUsePluginDataInjection()) {
                  //Datainjection specific
                  $options[$currentindex]['displaytype'] = 'date';
                  $options[$currentindex]['checktype']   = 'date';
               }
               break;
            case "datetime":
               $options[$currentindex]['datatype'] = 'datetime';
               if ($item->canUsePluginDataInjection()) {
                  //Datainjection specific
                  $options[$currentindex]['displaytype'] = 'date';
                  $options[$currentindex]['checktype']   = 'date';
               }
               break;
         }
         $index++;
      }

      return $options;
   }

   //Datainjection specific methods
   function isPrimaryType() {
      return true;
   }
   
   function connectedTo() {
      return array();
   }
   
   /**
    * Standard method to add an object into glpi
    *
    * @param values fields to add into glpi
    * @param options options used during creation
    * @return an array of IDs of newly created objects : for example array(Computer=>1, Networkport=>10)
    *
   **/
   function addOrUpdateObject($values=array(), $options=array()) {

      $lib = new PluginDatainjectionCommonInjectionLib($this, $values, $options);
      $lib->processAddOrUpdate();
      return $lib->getInjectionResults();
   }

   function getOptions($primary_type = '') {
      return Search::getOptions($primary_type);
   }
   
   function transfer($new_entity) {
      global $DB;
      if ($this->fields['id'] > 0 && $this->fields['entities_id'] != $new_entity) {
         //Update entity for this object
         $tmp['id']          = $this->fields['id'];
         $tmp['entities_id'] = $new_entity;
         $this->update($tmp);

         $toupdate = array('id' => $this->fields['id']);
         foreach (PluginGenericobjectSingletonObjectField::getInstance(get_called_class()) as $field => $data) {
            $table = getTableNameForForeignKeyField($field);

            //It is a dropdown table !
            if ($field != 'entities_id' 
               && $table != '' 
                  && isset($this->fields[$field]) && $this->fields[$field] > 0) {
               //Instanciate a new dropdown object
               $dropdown_itemtype = getItemTypeForTable($table);
               $dropdown          = new $dropdown_itemtype();
               $dropdown->getFromDB($this->fields[$field]);
               
               //If dropdown is only accessible in the other entity
               //do not go further
               if (!$dropdown->isEntityAssign() 
                  || in_array($new_entity, getAncestorsOf('glpi_entities', 
                                                          $dropdown->getEntityID()))) {
                  continue;
               } else {
                  $tmp   = array();
                  $where = "";
                  if ($dropdown instanceof CommonTreeDropdown) {
                     $tmp['completename'] = $dropdown->fields['completename'];
                     $where               = "`completename`='".
                                             addslashes_deep($tmp['completename'])."'";
                  } else {
                     $tmp['name'] = $dropdown->fields['name'];
                     $where       = "`name`='".addslashes_deep($tmp['name'])."'";
                  }
                  $tmp['entities_id'] = $new_entity;
                  $where             .= " AND `entities_id`='".$tmp['entities_id']."'";
                  //There's a dropdown value in the target entity
                  if ($found = $this->find($where)) {
                     $myfound = array_pop($found);
                     if ($myfound['id'] != $this->fields[$field]) {
                        $toupdate[$field] = $myfound['id'];
                     }
                  } else {
                     $clone = $dropdown->fields;
                     if ($dropdown instanceof CommonTreeDropdown) {
                        unset($clone['completename']);
                     }
                     unset($clone['id']);
                     $clone['entities_id'] = $new_entity;
                     $new_id               = $dropdown->import($clone);
                     $toupdate[$field]     = $new_id;
                  }
               }
            }
         }
         $this->update($toupdate);
      }
      return true;
   }
}