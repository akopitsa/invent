<?php

/*
 * @version $Id: rulerightparameter.class.php 17152 2012-01-24 11:22:16Z moyo $
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
// Original Author of file: Olivier Andreotti
// Purpose of file:
// ----------------------------------------------------------------------
if (!defined('GLPI_ROOT')) {
   die("Sorry. You can't access directly to this file");
}

/// LDAP criteria class
class RuleRightParameter extends CommonDropdown {

   var $refresh_page = true;

   function prepareInputForAdd($input) {

      //LDAP parameters MUST be in lower case
      //because the are retieved in lower case  from the directory
      $input["value"] = Toolbox::strtolower($input["value"]);
      return $input;
   }


   function canCreate() {
      return Session::haveRight('rule_ldap', 'w');
   }


   function canView() {
      return Session::haveRight('rule_ldap', 'r');
   }


   function getAdditionalFields() {
      global $LANG;

      return array(array('name'  => 'value',
                         'label' => $LANG['rulesengine'][16],
                         'type'  => 'text',
                         'list'  => false));
   }


   /**
    * Get search function for the class
    *
    * @return array of search option
   **/
   function getSearchOptions() {
      global $LANG;

      $tab = parent::getSearchOptions();

      $tab[11]['table'] = $this->getTable();
      $tab[11]['field'] = 'value';
      $tab[11]['name']  = $LANG['rulesengine'][16];

      return $tab;
   }


   static function getTypeName($nb=0) {
      global $LANG;

      if ($nb>1) {
         return $LANG['rulesengine'][138];
      }
      return $LANG['rulesengine'][137];
   }

}

?>
