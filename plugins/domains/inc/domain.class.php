<?php
/*
 * @version $Id: HEADER 15930 2011-10-30 15:47:55Z tsmr $
 -------------------------------------------------------------------------
 Domains plugin for GLPI
 Copyright (C) 2003-2011 by the Domains Development Team.

 https://forge.indepnet.net/projects/domains
 -------------------------------------------------------------------------

 LICENSE
		
 This file is part of Domains.

 Domains is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 Domains is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Domains. If not, see <http://www.gnu.org/licenses/>.
 --------------------------------------------------------------------------
 */

if (!defined('GLPI_ROOT')) {
   die("Sorry. You can't access directly to this file");
}

class PluginDomainsDomain extends CommonDBTM {
	
   public $dohistory=true;
   
   static $types = array('Computer','Monitor','NetworkEquipment','Peripheral',
         'Phone','Printer','Software');
         
   static function getTypeName($nb=0) {
      global $LANG;

      if ($nb>1) {
         return $LANG['plugin_domains']['title'][1];
      }
      return $LANG['plugin_domains'][1];
   }
   
   function canCreate() {
      return plugin_domains_haveRight('domains', 'w');
   }

   function canView() {
      return plugin_domains_haveRight('domains', 'r');
   }
	
	function getTabNameForItem(CommonGLPI $item, $withtemplate=0) {
      global $LANG;

      if ($item->getType()=='Supplier') {
         if ($_SESSION['glpishow_count_on_tabs']) {
            return self::createTabEntry(self::getTypeName(2), self::countForItem($item));
         }
         return self::getTypeName(2);
      }
      return '';
   }


   static function displayTabContentForItem(CommonGLPI $item, $tabnum=1, $withtemplate=0) {
      global $CFG_GLPI;

      if ($item->getType()=='Supplier') {
         $self = new self();
         $self->showPluginFromSupplier($item->getField('id'));
      }
      return true;
   }
   
   static function countForItem(CommonDBTM $item) {

      return countElementsInTable('glpi_plugin_domains_domains',
                                  "`suppliers_id` = '".$item->getID()."'");
   }
   
	function cleanDBonPurge() {

		$temp = new PluginDomainsDomain_Item();
		$temp->deleteByCriteria(array('plugin_domains_domains_id' => $this->fields['id']));

	}
	
	function getSearchOptions() {
      global $LANG;

      $tab = array();
    
      $tab['common'] = $LANG['plugin_domains']['title'][1];

      $tab[1]['table']=$this->getTable();
      $tab[1]['field']='name';
      $tab[1]['name']=$LANG['plugin_domains'][7];
      $tab[1]['datatype']='itemlink';
      $tab[1]['itemlink_type'] = $this->getType();
      
      $tab[2]['table']='glpi_plugin_domains_domaintypes';
      $tab[2]['field']='name';
      $tab[2]['name']=$LANG['plugin_domains'][12];
      
      $tab[3]['table']='glpi_users';
      $tab[3]['field']='name';
      $tab[3]['linkfield'] = 'users_id_tech';
      $tab[3]['name']=$LANG['plugin_domains'][18];
      
      $tab[4]['table']='glpi_suppliers';
      $tab[4]['field']='name';
      $tab[4]['name']=$LANG['plugin_domains'][2];
      $tab[4]['datatype']='itemlink';
      $tab[4]['itemlink_type']='Supplier';
      $tab[4]['forcegroupby']=true;
      
      $tab[5]['table']=$this->getTable();
      $tab[5]['field']='date_creation';
      $tab[5]['name']=$LANG['plugin_domains'][17];
      $tab[5]['datatype']='date';
      
      $tab[6]['table']=$this->getTable();
      $tab[6]['field']='date_expiration';
      $tab[6]['name']=$LANG['plugin_domains'][13];
      $tab[6]['datatype']='date';
      
      $tab[7]['table']=$this->getTable();
      $tab[7]['field']='comment';
      $tab[7]['name']=$LANG['plugin_domains'][10];
      $tab[7]['datatype']='text';
      
      $tab[8]['table']='glpi_plugin_domains_domains_items';
      $tab[8]['field']='items_id';
      $tab[8]['nosearch']=true;
      $tab[8]['massiveaction']=false;
      $tab[8]['name']=$LANG['plugin_domains'][6];
      $tab[8]['joinparams']    = array('jointype' => 'child');
      
      $tab[9]['table']=$this->getTable();
      $tab[9]['field']='others';
      $tab[9]['name']=$LANG['plugin_domains'][16];
      //datainjection
      $tab[9]['displaytype']  = 'text';
      $tab[9]['checktype']  = 'text';
      $tab[9]['injectable']  = true;
      
      $tab[10]['table']='glpi_groups';
      $tab[10]['field']='name';
      $tab[10]['linkfield'] = 'groups_id_tech';
      $tab[10]['name']=$LANG['common'][109];
      
      $tab[11]['table']=$this->getTable();
      $tab[11]['field']='is_helpdesk_visible';
      $tab[11]['name']=$LANG['software'][46];
      $tab[11]['datatype']='bool';
      
      $tab[12]['table']=$this->getTable();
      $tab[12]['field']='date_mod';
      $tab[12]['massiveaction']=false;
      $tab[12]['name']=$LANG['common'][26];
      $tab[12]['datatype']='datetime';
      
      $tab[18]['table']=$this->getTable();
      $tab[18]['field']='is_recursive';
      $tab[18]['name']=$LANG['entity'][9];
      $tab[18]['datatype']='bool';
      //datainjection
      $tab[18]['displaytype']  = 'bool';
      $tab[18]['checktype']  = 'decimal';
      $tab[18]['injectable']  = true;
      
      $tab[30]['table']=$this->getTable();
      $tab[30]['field']='id';
      $tab[30]['name']=$LANG['common'][2];
      
      $tab[80]['table']='glpi_entities';
      $tab[80]['field']='completename';
      $tab[80]['name']=$LANG['entity'][0];
		
		return $tab;
   }
	
	
	function defineTabs($options=array()) {
      global $LANG;

      $ong = array();
      $this->addStandardTab('PluginDomainsDomain_Item', $ong, $options);
      $this->addStandardTab('Ticket', $ong, $options);
      $this->addStandardTab('Item_Problem', $ong, $options);
      $this->addStandardTab('Contract_Item', $ong, $options);
      $this->addStandardTab('Document', $ong, $options);
      $this->addStandardTab('Note', $ong, $options);
      $this->addStandardTab('Log', $ong, $options);

      return $ong;
   }
   
	function prepareInputForAdd($input) {
		
		if (isset($input['date_creation']) && empty($input['date_creation'])) 
         $input['date_creation']='NULL';
		if (isset($input['date_expiration']) && empty($input['date_expiration'])) 
         $input['date_expiration']='NULL';
		
		return $input;
	}
	
	function prepareInputForUpdate($input) {
		
		if (isset($input['date_creation']) && empty($input['date_creation'])) 
         $input['date_creation']='NULL';
		if (isset($input['date_expiration']) && empty($input['date_expiration'])) 
         $input['date_expiration']='NULL';
		
		return $input;
	}
	
	/*
    * Return the SQL command to retrieve linked object
    *
    * @return a SQL command which return a set of (itemtype, items_id)
    */
   function getSelectLinkedItem () {
      return "SELECT `itemtype`, `items_id`
              FROM `glpi_plugin_domains_domains_items`
              WHERE `plugin_domains_domains_id`='" . $this->fields['id']."'";
   }
   
	function showForm ($ID, $options=array()) {
      global $CFG_GLPI,$LANG;
		
		if (!$this->canView()) return false;
		
		if ($ID > 0) {
         $this->check($ID,'r');
      } else {
         // Create item
         $this->check(-1,'w');
         $this->getEmpty();
      }
    
      $this->showTabs($options);
      $this->showFormHeader($options);

      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['plugin_domains'][7].": </td>";
      echo "<td>";
      Html::autocompletionTextField($this,"name");
      echo "</td>";
      
      echo "<td>".$LANG['plugin_domains'][16].":	</td>";
      echo "<td>";
      Html::autocompletionTextField($this,"others");	
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['plugin_domains'][2].": </td>";
      echo "<td>";
      Dropdown::show('Supplier', array('name' => "suppliers_id",
                                       'value' => $this->fields["suppliers_id"], 
                                       'entity' => $this->fields["entities_id"]));
      echo "</td>";
      
      echo "<td>".$LANG['plugin_domains'][17].": </td>";
      echo "<td>";
      Html::showDateFormItem("date_creation",$this->fields["date_creation"],true,true);
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['plugin_domains'][12].": </td><td>";
      Dropdown::show('PluginDomainsDomainType', array('name' => "plugin_domains_domaintypes_id",
                                                      'value' => $this->fields["plugin_domains_domaintypes_id"],
                                                      'entity' => $this->fields["entities_id"]));
      echo "</td>";
      
      echo "<td>".$LANG['plugin_domains'][13];
      echo "&nbsp;";
      Html::showToolTip(nl2br($LANG['plugin_domains'][15]));
      echo ": </td>";
      echo "<td>";
      Html::showDateFormItem("date_expiration",$this->fields["date_expiration"],true,true);
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['plugin_domains'][18].": </td><td>";
      User::dropdown(array('name' => "users_id_tech",
                           'value' => $this->fields["users_id_tech"],
                           'entity' => $this->fields["entities_id"],
                           'right' => 'interface'));
      echo "</td>";
      
      echo "<td>" . $LANG['software'][46] . ":</td><td>";
      Dropdown::showYesNo('is_helpdesk_visible',$this->fields['is_helpdesk_visible']);
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['common'][109].": </td><td>";
      Dropdown::show('Group', array('name' => "groups_id_tech",
                                    'value' => $this->fields["groups_id_tech"], 
                                    'entity' => $this->fields["entities_id"],
                                    'condition' => '`is_assign`'));
      echo "</td>";
      
      echo "<td>".$LANG['common'][26].": </td>";
      $date = Html::convDateTime($this->fields["date_mod"]);
      echo "<td>".$date;
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>";
      echo "</td>";
      echo "<td>";
      echo "</td>";
      
      echo "<td>";
      echo $LANG['plugin_domains'][10].":	</td>";
      echo "<td class='center'>";
      echo "<textarea cols='35' rows='4' name='comment' >".$this->fields["comment"]."</textarea>";
      echo "</td>";
      
      echo "</tr>";

      $this->showFormButtons($options);
      $this->addDivForTabs();

		return true;
	}
	
	function dropdownDomains($myname,$entity_restrict='',$used=array()) {
      global $DB,$LANG,$CFG_GLPI;

      $rand=mt_rand();

      $where=" WHERE `".$this->getTable()."`.`is_deleted` = '0' ";
      $where.=getEntitiesRestrictRequest("AND",$this->getTable(),'',$entity_restrict,true);

      if (count($used)) {
         $where .= " AND `id` NOT IN (0";
         foreach ($used as $ID)
            $where .= ",$ID";
         $where .= ")";
      }

      $query="SELECT *
        FROM `glpi_plugin_domains_domaintypes`
        WHERE `id` IN (
          SELECT DISTINCT `plugin_domains_domaintypes_id`
          FROM `".$this->getTable()."`
          $where)
        GROUP BY `name`
        ORDER BY `name`";
      $result=$DB->query($query);

      echo "<select name='_type' id='plugin_domains_domaintypes_id'>\n";
      echo "<option value='0'>".Dropdown::EMPTY_VALUE."</option>\n";
      while ($data=$DB->fetch_assoc($result)) {
         echo "<option value='".$data['id']."'>".$data['name']."</option>\n";
      }
      echo "</select>\n";

      $params=array('plugin_domains_domaintypes_id'=>'__VALUE__',
        'entity_restrict'=>$entity_restrict,
        'rand'=>$rand,
        'myname'=>$myname,
        'used'=>$used
        );

      Ajax::updateItemOnSelectEvent("plugin_domains_domaintypes_id","show_$myname$rand",$CFG_GLPI["root_doc"]."/plugins/domains/ajax/dropdownTypeDomains.php",$params);

      echo "<span id='show_$myname$rand'>";
      $_POST["entity_restrict"]=$entity_restrict;
      $_POST["plugin_domains_domaintypes_id"]=0;
      $_POST["myname"]=$myname;
      $_POST["rand"]=$rand;
      $_POST["used"]=$used;
      include (GLPI_ROOT."/plugins/domains/ajax/dropdownTypeDomains.php");
      echo "</span>\n";

      return $rand;
   }
  
  // Cron action
   static function cronInfo($name) {
      global $LANG;
       
      switch ($name) {
         case 'DomainsAlert':
            return array (
               'description' => $LANG['plugin_domains']['mailing'][3]);   // Optional
            break;
      }
      return array();
   }

   static function queryExpiredDomains() {
      global $DB;
      
      $config=new PluginDomainsConfig();
      $config->getFromDB('1');
      $delay=$config->fields["delay_expired"];

      $query = "SELECT * 
         FROM `glpi_plugin_domains_domains`
         WHERE `date_expiration` IS NOT NULL
         AND `is_deleted` = '0'
         AND DATEDIFF(CURDATE(),`date_expiration`) > $delay 
         AND DATEDIFF(CURDATE(),`date_expiration`) > 0 ";

      return $query;
   }
   
   static function queryDomainsWhichExpire() {
      global $DB;
      
      $config=new PluginDomainsConfig();
      $config->getFromDB('1');
      $delay=$config->fields["delay_whichexpire"];
      
      $query = "SELECT *
         FROM `glpi_plugin_domains_domains`
         WHERE `date_expiration` IS NOT NULL
         AND `is_deleted` = '0'
         AND DATEDIFF(CURDATE(),`date_expiration`) > -$delay 
         AND DATEDIFF(CURDATE(),`date_expiration`) < 0 ";

      return $query;
   }
   /**
    * Cron action on domains : ExpiredDomains or DomainsWhichExpire
    *
    * @param $task for log, if NULL display
    *
    **/
   static function cronDomainsAlert($task=NULL) {
      global $DB,$CFG_GLPI,$LANG;
      
      if (!$CFG_GLPI["use_mailing"]) {
         return 0;
      }

      $message=array();
      $cron_status = 0;
      
      $query_expired = self::queryExpiredDomains();
      $query_whichexpire = self::queryDomainsWhichExpire();
      
      $querys = array(Alert::NOTICE=>$query_whichexpire, Alert::END=>$query_expired);
      
      $domain_infos = array();
      $domain_messages = array();

      foreach ($querys as $type => $query) {
         $domain_infos[$type] = array();
         foreach ($DB->request($query) as $data) {
            $entity = $data['entities_id'];
            $message = $data["name"].": ".
                        Html::convdate($data["date_expiration"])."<br>\n";
            $domain_infos[$type][$entity][] = $data;

            if (!isset($domains_infos[$type][$entity])) {
               $domain_messages[$type][$entity] = $LANG['plugin_domains']['mailing'][0]."<br />";
            }
            $domain_messages[$type][$entity] .= $message;
         }
      }
      
      foreach ($querys as $type => $query) {
      
         foreach ($domain_infos[$type] as $entity => $domains) {
            Plugin::loadLang('domains');

            if (NotificationEvent::raiseEvent(($type==Alert::NOTICE?"DomainsWhichExpire":"ExpiredDomains"),
                                              new PluginDomainsDomain(),
                                              array('entities_id'=>$entity,
                                                    'domains'=>$domains))) {
               $message = $domain_messages[$type][$entity];
               $cron_status = 1;
               if ($task) {
                  $task->log(Dropdown::getDropdownName("glpi_entities",
                                                       $entity).":  $message\n");
                  $task->addVolume(1);
               } else {
                  addMessageAfterRedirect(Dropdown::getDropdownName("glpi_entities",
                                                                    $entity).":  $message");
               }

            } else {
               if ($task) {
                  $task->log(Dropdown::getDropdownName("glpi_entities",$entity).
                             ":  Send domains alert failed\n");
               } else {
                  addMessageAfterRedirect(Dropdown::getDropdownName("glpi_entities",$entity).
                                          ":  Send domains alert failed",false,ERROR);
               }
            }
         }
      }
      
      return $cron_status;
   }
   
   static function configCron($target) {

      $config=new PluginDomainsConfig();
      $config->showForm($target,1);
    
   }
   
   /**
    * For other plugins, add a type to the linkable types
    *
    * @since version 1.3.0
    *
    * @param $type string class name
   **/
   static function registerType($type) {
      if (!in_array($type, self::$types)) {
         self::$types[] = $type;
      }
   }


   /**
    * Type than could be linked to a Rack
    *
    * @param $all boolean, all type, or only allowed ones
    *
    * @return array of types
   **/
   static function getTypes($all=false) {

      if ($all) {
         return self::$types;
      }

      // Only allowed types
      $types = self::$types;

      foreach ($types as $key => $type) {
         if (!class_exists($type)) {
            continue;
         }

         $item = new $type();
         if (!$item->canView()) {
            unset($types[$key]);
         }
      }
      return $types;
   }
   
   function showPluginFromSupplier($ID,$withtemplate='') {
      global $DB,$CFG_GLPI, $LANG;

      $item = new Supplier();
      $canread = $item->can($ID,'r');
      $canedit = $item->can($ID,'w');
      
      $query = "SELECT `glpi_plugin_domains_domains`.* "
        ."FROM `glpi_plugin_domains_domains` "
        ." LEFT JOIN `glpi_entities` ON (`glpi_entities`.`id` = `glpi_plugin_domains_domains`.`entities_id`) "
        ." WHERE `suppliers_id` = '$ID' "
        . getEntitiesRestrictRequest(" AND ","glpi_plugin_domains_domains",'','',$this->maybeRecursive());
      $query.= " ORDER BY glpi_plugin_domains_domains.name ";

      $result = $DB->query($query);
      $number = $DB->numrows($result);

      if (Session::isMultiEntitiesMode()) {
         $colsup=1;
      } else {
         $colsup=0;
      }

      echo "<form method='post' action=\"".$CFG_GLPI["root_doc"]."/plugins/domains/front/domain.form.php\">";
      echo "<div align='center'><table class='tab_cadre_fixe'>";
      echo "<tr><th colspan='".(5+$colsup)."'>".$LANG['plugin_domains'][8].":</th></tr>";
      echo "<tr><th>".$LANG['plugin_domains'][7]."</th>";
      if (Session::isMultiEntitiesMode())
         echo "<th>".$LANG['entity'][0]."</th>";
      echo "<th>".$LANG['plugin_domains'][18]."</th>";
      echo "<th>".$LANG['plugin_domains'][12]."</th>";
      echo "<th>".$LANG['plugin_domains'][17]."</th>";
      echo "<th>".$LANG['plugin_domains'][13]."</th>";
      echo "</tr>";

      while ($data=$DB->fetch_array($result)) {

         echo "<tr class='tab_bg_1".($data["is_deleted"]=='1'?"_2":"")."'>";
         if ($withtemplate!=3 && $canread && (in_array($data['entities_id'],$_SESSION['glpiactiveentities']) || $data["is_recursive"])) {
            echo "<td class='center'><a href='".$CFG_GLPI["root_doc"]."/plugins/domains/front/domain.form.php?id=".$data["id"]."'>".$data["name"];
            if ($_SESSION["glpiis_ids_visible"]) echo " (".$data["id"].")";
            echo "</a></td>";
         } else {
            echo "<td class='center'>".$data["name"];
            if ($_SESSION["glpiis_ids_visible"]) echo " (".$data["id"].")";
            echo "</td>";
         }
         if (Session::isMultiEntitiesMode())
            echo "<td class='center'>".Dropdown::getDropdownName("glpi_entities",$data['entities_id'])."</td>";
         echo "<td class='center'>".getUsername($data["users_id_tech"])."</td>";
         echo "<td class='center'>".Dropdown::getDropdownName("glpi_plugin_domains_domaintypes",$data["plugin_domains_domaintypes_id"])."</td>";
         echo "<td class='center'>".Html::convdate($data["date_creation"])."</td>";
         if ($data["date_expiration"] <= date('Y-m-d') && !empty($data["date_expiration"]))
            echo "<td class='center'><span class='plugin_domains_date_color'>".Html::convdate($data["date_expiration"])."</span></td>";
         else if (empty($data["date_expiration"]))
            echo "<td class='center'>".$LANG['plugin_domains'][14]."</td>";
         else
            echo "<td class='center'>".Html::convdate($data["date_expiration"])."</td>";
         echo "</tr>";
      }

      echo "</table></div>";
      echo "</form>";
   }
   
}

?>