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

class PluginDatabasesProfile extends CommonDBTM {
   
	static function getTypeName() {
      global $LANG;

      return $LANG['plugin_databases']['profile'][0];
   }
   
   function canCreate() {
      return Session::haveRight('profile', 'w');
   }

   function canView() {
      return Session::haveRight('profile', 'r');
   }
   
   function getTabNameForItem(CommonGLPI $item, $withtemplate=0) {
      global $LANG;

      if ($item->getType()=='Profile') {
            return $LANG['plugin_databases']['title'][1];
      }
      return '';
   }


   static function displayTabContentForItem(CommonGLPI $item, $tabnum=1, $withtemplate=0) {
      global $CFG_GLPI;

      if ($item->getType()=='Profile') {
         $ID = $item->getField('id');
         $prof = new self();
         
         if (!$prof->getFromDBByProfile($item->getField('id'))) {
            $prof->createAccess($item->getField('id'));
         }
         $prof->showForm($item->getField('id'), array('target' => 
                           $CFG_GLPI["root_doc"]."/plugins/databases/front/profile.form.php"));
      }
      return true;
   }
   
	//if profile deleted
	static function purgeProfiles(Profile $prof) {
      $plugprof = new self();
      $plugprof->deleteByCriteria(array('profiles_id' => $prof->getField("id")));
   }
   
   function getFromDBByProfile($profiles_id) {
		global $DB;
		
		$query = "SELECT * FROM `".$this->getTable()."`
					WHERE `profiles_id` = '" . $profiles_id . "' ";
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
	
	static function createFirstAccess($ID) {
      
      $myProf = new self();
      if (!$myProf->getFromDBByProfile($ID)) {

         $myProf->add(array(
            'profiles_id' => $ID,
            'databases' => 'w',
            'open_ticket' => '1'));
            
      }
   }
	
	function createAccess($ID) {

      $this->add(array(
      'profiles_id' => $ID));
   }
   
   static function changeProfile() {
      
      $prof = new self();
      if ($prof->getFromDBByProfile($_SESSION['glpiactiveprofile']['id'])) {
         $_SESSION["glpi_plugin_databases_profile"]=$prof->fields;
         $_SESSION['glpiactiveprofile']['helpdesk_item_type'][] = "PluginDatabasesDatabase";
      } else {
         unset($_SESSION["glpi_plugin_databases_profile"]);
         unset($_SESSION["glpiactiveprofile"]['helpdesk_item_type']['PluginDatabasesDatabase']);
      }
   }

	function showForm ($ID, $options=array()) {
		global $LANG;

		if (!Session::haveRight("profile","r")) return false;

		$prof = new Profile();
		if ($ID) {
			$this->getFromDBByProfile($ID);
			$prof->getFromDB($ID);
		}

      $this->showFormHeader($options);

		echo "<tr class='tab_bg_2'>";
		
		echo "<th colspan='4'>".$LANG['plugin_databases']['profile'][0]." ".$prof->fields["name"]."</th>";
      
      echo "</tr>";
		echo "<tr class='tab_bg_2'>";
		
		echo "<td>".$LANG['plugin_databases']['title'][1].":</td><td>";

		if ($prof->fields['interface']!='helpdesk') {
			Profile::dropdownNoneReadWrite("databases",$this->fields["databases"],1,1,1);
		} else {
			echo $LANG['profiles'][12]; // No access;
		}
		echo "</td>";

		echo "<td>" . $LANG['setup'][352] . " - " . $LANG['plugin_databases']['title'][1] . ":</td><td>";
		if ($prof->fields['create_ticket']) {
			Dropdown::showYesNo("open_ticket",$this->fields["open_ticket"]);
		} else {
			echo Dropdown::getYesNo(0);
		}
		echo "</td>";
		echo "</tr>";

		echo "<input type='hidden' name='id' value=".$this->fields["id"].">";
      
		$options['candel'] = false;
      $this->showFormButtons($options);
	}
}

?>