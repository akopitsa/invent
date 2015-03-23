<?php
/*
 * @version $Id: planningcheck.php 17152 2012-01-24 11:22:16Z moyo $
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
// Since: version 0.83
// ----------------------------------------------------------------------

// Direct access to file
if (strpos($_SERVER['PHP_SELF'],"planningcheck.php")) {
   $AJAX_INCLUDE = 1;
   define('GLPI_ROOT','..');
   include (GLPI_ROOT."/inc/includes.php");
   header("Content-Type: text/html; charset=UTF-8");
   Html::header_nocache();
}

Session::checkLoginUser();

if (isset($_REQUEST['users_id']) &&  $_REQUEST['users_id'] > 0) {
   echo "<span onClick=\"window.open('".$CFG_GLPI["root_doc"].
         "/front/planning.php?checkavailability=checkavailability&amp;users_id=".$_REQUEST['users_id']."',
         'infocoms','location=infocoms,width=1000,height=600,scrollbars=no')\"
         style='cursor:pointer'>
         <img src=\"".$CFG_GLPI["root_doc"]."/pics/reservation-3.png\"
         alt=\"".$LANG['common'][75]."\" title=\"".$LANG['common'][75]."\">
         </span>";
}
?>