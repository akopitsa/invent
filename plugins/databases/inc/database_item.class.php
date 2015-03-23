<?php
/*
 * @version $Id: HEADER 15930 2011-10-30 15:47:55Z tsmr $
 -------------------------------------------------------------------------
 Databases plugin for GLPI
 Copyright (C) 2003-2011 by the databases Development Team.

 https://forge.indepnet.net/projects/databases
 -------------------------------------------------------------------------

 LICENSE
		
 This file is part of databases.

 Databases is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 Databases is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Databases. If not, see <http://www.gnu.org/licenses/>.
 --------------------------------------------------------------------------
 */

if (!defined('GLPI_ROOT')) {
	die("Sorry. You can't access directly to this file");
}

class PluginDatabasesDatabase_Item extends CommonDBTM {

   // From CommonDBRelation
   public $itemtype_1 = "PluginDatabasesDatabase";
   public $items_id_1 = 'plugin_databases_databases_id';

   public $itemtype_2 = 'itemtype';
   public $items_id_2 = 'items_id';
   
   function canCreate() {
      return plugin_databases_haveRight('databases', 'w');
   }

   function canView() {
      return plugin_databases_haveRight('databases', 'r');
   }
   
   static function cleanForItem(CommonDBTM $item) {

      $temp = new self();
      $temp->deleteByCriteria(
         array('itemtype' => $item->getType(),
               'items_id' => $item->getField('id'))
      );
   }
   
	/*static function getClasses($all=false) {
	
      static $types = array(
         'Computer','Software'
         );

      $plugin = new Plugin();
      if ($plugin->isActivated("appliances")) {
         $types[] = 'PluginAppliancesAppliance';
      }
      if ($plugin->isActivated("webapplications")) {
         $types[] = 'PluginWebapplicationsWebapplication';
      }
      
      if ($all) {
         return $types;
      }
      
      foreach ($types as $key=>$type) {
         if (!class_exists($type)) {
            continue;
         }
         $item = new $type();
         if (!$item->canView()) {
            unset($types[$key]);
         }
      }
      return $types;
   }*/
   
   function getTabNameForItem(CommonGLPI $item, $withtemplate=0) {
      global $LANG;

      if (!$withtemplate) {
         if ($item->getType()=='PluginDatabasesDatabase'
             && count(PluginDatabasesDatabase::getTypes(false))) {
            if ($_SESSION['glpishow_count_on_tabs']) {
               return self::createTabEntry($LANG['document'][19], self::countForDatabase($item));
            }
            return $LANG['document'][19];

         } else if (in_array($item->getType(), PluginDatabasesDatabase::getTypes(true))
                    && plugin_databases_haveRight('databases', 'r')) {
            if ($_SESSION['glpishow_count_on_tabs']) {
               return self::createTabEntry(PluginDatabasesDatabase::getTypeName(2), self::countForItem($item));
            }
            return PluginDatabasesDatabase::getTypeName(2);
         }
      }
      return '';
   }


   static function displayTabContentForItem(CommonGLPI $item, $tabnum=1, $withtemplate=0) {
   
      $self = new self();
      
      if ($item->getType()=='PluginDatabasesDatabase') {
         
         $self->showItemFromPlugin($item->getID());

      } else if (in_array($item->getType(), PluginDatabasesDatabase::getTypes(true))) {
         
            $self->showPluginFromItems(get_class($item),$item->getField('id'));
      }
      return true;
   }
   
   static function countForDatabase(PluginDatabasesDatabase $item) {

      $types = implode("','", $item->getTypes());
      if (empty($types)) {
         return 0;
      }
      return countElementsInTable('glpi_plugin_databases_databases_items',
                                  "`itemtype` IN ('$types')
                                   AND `plugin_databases_databases_id` = '".$item->getID()."'");
   }


   static function countForItem(CommonDBTM $item) {

      return countElementsInTable('glpi_plugin_databases_databases_items',
                                  "`itemtype`='".$item->getType()."'
                                   AND `items_id` = '".$item->getID()."'");
   }
   
	function getFromDBbyDatabasesAndItem($plugin_databases_databases_id,$items_id,$itemtype) {
		global $DB;
		
		$query = "SELECT * FROM `".$this->getTable()."` " .
			"WHERE `plugin_databases_databases_id` = '" . $plugin_databases_databases_id . "' 
			AND `itemtype` = '" . $items_id . "'
			AND `items_id` = '" . $itemtype . "'";
		if ($result = $DB->query($query)) {
			if ($DB->numrows($result) != 1) {
				return false;
			}
			$this->fields = $DB->fetch_assoc($result);
			if (is_array($this->fields) && count($this->fields)) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}
	
	function addItem($values) {

      $this->add(array('plugin_databases_databases_id'=>$values["plugin_databases_databases_id"],
								'items_id'=>$values["items_id"],
								'itemtype'=>$values["itemtype"]));
    
   }

   function deleteItemByDatabasesAndItem($plugin_databases_databases_id,$items_id,$itemtype) {
    
      if ($this->getFromDBbyDatabasesAndItem($plugin_databases_databases_id,$items_id,$itemtype)) {
         $this->delete(array('id'=>$this->fields["id"]));
      }
   }
  
   function showItemFromPlugin($instID,$search='') {
      global $DB,$CFG_GLPI, $LANG;

      if (!$this->canView())	return false;
      
      $rand=mt_rand();
      
      $database=new PluginDatabasesDatabase();
      if ($database->getFromDB($instID)) {
      
         $canedit=$database->can($instID,'w');
         
         $query = "SELECT DISTINCT `itemtype` 
             FROM `".$this->getTable()."` 
             WHERE `plugin_databases_databases_id` = '$instID' 
             ORDER BY `itemtype`";
         $result = $DB->query($query);
         $number = $DB->numrows($result);
      
         if (Session::isMultiEntitiesMode()) {
            $colsup=1;
         } else {
            $colsup=0;
         }
      
         echo "<form method='post' name='databases_form$rand' id='databases_form$rand'  action=\"".$CFG_GLPI["root_doc"]."/plugins/databases/front/database.form.php\">";
    
         echo "<div class='center'><table class='tab_cadre_fixe'>";
         echo "<tr><th colspan='".($canedit?(5+$colsup):(4+$colsup))."'>".$LANG['plugin_databases']['setup'][15].":</th></tr><tr>";
         if ($canedit) {
            echo "<th>&nbsp;</th>";
         }
         echo "<th>".$LANG['common'][17]."</th>";
         echo "<th>".$LANG['common'][16]."</th>";
         if (Session::isMultiEntitiesMode())
            echo "<th>".$LANG['entity'][0]."</th>";
         echo "<th>".$LANG['common'][19]."</th>";
         echo "<th>".$LANG['common'][20]."</th>";
         echo "</tr>";
      
         for ($i=0 ; $i < $number ; $i++) {
            $type=$DB->result($result, $i, "itemtype");
            if (!class_exists($type)) {
               continue;
            }           
            $item = new $type();
            if ($item->canView()) {
               $column="name";
               $table = getTableForItemType($type);

               $query = "SELECT `".$table."`.*, `".$this->getTable()."`.`id` AS items_id, `glpi_entities`.`id` AS entity "
                ." FROM `".$this->getTable()."`, `".$table
                ."` LEFT JOIN `glpi_entities` ON (`glpi_entities`.`id` = `".$table."`.`entities_id`) "
                ." WHERE `".$table."`.`id` = `".$this->getTable()."`.`items_id` 
                AND `".$this->getTable()."`.`itemtype` = '$type' 
                AND `".$this->getTable()."`.`plugin_databases_databases_id` = '$instID' "
                . getEntitiesRestrictRequest(" AND ",$table,'','',$item->maybeRecursive()); 

               if ($item->maybeTemplate()) {
                  $query.=" AND `".$table."`.`is_template` = '0'";
               }
               $query.=" ORDER BY `glpi_entities`.`completename`, `".$table."`.`$column`";

               if ($result_linked=$DB->query($query))
                  if ($DB->numrows($result_linked)) {
                     Session::initNavigateListItems($type,$LANG['plugin_databases']['title'][1]." = ".$database->fields['name']);

                     while ($data=$DB->fetch_assoc($result_linked)) {
                        $item->getFromDB($data["id"]);
                        
                        Session::addToNavigateListItems($type,$data["id"]);
                        $ID="";
                        if ($_SESSION["glpiis_ids_visible"]||empty($data["name"])) $ID= " (".$data["id"].")";
                        $link=Toolbox::getItemTypeFormURL($type);
                        $name= "<a href=\"".$link."?id=".$data["id"]."\">"
                        .$data["name"]."$ID</a>";
                
                        echo "<tr class='tab_bg_1'>";

                        if ($canedit) {
                           echo "<td width='10'>";
                           $sel="";
                           if (isset($_GET["select"])&&$_GET["select"]=="all") $sel="checked";
                           echo "<input type='checkbox' name='item[".$data["items_id"]."]' value='1' $sel>";
                           echo "</td>";
                        }
                        echo "<td class='center'>".$item->getTypeName()."</td>";
                
                        echo "<td class='center' ".(isset($data['is_deleted'])&&$data['is_deleted']?"class='tab_bg_2_2'":"").">".$name."</td>";
                
                        if (Session::isMultiEntitiesMode())
                           echo "<td class='center'>".Dropdown::getDropdownName("glpi_entities",$data['entity'])."</td>";
                           
                        echo "<td class='center'>".(isset($data["serial"])? "".$data["serial"]."" :"-")."</td>";
                        echo "<td class='center'>".(isset($data["otherserial"])? "".$data["otherserial"]."" :"-")."</td>";
                
                        echo "</tr>";
                     }
                  }
            }
         }
    
         if ($canedit)	{
            echo "<tr class='tab_bg_1'><td colspan='".(3+$colsup)."' class='center'>";
            echo "<input type='hidden' name='plugin_databases_databases_id' value='$instID'>";
            Dropdown::showAllItems("items_id",0,0,($database->fields['is_recursive']?-1:$database->fields['entities_id']),PluginDatabasesDatabase::getTypes());
            echo "</td>";
            echo "<td colspan='2' class='tab_bg_2'>";
            echo "<input type='submit' name='additem' value=\"".$LANG['buttons'][8]."\" class='submit'>";
            echo "</td></tr>";
            echo "</table></div>" ;
            
            Html::openArrowMassives("databases_form$rand",true);
            Html::closeArrowMassives(array('deleteitem'=> $LANG['buttons'][6]));

         } else {
    
            echo "</table></div>";
         }
         echo "</form>";
      }
   }

   //items
   function showPluginFromItems($itemtype,$ID,$withtemplate='') {
      global $DB,$CFG_GLPI,$LANG;
    
      $item = new $itemtype();
      $canread = $item->can($ID,'r');
      $canedit = $item->can($ID,'w');
      
      $database=new PluginDatabasesDatabase();
      
      $query = "SELECT `".$this->getTable()."`.`id` AS items_id,`glpi_plugin_databases_databases`.* "
      ."FROM `".$this->getTable()."`,`glpi_plugin_databases_databases` "
      ." LEFT JOIN `glpi_entities` ON (`glpi_entities`.`id` = `glpi_plugin_databases_databases`.`entities_id`) "
      ." WHERE `".$this->getTable()."`.`items_id` = '".$ID."' 
      AND `".$this->getTable()."`.`itemtype` = '".$itemtype."' 
      AND `".$this->getTable()."`.`plugin_databases_databases_id` = `glpi_plugin_databases_databases`.`id` "
      . getEntitiesRestrictRequest(" AND ","glpi_plugin_databases_databases",'','',$database->maybeRecursive());
    
      $query.= " ORDER BY `glpi_plugin_databases_databases`.`name` ";
    
      $result = $DB->query($query);
      $number = $DB->numrows($result);
    
      if (Session::isMultiEntitiesMode()) {
         $colsup=1;
      } else {
         $colsup=0;
      }
    
      if ($withtemplate!=2) echo "<form method='post' action=\"".$CFG_GLPI["root_doc"]."/plugins/databases/front/database.form.php\">";

      echo "<div align='center'><table class='tab_cadre_fixe'>";
      echo "<tr><th colspan='".(6+$colsup)."'>".$LANG['plugin_databases'][21].":</th></tr>";
      echo "<tr><th>".$LANG['plugin_databases'][0]."</th>";
      if (Session::isMultiEntitiesMode())
         echo "<th>".$LANG['entity'][0]."</th>";
      echo "<th>".$LANG['plugin_databases'][14]."</th>";
      echo "<th>".$LANG['plugin_databases']['setup'][1]."</th>";
      echo "<th>".$LANG['plugin_databases']['setup'][12]."</th>";
      echo "<th>".$LANG['plugin_databases']['setup'][14]."</th>";
      if ($this->canCreate())
         if ($withtemplate<2)echo "<th>&nbsp;</th>";
      echo "</tr>";
      $used=array();
      while ($data=$DB->fetch_array($result)) {
         $databasesID=$data["id"];
         $used[]=$databasesID;
         echo "<tr class='tab_bg_1".($data["is_deleted"]=='1'?"_2":"")."'>";

         if ($withtemplate!=3 && $canread && (in_array($data['entities_id'],$_SESSION['glpiactiveentities']) || $data["is_recursive"])) {
            echo "<td class='center'><a href='".$CFG_GLPI["root_doc"]."/plugins/databases/front/database.form.php?id=".$data["id"]."'>".$data["name"];
         if ($_SESSION["glpiis_ids_visible"]) echo " (".$data["id"].")";
            echo "</a></td>";
         } else {
            echo "<td class='center'>".$data["name"];
            if ($_SESSION["glpiis_ids_visible"]) echo " (".$data["id"].")";
            echo "</td>";
         }
         if (Session::isMultiEntitiesMode())
            echo "<td class='center'>".Dropdown::getDropdownName("glpi_entities",$data['entities_id'])."</td>";

         echo "<td>".Dropdown::getDropdownName("glpi_plugin_databases_servertypes",$data["plugin_databases_servertypes_id"])."</td>";
         echo "<td>".Dropdown::getDropdownName("glpi_plugin_databases_databasetypes",$data["plugin_databases_databasetypes_id"])."</td>";
         echo "<td>".Dropdown::getDropdownName("glpi_manufacturers",$data["manufacturers_id"])."</td>";
         echo "<td>";
         echo "<a href=\"".$CFG_GLPI["root_doc"]."/front/supplier.form.php?id=".$data["suppliers_id"]."\">";
         echo Dropdown::getDropdownName("glpi_suppliers",$data["suppliers_id"]);
         if ($_SESSION["glpiis_ids_visible"] == 1 )
            echo " (".$data["suppliers_id"].")";
         echo "</a></td>";

         if ($this->canCreate())
            echo "<td class='center' class='tab_bg_2'><a href='".$CFG_GLPI["root_doc"]."/plugins/databases/front/database.form.php?deletedatabases=deletedatabases&amp;id=".$data["items_id"]."'><b>".$LANG['buttons'][6]."</b></a></td>";
         echo "</tr>";	
      }
      
      if ($canedit) {
      
         $entities=""; 
         if ($item->isRecursive()) {
            $entities = getSonsOf('glpi_entities',$item->getEntityID());
         } else {
            $entities = $item->getEntityID();
         }   
         $limit = getEntitiesRestrictRequest(" AND ","glpi_plugin_databases_databases",'',$entities,true);

         $q="SELECT COUNT(*) 
           FROM `glpi_plugin_databases_databases` 
           WHERE `is_deleted` = '0' ";
         $q.=" $limit";
         $result = $DB->query($q);
         $nb = $DB->result($result,0,0);
         
         if ($nb>count($used)) {
            if ($this->canCreate()) {
               
               echo "<tr class='tab_bg_1'><td colspan='".(5+$colsup)."' class='right'>";
               echo "<input type='hidden' name='items_id' value='$ID'><input type='hidden' name='itemtype' value='$itemtype'>";
               $database->dropdownDatabases("plugin_databases_databases_id",$entities,$used);
               echo "</td><td class='center'>";
               echo "<input type='submit' name='additem' value=\"".$LANG['buttons'][8]."\" class='submit'>";
               echo "</td>";
               echo "</tr>";
            }
         }
      }
      if ($canedit)
         echo "<tr class='tab_bg_1'><td colspan='".(6+$colsup)."' class='right'><a href='".$CFG_GLPI["root_doc"]."/plugins/databases/front/database.form.php'>".$LANG['plugin_databases'][10]."</a></td></tr>";
      echo "</table></div>";
      echo "</form>";
   }
}

?>