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

class PluginDatabasesDatabase extends CommonDBTM {
	
   public $dohistory=true;
   
   static $types = array('Computer','Software');
   
   static function getTypeName($nb=0) {
      global $LANG;

      if ($nb>1) {
         return $LANG['plugin_databases']['title'][1];
      }
      return $LANG['plugin_databases'][1];
   }
   
   function canCreate() {
      return plugin_databases_haveRight('databases', 'w');
   }

   function canView() {
      return plugin_databases_haveRight('databases', 'r');
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

      return countElementsInTable('glpi_plugin_databases_databases',
                                  "`suppliers_id` = '".$item->getID()."'");
   }
   
	//clean if databases are deleted
	function cleanDBonPurge() {

		$temp = new PluginDatabasesDatabase_Item();
		$temp->deleteByCriteria(array('plugin_databases_databases_id' => $this->fields['id']));
	}
	
	function getSearchOptions() {
      global $LANG;

      $tab = array();
    
      $tab['common'] = $LANG['plugin_databases']['title'][1];

      $tab[1]['table']=$this->getTable();
      $tab[1]['field']='name';
      $tab[1]['name']=$LANG['plugin_databases'][0];
      $tab[1]['datatype']='itemlink';
      $tab[1]['itemlink_type'] = $this->getType();
      
      $tab[2]['table']='glpi_plugin_databases_databasecategories';
      $tab[2]['field']='name';
      $tab[2]['name']=$LANG['plugin_databases']['setup'][1];
      
      $tab[3]['table']='glpi_plugin_databases_servertypes';
      $tab[3]['field']='name';
      $tab[3]['name']=$LANG['plugin_databases'][14];
      
      $tab[4]['table']='glpi_locations';
      $tab[4]['field']='completename';
      $tab[4]['name']=$LANG['plugin_databases'][25];
      
      $tab[5]['table']='glpi_suppliers';
      $tab[5]['field']='name';
      $tab[5]['name']=$LANG['plugin_databases']['setup'][12];
      
      $tab[6]['table']='glpi_manufacturers';
      $tab[6]['field']='name';
      $tab[6]['name']=$LANG['plugin_databases']['setup'][14];
      
      $tab[7]['table']='glpi_plugin_databases_databases_items';
      $tab[7]['field']='items_id';
      $tab[7]['nosearch']=true;
      $tab[7]['massiveaction']=false;
      $tab[7]['name']=$LANG['plugin_databases']['setup'][15];
      $tab[7]['forcegroupby']=true;
      $tab[7]['joinparams']    = array('jointype' => 'child');
      
      $tab[8]['table']=$this->getTable();
      $tab[8]['field']='is_recursive';
      $tab[8]['name']=$LANG['entity'][9];
      $tab[8]['datatype']='bool';
      
      $tab[9]['table']=$this->getTable();
      $tab[9]['field']='comment';
      $tab[9]['name']=$LANG['plugin_databases'][2];
      $tab[9]['datatype']='text';
      
      $tab[10]['table']='glpi_plugin_databases_databasetypes';
      $tab[10]['field']='name';
      $tab[10]['name']=$LANG['plugin_databases'][4];
      
      $tab[11]['table']='glpi_users';
      $tab[11]['field']='name';
      $tab[11]['linkfield'] = 'users_id_tech';
      $tab[11]['name']=$LANG['plugin_databases'][9];
      
      $tab[12]['table']='glpi_groups';
      $tab[12]['field']='name';
      $tab[12]['linkfield'] = 'groups_id_tech';
      $tab[12]['name']=$LANG['common'][109];
      
      $tab[13]['table']=$this->getTable();
      $tab[13]['field']='is_helpdesk_visible';
      $tab[13]['name']=$LANG['software'][46];
      $tab[13]['datatype']='bool';
      
      $tab[14]['table']=$this->getTable();
      $tab[14]['field']='date_mod';
      $tab[14]['massiveaction']=false;
      $tab[14]['name']=$LANG['common'][26];
      $tab[14]['datatype']='datetime';
      
      $tab[30]['table']=$this->getTable();
      $tab[30]['field']='id';
      $tab[30]['name']=$LANG['common'][2];
      
      $tab[80]['table']='glpi_entities';
      $tab[80]['field']='completename';
      $tab[80]['name']=$LANG['entity'][0];
		
		return $tab;
   }
   
	//define header form
	function defineTabs($options=array()) {
      global $LANG;

      $ong = array();
      $this->addStandardTab('PluginDatabasesDatabase_Item', $ong, $options);
      $this->addStandardTab('PluginDatabasesInstance', $ong, $options);
      $this->addStandardTab('PluginDatabasesScript', $ong, $options);
      $this->addStandardTab('Ticket', $ong, $options);
      $this->addStandardTab('Item_Problem', $ong, $options);
      $this->addStandardTab('Document', $ong, $options);
      $this->addStandardTab('Note', $ong, $options);
      $this->addStandardTab('Log', $ong, $options);

      return $ong;
   }
   
   /*
    * Return the SQL command to retrieve linked object
    *
    * @return a SQL command which return a set of (itemtype, items_id)
    */
   function getSelectLinkedItem () {
      return "SELECT `itemtype`, `items_id`
              FROM `glpi_plugin_databases_databases_items`
              WHERE `plugin_databases_databases_id`='" . $this->fields['id']."'";
   }
   
	function showForm ($ID, $options=array()) {
		global  $CFG_GLPI, $LANG;

		if (!plugin_databases_haveRight("databases","r")) return false;

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

      echo "<td>".$LANG['plugin_databases'][0].":	</td>";
      echo "<td>";
      Html::autocompletionTextField($this,"name");
      echo "</td>";
      
      echo "<td>".$LANG['plugin_databases']['setup'][1].": </td>";
      echo "<td>";
      Dropdown::show('PluginDatabasesDatabaseCategory', array('name' => "plugin_databases_databasecategories_id",
                                                               'value' => $this->fields["plugin_databases_databasecategories_id"],
                                                               'entity' => $this->fields["entities_id"]));
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['plugin_databases'][25].": </td>";
      echo "<td>";
      Dropdown::show('Location', array('name' => "locations_id",
                                       'value' => $this->fields["locations_id"],
                                       'entity' => $this->fields["entities_id"]));
      echo "</td>";
      
      echo "<td>".$LANG['plugin_databases'][14].": </td>";
      echo "<td>";
      Dropdown::show('PluginDatabasesServerType', array('name' => "plugin_databases_servertypes_id",
                                                      'value' => $this->fields["plugin_databases_servertypes_id"]));
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['plugin_databases'][9].":	</td><td>";
      User::dropdown(array('name' => "users_id_tech",
                           'value' => $this->fields["users_id_tech"],
                           'entity' => $this->fields["entities_id"],
                           'right' => 'interface'));
      echo "</td>";
      
      echo "<td>".$LANG['plugin_databases'][4].": </td>";
      echo "<td>";
      Dropdown::show('PluginDatabasesDatabaseType', array('name' => "plugin_databases_databasetypes_id",
                                                         'value' => $this->fields["plugin_databases_databasetypes_id"], 
                                                         'entity' => $this->fields["entities_id"]));
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['common'][109].":	</td><td>";
      Dropdown::show('Group', array('name' => "groups_id_tech",
                                    'value' => $this->fields["groups_id_tech"], 
                                    'entity' => $this->fields["entities_id"],
                                    'condition' => '`is_assign`'));
      echo "</td>";
      
      echo "<td>".$LANG['plugin_databases']['setup'][14].": </td>";
      echo "<td>";
      Dropdown::show('Manufacturer', array('name' => "manufacturers_id",
                                             'value' => $this->fields["manufacturers_id"], 
                                             'entity' => $this->fields["entities_id"]));
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['plugin_databases']['setup'][12].": </td>";
      echo "<td>";
      Dropdown::show('Supplier', array('name' => "suppliers_id",
                                       'value' => $this->fields["suppliers_id"], 
                                       'entity' => $this->fields["entities_id"]));
      echo "</td>";

      echo "<td>" . $LANG['software'][46] . ":</td><td>";
      Dropdown::showYesNo('is_helpdesk_visible',$this->fields['is_helpdesk_visible']);
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td class='center' colspan = '4'>" . $LANG['common'][26] . ":";
      echo Html::convDateTime($this->fields["date_mod"]);
      echo "</td>";

      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td colspan = '4'>";
      echo "<table cellpadding='2' cellspacing='2' border='0'><tr><td>";
      echo $LANG['plugin_databases'][2].": </td></tr>";
      echo "<tr>";
      echo "<td class='center'>";
      echo "<textarea cols='125' rows='3' name='comment'>".$this->fields["comment"]."</textarea>";
      echo "</td></tr></table>";
      echo "</td>";
      
      echo "</tr>";

      $this->showFormButtons($options);
      $this->addDivForTabs();

      return true;
	}
	
	function dropdownDatabases($myname,$entity_restrict='',$used=array()) {
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
        FROM `glpi_plugin_databases_databasetypes`
        WHERE `id` IN (
          SELECT DISTINCT plugin_databases_databasetypes_id
          FROM `".$this->getTable()."`
          $where)
        GROUP BY `name`
        ORDER BY `name`";
      $result=$DB->query($query);

      echo "<select name='_type' id='plugin_databases_databasetypes_id'>\n";
      echo "<option value='0'>".Dropdown::EMPTY_VALUE."</option>\n";
      while ($data=$DB->fetch_assoc($result)) {
         echo "<option value='".$data['id']."'>".$data['name']."</option>\n";
      }
      echo "</select>\n";

      $params=array('plugin_databases_databasetypes_id'=>'__VALUE__',
        'entity_restrict'=>$entity_restrict,
        'rand'=>$rand,
        'myname'=>$myname,
        'used'=>$used
        );

      Ajax::updateItemOnSelectEvent("plugin_databases_databasetypes_id","show_$myname$rand",$CFG_GLPI["root_doc"]."/plugins/databases/ajax/dropdownTypeDatabases.php",$params);

      echo "<span id='show_$myname$rand'>";
      $_POST["entity_restrict"]=$entity_restrict;
      $_POST["plugin_databases_databasetypes_id"]=0;
      $_POST["myname"]=$myname;
      $_POST["rand"]=$rand;
      $_POST["used"]=$used;
      include (GLPI_ROOT."/plugins/databases/ajax/dropdownTypeDatabases.php");
      echo "</span>\n";

      return $rand;
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
      global $DB,$CFG_GLPI,$LANG;
    
      $item = new Supplier();
      $canread = $item->can($ID,'r');
      $canedit = $item->can($ID,'w');
      
      $query = "SELECT `glpi_plugin_databases_databases`.* "
        ."FROM `glpi_plugin_databases_databases` "
        ." LEFT JOIN `glpi_entities` ON (`glpi_entities`.`id` = `glpi_plugin_databases_databases`.`entities_id`) "
        ." WHERE `suppliers_id` = '$ID' "
        . getEntitiesRestrictRequest(" AND ","glpi_plugin_databases_databases",'','',$this->maybeRecursive());
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
      echo "<tr><th colspan='".(4+$colsup)."'>".$LANG['plugin_databases'][21].":</th></tr>";
      echo "<tr><th>".$LANG['plugin_databases'][0]."</th>";
      if (Session::isMultiEntitiesMode())
         echo "<th>".$LANG['entity'][0]."</th>";
      echo "<th>".$LANG['plugin_databases']['setup'][1]."</th>";
      echo "<th>".$LANG['plugin_databases']['setup'][11]."</th>";
      echo "<th>".$LANG['plugin_databases'][2]."</th>";

      echo "</tr>";

      while ($data=$DB->fetch_array($result)) {

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
         echo "</a></td>";
         if (Session::isMultiEntitiesMode())
            echo "<td class='center'>".Dropdown::getDropdownName("glpi_entities",$data['entities_id'])."</td>";
         echo "<td>".Dropdown::getDropdownName("glpi_plugin_databases_databasetypes",$data["plugin_databases_databasetypes_id"])."</td>";
         echo "<td>".Dropdown::getDropdownName("glpi_plugin_databases_servertypes",$data["plugin_databases_servertypes_id"])."</td>";
         echo "<td>".$data["comment"]."</td></tr>";
      }
      echo "</table></div>";
      echo "</form>";
   }
}

?>