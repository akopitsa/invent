<?php
/*
 * @version $Id: mailcollector.form.php 17152 2012-01-24 11:22:16Z moyo $
 -------------------------------------------------------------------------
 GLPI - Gestionnaire Libre de Parc Informatique
 Copyright (C) 2003-2012 by the INDEPNET Development Team.

 http://indepnet.net/   http://glpi-project.org
 -------------------------------------------------------------------------

 LICENSE

 This file is part of GLPI.

 GLPI is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 GLPI is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with GLPI. If not, see <http://www.gnu.org/licenses/>.
 --------------------------------------------------------------------------
 */

// ----------------------------------------------------------------------
// Original Author of file: Julien Dombre
// Purpose of file:
// ----------------------------------------------------------------------

define('GLPI_ROOT', '..');
include (GLPI_ROOT . "/inc/includes.php");

Session::checkRight("config", "r");

if (!isset($_GET["id"])) {
   $_GET["id"] = "";
}

$mailgate = new MailCollector();

if (isset($_POST["add"])) {
   $mailgate->check(-1,'w',$_POST);
   $newID = $mailgate->add($_POST);

   Event::log($newID, "mailcollector", 4, "setup",
              $_SESSION["glpiname"]." added ".$_POST["name"].".");
   Html::back();

} else if (isset($_POST["delete"])) {
   $mailgate->check($_POST['id'],'w');
   $mailgate->delete($_POST);

   Event::log($_POST["id"], "mailcollector", 4, "setup",
              $_SESSION["glpiname"]." ".$LANG['log'][22]);
   $mailgate->redirectToList();

} else if (isset($_POST["update"])) {
   $mailgate->check($_POST['id'],'w');
   $mailgate->update($_POST);

   Event::log($_POST["id"], "mailcollector", 4, "setup",
              $_SESSION["glpiname"]." ".$LANG['log'][21]);
   Html::back();

} else if (isset($_POST["get_mails"])) {
   $mailgate->check($_POST['id'],'w');
   $mailgate->collect($_POST["id"],1);

   Html::back();

} else {
   Html::header($LANG['Menu'][39], $_SERVER['PHP_SELF'], "config", "mailcollector");
   $mailgate->showForm($_GET["id"]);
   Html::footer();
}
?>