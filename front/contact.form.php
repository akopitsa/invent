<?php
/*
 * @version $Id: contact.form.php 17152 2012-01-24 11:22:16Z moyo $
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

Session::checkRight("contact_enterprise", "r");

if (empty($_GET["id"])) {
   $_GET["id"] = -1;
}

$contact = new Contact();
$contactsupplier = new Contact_Supplier();

if (isset($_REQUEST['getvcard'])) {
   if ($_GET["id"]<0) {
      Html::redirect($CFG_GLPI["root_doc"]."/front/contact.php");
   }
   $contact->check($_GET["id"],'r');
   $contact->generateVcard();
} else if (isset($_POST["add"])) {
   $contact->check(-1,'w',$_POST);

   if ($newID = $contact->add($_POST)) {
      Event::log($newID, "contacts", 4, "financial",
               $_SESSION["glpiname"]." ".$LANG['log'][20]." ".$_POST["name"].".");
   }
   Html::back();

} else if (isset($_POST["delete"])) {
   $contact->check($_POST["id"],'w');

   if ($contact->delete($_POST)) {
      Event::log($_POST["id"], "contacts", 4, "financial", $_SESSION["glpiname"]." ".$LANG['log'][22]);
   }
   $contact->redirectToList();

} else if (isset($_POST["restore"])) {
   $contact->check($_POST["id"],'w');

   if ($contact->restore($_POST)) {
      Event::log($_POST["id"], "contacts", 4, "financial", $_SESSION["glpiname"]." ".$LANG['log'][23]);
   }
   $contact->redirectToList();

} else if (isset($_POST["purge"])) {
   $contact->check($_POST["id"],'w');

   if ($contact->delete($_POST,1)) {
      Event::log($_POST["id"], "contacts", 4, "financial", $_SESSION["glpiname"]." ".$LANG['log'][24]);
   }
   $contact->redirectToList();

} else if (isset($_POST["update"])) {
   $contact->check($_POST["id"],'w');

   if ($contact->update($_POST)) {
      Event::log($_POST["id"], "contacts", 4, "financial", $_SESSION["glpiname"]." ".$LANG['log'][21]);
   }
   Html::back();

} else if (isset($_POST["addcontactsupplier"])) {
   $contactsupplier->check(-1,'w',$_POST);

   if (isset($_POST["contacts_id"]) && $_POST["contacts_id"] > 0
      && isset($_POST["suppliers_id"]) && $_POST["suppliers_id"] > 0) {
      if ($contactsupplier->add($_POST)) {
         Event::log($_POST["contacts_id"], "contacts", 4, "financial",
         $_SESSION["glpiname"]."  ".$LANG['log'][34]);
      }
   }
   Html::back();

} else if (isset($_GET["deletecontactsupplier"])) {
   $contactsupplier->check($_GET["id"],'w');

   if ($contactsupplier->delete($_GET)) {
      Event::log($_GET["contacts_id"], "contacts", 4, "financial",
               $_SESSION["glpiname"]."  ".$LANG['log'][35]);
   }
   Html::back();

} else {
   Html::header($LANG['Menu'][22],$_SERVER['PHP_SELF'],"financial","contact");
   $contact->showForm($_GET["id"],'');
   Html::footer();
}
?>