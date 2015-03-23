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

define('GLPI_ROOT', '../../..');
include (GLPI_ROOT."/inc/includes.php");

if(!isset($_GET["id"])) $_GET["id"] = "";
if(!isset($_GET["withtemplate"])) $_GET["withtemplate"] = "";
if(!isset($_GET["plugin_databases_databases_id"])) $_GET["plugin_databases_databases_id"] = "";

$script=new PluginDatabasesScript();

if (isset($_POST["add"])) {

	if ($script->canCreate())
		$script->add($_POST);
	Html::back();
		
} else if (isset($_POST["update"])) {
	
	if ($script->canCreate())
      $script->update($_POST);
	Html::back();

} else if (isset($_POST["delete"])) {
	
  if ($script->canCreate())
      $script->delete($_POST,1);
	Html::redirect(Toolbox::getItemTypeFormURL('PluginDatabasesDatabase')."?id=".$_POST["plugin_databases_databases_id"]);

} else if (isset($_POST["delete_script"])) {
   if ($script->canCreate()) {
      foreach ($_POST["check"] as $ID => $value) {
         $script->delete(array("id"=>$ID),1);
      }
   }
   Html::back();

} else {

	$script->checkGlobal("r");
	
	$plugin = new Plugin();
	if ($plugin->isActivated("environment"))
		Html::header($LANG['plugin_databases']['title'][1],'',"plugins","environment","databases");
	else
		Html::header($LANG['plugin_databases']['title'][1],'',"plugins","databases");

	$script->showForm($_GET["id"], array('plugin_databases_databases_id' => $_GET["plugin_databases_databases_id"]));
   
   Html::footer();
}

?>