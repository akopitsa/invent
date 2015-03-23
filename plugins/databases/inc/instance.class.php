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

class PluginDatabasesInstance extends CommonDBChild {
   
   public $itemtype = 'PluginDatabasesDatabase';
   public $items_id = 'plugin_databases_databases_id';
   
	static function getTypeName() {
      global $LANG;

      return $LANG['plugin_databases'][5];
   }
   
   function canCreate() {
      return plugin_databases_haveRight('databases', 'w');
   }

   function canView() {
      return plugin_databases_haveRight('databases', 'r');
   }
   
   function getTabNameForItem(CommonGLPI $item, $withtemplate=0) {
      global $LANG;

      if ($item->getType()=='PluginDatabasesDatabase') {
            return $LANG['plugin_databases'][5];
      }
      return '';
   }


   static function displayTabContentForItem(CommonGLPI $item, $tabnum=1, $withtemplate=0) {
      global $CFG_GLPI;

      if ($item->getType()=='PluginDatabasesDatabase') {
         $self = new self();
         
         $self->showInstances($item->getField('id'));
         $self->showForm("", array('plugin_databases_databases_id' => $item->getField('id'), 
                                    'target' => $CFG_GLPI['root_doc']."/plugins/databases/front/instance.form.php"));
      }
      return true;
   }
   
   function post_getEmpty () {
      $this->fields["port"]='0';
   }
   
   function prepareInputForAdd($input) {
      // Not attached to reference -> not added
      if (!isset($input['plugin_databases_databases_id']) 
            || $input['plugin_databases_databases_id'] <= 0) {
         return false;
      }
      return $input;
   }
   
	function showForm ($ID, $options=array()) {
		global $CFG_GLPI, $LANG;
      
		if (!$this->canView()) return false;
      
      $plugin_databases_databases_id = -1;
      if (isset($options['plugin_databases_databases_id'])) {
         $plugin_databases_databases_id = $options['plugin_databases_databases_id'];
      }
      
		if ($ID > 0) {
         $this->check($ID,'r');
      } else {
         $database = new PluginDatabasesDatabase();
         $database->getFromDB($plugin_databases_databases_id);
         // Create item
         $input=array('plugin_databases_databases_id'=>$plugin_databases_databases_id);
         $input = array('entities_id' => $database->getEntityID(),
                        'is_recursive' => $database->isRecursive());
         $this->check(-1,'w',$input);
      }
      
      if ($ID > 0) {
         $this->showTabs($options);
      }
      $this->showFormHeader($options);

      echo "<input type='hidden' name='plugin_databases_databases_id' value='$plugin_databases_databases_id'>";
      echo "<input type='hidden' name='entities_id' value='".$this->fields["entities_id"]."'>";
      echo "<input type='hidden' name='is_recursive' value='".$this->fields["is_recursive"]."'>";
      
      echo "<tr class='tab_bg_1'>";

      echo "<td>".$LANG['plugin_databases']['instance'][0].": </td>";
      echo "<td>";
      Html::autocompletionTextField($this,"name");
      echo "</td>";
      
      echo "<td>".$LANG['plugin_databases']['instance'][1].": </td>";
      echo "<td>";
      Html::autocompletionTextField($this,"port");
      echo "</td>";
      
      echo "</tr>";
      
      echo "<tr class='tab_bg_1'>";
      
      echo "<td>".$LANG['plugin_databases']['instance'][2].": </td>";
      echo "<td>";
      Html::autocompletionTextField($this,"path");
      echo "</td>";
      
      echo "<td></td>";
      echo "<td></td>";
      
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
      
      $options['candel'] = false;
      $this->showFormButtons($options);

      return true;
	}
	
	function showInstances($ID) {
      global $DB,$CFG_GLPI, $LANG;
    
      $rand=mt_rand();
      $database = new PluginDatabasesDatabase();
      $database->getFromDB($ID);
      $canedit = $database->can($ID,'w');
      
      Session::initNavigateListItems($this->getType(),$LANG['plugin_databases']['title'][1] ." = ". $database->fields["name"]);
      
      $query = "SELECT `".$this->getTable()."`.`name`,
                     `".$this->getTable()."`.`id`,
                     `".$this->getTable()."`.`plugin_databases_databases_id`,
                     `".$this->getTable()."`.`path`,
                     `".$this->getTable()."`.`port`,
                     `".$this->getTable()."`.`comment` 
                      FROM `".$this->getTable()."` ";
      $query.= " LEFT JOIN `glpi_plugin_databases_databases` ON (`glpi_plugin_databases_databases`.`id` = `".$this->getTable()."`.`plugin_databases_databases_id`)";
      $query.= " WHERE `".$this->getTable()."`.`plugin_databases_databases_id` = '$ID' 
        ORDER BY `".$this->getTable()."`.`name`";
      $result = $DB->query($query);
      $number = $DB->numrows($result);
      $i = 0;
      $row_num=1;
      if ($number !="0") {
         echo "<form method='post' name='form_instances$rand' id='form_instances$rand' action=\"./instance.form.php\">";
         echo "<div align='center'><table class='tab_cadre_fixe'>";
         echo "<tr><th colspan='5'>".$LANG['plugin_databases'][5]."</th></tr>";
         $sel="";
         if (isset($_GET["select"])&&$_GET["select"]=="all") $sel="checked";

         echo "<tr>";
         if ($this->canCreate() && $canedit)
           echo "<th>&nbsp;</th>";
         echo "<th>".$LANG['plugin_databases']['instance'][0]."</th>";
         echo "<th>".$LANG['plugin_databases']['instance'][1]."</th>";
         echo "<th>".$LANG['plugin_databases']['instance'][2]."</th>";
         echo "<th>".$LANG['plugin_databases'][2]."</th>";

         echo "</tr>";

         while ($data=$DB->fetch_array($result)) {
            
            Session::addToNavigateListItems($this->getType(),$data['id']);
            
            $i++;
            $row_num++;
            echo "<tr class='tab_bg_1 center'>";
            echo "<td width='10'>";
            if ($this->canCreate() && $canedit) {
               echo "<input type='checkbox' name='check[" . $data["id"] . "]'";
               if (isset($_POST['check']) && $_POST['check'] == 'all')
                  echo " checked ";
               echo ">";
            }
            echo "</td>";

            echo "<td class='center'>";
            echo "<a href='".$CFG_GLPI["root_doc"]."/plugins/databases/front/instance.form.php?id=".$data["id"]."&amp;plugin_databases_databases_id=".$data["plugin_databases_databases_id"]."'>".$data["name"];
            if ($_SESSION["glpiis_ids_visible"] || empty($data["name"])) echo " (".$data["id"].")";
            echo "</a></td>";

            echo "<td class='center'>".$data["port"]."</td>";
            echo "<td class='left'>".$data["path"]."</td>";
            echo "<td class='center'>".nl2br($data["comment"])."</td>";
            echo "</tr>";

         }
      
         echo "</table></div>";
      
         if ($number && $canedit) {
            if ($this->canCreate()) {
               Html::openArrowMassives("form_instances$rand", true);
               Html::closeArrowMassives(array('delete_instance' => $LANG['buttons'][6]));
          
            }
         }
         echo "</form>";
      }
   }
}

?>