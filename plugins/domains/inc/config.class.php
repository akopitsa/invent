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

class PluginDomainsConfig extends CommonDBTM {
   
   function getTabNameForItem(CommonGLPI $item, $withtemplate=0) {
      global $LANG;

      if ($item->getType()=='CronTask' && $item->getField('name')=="DomainsAlert") {
            return $LANG['plugin_domains']['setup'][1];
      }
      return '';
   }


   static function displayTabContentForItem(CommonGLPI $item, $tabnum=1, $withtemplate=0) {
      global $CFG_GLPI;

      if ($item->getType()=='CronTask') {

         $target = $CFG_GLPI["root_doc"]."/plugins/domains/front/notification.state.php";
         PluginDomainsDomain::configCron($target);
      }
      return true;
   }
   
	function showForm($target,$ID) {
      global $LANG;
    
      $this->getFromDB($ID);
      $delay_expired=$this->fields["delay_expired"];
      $delay_whichexpire=$this->fields["delay_whichexpire"];
      echo "<div align='center'>";
      echo "<form method='post' action=\"$target\">";
      echo "<table class='tab_cadre_fixe' cellpadding='5'><tr><th>";
      echo $LANG['plugin_domains']['setup'][11]." : </th></tr>";
      echo "<tr class='tab_bg_1'><td><div align='center'>";

      $delay_stamp_first= mktime(0, 0, 0, date("m"), date("d")-$delay_expired, date("y"));
      $delay_stamp_next= mktime(0, 0, 0, date("m"), date("d")+$delay_whichexpire, date("y"));
      $date_first=date("Y-m-d",$delay_stamp_first);
      $date_next=date("Y-m-d",$delay_stamp_next);
      
      echo "<tr class='tab_bg_1'><td><div align='left'>";
      echo $LANG['plugin_domains']['mailing'][4];
      echo "&nbsp;<input type='text' size='5' name='delay_expired' value=\"$delay_expired\">";
      echo "&nbsp;".$LANG['plugin_domains']['setup'][12];
      echo "&nbsp;( >".Html::convdate($date_first).")<br>";
      echo $LANG['plugin_domains']['mailing'][5];
      echo "&nbsp;<input type='text' size='5' name='delay_whichexpire' value=\"$delay_whichexpire\">";
      echo "&nbsp;".$LANG['plugin_domains']['setup'][12];
      echo "&nbsp;( <".Html::convdate($date_next).")";

      echo "</td>";
      echo "</tr>";
      
      echo "<tr><th>";
      echo "<input type='hidden' name='id' value='".$ID."'>";
      echo "<div align='center'>";
      echo "<input type='submit' name='update' value=\"".$LANG['buttons'][2]."\" class='submit' >";
      echo "</div></th></tr>";
      echo "</table>";
      echo "</form></div>";
   }
}

?>