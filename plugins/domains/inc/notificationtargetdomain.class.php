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

if (!defined('GLPI_ROOT')){
   die("Sorry. You can't access directly to this file");
}

// Class NotificationTarget
class PluginDomainsNotificationTargetDomain extends NotificationTarget {

   function getEvents() {
      global $LANG;
      return array ('ExpiredDomains' => $LANG['plugin_domains']['mailing'][0],
                     'DomainsWhichExpire' => $LANG['plugin_domains']['mailing'][2]);
   }

   function getDatasForTemplate($event,$options=array()) {
      global $LANG, $CFG_GLPI;
         
      $this->datas['##domain.entity##'] =
                        Dropdown::getDropdownName('glpi_entities',
                                                  $options['entities_id']);
      $this->datas['##lang.domain.entity##'] =$LANG['entity'][0];
      $this->datas['##domain.action##'] = ($event=="ExpiredDomains"?$LANG['plugin_domains']['mailing'][0]:
                                                         $LANG['plugin_domains']['mailing'][2]);
      
      $this->datas['##lang.domain.name##'] = $LANG['plugin_domains'][7];
      $this->datas['##lang.domain.dateexpiration##'] = $LANG['plugin_domains'][13];

      foreach($options['domains'] as $id => $domain) {
         $tmp = array();

         $tmp['##domain.name##'] = $domain['name'];
         $tmp['##domain.dateexpiration##'] = Html::convDate($domain['date_expiration']);

         $this->datas['domains'][] = $tmp;
      }
   }
   
   function getTags() {
      global $LANG;

      $tags = array('domain.name'            => $LANG['plugin_domains'][7],
                     'domain.dateexpiration'    => $LANG['plugin_domains'][13]);
      foreach ($tags as $tag => $label) {
         $this->addTagToList(array('tag'=>$tag,'label'=>$label,
                                   'value'=>true));
      }
      
      $this->addTagToList(array('tag'=>'domains',
                                'label'=>$LANG['plugin_domains']['mailing'][3],
                                'value'=>false,
                                'foreach'=>true,
                                'events'=>array('DomainsWhichExpire','ExpiredDomains')));

      asort($this->tag_descriptions);
   }
}

?>