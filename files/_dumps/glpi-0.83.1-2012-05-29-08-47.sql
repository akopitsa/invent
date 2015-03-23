#GLPI Dump database on 2012-05-29 08:47

### Dump table glpi_alerts

DROP TABLE IF EXISTS `glpi_alerts`;
CREATE TABLE `glpi_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php ALERT_* constant',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`type`),
  KEY `type` (`type`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_authldapreplicates

DROP TABLE IF EXISTS `glpi_authldapreplicates`;
CREATE TABLE `glpi_authldapreplicates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authldaps_id` int(11) NOT NULL DEFAULT '0',
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT '389',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authldaps_id` (`authldaps_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_authldaps

DROP TABLE IF EXISTS `glpi_authldaps`;
CREATE TABLE `glpi_authldaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `basedn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rootdn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT '389',
  `condition` text COLLATE utf8_unicode_ci,
  `login_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'uid',
  `use_tls` tinyint(1) NOT NULL DEFAULT '0',
  `group_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_condition` text COLLATE utf8_unicode_ci,
  `group_search_type` int(11) NOT NULL DEFAULT '0',
  `group_member_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email1_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_dn` tinyint(1) NOT NULL DEFAULT '1',
  `time_offset` int(11) NOT NULL DEFAULT '0' COMMENT 'in seconds',
  `deref_option` int(11) NOT NULL DEFAULT '0',
  `title_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_condition` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `rootdn_passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_number_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email2_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email3_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email4_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `is_default` (`is_default`),
  KEY `is_active` (`is_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_authmails

DROP TABLE IF EXISTS `glpi_authmails`;
CREATE TABLE `glpi_authmails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connect_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `is_active` (`is_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_autoupdatesystems

DROP TABLE IF EXISTS `glpi_autoupdatesystems`;
CREATE TABLE `glpi_autoupdatesystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_bookmarks

DROP TABLE IF EXISTS `glpi_bookmarks`;
CREATE TABLE `glpi_bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php BOOKMARK_* constant',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '1',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `is_private` (`is_private`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_bookmarks_users

DROP TABLE IF EXISTS `glpi_bookmarks_users`;
CREATE TABLE `glpi_bookmarks_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `bookmarks_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`),
  KEY `bookmarks_id` (`bookmarks_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_budgets

DROP TABLE IF EXISTS `glpi_budgets`;
CREATE TABLE `glpi_budgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `notepad` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `begin_date` (`begin_date`),
  KEY `is_template` (`is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `end_date` (`end_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_calendars

DROP TABLE IF EXISTS `glpi_calendars`;
CREATE TABLE `glpi_calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `cache_duration` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_calendars` VALUES ('1','Default','0','1','Default calendar',NULL,'[0,43200,43200,43200,43200,43200,0]');

### Dump table glpi_calendars_holidays

DROP TABLE IF EXISTS `glpi_calendars_holidays`;
CREATE TABLE `glpi_calendars_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `holidays_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`calendars_id`,`holidays_id`),
  KEY `holidays_id` (`holidays_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_calendarsegments

DROP TABLE IF EXISTS `glpi_calendarsegments`;
CREATE TABLE `glpi_calendarsegments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'numer of the day based on date(w)',
  `begin` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendars_id` (`calendars_id`),
  KEY `day` (`day`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_calendarsegments` VALUES ('1','1','0','0','1','08:00:00','20:00:00');
INSERT INTO `glpi_calendarsegments` VALUES ('2','1','0','0','2','08:00:00','20:00:00');
INSERT INTO `glpi_calendarsegments` VALUES ('3','1','0','0','3','08:00:00','20:00:00');
INSERT INTO `glpi_calendarsegments` VALUES ('4','1','0','0','4','08:00:00','20:00:00');
INSERT INTO `glpi_calendarsegments` VALUES ('5','1','0','0','5','08:00:00','20:00:00');

### Dump table glpi_cartridgeitems

DROP TABLE IF EXISTS `glpi_cartridgeitems`;
CREATE TABLE `glpi_cartridgeitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `cartridgeitemtypes_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `alarm_threshold` int(11) NOT NULL DEFAULT '10',
  `notepad` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `cartridgeitemtypes_id` (`cartridgeitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_cartridgeitems_printermodels

DROP TABLE IF EXISTS `glpi_cartridgeitems_printermodels`;
CREATE TABLE `glpi_cartridgeitems_printermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartridgeitems_id` int(11) NOT NULL DEFAULT '0',
  `printermodels_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`printermodels_id`,`cartridgeitems_id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_cartridgeitemtypes

DROP TABLE IF EXISTS `glpi_cartridgeitemtypes`;
CREATE TABLE `glpi_cartridgeitemtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_cartridges

DROP TABLE IF EXISTS `glpi_cartridges`;
CREATE TABLE `glpi_cartridges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `cartridgeitems_id` int(11) NOT NULL DEFAULT '0',
  `printers_id` int(11) NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `pages` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`),
  KEY `printers_id` (`printers_id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computerdisks

DROP TABLE IF EXISTS `glpi_computerdisks`;
CREATE TABLE `glpi_computerdisks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mountpoint` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesystems_id` int(11) NOT NULL DEFAULT '0',
  `totalsize` int(11) NOT NULL DEFAULT '0',
  `freesize` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `device` (`device`),
  KEY `mountpoint` (`mountpoint`),
  KEY `totalsize` (`totalsize`),
  KEY `freesize` (`freesize`),
  KEY `computers_id` (`computers_id`),
  KEY `filesystems_id` (`filesystems_id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computermodels

DROP TABLE IF EXISTS `glpi_computermodels`;
CREATE TABLE `glpi_computermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_computermodels` VALUES ('1','12.1','');

### Dump table glpi_computers

DROP TABLE IF EXISTS `glpi_computers`;
CREATE TABLE `glpi_computers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `operatingsystems_id` int(11) NOT NULL DEFAULT '0',
  `operatingsystemversions_id` int(11) NOT NULL DEFAULT '0',
  `operatingsystemservicepacks_id` int(11) NOT NULL DEFAULT '0',
  `os_license_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_licenseid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autoupdatesystems_id` int(11) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `networks_id` int(11) NOT NULL DEFAULT '0',
  `computermodels_id` int(11) NOT NULL DEFAULT '0',
  `computertypes_id` int(11) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `notepad` longtext COLLATE utf8_unicode_ci,
  `is_ocs_import` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `domains_id` (`domains_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `computermodels_id` (`computermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `operatingsystemservicepacks_id` (`operatingsystemservicepacks_id`),
  KEY `operatingsystemversions_id` (`operatingsystemversions_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `computertypes_id` (`computertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_ocs_import` (`is_ocs_import`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_computers` VALUES ('1','0','PC0001','','','','','9','3','','2012-05-16 05:42:24','1','1','0','','VP4RF-2WJ8G-C4GC4-97JB7-RYC9D','0','1','0','0','0','0','0',NULL,'0','0',NULL,'0','71','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('2','0','PC0002','','','','','9','3','','2012-05-16 09:51:26','1','2','0','','TV6CX-J7DYC-33VXK-9V6GY-Q9CD8','0','1','0','0','0','0','0',NULL,'0','0',NULL,'0','62','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('3','0','PC0003','','','','','9','3','','2012-05-16 09:55:40','1','2','0','','TFYHH-442GJ-7VDH6-YRX6H-79V4D','0','1','0','0','0','0','0',NULL,'0','0',NULL,'0','22','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('4','0','PC0004','','','','','9','3','','2012-05-16 09:54:42','1','2','0','','D897F-4C4Y8-HFVXG-MG7R3-KMDVX','0','1','0','0','0','0','0',NULL,'0','0',NULL,'0','45','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('5','0','PC0005','','','','','9','3','','2012-05-15 03:40:46','1','2','0','','GRDK7-QVGRW-FC7PD-4WPD3-MF9BV','0','2','0','0','0','0','0',NULL,'0','0',NULL,'0','68','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('6','0','PC0006','','','','','9','3','','2012-05-16 05:36:16','1','2','0','','9BR6V-X2WFK-743W9-24TBJ-RBTP8','0','5','0','0','0','0','0',NULL,'0','0',NULL,'0','16','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('7','0','PC0007','','','','','9','3','','2012-05-15 04:56:05','1','2','0','','PQ6QV-GDRG6-3RHXV-PPG93-679GR','0','2','0','0','0','0','0',NULL,'0','0',NULL,'0','70','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('8','0','PC0008','','','','','9','0','','2012-05-15 05:01:50','1','2','0','','6VJYK-TP767-HJCR2-7J4X4-WH4JT','0','2','0','0','0','0','0',NULL,'0','0',NULL,'0','69','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('9','0','PC0009','','','','','9','3','','2012-05-15 05:42:58','1','2','0','','D3GRJ-YC28T-23QY2-XK29F-FF9XV','0','3','0','0','0','0','0',NULL,'0','0',NULL,'0','17','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('10','0','PC0010','','','','','9','3','','2012-05-15 05:55:31','1','2','0','','HV3KY-QTPWW-WVDKP-GMJTP-Q4Q77','0','3','0','0','0','0','0',NULL,'0','0',NULL,'0','43','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('11','0','PC0011','','','','','9','3','','2012-05-15 06:11:24','1','2','0','','MJYGK-BVTWH-K3WYJ-934RQ-TPCJC','0','3','0','0','0','0','0',NULL,'0','0',NULL,'0','24','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('12','0','PC0012','','','','','9','3','','2012-05-15 06:23:40','1','2','0','','BCKX8-8X96Y-PD7G6-BJKKJ-TXCGQ','0','3','0','0','0','0','0',NULL,'0','0',NULL,'0','39','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('13','0','PC0013','','','','','9','3','','2012-05-15 07:49:57','1','2','0','','7K497-JD8C7-7GWY2-C8M4X-X6JJJ','0','4','0','0','0','0','0',NULL,'0','0',NULL,'0','50','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('14','0','PC0014','','','','','9','3','','2012-05-15 08:07:31','1','2','0','','6K3W2-V4VVV-WR9W7-3KVDF-WW4K9','0','4','0','0','0','0','0',NULL,'0','0',NULL,'0','54','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('15','0','PC0015','','','','','9','3','','2012-05-15 08:25:10','1','2','0','','H8DM9-Y89YH-9XB36-8JJBV-C268M','0','4','0','0','0','0','0',NULL,'0','0',NULL,'0','25','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('16','0','PC0016','','','','','9','3','','2012-05-15 08:36:19','1','1','0','','QYWD6-2P4PY-RXWPH-QQGKB-8R3YY','0','4','0','0','0','0','0',NULL,'0','0',NULL,'0','28','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('17','0','PC0017','','','','','9','3','','2012-05-15 08:50:06','1','2','0','','HYMPX-HFBC3-F8T26-TBVFH-C66V8','0','4','0','0','0','0','0',NULL,'0','0',NULL,'0','64','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('18','0','PC0018','','','','','9','3','','2012-05-16 02:57:19','1','2','0','','GGQ6G-X2K3M-F28HV-XXYX8-YCMQ4','0','5','0','0','0','0','0',NULL,'0','0',NULL,'0','47','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('19','0','PC0019','','','','','9','3','','2012-05-16 03:02:40','1','2','0','','4BT7T-C2VVH-Q7VTJ-2376W-RHKBV','0','5','0','0','0','0','0',NULL,'0','0',NULL,'0','58','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('20','0','PC0020','','','','','9','3','','2012-05-16 03:09:24','1','2','0','','XBF9T-PTX74-CQ9R7-Y2BGF-827Y3','0','5','0','0','0','0','0',NULL,'0','0',NULL,'0','12','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('21','0','PC0021','','','','','9','3','','2012-05-16 05:37:00','1','2','0','','2X8G2-6XKJD-KK3JJ-DXMWV-W6JQP','0','1','0','0','0','0','0',NULL,'0','0',NULL,'0','60','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('22','0','PC0022','','','','','9','3','','2012-05-16 03:19:55','1','2','0','','W36HH-X4KC8-33DHC-8PBTM-CVG6P','0','5','0','0','0','0','0',NULL,'0','0',NULL,'0','37','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('23','0','PC0023','','','','','6','0','','2012-05-16 05:47:09','0','0','0','','','0','5','0','0','0','0','0',NULL,'0','0',NULL,'0','6','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('24','0','MACMINI0001','C07H52U2D3D0','','','','9','3','','2012-05-16 03:27:29','3','0','0','','','0','1','0','0','0','0','0',NULL,'0','0',NULL,'0','22','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('25','0','MACMINI0002','YM0120D09G6','','','','9','3','','2012-05-16 03:28:47','3','0','0','','','0','6','0','0','0','0','0',NULL,'0','0',NULL,'0','15','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('26','0','PC0024','','','','','9','3','','2012-05-16 03:32:56','1','1','0','','JQ2HY-639MD-MF67V-3P79K-VVYYJ','0','6','0','0','0','0','0',NULL,'0','0',NULL,'0','21','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('27','0','PC0025','','','','','9','0','','2012-05-16 03:57:17','2','4','0','','','0','6','0','0','0','0','0',NULL,'0','0',NULL,'0','36','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('28','0','PC0026','','','','','9','3','','2012-05-16 03:53:53','2','3','0','','','0','6','0','0','0','0','0',NULL,'0','0',NULL,'0','38','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('29','0','MACMINI0003','C07GD4YFDJDO','','','','9','3','','2012-05-16 04:15:02','3','0','0','','','0','7','0','0','0','0','0',NULL,'0','0',NULL,'0','31','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('30','0','IMAC0001','D25GD0QLDHJN','','','','9','3','','2012-05-16 04:17:27','3','0','0','','','0','7','0','0','1','0','0',NULL,'0','0',NULL,'0','67','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('31','0','PC0027','','','','','9','3','','2012-05-16 04:21:06','2','0','0','','','0','7','0','0','0','0','0',NULL,'0','0',NULL,'0','33','3','0','0.0000','');
INSERT INTO `glpi_computers` VALUES ('32','0','PC0028','','','','','9','3','','2012-05-16 04:31:05','1','5','0','','BTCJG-6P2X4-3MJRM-GH74X-TQRCD','0','7','0','0','0','0','0',NULL,'0','0',NULL,'0','48','3','0','0.0000','');

### Dump table glpi_computers_devicecases

DROP TABLE IF EXISTS `glpi_computers_devicecases`;
CREATE TABLE `glpi_computers_devicecases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicecases_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicecases_id` (`devicecases_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computers_devicecontrols

DROP TABLE IF EXISTS `glpi_computers_devicecontrols`;
CREATE TABLE `glpi_computers_devicecontrols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicecontrols_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicecontrols_id` (`devicecontrols_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computers_devicedrives

DROP TABLE IF EXISTS `glpi_computers_devicedrives`;
CREATE TABLE `glpi_computers_devicedrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicedrives_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicedrives_id` (`devicedrives_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computers_devicegraphiccards

DROP TABLE IF EXISTS `glpi_computers_devicegraphiccards`;
CREATE TABLE `glpi_computers_devicegraphiccards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicegraphiccards_id` int(11) NOT NULL DEFAULT '0',
  `specificity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicegraphiccards_id` (`devicegraphiccards_id`),
  KEY `specificity` (`specificity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('1','1','1','1024');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('2','3','3','512');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('3','3','2','512');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('4','2','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('5','4','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('6','5','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('7','6','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('8','7','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('10','8','5','512');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('11','9','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('12','10','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('13','11','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('14','12','5','512');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('15','13','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('16','14','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('17','15','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('18','16','3','512');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('19','17','5','512');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('20','18','6','256');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('21','19','7','512');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('22','20','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('24','21','6','256');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('25','22','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('26','26','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('27','28','4','0');
INSERT INTO `glpi_computers_devicegraphiccards` VALUES ('28','27','4','0');

### Dump table glpi_computers_deviceharddrives

DROP TABLE IF EXISTS `glpi_computers_deviceharddrives`;
CREATE TABLE `glpi_computers_deviceharddrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `deviceharddrives_id` int(11) NOT NULL DEFAULT '0',
  `specificity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `deviceharddrives_id` (`deviceharddrives_id`),
  KEY `specificity` (`specificity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_computers_deviceharddrives` VALUES ('1','1','1','160');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('2','2','2','160');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('3','3','3','120');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('4','4','4','500');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('5','5','5','120');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('6','6','6','128');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('7','7','4','500');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('8','8','7','320');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('9','9','3','120');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('10','10','8','128');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('11','11','9','320');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('12','12','10','500');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('13','13','11','80');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('14','14','12','160');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('15','15','4','500');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('16','16','1','160');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('17','17','2','160');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('18','18','6','128');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('19','19','13','250');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('20','21','10','500');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('21','22','6','128');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('22','26','11','80');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('23','28','4','500');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('24','27','11','80');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('25','31','9','320');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('26','32','9','320');
INSERT INTO `glpi_computers_deviceharddrives` VALUES ('27','20','11','80');

### Dump table glpi_computers_devicememories

DROP TABLE IF EXISTS `glpi_computers_devicememories`;
CREATE TABLE `glpi_computers_devicememories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicememories_id` int(11) NOT NULL DEFAULT '0',
  `specificity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicememories_id` (`devicememories_id`),
  KEY `specificity` (`specificity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_computers_devicememories` VALUES ('1','1','1','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('2','1','1','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('3','2','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('4','2','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('5','3','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('6','3','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('7','3','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('8','3','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('9','4','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('10','4','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('11','5','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('12','5','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('13','6','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('14','6','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('15','7','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('16','7','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('17','8','4','1024');
INSERT INTO `glpi_computers_devicememories` VALUES ('18','8','4','1024');
INSERT INTO `glpi_computers_devicememories` VALUES ('19','8','4','1024');
INSERT INTO `glpi_computers_devicememories` VALUES ('20','8','4','1024');
INSERT INTO `glpi_computers_devicememories` VALUES ('21','9','5','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('22','10','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('23','10','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('24','11','5','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('25','11','5','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('26','12','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('27','12','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('28','13','1','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('29','13','1','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('30','14','1','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('31','14','1','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('32','15','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('33','15','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('34','16','1','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('35','16','1','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('36','17','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('37','17','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('38','18','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('39','18','2','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('40','19','6','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('41','19','6','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('42','20','7','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('43','20','7','2048');
INSERT INTO `glpi_computers_devicememories` VALUES ('44','21','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('45','21','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('46','22','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('47','22','3','4096');
INSERT INTO `glpi_computers_devicememories` VALUES ('48','26','8','1024');
INSERT INTO `glpi_computers_devicememories` VALUES ('49','26','8','1024');
INSERT INTO `glpi_computers_devicememories` VALUES ('50','27','8','1024');
INSERT INTO `glpi_computers_devicememories` VALUES ('51','27','8','1024');
INSERT INTO `glpi_computers_devicememories` VALUES ('52','28','2','4096');

### Dump table glpi_computers_devicemotherboards

DROP TABLE IF EXISTS `glpi_computers_devicemotherboards`;
CREATE TABLE `glpi_computers_devicemotherboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicemotherboards_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicemotherboards_id` (`devicemotherboards_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_computers_devicemotherboards` VALUES ('1','1','1');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('2','2','2');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('3','3','3');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('4','4','4');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('5','5','5');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('6','6','2');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('7','7','2');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('8','8','6');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('9','9','5');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('10','10','7');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('11','11','8');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('12','12','9');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('13','13','10');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('14','14','1');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('15','15','2');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('16','16','1');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('17','17','9');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('18','18','11');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('19','19','12');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('20','20','10');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('21','21','13');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('22','22','2');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('23','26','14');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('24','28','2');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('25','27','15');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('26','31','6');
INSERT INTO `glpi_computers_devicemotherboards` VALUES ('27','32','16');

### Dump table glpi_computers_devicenetworkcards

DROP TABLE IF EXISTS `glpi_computers_devicenetworkcards`;
CREATE TABLE `glpi_computers_devicenetworkcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicenetworkcards_id` int(11) NOT NULL DEFAULT '0',
  `specificity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicenetworkcards_id` (`devicenetworkcards_id`),
  KEY `specificity` (`specificity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computers_devicepcis

DROP TABLE IF EXISTS `glpi_computers_devicepcis`;
CREATE TABLE `glpi_computers_devicepcis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicepcis_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicepcis_id` (`devicepcis_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computers_devicepowersupplies

DROP TABLE IF EXISTS `glpi_computers_devicepowersupplies`;
CREATE TABLE `glpi_computers_devicepowersupplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicepowersupplies_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicepowersupplies_id` (`devicepowersupplies_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computers_deviceprocessors

DROP TABLE IF EXISTS `glpi_computers_deviceprocessors`;
CREATE TABLE `glpi_computers_deviceprocessors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `deviceprocessors_id` int(11) NOT NULL DEFAULT '0',
  `specificity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `deviceprocessors_id` (`deviceprocessors_id`),
  KEY `specificity` (`specificity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_computers_deviceprocessors` VALUES ('1','1','1','2200');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('2','2','2','2800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('3','3','3','2800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('4','4','4','2500');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('5','5','5','3000');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('6','6','6','3400');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('7','7','2','2800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('8','8','7','3000');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('9','9','2','2800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('10','10','8','3200');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('11','11','4','2500');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('12','12','9','2933');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('13','13','10','1800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('14','14','1','2200');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('15','15','2','2800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('16','16','1','2200');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('17','17','9','2933');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('18','18','6','3400');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('19','19','7','3000');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('20','20','10','1800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('21','21','11','2500');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('22','22','5','3000');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('23','26','12','1800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('24','27','12','1800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('25','28','2','2800');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('26','31','13','3006');
INSERT INTO `glpi_computers_deviceprocessors` VALUES ('27','32','14','2600');

### Dump table glpi_computers_devicesoundcards

DROP TABLE IF EXISTS `glpi_computers_devicesoundcards`;
CREATE TABLE `glpi_computers_devicesoundcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `devicesoundcards_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `devicesoundcards_id` (`devicesoundcards_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computers_items

DROP TABLE IF EXISTS `glpi_computers_items`;
CREATE TABLE `glpi_computers_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various table, according to itemtype (ID)',
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_computers_items` VALUES ('62','2','4','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('56','1','21','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('3','4','2','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('4','3','2','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('5','5','3','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('6','6','3','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('7','7','3','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('8','8','4','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('10','1','3','Peripheral');
INSERT INTO `glpi_computers_items` VALUES ('11','10','5','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('12','11','5','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('53','13','18','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('52','12','7','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('15','16','7','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('60','34','21','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('17','14','8','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('18','15','8','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('19','18','9','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('20','19','9','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('21','20','10','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('22','21','10','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('23','22','11','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('24','23','12','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('25','24','12','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('26','25','13','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('27','26','14','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('28','27','15','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('29','28','15','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('30','29','16','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('31','30','16','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('32','31','17','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('33','32','17','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('34','33','18','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('36','36','19','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('37','35','20','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('38','39','22','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('39','40','22','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('55','38','6','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('54','37','6','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('42','41','23','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('43','42','25','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('44','43','26','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('45','44','27','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('46','45','28','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('47','46','29','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('48','47','31','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('49','48','31','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('50','49','32','Monitor');
INSERT INTO `glpi_computers_items` VALUES ('51','50','32','Monitor');

### Dump table glpi_computers_softwarelicenses

DROP TABLE IF EXISTS `glpi_computers_softwarelicenses`;
CREATE TABLE `glpi_computers_softwarelicenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `softwarelicenses_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`computers_id`,`softwarelicenses_id`),
  KEY `computers_id` (`computers_id`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computers_softwareversions

DROP TABLE IF EXISTS `glpi_computers_softwareversions`;
CREATE TABLE `glpi_computers_softwareversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `softwareversions_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`computers_id`,`softwareversions_id`),
  KEY `softwareversions_id` (`softwareversions_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computertypes

DROP TABLE IF EXISTS `glpi_computertypes`;
CREATE TABLE `glpi_computertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_computervirtualmachines

DROP TABLE IF EXISTS `glpi_computervirtualmachines`;
CREATE TABLE `glpi_computervirtualmachines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `virtualmachinestates_id` int(11) NOT NULL DEFAULT '0',
  `virtualmachinesystems_id` int(11) NOT NULL DEFAULT '0',
  `virtualmachinetypes_id` int(11) NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vcpu` int(11) NOT NULL DEFAULT '0',
  `ram` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `virtualmachinestates_id` (`virtualmachinestates_id`),
  KEY `virtualmachinesystems_id` (`virtualmachinesystems_id`),
  KEY `vcpu` (`vcpu`),
  KEY `ram` (`ram`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_configs

DROP TABLE IF EXISTS `glpi_configs`;
CREATE TABLE `glpi_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_jobs_at_login` tinyint(1) NOT NULL DEFAULT '0',
  `cut` int(11) NOT NULL DEFAULT '255',
  `list_limit` int(11) NOT NULL DEFAULT '20',
  `list_limit_max` int(11) NOT NULL DEFAULT '50',
  `url_maxlength` int(11) NOT NULL DEFAULT '30',
  `version` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_loglevel` int(11) NOT NULL DEFAULT '5',
  `use_mailing` tinyint(1) NOT NULL DEFAULT '0',
  `admin_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_reply` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_reply_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mailing_signature` text COLLATE utf8_unicode_ci,
  `use_anonymous_helpdesk` tinyint(1) NOT NULL DEFAULT '0',
  `use_anonymous_followups` tinyint(1) NOT NULL DEFAULT '0',
  `language` char(10) COLLATE utf8_unicode_ci DEFAULT 'en_GB' COMMENT 'see define.php CFG_GLPI[language] array',
  `priority_1` char(20) COLLATE utf8_unicode_ci DEFAULT '#fff2f2',
  `priority_2` char(20) COLLATE utf8_unicode_ci DEFAULT '#ffe0e0',
  `priority_3` char(20) COLLATE utf8_unicode_ci DEFAULT '#ffcece',
  `priority_4` char(20) COLLATE utf8_unicode_ci DEFAULT '#ffbfbf',
  `priority_5` char(20) COLLATE utf8_unicode_ci DEFAULT '#ffadad',
  `priority_6` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#ff5555',
  `date_tax` date NOT NULL DEFAULT '2005-12-31',
  `cas_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cas_port` int(11) NOT NULL DEFAULT '443',
  `cas_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cas_logout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authldaps_id_extra` int(11) NOT NULL DEFAULT '0' COMMENT 'extra server',
  `existing_auth_server_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `existing_auth_server_field_clean_domain` tinyint(1) NOT NULL DEFAULT '0',
  `planning_begin` time NOT NULL DEFAULT '08:00:00',
  `planning_end` time NOT NULL DEFAULT '20:00:00',
  `utf8_conv` int(11) NOT NULL DEFAULT '0',
  `use_public_faq` tinyint(1) NOT NULL DEFAULT '0',
  `url_base` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_link_in_mail` tinyint(1) NOT NULL DEFAULT '0',
  `text_login` text COLLATE utf8_unicode_ci,
  `founded_new_version` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dropdown_max` int(11) NOT NULL DEFAULT '100',
  `ajax_wildcard` char(1) COLLATE utf8_unicode_ci DEFAULT '*',
  `use_ajax` tinyint(1) NOT NULL DEFAULT '0',
  `ajax_min_textsearch_load` int(11) NOT NULL DEFAULT '0',
  `ajax_limit_count` int(11) NOT NULL DEFAULT '50',
  `use_ajax_autocompletion` tinyint(1) NOT NULL DEFAULT '1',
  `is_users_auto_add` tinyint(1) NOT NULL DEFAULT '1',
  `date_format` int(11) NOT NULL DEFAULT '0',
  `number_format` int(11) NOT NULL DEFAULT '0',
  `csv_delimiter` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `is_ids_visible` tinyint(1) NOT NULL DEFAULT '0',
  `dropdown_chars_limit` int(11) NOT NULL DEFAULT '50',
  `use_ocs_mode` tinyint(1) NOT NULL DEFAULT '0',
  `smtp_mode` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php MAIL_* constant',
  `smtp_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_port` int(11) NOT NULL DEFAULT '25',
  `smtp_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proxy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proxy_port` int(11) NOT NULL DEFAULT '8080',
  `proxy_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_followup_on_update_ticket` tinyint(1) NOT NULL DEFAULT '1',
  `keep_tickets_on_delete` tinyint(1) NOT NULL DEFAULT '1',
  `time_step` int(11) DEFAULT '5',
  `decimal_number` int(11) DEFAULT '2',
  `helpdesk_doc_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `central_doc_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `documentcategories_id_forticket` int(11) NOT NULL DEFAULT '0' COMMENT 'default category for documents added with a ticket',
  `monitors_management_restrict` int(11) NOT NULL DEFAULT '2',
  `phones_management_restrict` int(11) NOT NULL DEFAULT '2',
  `peripherals_management_restrict` int(11) NOT NULL DEFAULT '2',
  `printers_management_restrict` int(11) NOT NULL DEFAULT '2',
  `use_log_in_files` tinyint(1) NOT NULL DEFAULT '0',
  `time_offset` int(11) NOT NULL DEFAULT '0' COMMENT 'in seconds',
  `is_contact_autoupdate` tinyint(1) NOT NULL DEFAULT '1',
  `is_user_autoupdate` tinyint(1) NOT NULL DEFAULT '1',
  `is_group_autoupdate` tinyint(1) NOT NULL DEFAULT '1',
  `is_location_autoupdate` tinyint(1) NOT NULL DEFAULT '1',
  `state_autoupdate_mode` int(11) NOT NULL DEFAULT '0',
  `is_contact_autoclean` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_autoclean` tinyint(1) NOT NULL DEFAULT '0',
  `is_group_autoclean` tinyint(1) NOT NULL DEFAULT '0',
  `is_location_autoclean` tinyint(1) NOT NULL DEFAULT '0',
  `state_autoclean_mode` int(11) NOT NULL DEFAULT '0',
  `use_flat_dropdowntree` tinyint(1) NOT NULL DEFAULT '0',
  `use_autoname_by_entity` tinyint(1) NOT NULL DEFAULT '1',
  `is_categorized_soft_expanded` tinyint(1) NOT NULL DEFAULT '1',
  `is_not_categorized_soft_expanded` tinyint(1) NOT NULL DEFAULT '1',
  `softwarecategories_id_ondelete` int(11) NOT NULL DEFAULT '0' COMMENT 'category applyed when a software is deleted',
  `x509_email_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_mailcollector_filesize_max` int(11) NOT NULL DEFAULT '2097152',
  `followup_private` tinyint(1) NOT NULL DEFAULT '0',
  `task_private` tinyint(1) NOT NULL DEFAULT '0',
  `default_software_helpdesk_visible` tinyint(1) NOT NULL DEFAULT '1',
  `names_format` int(11) NOT NULL DEFAULT '0' COMMENT 'see *NAME_BEFORE constant in define.php',
  `default_graphtype` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'svg',
  `default_requesttypes_id` int(11) NOT NULL DEFAULT '1',
  `use_noright_users_add` tinyint(1) NOT NULL DEFAULT '1',
  `cron_limit` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Number of tasks execute by external cron',
  `priority_matrix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'json encoded array for Urgence / Impact to Protority',
  `urgency_mask` int(11) NOT NULL DEFAULT '62',
  `impact_mask` int(11) NOT NULL DEFAULT '62',
  `user_deleted_ldap` tinyint(1) NOT NULL DEFAULT '0',
  `auto_create_infocoms` tinyint(1) NOT NULL DEFAULT '0',
  `use_slave_for_search` tinyint(1) NOT NULL DEFAULT '0',
  `proxy_passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfers_id_auto` int(11) NOT NULL DEFAULT '0',
  `show_count_on_tabs` tinyint(1) NOT NULL DEFAULT '1',
  `refresh_ticket_list` int(11) NOT NULL DEFAULT '0',
  `set_default_tech` tinyint(1) NOT NULL DEFAULT '1',
  `allow_search_view` int(11) NOT NULL DEFAULT '2',
  `allow_search_all` tinyint(1) NOT NULL DEFAULT '1',
  `allow_search_global` tinyint(1) NOT NULL DEFAULT '1',
  `display_count_on_home` int(11) NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_configs` VALUES ('1','0','250','15','50','30',' 0.83.1','5','0','admsys@xxxxx.fr',NULL,NULL,NULL,'SIGNATURE','0','0','en_GB','#fff2f2','#ffe0e0','#ffcece','#ffbfbf','#ffadad','#ff5555','2005-12-31','','443','',NULL,'1',NULL,'0','08:00:00','20:00:00','1','0','http://invent.uadevelopers.com','0','','','100','*','0','0','50','1','1','0','0',';','0','50','0','0',NULL,'25',NULL,NULL,'8080',NULL,'1','0','5','2',NULL,NULL,'0','2','2','2','2','1','0','1','1','1','1','0','0','0','0','0','0','0','1','1','1','1',NULL,'2097152','0','0','1','0','svg','1','1','1','{\"1\":{\"1\":1,\"2\":1,\"3\":2,\"4\":2,\"5\":2},\"2\":{\"1\":1,\"2\":2,\"3\":2,\"4\":3,\"5\":3},\"3\":{\"1\":2,\"2\":2,\"3\":3,\"4\":4,\"5\":4},\"4\":{\"1\":2,\"2\":3,\"3\":4,\"4\":4,\"5\":5},\"5\":{\"1\":2,\"2\":3,\"3\":4,\"4\":5,\"5\":5}}','62','62','0','0','0',NULL,NULL,'0','1','0','1','2','1','1','5');

### Dump table glpi_consumableitems

DROP TABLE IF EXISTS `glpi_consumableitems`;
CREATE TABLE `glpi_consumableitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `consumableitemtypes_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `alarm_threshold` int(11) NOT NULL DEFAULT '10',
  `notepad` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `consumableitemtypes_id` (`consumableitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_consumableitemtypes

DROP TABLE IF EXISTS `glpi_consumableitemtypes`;
CREATE TABLE `glpi_consumableitemtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_consumables

DROP TABLE IF EXISTS `glpi_consumables`;
CREATE TABLE `glpi_consumables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `consumableitems_id` int(11) NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_in` (`date_in`),
  KEY `date_out` (`date_out`),
  KEY `consumableitems_id` (`consumableitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_contacts

DROP TABLE IF EXISTS `glpi_contacts`;
CREATE TABLE `glpi_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacttypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `notepad` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `contacttypes_id` (`contacttypes_id`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_contacts_suppliers

DROP TABLE IF EXISTS `glpi_contacts_suppliers`;
CREATE TABLE `glpi_contacts_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `contacts_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contacts_id`),
  KEY `contacts_id` (`contacts_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_contacttypes

DROP TABLE IF EXISTS `glpi_contacttypes`;
CREATE TABLE `glpi_contacttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_contracts

DROP TABLE IF EXISTS `glpi_contracts`;
CREATE TABLE `glpi_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `contracttypes_id` int(11) NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `notice` int(11) NOT NULL DEFAULT '0',
  `periodicity` int(11) NOT NULL DEFAULT '0',
  `billing` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `accounting_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `week_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `week_end_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_saturday` tinyint(1) NOT NULL DEFAULT '0',
  `monday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `monday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_monday` tinyint(1) NOT NULL DEFAULT '0',
  `max_links_allowed` int(11) NOT NULL DEFAULT '0',
  `notepad` longtext COLLATE utf8_unicode_ci,
  `alert` int(11) NOT NULL DEFAULT '0',
  `renewal` int(11) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `begin_date` (`begin_date`),
  KEY `name` (`name`),
  KEY `contracttypes_id` (`contracttypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `use_monday` (`use_monday`),
  KEY `use_saturday` (`use_saturday`),
  KEY `alert` (`alert`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_contracts_items

DROP TABLE IF EXISTS `glpi_contracts_items`;
CREATE TABLE `glpi_contracts_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contracts_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`contracts_id`,`itemtype`,`items_id`),
  KEY `FK_device` (`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_contracts_suppliers

DROP TABLE IF EXISTS `glpi_contracts_suppliers`;
CREATE TABLE `glpi_contracts_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `contracts_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contracts_id`),
  KEY `contracts_id` (`contracts_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_contracttypes

DROP TABLE IF EXISTS `glpi_contracttypes`;
CREATE TABLE `glpi_contracttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_crontasklogs

DROP TABLE IF EXISTS `glpi_crontasklogs`;
CREATE TABLE `glpi_crontasklogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crontasks_id` int(11) NOT NULL,
  `crontasklogs_id` int(11) NOT NULL COMMENT 'id of ''start'' event',
  `date` datetime NOT NULL,
  `state` int(11) NOT NULL COMMENT '0:start, 1:run, 2:stop',
  `elapsed` float NOT NULL COMMENT 'time elapsed since start',
  `volume` int(11) NOT NULL COMMENT 'for statistics',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'message',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `crontasks_id` (`crontasks_id`),
  KEY `crontasklogs_id_state` (`crontasklogs_id`,`state`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_crontasklogs` VALUES ('1','15','0','2012-05-14 07:20:09','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('2','15','1','2012-05-14 07:20:09','2','0.0377989','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('3','16','0','2012-05-14 07:21:11','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('4','16','3','2012-05-14 07:21:11','2','0.0235479','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('5','17','0','2012-05-14 07:25:25','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('6','17','5','2012-05-14 07:25:25','2','0.0231819','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('7','18','0','2012-05-14 07:30:13','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('8','18','7','2012-05-14 07:30:13','2','0.0309651','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('9','19','0','2012-05-14 07:31:35','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('10','19','9','2012-05-14 07:31:35','2','0.0209849','0','Action completed, fully processed');
INSERT INTO `glpi_crontasklogs` VALUES ('11','20','0','2012-05-14 07:35:34','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('12','20','11','2012-05-14 07:35:34','2','0.0227361','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('13','5','0','2012-05-14 07:37:31','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('14','5','13','2012-05-14 07:37:31','2','0.0231979','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('15','6','0','2012-05-14 07:42:03','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('16','6','15','2012-05-14 07:42:03','2','0.022459','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('17','8','0','2012-05-14 07:42:45','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('18','8','17','2012-05-14 07:42:45','2','0.112616','203','Задание завершено, полностью выполнено.');
INSERT INTO `glpi_crontasklogs` VALUES ('19','9','0','2012-05-14 07:44:58','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('20','9','19','2012-05-14 07:44:58','2','0.021975','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('21','12','0','2012-05-14 07:47:05','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('22','12','21','2012-05-14 07:47:05','1','0.0225539','1','Clean 1 session file(s) created since more than 180 seconds
');
INSERT INTO `glpi_crontasklogs` VALUES ('23','12','21','2012-05-14 07:47:05','2','0.023638','1','Action completed, fully processed');
INSERT INTO `glpi_crontasklogs` VALUES ('24','13','0','2012-05-14 07:48:21','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('25','13','24','2012-05-14 07:48:21','1','0.0222261','1','Clean 1 graph file(s) created since more than 3600 seconds
');
INSERT INTO `glpi_crontasklogs` VALUES ('26','13','24','2012-05-14 07:48:21','2','0.0233312','1','Action completed, fully processed');
INSERT INTO `glpi_crontasklogs` VALUES ('27','14','0','2012-05-14 07:52:12','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('28','14','27','2012-05-14 07:52:12','2','0.020268','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('29','17','0','2012-05-14 07:54:28','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('30','17','29','2012-05-14 07:54:28','2','0.021982','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('31','9','0','2012-05-14 08:00:51','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('32','9','31','2012-05-14 08:00:51','2','0.0216951','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('33','17','0','2012-05-14 08:05:53','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('34','17','33','2012-05-14 08:05:53','2','0.0205722','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('35','9','0','2012-05-14 08:11:00','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('36','9','35','2012-05-14 08:11:00','2','0.0218399','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('37','17','0','2012-05-14 08:16:34','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('38','17','37','2012-05-14 08:16:34','2','0.022074','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('39','9','0','2012-05-14 08:21:50','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('40','9','39','2012-05-14 08:21:50','2','0.0237079','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('41','17','0','2012-05-14 08:28:15','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('42','17','41','2012-05-14 08:28:15','2','0.020591','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('43','9','0','2012-05-14 08:35:38','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('44','9','43','2012-05-14 08:35:38','2','0.0217428','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('45','17','0','2012-05-14 08:47:18','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('46','17','45','2012-05-14 08:47:18','2','0.020999','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('47','20','0','2012-05-14 08:54:41','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('48','20','47','2012-05-14 08:54:41','2','0.0229471','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('49','9','0','2012-05-14 09:02:22','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('50','9','49','2012-05-14 09:02:22','2','0.039875','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('51','13','0','2012-05-14 09:08:12','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('52','13','51','2012-05-14 09:08:12','2','0.0221021','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('53','14','0','2012-05-14 09:13:36','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('54','14','53','2012-05-14 09:13:36','2','0.020262','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('55','17','0','2012-05-14 09:19:02','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('56','17','55','2012-05-14 09:19:02','2','0.0220931','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('57','9','0','2012-05-14 09:24:02','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('58','9','57','2012-05-14 09:24:02','2','0.0236912','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('59','17','0','2012-05-14 09:29:38','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('60','17','59','2012-05-14 09:29:38','2','0.0226381','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('61','9','0','2012-05-14 09:34:48','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('62','9','61','2012-05-14 09:34:48','2','0.0219359','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('63','17','0','2012-05-14 09:41:26','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('64','17','63','2012-05-14 09:41:26','2','0.022105','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('65','9','0','2012-05-14 09:50:07','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('66','9','65','2012-05-14 09:50:07','2','0.0239489','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('67','17','0','2012-05-14 09:55:11','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('68','17','67','2012-05-14 09:55:11','2','0.0221748','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('69','20','0','2012-05-14 10:02:37','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('70','20','69','2012-05-14 10:02:37','2','0.0227571','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('71','9','0','2012-05-14 10:09:16','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('72','9','71','2012-05-14 10:09:16','2','0.023876','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('73','17','0','2012-05-14 10:14:23','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('74','17','73','2012-05-14 10:14:23','2','0.02264','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('75','13','0','2012-05-14 10:19:31','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('76','13','75','2012-05-14 10:19:31','2','0.0218139','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('77','14','0','2012-05-14 11:30:56','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('78','14','77','2012-05-14 11:30:56','2','0.022325','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('79','9','0','2012-05-15 02:39:53','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('80','9','79','2012-05-15 02:39:53','2','0.0220549','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('81','17','0','2012-05-15 02:45:41','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('82','17','81','2012-05-15 02:45:41','2','0.020926','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('83','20','0','2012-05-15 02:51:14','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('84','20','83','2012-05-15 02:51:14','2','0.02106','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('85','13','0','2012-05-15 02:56:24','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('86','13','85','2012-05-15 02:56:24','2','0.0203202','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('87','14','0','2012-05-15 03:00:15','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('88','14','87','2012-05-15 03:00:15','2','0.020201','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('89','15','0','2012-05-15 03:07:06','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('90','15','89','2012-05-15 03:07:06','2','0.037709','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('91','16','0','2012-05-15 03:13:52','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('92','16','91','2012-05-15 03:13:52','2','0.023469','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('93','9','0','2012-05-15 03:19:03','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('94','9','93','2012-05-15 03:19:03','2','0.0217409','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('95','17','0','2012-05-15 03:24:29','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('96','17','95','2012-05-15 03:24:29','2','0.0208402','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('97','9','0','2012-05-15 03:30:36','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('98','9','97','2012-05-15 03:30:36','2','0.0247269','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('99','17','0','2012-05-15 03:38:34','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('100','17','99','2012-05-15 03:38:34','2','0.0229709','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('101','9','0','2012-05-15 03:43:47','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('102','9','101','2012-05-15 03:43:47','2','0.0256472','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('103','17','0','2012-05-15 03:49:29','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('104','17','103','2012-05-15 03:49:29','2','0.0223038','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('105','20','0','2012-05-15 03:54:38','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('106','20','105','2012-05-15 03:54:38','2','0.020972','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('107','9','0','2012-05-15 04:04:42','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('108','9','107','2012-05-15 04:04:42','2','0.022397','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('109','17','0','2012-05-15 04:21:02','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('110','17','109','2012-05-15 04:21:02','2','0.0233531','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('111','13','0','2012-05-15 04:24:24','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('112','13','111','2012-05-15 04:24:24','2','0.0202539','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('113','14','0','2012-05-15 04:43:15','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('114','14','113','2012-05-15 04:43:15','2','0.022326','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('115','9','0','2012-05-15 04:48:54','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('116','9','115','2012-05-15 04:48:54','2','0.0243011','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('117','17','0','2012-05-15 04:54:00','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('118','17','117','2012-05-15 04:54:00','2','0.0223641','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('119','20','0','2012-05-15 04:59:32','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('120','20','119','2012-05-15 04:59:32','2','0.023011','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('121','9','0','2012-05-15 05:05:41','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('122','9','121','2012-05-15 05:05:41','2','0.024327','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('123','17','0','2012-05-15 05:23:38','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('124','17','123','2012-05-15 05:23:38','2','0.022429','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('125','9','0','2012-05-15 05:28:44','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('126','9','125','2012-05-15 05:28:44','2','0.021836','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('127','13','0','2012-05-15 05:33:58','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('128','13','127','2012-05-15 05:33:58','2','0.0218542','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('129','17','0','2012-05-15 05:40:58','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('130','17','129','2012-05-15 05:40:58','2','0.022136','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('131','9','0','2012-05-15 05:46:12','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('132','9','131','2012-05-15 05:46:12','2','0.0238822','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('133','14','0','2012-05-15 05:53:27','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('134','14','133','2012-05-15 05:53:27','2','0.022527','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('135','17','0','2012-05-15 05:58:32','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('136','17','135','2012-05-15 05:58:32','2','0.022455','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('137','9','0','2012-05-15 06:04:21','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('138','9','137','2012-05-15 06:04:21','2','0.0240161','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('139','20','0','2012-05-15 06:09:24','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('140','20','139','2012-05-15 06:09:24','2','0.0230858','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('141','17','0','2012-05-15 06:14:59','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('142','17','141','2012-05-15 06:14:59','2','0.022459','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('143','9','0','2012-05-15 06:21:40','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('144','9','143','2012-05-15 06:21:40','2','0.023912','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('145','17','0','2012-05-15 06:27:42','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('146','17','145','2012-05-15 06:27:42','2','0.022218','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('147','9','0','2012-05-15 06:53:41','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('148','9','147','2012-05-15 06:53:41','2','0.024864','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('149','17','0','2012-05-15 06:59:44','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('150','17','149','2012-05-15 06:59:44','2','0.022305','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('151','13','0','2012-05-15 07:04:54','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('152','13','151','2012-05-15 07:04:54','2','0.022701','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('153','14','0','2012-05-15 07:10:37','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('154','14','153','2012-05-15 07:10:37','2','0.0221889','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('155','9','0','2012-05-15 07:47:50','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('156','9','155','2012-05-15 07:47:50','2','0.024137','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('157','17','0','2012-05-15 07:53:16','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('158','17','157','2012-05-15 07:53:16','2','0.0223238','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('159','20','0','2012-05-15 07:55:51','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('160','20','159','2012-05-15 07:55:51','2','0.0230441','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('161','18','0','2012-05-15 07:59:03','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('162','18','161','2012-05-15 07:59:03','2','0.030956','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('163','19','0','2012-05-15 07:59:28','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('164','19','163','2012-05-15 07:59:28','2','0.0229411','0','Action completed, fully processed');
INSERT INTO `glpi_crontasklogs` VALUES ('165','5','0','2012-05-15 07:59:58','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('166','5','165','2012-05-15 07:59:58','2','0.0230012','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('167','6','0','2012-05-15 08:01:29','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('168','6','167','2012-05-15 08:01:29','2','0.0228629','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('169','12','0','2012-05-15 08:04:41','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('170','12','169','2012-05-15 08:04:41','1','0.021981','4','Clean 4 session file(s) created since more than 180 seconds
');
INSERT INTO `glpi_crontasklogs` VALUES ('171','12','169','2012-05-15 08:04:41','2','0.0231991','4','Задание завершено, полностью выполнено.');
INSERT INTO `glpi_crontasklogs` VALUES ('172','9','0','2012-05-15 08:09:58','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('173','9','172','2012-05-15 08:09:58','2','0.024925','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('174','17','0','2012-05-15 08:23:55','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('175','17','174','2012-05-15 08:23:55','2','0.0224121','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('176','13','0','2012-05-15 08:24:23','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('177','13','176','2012-05-15 08:24:23','2','0.0225708','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('178','14','0','2012-05-15 08:32:07','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('179','14','178','2012-05-15 08:32:07','2','0.0220399','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('180','9','0','2012-05-15 08:44:15','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('181','9','180','2012-05-15 08:44:15','2','0.0240672','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('182','17','0','2012-05-15 08:50:09','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('183','17','182','2012-05-15 08:50:09','2','0.022089','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('184','9','0','2012-05-15 08:55:46','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('185','9','184','2012-05-15 08:55:46','2','0.0247309','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('186','17','0','2012-05-15 09:16:31','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('187','17','186','2012-05-15 09:16:31','2','0.0213299','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('188','20','0','2012-05-15 09:31:23','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('189','20','188','2012-05-15 09:31:23','2','0.0230811','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('190','9','0','2012-05-15 09:36:42','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('191','9','190','2012-05-15 09:36:42','2','0.0239232','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('192','17','0','2012-05-15 09:41:47','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('193','17','192','2012-05-15 09:41:47','2','0.0221891','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('194','13','0','2012-05-15 09:47:44','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('195','13','194','2012-05-15 09:47:44','2','0.0219028','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('196','14','0','2012-05-15 09:54:41','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('197','14','196','2012-05-15 09:54:41','2','0.0221419','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('198','9','0','2012-05-15 10:08:58','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('199','9','198','2012-05-15 10:08:58','2','0.024241','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('200','17','0','2012-05-16 02:54:40','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('201','17','200','2012-05-16 02:54:40','2','0.0205839','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('202','9','0','2012-05-16 02:59:51','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('203','9','202','2012-05-16 02:59:51','2','0.023546','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('204','20','0','2012-05-16 03:04:58','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('205','20','204','2012-05-16 03:04:58','2','0.023443','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('206','13','0','2012-05-16 03:10:18','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('207','13','206','2012-05-16 03:10:18','2','0.020484','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('208','14','0','2012-05-16 03:15:53','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('209','14','208','2012-05-16 03:15:53','2','0.0204818','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('210','15','0','2012-05-16 03:21:06','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('211','15','210','2012-05-16 03:21:06','2','0.037189','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('212','16','0','2012-05-16 03:26:07','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('213','16','212','2012-05-16 03:26:07','2','0.0234282','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('214','17','0','2012-05-16 03:31:18','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('215','17','214','2012-05-16 03:31:18','2','0.023056','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('216','9','0','2012-05-16 03:36:21','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('217','9','216','2012-05-16 03:36:21','2','0.021699','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('218','17','0','2012-05-16 03:42:17','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('219','17','218','2012-05-16 03:42:17','2','0.0208361','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('220','9','0','2012-05-16 03:47:19','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('221','9','220','2012-05-16 03:47:19','2','0.0223782','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('222','17','0','2012-05-16 03:52:33','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('223','17','222','2012-05-16 03:52:33','2','0.0206521','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('224','9','0','2012-05-16 03:57:56','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('225','9','224','2012-05-16 03:57:56','2','0.021857','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('226','17','0','2012-05-16 04:09:48','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('227','17','226','2012-05-16 04:09:48','2','0.022938','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('228','20','0','2012-05-16 04:14:54','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('229','20','228','2012-05-16 04:14:54','2','0.020978','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('230','9','0','2012-05-16 04:20:03','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('231','9','230','2012-05-16 04:20:03','2','0.023056','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('232','13','0','2012-05-16 04:26:55','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('233','13','232','2012-05-16 04:26:55','2','0.02127','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('234','17','0','2012-05-16 04:31:57','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('235','17','234','2012-05-16 04:31:57','2','0.021009','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('236','14','0','2012-05-16 04:37:01','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('237','14','236','2012-05-16 04:37:01','2','0.020309','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('238','9','0','2012-05-16 05:22:51','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('239','9','238','2012-05-16 05:22:51','2','0.024852','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('240','17','0','2012-05-16 05:27:59','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('241','17','240','2012-05-16 05:27:59','2','0.020957','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('242','20','0','2012-05-16 05:34:45','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('243','20','242','2012-05-16 05:34:45','2','0.029582','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('244','13','0','2012-05-16 05:41:52','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('245','13','244','2012-05-16 05:41:52','2','0.021018','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('246','9','0','2012-05-16 05:47:02','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('247','9','246','2012-05-16 05:47:02','2','0.0237651','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('248','17','0','2012-05-16 06:19:39','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('249','17','248','2012-05-16 06:19:39','2','0.023314','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('250','14','0','2012-05-16 09:51:11','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('251','14','250','2012-05-16 09:51:11','2','0.021996','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('252','9','0','2012-05-16 09:56:14','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('253','9','252','2012-05-16 09:56:14','2','0.0237551','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('254','17','0','2012-05-16 10:08:46','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('255','17','254','2012-05-16 10:08:46','2','0.0223908','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('256','20','0','2012-05-16 11:12:01','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('257','20','256','2012-05-16 11:12:01','2','0.0233231','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('258','13','0','2012-05-16 11:34:32','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('259','13','258','2012-05-16 11:34:32','2','0.0226052','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('260','18','0','2012-05-17 03:54:07','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('261','18','260','2012-05-17 03:54:07','2','0.0266809','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('262','19','0','2012-05-17 04:19:16','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('263','19','262','2012-05-17 04:19:16','2','0.0230141','0','Action completed, fully processed');
INSERT INTO `glpi_crontasklogs` VALUES ('264','5','0','2012-05-17 04:31:14','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('265','5','264','2012-05-17 04:31:14','2','0.0202219','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('266','6','0','2012-05-17 11:11:14','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('267','6','266','2012-05-17 11:11:14','2','0.023277','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('268','12','0','2012-05-18 02:35:58','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('269','12','268','2012-05-18 02:35:58','1','0.0220768','23','Clean 23 session file(s) created since more than 180 seconds
');
INSERT INTO `glpi_crontasklogs` VALUES ('270','12','268','2012-05-18 02:35:58','2','0.0232708','23','Action completed, fully processed');
INSERT INTO `glpi_crontasklogs` VALUES ('271','9','0','2012-05-18 02:37:06','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('272','9','271','2012-05-18 02:37:06','2','0.022609','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('273','17','0','2012-05-18 02:37:21','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('274','17','273','2012-05-18 02:37:21','2','0.0209639','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('275','14','0','2012-05-18 02:38:26','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('276','14','275','2012-05-18 02:38:26','2','0.0225759','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('277','20','0','2012-05-18 02:40:05','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('278','20','277','2012-05-18 02:40:05','2','0.0232401','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('279','13','0','2012-05-18 02:41:00','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('280','13','279','2012-05-18 02:41:00','2','0.0225959','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('281','15','0','2012-05-18 02:41:07','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('282','15','281','2012-05-18 02:41:07','2','0.0323699','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('283','16','0','2012-05-18 02:46:27','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('284','16','283','2012-05-18 02:46:27','2','0.023762','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('285','17','0','2012-05-18 02:47:43','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('286','17','285','2012-05-18 02:47:43','2','0.0228021','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('287','9','0','2012-05-18 03:12:23','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('288','9','287','2012-05-18 03:12:23','2','0.0245168','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('289','17','0','2012-05-18 04:58:38','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('290','17','289','2012-05-18 04:58:38','2','0.0214262','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('291','9','0','2012-05-18 05:03:43','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('292','9','291','2012-05-18 05:03:43','2','0.0246482','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('293','14','0','2012-05-18 05:08:58','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('294','14','293','2012-05-18 05:08:58','2','0.0205729','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('295','20','0','2012-05-18 05:14:37','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('296','20','295','2012-05-18 05:14:37','2','0.0216231','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('297','13','0','2012-05-18 05:15:59','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('298','13','297','2012-05-18 05:15:59','2','0.0213521','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('299','18','0','2012-05-18 05:33:01','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('300','18','299','2012-05-18 05:33:01','2','0.030997','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('301','19','0','2012-05-18 05:34:57','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('302','19','301','2012-05-18 05:34:57','2','0.0215271','0','Action completed, fully processed');
INSERT INTO `glpi_crontasklogs` VALUES ('303','5','0','2012-05-18 06:32:17','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('304','5','303','2012-05-18 06:32:17','2','0.022408','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('305','17','0','2012-05-18 07:02:33','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('306','17','305','2012-05-18 07:02:33','2','0.0208249','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('307','9','0','2012-05-24 07:18:30','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('308','9','307','2012-05-24 07:18:30','2','0.024514','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('309','14','0','2012-05-24 07:19:07','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('310','14','309','2012-05-24 07:19:07','2','0.0204101','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('311','20','0','2012-05-25 04:08:00','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('312','20','311','2012-05-25 04:08:00','2','0.020772','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('313','13','0','2012-05-29 07:47:17','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('314','13','313','2012-05-29 07:47:17','2','0.0210991','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('315','17','0','2012-05-29 07:52:36','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('316','17','315','2012-05-29 07:52:36','2','0.0210001','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('317','6','0','2012-05-29 07:52:55','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('318','6','317','2012-05-29 07:52:55','2','0.0204401','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('319','15','0','2012-05-29 07:54:08','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('320','15','319','2012-05-29 07:54:08','2','0.033865','0','Action completed, no processing required');
INSERT INTO `glpi_crontasklogs` VALUES ('321','16','0','2012-05-29 07:57:51','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('322','16','321','2012-05-29 07:57:51','2','0.0205288','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('323','12','0','2012-05-29 07:58:56','0','0','0','Run mode : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('324','12','323','2012-05-29 07:58:56','1','0.0208721','7','Clean 7 session file(s) created since more than 180 seconds
');
INSERT INTO `glpi_crontasklogs` VALUES ('325','12','323','2012-05-29 07:58:56','2','0.022011','7','Action completed, fully processed');
INSERT INTO `glpi_crontasklogs` VALUES ('326','18','0','2012-05-29 08:04:11','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('327','18','326','2012-05-29 08:04:11','2','0.0311689','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('328','19','0','2012-05-29 08:15:49','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('329','19','328','2012-05-29 08:15:49','2','0.0241029','0','Задание завершено, полностью выполнено.');
INSERT INTO `glpi_crontasklogs` VALUES ('330','5','0','2012-05-29 08:20:54','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('331','5','330','2012-05-29 08:20:54','2','0.0204928','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('332','8','0','2012-05-29 08:30:02','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('333','8','332','2012-05-29 08:30:02','2','0.115885','207','Задание завершено, полностью выполнено.');
INSERT INTO `glpi_crontasklogs` VALUES ('334','9','0','2012-05-29 08:36:38','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('335','9','334','2012-05-29 08:36:38','2','0.022084','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('336','14','0','2012-05-29 08:42:04','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('337','14','336','2012-05-29 08:42:04','2','0.023844','0','Задание завершено, действий не требуется.');
INSERT INTO `glpi_crontasklogs` VALUES ('338','20','0','2012-05-29 08:47:10','0','0','0','Способ выполнения : GLPI');
INSERT INTO `glpi_crontasklogs` VALUES ('339','20','338','2012-05-29 08:47:10','2','0.0336211','0','Задание завершено, действий не требуется.');

### Dump table glpi_crontasks

DROP TABLE IF EXISTS `glpi_crontasks`;
CREATE TABLE `glpi_crontasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'task name',
  `frequency` int(11) NOT NULL COMMENT 'second between launch',
  `param` int(11) DEFAULT NULL COMMENT 'task specify parameter',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0:disabled, 1:waiting, 2:running',
  `mode` int(11) NOT NULL DEFAULT '1' COMMENT '1:internal, 2:external',
  `allowmode` int(11) NOT NULL DEFAULT '3' COMMENT '1:internal, 2:external, 3:both',
  `hourmin` int(11) NOT NULL DEFAULT '0',
  `hourmax` int(11) NOT NULL DEFAULT '24',
  `logs_lifetime` int(11) NOT NULL DEFAULT '30' COMMENT 'number of days',
  `lastrun` datetime DEFAULT NULL COMMENT 'last run date',
  `lastcode` int(11) DEFAULT NULL COMMENT 'last run return code',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`name`),
  KEY `mode` (`mode`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Task run by internal / external cron.';

INSERT INTO `glpi_crontasks` VALUES ('1','OcsServer','ocsng','300',NULL,'0','1','3','0','24','30',NULL,NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('2','CartridgeItem','cartridge','86400','10','0','1','3','0','24','30',NULL,NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('3','ConsumableItem','consumable','86400','10','0','1','3','0','24','30',NULL,NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('4','SoftwareLicense','software','86400',NULL,'0','1','3','0','24','30',NULL,NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('5','Contract','contract','86400',NULL,'1','1','3','0','24','30','2012-05-29 08:20:55',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('6','InfoCom','infocom','86400',NULL,'1','1','3','0','24','30','2012-05-29 07:52:55',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('7','CronTask','logs','86400','30','0','1','3','0','24','30',NULL,NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('8','CronTask','optimize','604800',NULL,'1','1','3','0','24','30','2012-05-29 08:30:03',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('9','MailCollector','mailgate','600','10','1','1','3','0','24','30','2012-05-29 08:36:38',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('10','DBconnection','checkdbreplicate','300',NULL,'0','1','3','0','24','30',NULL,NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('11','CronTask','checkupdate','604800',NULL,'0','1','3','0','24','30',NULL,NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('12','CronTask','session','86400',NULL,'1','1','3','0','24','30','2012-05-29 07:58:56',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('13','CronTask','graph','3600',NULL,'1','1','3','0','24','30','2012-05-29 07:47:17',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('14','ReservationItem','reservation','3600',NULL,'1','1','3','0','24','30','2012-05-29 08:42:04',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('15','Ticket','closeticket','43200',NULL,'1','1','3','0','24','30','2012-05-29 07:54:08',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('16','Ticket','alertnotclosed','43200',NULL,'1','1','3','0','24','30','2012-05-29 07:57:51',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('17','SlaLevel_Ticket','slaticket','300',NULL,'1','1','3','0','24','30','2012-05-29 07:52:36',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('18','Ticket','createinquest','86400',NULL,'1','1','3','0','24','30','2012-05-29 08:04:11',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('19','Crontask','watcher','86400',NULL,'1','1','3','0','24','30','2012-05-29 08:15:49',NULL,NULL);
INSERT INTO `glpi_crontasks` VALUES ('20','TicketRecurrent','ticketrecurrent','3600',NULL,'1','1','3','0','24','30','2012-05-29 08:47:10',NULL,NULL);

### Dump table glpi_devicecases

DROP TABLE IF EXISTS `glpi_devicecases`;
CREATE TABLE `glpi_devicecases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicecasetypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicecasetypes_id` (`devicecasetypes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_devicecasetypes

DROP TABLE IF EXISTS `glpi_devicecasetypes`;
CREATE TABLE `glpi_devicecasetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_devicecontrols

DROP TABLE IF EXISTS `glpi_devicecontrols`;
CREATE TABLE `glpi_devicecontrols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_raid` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_devicedrives

DROP TABLE IF EXISTS `glpi_devicedrives`;
CREATE TABLE `glpi_devicedrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_writer` tinyint(1) NOT NULL DEFAULT '1',
  `speed` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_devicegraphiccards

DROP TABLE IF EXISTS `glpi_devicegraphiccards`;
CREATE TABLE `glpi_devicegraphiccards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `specif_default` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_devicegraphiccards` VALUES ('1','EAH4350','9','','6','1024');
INSERT INTO `glpi_devicegraphiccards` VALUES ('2','GeForce 210 ','9','','11','512');
INSERT INTO `glpi_devicegraphiccards` VALUES ('3','8400GS','9','','11','512');
INSERT INTO `glpi_devicegraphiccards` VALUES ('4','Integrated','0','','0','0');
INSERT INTO `glpi_devicegraphiccards` VALUES ('5','HD4350','9','','5','512');
INSERT INTO `glpi_devicegraphiccards` VALUES ('6','HD4300','9','','5','256');
INSERT INTO `glpi_devicegraphiccards` VALUES ('7','9400GT','9','','11','512');

### Dump table glpi_deviceharddrives

DROP TABLE IF EXISTS `glpi_deviceharddrives`;
CREATE TABLE `glpi_deviceharddrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rpm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `cache` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `specif_default` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_deviceharddrives` VALUES ('1','HD161HJ','','10','','','2','160');
INSERT INTO `glpi_deviceharddrives` VALUES ('2','HDT721016SLA380','','10','','','0','160');
INSERT INTO `glpi_deviceharddrives` VALUES ('3','SH100S3120G ','','11','','','7','120');
INSERT INTO `glpi_deviceharddrives` VALUES ('4','HD502HJ ','','0','','','2','500');
INSERT INTO `glpi_deviceharddrives` VALUES ('5','SVP200S3120G','','11','','','7','120');
INSERT INTO `glpi_deviceharddrives` VALUES ('6','SVP100ES2128G','','11','','','7','128');
INSERT INTO `glpi_deviceharddrives` VALUES ('7','HD322HJ','','10','','','2','320');
INSERT INTO `glpi_deviceharddrives` VALUES ('8','SNVP325S2128GB','','10','','','7','128');
INSERT INTO `glpi_deviceharddrives` VALUES ('9','ST3320418AS','','10','','','14','320');
INSERT INTO `glpi_deviceharddrives` VALUES ('10','WD5000AADS-00S9B0','','10','','','15','500');
INSERT INTO `glpi_deviceharddrives` VALUES ('11','HD080HJ','','10','','','2','80');
INSERT INTO `glpi_deviceharddrives` VALUES ('12','WD1600AAJS-00B4A0','','10','','','15','160');
INSERT INTO `glpi_deviceharddrives` VALUES ('13','HD252HJ','','10','','','2','250');

### Dump table glpi_devicememories

DROP TABLE IF EXISTS `glpi_devicememories`;
CREATE TABLE `glpi_devicememories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `specif_default` int(11) NOT NULL,
  `devicememorytypes_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicememorytypes_id` (`devicememorytypes_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_devicememories` VALUES ('1','2GB_DDR2_KINGSTON','800','','7','2048','5');
INSERT INTO `glpi_devicememories` VALUES ('2','4GB_DDR3_KINGSTON','1333','','7','4096','6');
INSERT INTO `glpi_devicememories` VALUES ('3','4GB_DDR3_HYNIX','1333','','13','4096','6');
INSERT INTO `glpi_devicememories` VALUES ('4','1GB_DDR2_SAMSUNG','800','','2','1024','5');
INSERT INTO `glpi_devicememories` VALUES ('5','4GB_DDR3_SAMSUNG','1333','','2','4096','6');
INSERT INTO `glpi_devicememories` VALUES ('6','2GB_DDR2_TRANSCEND','800','','17','2048','5');
INSERT INTO `glpi_devicememories` VALUES ('7','2GB_DDR2_HYNIX','800','','13','2048','5');
INSERT INTO `glpi_devicememories` VALUES ('8','1GB_DDR1_NONAME','400','','0','1024','2');

### Dump table glpi_devicememorytypes

DROP TABLE IF EXISTS `glpi_devicememorytypes`;
CREATE TABLE `glpi_devicememorytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_devicememorytypes` VALUES ('1','EDO',NULL);
INSERT INTO `glpi_devicememorytypes` VALUES ('2','DDR',NULL);
INSERT INTO `glpi_devicememorytypes` VALUES ('3','SDRAM',NULL);
INSERT INTO `glpi_devicememorytypes` VALUES ('4','SDRAM-2',NULL);
INSERT INTO `glpi_devicememorytypes` VALUES ('5','DDR2','');
INSERT INTO `glpi_devicememorytypes` VALUES ('6','DDR3','');

### Dump table glpi_devicemotherboards

DROP TABLE IF EXISTS `glpi_devicemotherboards`;
CREATE TABLE `glpi_devicemotherboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chipset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_devicemotherboards` VALUES ('1','S775_P5G-MX','775','','6');
INSERT INTO `glpi_devicemotherboards` VALUES ('2','S1155_GA-H61M-D2-B3','1155','','9');
INSERT INTO `glpi_devicemotherboards` VALUES ('3','S1156_GA-P55A-UD3','1156','','9');
INSERT INTO `glpi_devicemotherboards` VALUES ('4','S775_P5G41TD-M Pro','S775','','6');
INSERT INTO `glpi_devicemotherboards` VALUES ('5','S1155_GA-H61MA-D3V ','1155','','9');
INSERT INTO `glpi_devicemotherboards` VALUES ('6','S775_P5Q SE','775','','6');
INSERT INTO `glpi_devicemotherboards` VALUES ('7','S1155_GA-H61M-D2H-USB3','1155','','9');
INSERT INTO `glpi_devicemotherboards` VALUES ('8','S775_P5G41T-M LE','775','','6');
INSERT INTO `glpi_devicemotherboards` VALUES ('9','S775_P5G41T-M LX2/GB','775','','6');
INSERT INTO `glpi_devicemotherboards` VALUES ('10','S775_P5GZ-MX','775','','4');
INSERT INTO `glpi_devicemotherboards` VALUES ('11','S1155_GA-Z68M-D2H','1155','','9');
INSERT INTO `glpi_devicemotherboards` VALUES ('12','S775_Topsfield DP43TF','775','','4');
INSERT INTO `glpi_devicemotherboards` VALUES ('13','S775_G41C-VS','775','','18');
INSERT INTO `glpi_devicemotherboards` VALUES ('14','S754_6100K8MB-RS(H)','754','','19');
INSERT INTO `glpi_devicemotherboards` VALUES ('15','S754_K8NF6G-VSTA','754','','18');
INSERT INTO `glpi_devicemotherboards` VALUES ('16','S775_P5QL','775','','6');

### Dump table glpi_devicenetworkcards

DROP TABLE IF EXISTS `glpi_devicenetworkcards`;
CREATE TABLE `glpi_devicenetworkcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bandwidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `specif_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_devicepcis

DROP TABLE IF EXISTS `glpi_devicepcis`;
CREATE TABLE `glpi_devicepcis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_devicepowersupplies

DROP TABLE IF EXISTS `glpi_devicepowersupplies`;
CREATE TABLE `glpi_devicepowersupplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `power` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_atx` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_deviceprocessors

DROP TABLE IF EXISTS `glpi_deviceprocessors`;
CREATE TABLE `glpi_deviceprocessors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequence` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `specif_default` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_deviceprocessors` VALUES ('1','Pentium E2200','2200','','4','2200');
INSERT INTO `glpi_deviceprocessors` VALUES ('2','i5-2300','2900','','4','2800');
INSERT INTO `glpi_deviceprocessors` VALUES ('3','i5-760','0','','4','2800');
INSERT INTO `glpi_deviceprocessors` VALUES ('4','Core 2 Quad Q8300','2500','','4','2500');
INSERT INTO `glpi_deviceprocessors` VALUES ('5','i5-2310','3000','','4','3000');
INSERT INTO `glpi_deviceprocessors` VALUES ('6','i5-2500','0','','4','3400');
INSERT INTO `glpi_deviceprocessors` VALUES ('7','Core 2 Duo E8400','0','','4','3000');
INSERT INTO `glpi_deviceprocessors` VALUES ('8','i5-2320','0','','4','3200');
INSERT INTO `glpi_deviceprocessors` VALUES ('9','Core 2 Duo E7500','0','','4','2933');
INSERT INTO `glpi_deviceprocessors` VALUES ('10','Core 2 Duo E4300','0','','4','1800');
INSERT INTO `glpi_deviceprocessors` VALUES ('11','Core 2 Quad Q9300','0','','4','2500');
INSERT INTO `glpi_deviceprocessors` VALUES ('12','Sempron','0','','5','1800');
INSERT INTO `glpi_deviceprocessors` VALUES ('13','Core 2 Duo E7600','0','','4','3006');
INSERT INTO `glpi_deviceprocessors` VALUES ('14','Dual-Core E5300','0','','4','2600');

### Dump table glpi_devicesoundcards

DROP TABLE IF EXISTS `glpi_devicesoundcards`;
CREATE TABLE `glpi_devicesoundcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_displaypreferences

DROP TABLE IF EXISTS `glpi_displaypreferences`;
CREATE TABLE `glpi_displaypreferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`,`num`),
  KEY `rank` (`rank`),
  KEY `num` (`num`),
  KEY `itemtype` (`itemtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_displaypreferences` VALUES ('215','Computer','7','12','0');
INSERT INTO `glpi_displaypreferences` VALUES ('34','Computer','45','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('210','Computer','46','7','0');
INSERT INTO `glpi_displaypreferences` VALUES ('212','Computer','71','18','0');
INSERT INTO `glpi_displaypreferences` VALUES ('86','DocumentType','3','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('209','Monitor','71','8','0');
INSERT INTO `glpi_displaypreferences` VALUES ('50','Monitor','23','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('51','Monitor','3','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('44','Printer','31','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('38','NetworkEquipment','31','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('39','NetworkEquipment','23','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('45','Printer','23','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('46','Printer','3','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('63','Software','4','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('62','Software','5','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('61','Software','23','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('83','CartridgeItem','4','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('82','CartridgeItem','34','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('57','Peripheral','3','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('56','Peripheral','23','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('55','Peripheral','31','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('216','Computer','35','13','0');
INSERT INTO `glpi_displaypreferences` VALUES ('35','Computer','3','8','0');
INSERT INTO `glpi_displaypreferences` VALUES ('214','Computer','70','17','0');
INSERT INTO `glpi_displaypreferences` VALUES ('40','NetworkEquipment','3','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('41','NetworkEquipment','4','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('42','NetworkEquipment','11','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('43','NetworkEquipment','19','7','0');
INSERT INTO `glpi_displaypreferences` VALUES ('47','Printer','4','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('48','Printer','19','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('217','Computer','10','14','0');
INSERT INTO `glpi_displaypreferences` VALUES ('208','Monitor','70','7','0');
INSERT INTO `glpi_displaypreferences` VALUES ('58','Peripheral','4','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('59','Peripheral','19','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('60','Peripheral','7','7','0');
INSERT INTO `glpi_displaypreferences` VALUES ('64','Contact','3','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('65','Contact','4','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('66','Contact','5','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('67','Contact','6','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('68','Contact','9','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('69','Supplier','9','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('70','Supplier','3','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('71','Supplier','4','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('72','Supplier','5','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('73','Supplier','10','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('74','Supplier','6','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('75','Contract','4','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('76','Contract','3','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('77','Contract','5','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('78','Contract','6','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('79','Contract','7','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('80','Contract','11','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('84','CartridgeItem','23','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('85','CartridgeItem','3','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('88','DocumentType','6','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('89','DocumentType','4','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('90','DocumentType','5','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('91','Document','3','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('92','Document','4','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('93','Document','7','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('94','Document','5','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('95','Document','16','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('96','User','34','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('98','User','5','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('99','User','6','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('100','User','3','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('101','ConsumableItem','34','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('102','ConsumableItem','4','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('103','ConsumableItem','23','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('104','ConsumableItem','3','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('105','NetworkEquipment','40','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('106','Printer','40','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('107','Monitor','40','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('108','Peripheral','40','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('109','User','8','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('110','Phone','31','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('111','Phone','23','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('112','Phone','3','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('113','Phone','4','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('114','Phone','40','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('115','Phone','19','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('116','Phone','7','7','0');
INSERT INTO `glpi_displaypreferences` VALUES ('117','Group','16','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('118','States','31','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('119','ReservationItem','4','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('120','ReservationItem','3','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('125','Budget','3','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('122','Software','72','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('123','Software','163','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('124','Budget','2','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('126','Budget','4','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('127','Budget','19','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('128','Crontask','8','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('129','Crontask','3','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('130','Crontask','4','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('131','Crontask','7','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('132','RequestType','14','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('133','RequestType','15','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('134','NotificationTemplate','4','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('135','NotificationTemplate','16','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('136','Notification','5','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('137','Notification','6','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('138','Notification','2','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('139','Notification','4','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('140','Notification','80','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('141','Notification','86','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('142','MailCollector','2','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('143','MailCollector','19','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('144','AuthLDAP','3','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('145','AuthLDAP','19','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('146','AuthMail','3','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('147','AuthMail','19','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('148','OcsServer','3','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('149','OcsServer','19','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('150','Profile','2','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('151','Profile','3','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('152','Profile','19','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('153','Transfer','19','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('154','TicketValidation','3','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('155','TicketValidation','2','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('156','TicketValidation','8','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('157','TicketValidation','4','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('158','TicketValidation','9','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('159','TicketValidation','7','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('160','NotImportedEmail','2','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('161','NotImportedEmail','5','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('162','NotImportedEmail','4','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('163','NotImportedEmail','6','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('164','NotImportedEmail','16','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('165','NotImportedEmail','19','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('166','RuleRightParameter','11','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('167','Ticket','12','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('168','Ticket','19','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('169','Ticket','15','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('170','Ticket','3','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('171','Ticket','4','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('172','Ticket','5','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('173','Ticket','7','7','0');
INSERT INTO `glpi_displaypreferences` VALUES ('174','Calendar','19','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('175','Holiday','11','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('176','Holiday','12','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('177','Holiday','13','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('178','SLA','4','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('179','Ticket','18','8','0');
INSERT INTO `glpi_displaypreferences` VALUES ('180','AuthLdap','30','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('181','AuthMail','6','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('182','OcsServer','6','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('183','FieldUnicity','1','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('184','FieldUnicity','80','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('185','FieldUnicity','4','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('186','FieldUnicity','3','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('187','FieldUnicity','86','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('188','FieldUnicity','30','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('189','Problem','21','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('190','Problem','12','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('191','Problem','19','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('192','Problem','15','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('193','Problem','3','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('194','Problem','7','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('195','Problem','18','7','0');
INSERT INTO `glpi_displaypreferences` VALUES ('196','Vlan','11','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('197','TicketRecurrent','11','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('198','TicketRecurrent','12','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('199','TicketRecurrent','13','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('200','TicketRecurrent','15','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('201','TicketRecurrent','14','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('202','Reminder','2','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('203','Reminder','3','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('204','Reminder','4','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('205','Reminder','5','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('206','Reminder','6','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('207','Reminder','7','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('218','Computer','34','15','0');
INSERT INTO `glpi_displaypreferences` VALUES ('219','Computer','14','11','0');
INSERT INTO `glpi_displaypreferences` VALUES ('220','Computer','13','16','0');
INSERT INTO `glpi_displaypreferences` VALUES ('221','Computer','20','19','0');
INSERT INTO `glpi_displaypreferences` VALUES ('222','Monitor','5','9','0');
INSERT INTO `glpi_displaypreferences` VALUES ('223','PluginGenericobjectType','10','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('224','PluginGenericobjectType','9','2','0');
INSERT INTO `glpi_displaypreferences` VALUES ('225','PluginGenericobjectType','8','3','0');
INSERT INTO `glpi_displaypreferences` VALUES ('226','PluginGenericobjectType','7','4','0');
INSERT INTO `glpi_displaypreferences` VALUES ('227','PluginGenericobjectType','6','5','0');
INSERT INTO `glpi_displaypreferences` VALUES ('228','PluginGenericobjectType','2','6','0');
INSERT INTO `glpi_displaypreferences` VALUES ('229','PluginGenericobjectType','4','7','0');
INSERT INTO `glpi_displaypreferences` VALUES ('230','PluginGenericobjectType','11','8','0');
INSERT INTO `glpi_displaypreferences` VALUES ('231','PluginGenericobjectType','12','9','0');
INSERT INTO `glpi_displaypreferences` VALUES ('232','PluginGenericobjectType','14','10','0');
INSERT INTO `glpi_displaypreferences` VALUES ('233','PluginGenericobjectType','15','11','0');
INSERT INTO `glpi_displaypreferences` VALUES ('234','PluginGenericobjectRam','2','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('235','PluginGenericobjectProcessor','2','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('236','PluginGenericobjectMotherboard','2','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('237','PluginGenericobjectOs','2','1','0');
INSERT INTO `glpi_displaypreferences` VALUES ('238','PluginGenericobjectHdd','2','1','0');

### Dump table glpi_documentcategories

DROP TABLE IF EXISTS `glpi_documentcategories`;
CREATE TABLE `glpi_documentcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_documents

DROP TABLE IF EXISTS `glpi_documents`;
CREATE TABLE `glpi_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'for display and transfert',
  `filepath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'file storage path',
  `documentcategories_id` int(11) NOT NULL DEFAULT '0',
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notepad` longtext COLLATE utf8_unicode_ci,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `sha1sum` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `users_id` (`users_id`),
  KEY `documentcategories_id` (`documentcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sha1sum` (`sha1sum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_documents_items

DROP TABLE IF EXISTS `glpi_documents_items`;
CREATE TABLE `glpi_documents_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documents_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documents_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`,`entities_id`,`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_documenttypes

DROP TABLE IF EXISTS `glpi_documenttypes`;
CREATE TABLE `glpi_documenttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_uploadable` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ext`),
  KEY `name` (`name`),
  KEY `is_uploadable` (`is_uploadable`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_documenttypes` VALUES ('1','JPEG','jpg','jpg-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('2','PNG','png','png-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('3','GIF','gif','gif-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('4','BMP','bmp','bmp-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('5','Photoshop','psd','psd-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('6','TIFF','tif','tif-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('7','AIFF','aiff','aiff-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('8','Windows Media','asf','asf-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('9','Windows Media','avi','avi-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('44','C source','c','c-dist.png','','1','2011-12-06 09:48:34',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('27','RealAudio','rm','rm-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('16','Midi','mid','mid-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('17','QuickTime','mov','mov-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('18','MP3','mp3','mp3-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('19','MPEG','mpg','mpg-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('20','Ogg Vorbis','ogg','ogg-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('24','QuickTime','qt','qt-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('10','BZip','bz2','bz2-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('25','RealAudio','ra','ra-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('26','RealAudio','ram','ram-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('11','Word','doc','doc-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('12','DjVu','djvu','','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('42','MNG','mng','','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('13','PostScript','eps','ps-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('14','GZ','gz','gz-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('37','WAV','wav','wav-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('15','HTML','html','html-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('34','Flash','swf','swf-dist.png','','1','2011-12-06 09:48:34',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('21','PDF','pdf','pdf-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('22','PowerPoint','ppt','ppt-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('23','PostScript','ps','ps-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('40','Windows Media','wmv','wmv-dist.png','','1','2011-12-06 09:48:34',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('28','RTF','rtf','rtf-dist.png','','1','2004-12-13 19:47:21',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('29','StarOffice','sdd','sdd-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('30','StarOffice','sdw','sdw-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('31','Stuffit','sit','sit-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('43','Adobe Illustrator','ai','ai-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('32','OpenOffice Impress','sxi','sxi-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('33','OpenOffice','sxw','sxw-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('46','DVI','dvi','dvi-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('35','TGZ','tgz','tgz-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('36','texte','txt','txt-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('49','RedHat/Mandrake/SuSE','rpm','rpm-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('38','Excel','xls','xls-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('39','XML','xml','xml-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('41','Zip','zip','zip-dist.png','','1','2011-12-06 09:48:34',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('45','Debian','deb','deb-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('47','C header','h','h-dist.png','','1','2011-12-06 09:48:34',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('48','Pascal','pas','pas-dist.png','','1','2011-12-06 09:48:34',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('50','OpenOffice Calc','sxc','sxc-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('51','LaTeX','tex','tex-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('52','GIMP multi-layer','xcf','xcf-dist.png','','1','2004-12-13 19:47:22',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('53','JPEG','jpeg','jpg-dist.png','','1','2005-03-07 22:23:17',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('54','Oasis Open Office Writer','odt','odt-dist.png','','1','2006-01-21 17:41:13',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('55','Oasis Open Office Calc','ods','ods-dist.png','','1','2006-01-21 17:41:31',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('56','Oasis Open Office Impress','odp','odp-dist.png','','1','2006-01-21 17:42:54',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('57','Oasis Open Office Impress Template','otp','odp-dist.png','','1','2006-01-21 17:43:58',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('58','Oasis Open Office Writer Template','ott','odt-dist.png','','1','2006-01-21 17:44:41',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('59','Oasis Open Office Calc Template','ots','ods-dist.png','','1','2006-01-21 17:45:30',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('60','Oasis Open Office Math','odf','odf-dist.png','','1','2006-01-21 17:48:05',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('61','Oasis Open Office Draw','odg','odg-dist.png','','1','2006-01-21 17:48:31',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('62','Oasis Open Office Draw Template','otg','odg-dist.png','','1','2006-01-21 17:49:46',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('63','Oasis Open Office Base','odb','odb-dist.png','','1','2006-01-21 18:03:34',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('64','Oasis Open Office HTML','oth','oth-dist.png','','1','2006-01-21 18:05:27',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('65','Oasis Open Office Writer Master','odm','odm-dist.png','','1','2006-01-21 18:06:34',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('66','Oasis Open Office Chart','odc','','','1','2006-01-21 18:07:48',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('67','Oasis Open Office Image','odi','','','1','2006-01-21 18:08:18',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('68','Word XML','docx','doc-dist.png',NULL,'1','2011-01-18 11:40:42',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('69','Excel XML','xlsx','xls-dist.png',NULL,'1','2011-01-18 11:40:42',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('70','PowerPoint XML','pptx','ppt-dist.png',NULL,'1','2011-01-18 11:40:42',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('71','Comma-Separated Values','csv','csv-dist.png',NULL,'1','2011-12-06 09:48:34',NULL);
INSERT INTO `glpi_documenttypes` VALUES ('72','Scalable Vector Graphics','svg','svg-dist.png',NULL,'1','2011-12-06 09:48:34',NULL);

### Dump table glpi_domains

DROP TABLE IF EXISTS `glpi_domains`;
CREATE TABLE `glpi_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_entities

DROP TABLE IF EXISTS `glpi_entities`;
CREATE TABLE `glpi_entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`name`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_entities_knowbaseitems

DROP TABLE IF EXISTS `glpi_entities_knowbaseitems`;
CREATE TABLE `glpi_entities_knowbaseitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_entities_reminders

DROP TABLE IF EXISTS `glpi_entities_reminders`;
CREATE TABLE `glpi_entities_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_entitydatas

DROP TABLE IF EXISTS `glpi_entitydatas`;
CREATE TABLE `glpi_entitydatas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_reply` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_reply_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_subject_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notepad` longtext COLLATE utf8_unicode_ci,
  `ldap_dn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authldaps_id` int(11) NOT NULL DEFAULT '0',
  `mail_domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_ldapfilter` text COLLATE utf8_unicode_ci,
  `mailing_signature` text COLLATE utf8_unicode_ci,
  `cartridges_alert_repeat` int(11) NOT NULL DEFAULT '-2',
  `consumables_alert_repeat` int(11) NOT NULL DEFAULT '-2',
  `use_licenses_alert` int(11) NOT NULL DEFAULT '-2',
  `use_contracts_alert` int(11) NOT NULL DEFAULT '-2',
  `use_infocoms_alert` int(11) NOT NULL DEFAULT '-2',
  `use_reservations_alert` int(11) NOT NULL DEFAULT '-2',
  `autoclose_delay` int(11) NOT NULL DEFAULT '-2',
  `notclosed_delay` int(11) NOT NULL DEFAULT '-2',
  `calendars_id` int(11) NOT NULL DEFAULT '-2',
  `auto_assign_mode` int(11) NOT NULL DEFAULT '-2',
  `tickettype` int(11) NOT NULL DEFAULT '-2',
  `max_closedate` datetime DEFAULT NULL,
  `inquest_config` int(11) NOT NULL DEFAULT '-2',
  `inquest_rate` int(11) NOT NULL DEFAULT '0',
  `inquest_delay` int(11) NOT NULL DEFAULT '-10',
  `inquest_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autofill_warranty_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT '-2',
  `autofill_use_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT '-2',
  `autofill_buy_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT '-2',
  `autofill_delivery_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT '-2',
  `autofill_order_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT '-2',
  `tickettemplates_id` int(11) NOT NULL DEFAULT '-2',
  `entities_id_software` int(11) NOT NULL DEFAULT '-2',
  `default_contract_alert` int(11) NOT NULL DEFAULT '0',
  `default_infocom_alert` int(11) NOT NULL DEFAULT '0',
  `default_alarm_threshold` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_entitydatas` VALUES ('1','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'0','0','0','0','0','0','-1','0','0','-10','1',NULL,'1','0','0',NULL,'0','0','0','0','0','1','-10','0','0','10');

### Dump table glpi_events

DROP TABLE IF EXISTS `glpi_events`;
CREATE TABLE `glpi_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `level` (`level`),
  KEY `item` (`type`,`items_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_events` VALUES ('1','-1','system','2012-05-14 07:20:19','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('2','-1','system','2012-05-14 07:21:15','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('3','0','users','2012-05-14 07:22:49','setup','5','glpi  update the item  normal.');
INSERT INTO `glpi_events` VALUES ('4','0','users','2012-05-14 07:23:10','setup','5','glpi  update the item  post-only.');
INSERT INTO `glpi_events` VALUES ('5','0','users','2012-05-14 07:23:23','setup','5','glpi  update the item  tech.');
INSERT INTO `glpi_events` VALUES ('6','0','users','2012-05-14 07:35:33','setup','5','glpi  update the item  glpi.');
INSERT INTO `glpi_events` VALUES ('7','6','users','2012-05-14 07:37:30','setup','4','glpi добавление объекта denis.maksymenko.');
INSERT INTO `glpi_events` VALUES ('8','7','users','2012-05-14 07:38:09','setup','4','glpi добавление объекта max.krivoshlyk.');
INSERT INTO `glpi_events` VALUES ('9','8','users','2012-05-14 07:39:27','setup','4','glpi добавление объекта dmitriy.yenin.');
INSERT INTO `glpi_events` VALUES ('10','1','UserTitle','2012-05-14 07:39:48','setup','4','glpi added Старший системный администратор.');
INSERT INTO `glpi_events` VALUES ('11','2','UserTitle','2012-05-14 07:40:01','setup','4','glpi added Младший системный администратор.');
INSERT INTO `glpi_events` VALUES ('12','9','users','2012-05-14 07:40:48','setup','4','glpi добавление объекта dmitry.vilkhivskiy.');
INSERT INTO `glpi_events` VALUES ('13','7','users','2012-05-14 07:43:15','setup','4','glpi добавление пользователя в организацию');
INSERT INTO `glpi_events` VALUES ('14','6','users','2012-05-14 07:43:40','setup','4','glpi добавление пользователя в организацию');
INSERT INTO `glpi_events` VALUES ('15','6','users','2012-05-14 07:43:46','setup','4','glpi добавление пользователя в организацию');
INSERT INTO `glpi_events` VALUES ('16','0','entity','2012-05-14 07:43:55','setup','4','glpi удаление пользователя из организации');
INSERT INTO `glpi_events` VALUES ('17','0','entity','2012-05-14 07:44:00','setup','4','glpi удаление пользователя из организации');
INSERT INTO `glpi_events` VALUES ('18','0','entity','2012-05-14 07:44:15','setup','4','glpi удаление пользователя из организации');
INSERT INTO `glpi_events` VALUES ('19','8','users','2012-05-14 07:44:20','setup','4','glpi добавление пользователя в организацию');
INSERT INTO `glpi_events` VALUES ('20','0','entity','2012-05-14 07:44:33','setup','4','glpi удаление пользователя из организации');
INSERT INTO `glpi_events` VALUES ('21','9','users','2012-05-14 07:44:39','setup','4','glpi добавление пользователя в организацию');
INSERT INTO `glpi_events` VALUES ('22','0','entity','2012-05-14 07:44:53','setup','4','glpi удаление пользователя из организации');
INSERT INTO `glpi_events` VALUES ('23','-1','system','2012-05-14 07:45:12','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('24','0','users','2012-05-14 07:45:26','setup','5','dmitry.vilkhivskiy  update the item  dmitry.vilkhivskiy.');
INSERT INTO `glpi_events` VALUES ('25','3','UserTitle','2012-05-14 07:46:16','setup','4','dmitry.vilkhivskiy added System Administrator.');
INSERT INTO `glpi_events` VALUES ('26','0','users','2012-05-14 07:46:29','setup','5','dmitry.vilkhivskiy  обновление объекта  dmitriy.yenin.');
INSERT INTO `glpi_events` VALUES ('27','0','users','2012-05-14 07:46:43','setup','5','dmitry.vilkhivskiy  обновление объекта  dmitry.vilkhivskiy.');
INSERT INTO `glpi_events` VALUES ('28','-1','system','2012-05-14 07:47:10','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('29','1','groups','2012-05-14 07:47:49','setup','4','glpi добавление объекта BOSSdev.');
INSERT INTO `glpi_events` VALUES ('30','2','groups','2012-05-14 07:48:04','setup','4','glpi добавление объекта Flexaspect.');
INSERT INTO `glpi_events` VALUES ('31','3','groups','2012-05-14 07:48:21','setup','4','glpi добавление объекта Ukad.');
INSERT INTO `glpi_events` VALUES ('32','10','users','2012-05-14 07:54:24','setup','4','glpi добавление объекта alex.devyatkin.');
INSERT INTO `glpi_events` VALUES ('33','-1','system','2012-05-14 07:54:33','login','1','connection failed: alex.devyatkin (82.117.232.116)');
INSERT INTO `glpi_events` VALUES ('34','-1','system','2012-05-14 07:54:41','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('35','11','users','2012-05-14 07:56:47','setup','4','glpi добавление объекта alex.gaevoy.');
INSERT INTO `glpi_events` VALUES ('36','12','users','2012-05-14 07:57:53','setup','4','glpi добавление объекта alexander.gres.');
INSERT INTO `glpi_events` VALUES ('37','13','users','2012-05-14 08:00:50','setup','4','glpi добавление объекта alexander.perevalov.');
INSERT INTO `glpi_events` VALUES ('38','14','users','2012-05-14 08:01:15','setup','4','glpi добавление объекта alexander.razvalinov.');
INSERT INTO `glpi_events` VALUES ('39','15','users','2012-05-14 08:01:39','setup','4','glpi добавление объекта alexander.sidorov.');
INSERT INTO `glpi_events` VALUES ('40','16','users','2012-05-14 08:02:13','setup','4','glpi добавление объекта alexander.skripnik.');
INSERT INTO `glpi_events` VALUES ('41','17','users','2012-05-14 08:02:39','setup','4','glpi добавление объекта alexey.afanasyev.');
INSERT INTO `glpi_events` VALUES ('42','18','users','2012-05-14 08:03:09','setup','4','glpi добавление объекта alexey.bobylev.');
INSERT INTO `glpi_events` VALUES ('43','19','users','2012-05-14 08:03:43','setup','4','glpi добавление объекта alexey.scherbakov.');
INSERT INTO `glpi_events` VALUES ('44','20','users','2012-05-14 08:04:10','setup','4','glpi добавление объекта alla.zagorulko.');
INSERT INTO `glpi_events` VALUES ('45','21','users','2012-05-14 08:04:35','setup','4','glpi добавление объекта andrey.lushpigan.');
INSERT INTO `glpi_events` VALUES ('46','22','users','2012-05-14 08:04:54','setup','4','glpi добавление объекта artem.loboda.');
INSERT INTO `glpi_events` VALUES ('47','23','users','2012-05-14 08:05:14','setup','4','glpi добавление объекта artem.pyhtin.');
INSERT INTO `glpi_events` VALUES ('48','24','users','2012-05-14 08:05:32','setup','4','glpi добавление объекта artur.fisun.');
INSERT INTO `glpi_events` VALUES ('49','25','users','2012-05-14 08:05:52','setup','4','glpi добавление объекта denis.kovalev.');
INSERT INTO `glpi_events` VALUES ('50','26','users','2012-05-14 08:06:15','setup','4','glpi добавление объекта dmitriy.galuschkin.');
INSERT INTO `glpi_events` VALUES ('51','27','users','2012-05-14 08:06:35','setup','4','glpi добавление объекта dmitriy.kotelevskiy.');
INSERT INTO `glpi_events` VALUES ('52','28','users','2012-05-14 08:07:00','setup','4','glpi добавление объекта dmitriy.ovsyannikov.');
INSERT INTO `glpi_events` VALUES ('53','29','users','2012-05-14 08:07:31','setup','4','glpi добавление объекта dmitriy.voronin.');
INSERT INTO `glpi_events` VALUES ('54','30','users','2012-05-14 08:07:58','setup','4','glpi добавление объекта dmitriy.zhdankin.');
INSERT INTO `glpi_events` VALUES ('55','31','users','2012-05-14 08:08:33','setup','4','glpi добавление объекта dmitry.seredinov.');
INSERT INTO `glpi_events` VALUES ('56','32','users','2012-05-14 08:09:00','setup','4','glpi добавление объекта eduard.marakhovsky.');
INSERT INTO `glpi_events` VALUES ('57','33','users','2012-05-14 08:09:31','setup','4','glpi добавление объекта elena.zisina.');
INSERT INTO `glpi_events` VALUES ('58','34','users','2012-05-14 08:09:49','setup','4','glpi добавление объекта evgeniy.arsenyev.');
INSERT INTO `glpi_events` VALUES ('59','35','users','2012-05-14 08:10:23','setup','4','glpi добавление объекта evgeniy.kholodnyak.');
INSERT INTO `glpi_events` VALUES ('60','36','users','2012-05-14 08:10:58','setup','4','glpi добавление объекта evgeniy.udalov.');
INSERT INTO `glpi_events` VALUES ('61','37','users','2012-05-14 08:11:30','setup','4','glpi добавление объекта fedor.krutko.');
INSERT INTO `glpi_events` VALUES ('62','38','users','2012-05-14 08:12:03','setup','4','glpi добавление объекта igor.demo.');
INSERT INTO `glpi_events` VALUES ('63','39','users','2012-05-14 08:12:33','setup','4','glpi добавление объекта igor.skalov.');
INSERT INTO `glpi_events` VALUES ('64','40','users','2012-05-14 08:13:06','setup','4','glpi добавление объекта kirill.samojlenko.');
INSERT INTO `glpi_events` VALUES ('65','41','users','2012-05-14 08:13:29','setup','4','glpi добавление объекта maxim.kapustin.');
INSERT INTO `glpi_events` VALUES ('66','42','users','2012-05-14 08:14:05','setup','4','glpi добавление объекта maxim.kosenko.');
INSERT INTO `glpi_events` VALUES ('67','43','users','2012-05-14 08:14:25','setup','4','glpi добавление объекта natalya.skoromnaya.');
INSERT INTO `glpi_events` VALUES ('68','44','users','2012-05-14 08:14:41','setup','4','glpi добавление объекта natalya.vasilenko.');
INSERT INTO `glpi_events` VALUES ('69','45','users','2012-05-14 08:15:22','setup','4','glpi добавление объекта nickolay.chizhikov.');
INSERT INTO `glpi_events` VALUES ('70','46','users','2012-05-14 08:16:33','setup','4','glpi добавление объекта oleg.milkin.');
INSERT INTO `glpi_events` VALUES ('71','47','users','2012-05-14 08:16:51','setup','4','glpi добавление объекта oleg.plitnik.');
INSERT INTO `glpi_events` VALUES ('72','48','users','2012-05-14 08:17:35','setup','4','glpi добавление объекта pavel.kolesnikov.');
INSERT INTO `glpi_events` VALUES ('73','49','users','2012-05-14 08:18:08','setup','4','glpi добавление объекта pavel.melikhov.');
INSERT INTO `glpi_events` VALUES ('74','50','users','2012-05-14 08:18:26','setup','4','glpi добавление объекта pavel.sukhanov.');
INSERT INTO `glpi_events` VALUES ('75','51','users','2012-05-14 08:18:54','setup','4','glpi добавление объекта roman.lavrinenko.');
INSERT INTO `glpi_events` VALUES ('76','52','users','2012-05-14 08:19:31','setup','4','glpi добавление объекта roman.mazurika.');
INSERT INTO `glpi_events` VALUES ('77','53','users','2012-05-14 08:19:59','setup','4','glpi добавление объекта ruslan.getmansky.');
INSERT INTO `glpi_events` VALUES ('78','54','users','2012-05-14 08:20:57','setup','4','glpi добавление объекта sergey.boiko.');
INSERT INTO `glpi_events` VALUES ('79','55','users','2012-05-14 08:21:48','setup','4','glpi добавление объекта sergey.grebeniuk.');
INSERT INTO `glpi_events` VALUES ('80','56','users','2012-05-14 08:22:06','setup','4','glpi добавление объекта sergey.laptiy.');
INSERT INTO `glpi_events` VALUES ('81','57','users','2012-05-14 08:22:51','setup','4','glpi добавление объекта sergey.malyshkin.');
INSERT INTO `glpi_events` VALUES ('82','58','users','2012-05-14 08:23:14','setup','4','glpi добавление объекта tatiana.kunah.');
INSERT INTO `glpi_events` VALUES ('83','59','users','2012-05-14 08:23:53','setup','4','glpi добавление объекта vadim.matsukatov.');
INSERT INTO `glpi_events` VALUES ('84','60','users','2012-05-14 08:24:15','setup','4','glpi добавление объекта valeriy.matsukatov.');
INSERT INTO `glpi_events` VALUES ('85','61','users','2012-05-14 08:24:50','setup','4','glpi добавление объекта vasiliy.belokon.');
INSERT INTO `glpi_events` VALUES ('86','62','users','2012-05-14 08:25:10','setup','4','glpi добавление объекта vitaliy.orehov.');
INSERT INTO `glpi_events` VALUES ('87','63','users','2012-05-14 08:25:37','setup','4','glpi добавление объекта vitaliy.supronuk.');
INSERT INTO `glpi_events` VALUES ('88','64','users','2012-05-14 08:25:59','setup','4','glpi добавление объекта vladimir.kozhushniy.');
INSERT INTO `glpi_events` VALUES ('89','65','users','2012-05-14 08:26:23','setup','4','glpi добавление объекта vladimir.maryenko.');
INSERT INTO `glpi_events` VALUES ('90','66','users','2012-05-14 08:28:13','setup','4','glpi добавление объекта vladimir.rakovsky.');
INSERT INTO `glpi_events` VALUES ('91','67','users','2012-05-14 08:28:28','setup','4','glpi добавление объекта yuriy.zisin.');
INSERT INTO `glpi_events` VALUES ('92','0','users','2012-05-14 08:30:13','setup','5','glpi  обновление объекта  alexey.afanasyev.');
INSERT INTO `glpi_events` VALUES ('93','1','Location','2012-05-14 08:38:08','setup','4','glpi added 201.');
INSERT INTO `glpi_events` VALUES ('94','2','Location','2012-05-14 08:38:13','setup','4','glpi added 202.');
INSERT INTO `glpi_events` VALUES ('95','3','Location','2012-05-14 08:38:17','setup','4','glpi added 203.');
INSERT INTO `glpi_events` VALUES ('96','4','Location','2012-05-14 08:38:21','setup','4','glpi added 204.');
INSERT INTO `glpi_events` VALUES ('97','5','Location','2012-05-14 08:38:25','setup','4','glpi added 205.');
INSERT INTO `glpi_events` VALUES ('98','6','Location','2012-05-14 08:38:30','setup','4','glpi added 206.');
INSERT INTO `glpi_events` VALUES ('99','7','Location','2012-05-14 08:38:35','setup','4','glpi added 207.');
INSERT INTO `glpi_events` VALUES ('100','1','Manufacturer','2012-05-14 08:46:12','setup','4','glpi added LG.');
INSERT INTO `glpi_events` VALUES ('101','1','MonitorModel','2012-05-14 08:46:49','setup','4','glpi added L1730P.');
INSERT INTO `glpi_events` VALUES ('102','1','monitors','2012-05-14 08:47:16','inventory','4','glpi добавление объекта MON0001.');
INSERT INTO `glpi_events` VALUES ('103','2','Manufacturer','2012-05-14 08:49:02','setup','4','glpi added SAMSUNG.');
INSERT INTO `glpi_events` VALUES ('104','2','MonitorModel','2012-05-14 08:49:16','setup','4','glpi added 923NW.');
INSERT INTO `glpi_events` VALUES ('105','2','monitors','2012-05-14 08:50:35','inventory','4','glpi добавление объекта MON0002.');
INSERT INTO `glpi_events` VALUES ('106','3','MonitorModel','2012-05-14 08:53:26','setup','4','glpi added 943N.');
INSERT INTO `glpi_events` VALUES ('107','3','monitors','2012-05-14 08:54:39','inventory','4','glpi добавление объекта MON0003.');
INSERT INTO `glpi_events` VALUES ('108','4','MonitorModel','2012-05-14 08:55:30','setup','4','glpi added W2346T.');
INSERT INTO `glpi_events` VALUES ('109','4','monitors','2012-05-14 08:56:21','inventory','4','glpi добавление объекта MON0004.');
INSERT INTO `glpi_events` VALUES ('110','5','MonitorModel','2012-05-14 08:59:44','setup','4','glpi added W2346S.');
INSERT INTO `glpi_events` VALUES ('111','5','monitors','2012-05-14 09:02:21','inventory','4','glpi добавление объекта MON0005.');
INSERT INTO `glpi_events` VALUES ('112','6','MonitorModel','2012-05-14 09:03:30','setup','4','glpi added 943.');
INSERT INTO `glpi_events` VALUES ('113','6','monitors','2012-05-14 09:05:58','inventory','4','glpi добавление объекта MON006.');
INSERT INTO `glpi_events` VALUES ('114','7','monitors','2012-05-14 09:08:10','inventory','4','glpi добавление объекта MON007.');
INSERT INTO `glpi_events` VALUES ('115','7','MonitorModel','2012-05-14 09:08:43','setup','4','glpi added W2346.');
INSERT INTO `glpi_events` VALUES ('116','8','monitors','2012-05-14 09:10:11','inventory','4','glpi добавление объекта MON0008.');
INSERT INTO `glpi_events` VALUES ('117','3','Manufacturer','2012-05-14 09:10:51','setup','4','glpi added PHILIPS.');
INSERT INTO `glpi_events` VALUES ('118','8','MonitorModel','2012-05-14 09:11:25','setup','4','glpi added 190S.');
INSERT INTO `glpi_events` VALUES ('119','9','monitors','2012-05-14 09:12:22','inventory','4','glpi добавление объекта MON0009.');
INSERT INTO `glpi_events` VALUES ('120','7','monitors','2012-05-14 09:12:33','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('121','6','monitors','2012-05-14 09:12:43','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('122','1','OperatingSystem','2012-05-14 09:15:40','setup','4','glpi added Microsoft Windows.');
INSERT INTO `glpi_events` VALUES ('123','2','OperatingSystem','2012-05-14 09:15:48','setup','4','glpi added GNU/Linux.');
INSERT INTO `glpi_events` VALUES ('124','1','OperatingSystemVersion','2012-05-14 09:18:20','setup','4','glpi added XP PRO.');
INSERT INTO `glpi_events` VALUES ('125','1','computers','2012-05-14 09:19:00','inventory','4','glpi добавление объекта PC0001.');
INSERT INTO `glpi_events` VALUES ('126','4','Manufacturer','2012-05-14 09:23:11','setup','4','glpi added INTEL.');
INSERT INTO `glpi_events` VALUES ('127','5','Manufacturer','2012-05-14 09:23:17','setup','4','glpi added AMD.');
INSERT INTO `glpi_events` VALUES ('128','1','DeviceProcessor','2012-05-14 09:23:56','inventory','4','glpi добавление объекта Pentium E2200.');
INSERT INTO `glpi_events` VALUES ('129','6','Manufacturer','2012-05-14 09:25:06','setup','4','glpi added Asus.');
INSERT INTO `glpi_events` VALUES ('130','1','DeviceMotherboard','2012-05-14 09:25:32','inventory','4','glpi добавление объекта S775_P5G-MX.');
INSERT INTO `glpi_events` VALUES ('131','7','Manufacturer','2012-05-14 09:26:51','setup','4','glpi added KINGSTON.');
INSERT INTO `glpi_events` VALUES ('132','5','DeviceMemoryType','2012-05-14 09:27:30','setup','4','glpi added DDR2.');
INSERT INTO `glpi_events` VALUES ('133','6','DeviceMemoryType','2012-05-14 09:27:34','setup','4','glpi added DDR3.');
INSERT INTO `glpi_events` VALUES ('134','1','DeviceMemory','2012-05-14 09:28:24','inventory','4','glpi добавление объекта 2GB_DDR2_KINGSTON.');
INSERT INTO `glpi_events` VALUES ('135','1','computers','2012-05-14 09:28:53','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('136','9','InterfaceType','2012-05-14 09:30:52','setup','4','glpi added PCI-EX.');
INSERT INTO `glpi_events` VALUES ('137','1','DeviceGraphicCard','2012-05-14 09:31:03','inventory','4','glpi добавление объекта EAH4350.');
INSERT INTO `glpi_events` VALUES ('138','10','InterfaceType','2012-05-14 09:33:30','setup','4','glpi added SATA2.');
INSERT INTO `glpi_events` VALUES ('139','1','DeviceHardDrive','2012-05-14 09:33:36','inventory','4','glpi добавление объекта HD161HJ.');
INSERT INTO `glpi_events` VALUES ('140','1','computers','2012-05-14 09:34:34','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('141','1','computers','2012-05-14 09:34:47','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('142','8','Manufacturer','2012-05-14 09:37:54','setup','4','glpi added Microsoft.');
INSERT INTO `glpi_events` VALUES ('143','1','software','2012-05-14 09:38:13','inventory','4','glpi добавление объекта Microsoft Windows XP PRO.');
INSERT INTO `glpi_events` VALUES ('144','1','computers','2012-05-14 09:41:25','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('145','2','OperatingSystemVersion','2012-05-14 09:48:28','setup','4','glpi added 7_HOME_PREMIUM.');
INSERT INTO `glpi_events` VALUES ('146','2','computers','2012-05-14 09:50:06','inventory','4','glpi добавление объекта PC0002.');
INSERT INTO `glpi_events` VALUES ('147','9','Manufacturer','2012-05-14 09:54:24','setup','4','glpi added Gigabyte.');
INSERT INTO `glpi_events` VALUES ('148','2','DeviceMotherboard','2012-05-14 09:55:10','inventory','4','glpi добавление объекта S1155_GA-H61M-D2-B3.');
INSERT INTO `glpi_events` VALUES ('149','2','DeviceMemory','2012-05-14 09:56:16','inventory','4','glpi добавление объекта 4GB_DDR3_KINGSTON.');
INSERT INTO `glpi_events` VALUES ('150','2','DeviceProcessor','2012-05-14 09:57:24','inventory','4','glpi добавление объекта i5-2300.');
INSERT INTO `glpi_events` VALUES ('151','2','computers','2012-05-14 09:58:00','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('152','10','Manufacturer','2012-05-14 09:59:08','setup','4','glpi added Hitachi.');
INSERT INTO `glpi_events` VALUES ('153','2','DeviceHardDrive','2012-05-14 09:59:44','inventory','4','glpi добавление объекта HDT721016SLA380.');
INSERT INTO `glpi_events` VALUES ('154','2','computers','2012-05-14 10:03:00','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('155','2','computers','2012-05-14 10:03:11','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('156','0','networkport','2012-05-14 10:04:59','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('157','0','networkport','2012-05-14 10:07:15','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('158','3','computers','2012-05-14 10:10:48','inventory','4','glpi добавление объекта PC0003.');
INSERT INTO `glpi_events` VALUES ('159','3','DeviceMotherboard','2012-05-14 10:13:12','inventory','4','glpi добавление объекта S1156_GA-P55A-UD3.');
INSERT INTO `glpi_events` VALUES ('160','3','DeviceProcessor','2012-05-14 10:13:38','inventory','4','glpi добавление объекта i5-760,.');
INSERT INTO `glpi_events` VALUES ('161','3','computers','2012-05-14 10:14:46','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('162','11','Manufacturer','2012-05-14 10:15:41','setup','4','glpi added NVIDIA.');
INSERT INTO `glpi_events` VALUES ('163','2','DeviceGraphicCard','2012-05-14 10:15:59','inventory','4','glpi добавление объекта GeForce 210 .');
INSERT INTO `glpi_events` VALUES ('164','3','DeviceGraphicCard','2012-05-14 10:16:19','inventory','4','glpi добавление объекта 8400GS.');
INSERT INTO `glpi_events` VALUES ('165','11','InterfaceType','2012-05-14 10:18:18','setup','4','glpi added SATA3.');
INSERT INTO `glpi_events` VALUES ('166','3','DeviceHardDrive','2012-05-14 10:18:30','inventory','4','glpi добавление объекта SH100S3120G .');
INSERT INTO `glpi_events` VALUES ('167','3','computers','2012-05-14 10:19:08','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('168','3','computers','2012-05-14 10:19:20','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('169','3','computers','2012-05-14 10:19:30','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('170','4','DeviceGraphicCard','2012-05-14 10:20:39','inventory','4','glpi добавление объекта Integrated.');
INSERT INTO `glpi_events` VALUES ('171','0','networkport','2012-05-14 10:21:46','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('172','3','DeviceProcessor','2012-05-14 10:22:12','setup','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('173','-1','system','2012-05-14 11:31:19','login','3','glpi IP connection: 178.165.31.112');
INSERT INTO `glpi_events` VALUES ('174','-1','system','2012-05-15 02:39:58','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('175','4','computers','2012-05-15 02:44:02','inventory','4','glpi добавление объекта PC0004.');
INSERT INTO `glpi_events` VALUES ('176','4','DeviceMotherboard','2012-05-15 02:46:43','inventory','4','glpi добавление объекта S775_P5G41TD-M Pro.');
INSERT INTO `glpi_events` VALUES ('177','4','computers','2012-05-15 02:47:34','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('178','4','DeviceHardDrive','2012-05-15 02:51:19','inventory','4','glpi добавление объекта HD502HJ .');
INSERT INTO `glpi_events` VALUES ('179','4','DeviceProcessor','2012-05-15 02:51:47','inventory','4','glpi добавление объекта Core 2 Quad Q8300.');
INSERT INTO `glpi_events` VALUES ('180','0','networkport','2012-05-15 02:53:11','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('181','4','computers','2012-05-15 02:55:47','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('182','4','computers','2012-05-15 02:55:58','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('183','12','Manufacturer','2012-05-15 02:57:56','setup','4','glpi added Apple.');
INSERT INTO `glpi_events` VALUES ('184','1','peripherals','2012-05-15 02:58:38','inventory','4','glpi добавление объекта MAC MINI.');
INSERT INTO `glpi_events` VALUES ('185','3','computers','2012-05-15 02:59:08','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('186','-1','system','2012-05-15 03:00:25','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('187','0','users','2012-05-15 03:00:53','setup','5','dmitry.vilkhivskiy  обновление объекта  dmitry.vilkhivskiy.');
INSERT INTO `glpi_events` VALUES ('188','68','users','2012-05-15 03:14:43','setup','4','glpi добавление объекта denis.djelomanov.');
INSERT INTO `glpi_events` VALUES ('189','9','MonitorModel','2012-05-15 03:17:04','setup','4','glpi added 241SL.');
INSERT INTO `glpi_events` VALUES ('190','10','monitors','2012-05-15 03:17:51','inventory','4','glpi добавление объекта MON0010.');
INSERT INTO `glpi_events` VALUES ('191','11','monitors','2012-05-15 03:18:28','inventory','4','glpi добавление объекта MON0011.');
INSERT INTO `glpi_events` VALUES ('192','10','monitors','2012-05-15 03:19:01','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('193','11','monitors','2012-05-15 03:19:32','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('194','12','monitors','2012-05-15 03:20:40','inventory','4','glpi добавление объекта MON0012.');
INSERT INTO `glpi_events` VALUES ('195','10','MonitorModel','2012-05-15 03:21:27','setup','4','glpi added E2320.');
INSERT INTO `glpi_events` VALUES ('196','13','monitors','2012-05-15 03:22:31','inventory','4','glpi добавление объекта MON0013.');
INSERT INTO `glpi_events` VALUES ('197','69','users','2012-05-15 03:24:28','setup','4','glpi добавление объекта ivan.doroshenko.');
INSERT INTO `glpi_events` VALUES ('198','14','monitors','2012-05-15 03:25:54','inventory','4','glpi добавление объекта MON0014.');
INSERT INTO `glpi_events` VALUES ('199','15','monitors','2012-05-15 03:26:54','inventory','4','glpi добавление объекта MON0015.');
INSERT INTO `glpi_events` VALUES ('200','70','users','2012-05-15 03:28:20','setup','4','glpi добавление объекта nadejda.lyabik.');
INSERT INTO `glpi_events` VALUES ('201','16','monitors','2012-05-15 03:30:34','inventory','4','glpi добавление объекта MON0016.');
INSERT INTO `glpi_events` VALUES ('202','11','MonitorModel','2012-05-15 03:31:18','setup','4','glpi added 710N.');
INSERT INTO `glpi_events` VALUES ('203','17','monitors','2012-05-15 03:31:49','inventory','4','glpi добавление объекта MON0017.');
INSERT INTO `glpi_events` VALUES ('204','3','computers','2012-05-15 03:40:37','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('205','5','computers','2012-05-15 03:40:46','inventory','4','glpi добавление объекта PC0005.');
INSERT INTO `glpi_events` VALUES ('206','5','DeviceMotherboard','2012-05-15 03:42:42','inventory','4','glpi добавление объекта S1155_GA-H61MA-D3V .');
INSERT INTO `glpi_events` VALUES ('207','5','DeviceProcessor','2012-05-15 03:43:46','inventory','4','glpi добавление объекта i5-2310.');
INSERT INTO `glpi_events` VALUES ('208','13','Manufacturer','2012-05-15 03:44:56','setup','4','glpi added HYNIX.');
INSERT INTO `glpi_events` VALUES ('209','3','DeviceMemory','2012-05-15 03:45:11','inventory','4','glpi добавление объекта 4GB_DDR3_HYNIX.');
INSERT INTO `glpi_events` VALUES ('210','5','computers','2012-05-15 03:45:26','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('211','5','DeviceHardDrive','2012-05-15 03:47:12','inventory','4','glpi добавление объекта SVP200S3120G.');
INSERT INTO `glpi_events` VALUES ('212','0','networkport','2012-05-15 03:49:37','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('213','0','networkport','2012-05-15 03:50:08','inventory','5','glpi удаление нескольких сетевых портов');
INSERT INTO `glpi_events` VALUES ('214','0','networkport','2012-05-15 03:50:24','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('215','5','computers','2012-05-15 03:51:12','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('216','5','computers','2012-05-15 03:51:20','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('217','6','computers','2012-05-15 03:53:52','inventory','4','glpi добавление объекта PC0006.');
INSERT INTO `glpi_events` VALUES ('218','-1','system','2012-05-15 04:21:13','login','3','dmitriy.yenin IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('219','-1','system','2012-05-15 04:24:37','login','3','dmitriy.yenin IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('220','0','users','2012-05-15 04:25:01','setup','5','dmitriy.yenin  update the item  dmitriy.yenin.');
INSERT INTO `glpi_events` VALUES ('221','0','users','2012-05-15 04:25:54','setup','5','dmitriy.yenin  update the item  dmitriy.yenin.');
INSERT INTO `glpi_events` VALUES ('222','6','DeviceProcessor','2012-05-15 04:43:57','inventory','4','glpi добавление объекта i5-2500.');
INSERT INTO `glpi_events` VALUES ('223','6','computers','2012-05-15 04:47:52','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('224','6','DeviceHardDrive','2012-05-15 04:49:57','inventory','4','glpi добавление объекта SVP100ES2128G.');
INSERT INTO `glpi_events` VALUES ('225','0','networkport','2012-05-15 04:51:26','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('226','6','computers','2012-05-15 04:52:07','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('227','12','monitors','2012-05-15 04:52:25','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('228','6','computers','2012-05-15 04:52:44','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('229','7','computers','2012-05-15 04:55:10','inventory','4','glpi добавление объекта PC0007.');
INSERT INTO `glpi_events` VALUES ('230','7','computers','2012-05-15 04:56:05','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('231','7','computers','2012-05-15 04:57:14','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('232','0','networkport','2012-05-15 04:58:28','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('233','7','computers','2012-05-15 04:59:30','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('234','7','computers','2012-05-15 04:59:57','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('235','8','computers','2012-05-15 05:01:50','inventory','4','glpi добавление объекта PC0008.');
INSERT INTO `glpi_events` VALUES ('236','7','DeviceProcessor','2012-05-15 05:02:40','inventory','4','glpi добавление объекта Core 2 Duo E8400.');
INSERT INTO `glpi_events` VALUES ('237','6','DeviceMotherboard','2012-05-15 05:03:27','inventory','4','glpi добавление объекта S775_P5Q SE.');
INSERT INTO `glpi_events` VALUES ('238','4','DeviceMemory','2012-05-15 05:06:08','inventory','4','glpi добавление объекта 1GB_DDR2_SAMSUNG.');
INSERT INTO `glpi_events` VALUES ('239','8','computers','2012-05-15 05:06:22','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('240','5','DeviceGraphicCard','2012-05-15 05:07:08','inventory','4','glpi добавление объекта HD4350.');
INSERT INTO `glpi_events` VALUES ('241','8','computers','2012-05-15 05:07:45','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('242','7','DeviceHardDrive','2012-05-15 05:09:06','inventory','4','glpi добавление объекта HD322HJ.');
INSERT INTO `glpi_events` VALUES ('243','0','networkport','2012-05-15 05:09:59','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('244','8','computers','2012-05-15 05:10:20','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('245','8','computers','2012-05-15 05:10:27','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('246','12','MonitorModel','2012-05-15 05:26:02','setup','4','glpi added 940N.');
INSERT INTO `glpi_events` VALUES ('247','18','monitors','2012-05-15 05:26:45','inventory','4','glpi добавление объекта MAN0018.');
INSERT INTO `glpi_events` VALUES ('248','19','monitors','2012-05-15 05:27:46','inventory','4','glpi добавление объекта MAN0019.');
INSERT INTO `glpi_events` VALUES ('249','19','monitors','2012-05-15 05:28:43','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('250','18','monitors','2012-05-15 05:28:53','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('251','13','MonitorModel','2012-05-15 05:29:50','setup','4','glpi added 971P.');
INSERT INTO `glpi_events` VALUES ('252','20','monitors','2012-05-15 05:30:53','inventory','4','glpi добавление объекта MON0020.');
INSERT INTO `glpi_events` VALUES ('253','21','monitors','2012-05-15 05:32:49','inventory','4','glpi добавление объекта MON0021.');
INSERT INTO `glpi_events` VALUES ('254','22','monitors','2012-05-15 05:33:57','inventory','4','glpi добавление объекта MON0022.');
INSERT INTO `glpi_events` VALUES ('255','23','monitors','2012-05-15 05:35:05','inventory','4','glpi добавление объекта MON0023.');
INSERT INTO `glpi_events` VALUES ('256','24','monitors','2012-05-15 05:36:19','inventory','4','glpi добавление объекта MON0024.');
INSERT INTO `glpi_events` VALUES ('257','17','monitors','2012-05-15 05:37:06','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('258','5','DeviceMemory','2012-05-15 05:41:29','inventory','4','glpi добавление объекта 4GB_DDR3_SAMSUNG.');
INSERT INTO `glpi_events` VALUES ('259','9','computers','2012-05-15 05:42:58','inventory','4','glpi добавление объекта PC0009.');
INSERT INTO `glpi_events` VALUES ('260','9','computers','2012-05-15 05:47:47','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('261','9','computers','2012-05-15 05:48:17','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('262','0','networkport','2012-05-15 05:48:42','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('263','7','DeviceMotherboard','2012-05-15 05:54:29','inventory','4','glpi добавление объекта S1155_GA-H61M-D2H-USB3.');
INSERT INTO `glpi_events` VALUES ('264','10','computers','2012-05-15 05:55:31','inventory','4','glpi добавление объекта PC0010.');
INSERT INTO `glpi_events` VALUES ('265','8','DeviceProcessor','2012-05-15 05:58:09','inventory','4','glpi добавление объекта i5-2320.');
INSERT INTO `glpi_events` VALUES ('266','10','computers','2012-05-15 06:04:31','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('267','8','DeviceHardDrive','2012-05-15 06:05:54','inventory','4','glpi добавление объекта SNVP325S2128GB.');
INSERT INTO `glpi_events` VALUES ('268','10','computers','2012-05-15 06:07:43','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('269','20','monitors','2012-05-15 06:08:01','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('270','10','computers','2012-05-15 06:08:23','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('271','0','networkport','2012-05-15 06:09:23','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('272','11','computers','2012-05-15 06:11:24','inventory','4','glpi добавление объекта PC0011.');
INSERT INTO `glpi_events` VALUES ('273','8','DeviceMotherboard','2012-05-15 06:13:15','inventory','4','glpi добавление объекта S775_P5G41T-M LE.');
INSERT INTO `glpi_events` VALUES ('274','11','computers','2012-05-15 06:14:01','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('275','14','Manufacturer','2012-05-15 06:15:47','setup','4','glpi added SEAGATE.');
INSERT INTO `glpi_events` VALUES ('276','9','DeviceHardDrive','2012-05-15 06:16:07','inventory','4','glpi добавление объекта ST3320418AS.');
INSERT INTO `glpi_events` VALUES ('277','0','networkport','2012-05-15 06:17:18','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('278','11','computers','2012-05-15 06:18:36','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('279','12','computers','2012-05-15 06:23:40','inventory','4','glpi добавление объекта PC0012.');
INSERT INTO `glpi_events` VALUES ('280','9','DeviceMotherboard','2012-05-15 06:24:42','inventory','4','glpi добавление объекта S775_P5G41T-M LX2/GB.');
INSERT INTO `glpi_events` VALUES ('281','9','DeviceProcessor','2012-05-15 06:25:27','inventory','4','glpi добавление объекта Core 2 Duo E7500.');
INSERT INTO `glpi_events` VALUES ('282','15','Manufacturer','2012-05-15 06:28:05','setup','4','glpi added Western Digital.');
INSERT INTO `glpi_events` VALUES ('283','10','DeviceHardDrive','2012-05-15 06:28:27','inventory','4','glpi добавление объекта WD5000AADS-00S9B0.');
INSERT INTO `glpi_events` VALUES ('284','0','networkport','2012-05-15 06:28:56','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('285','12','computers','2012-05-15 06:29:25','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('286','12','computers','2012-05-15 06:29:30','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('287','1','monitors','2012-05-15 06:57:23','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('288','1','computers','2012-05-15 06:57:31','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('289','2','monitors','2012-05-15 06:57:50','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('290','25','monitors','2012-05-15 07:01:21','inventory','4','glpi добавление объекта MON0025.');
INSERT INTO `glpi_events` VALUES ('291','26','monitors','2012-05-15 07:03:17','inventory','4','glpi добавление объекта MON0026.');
INSERT INTO `glpi_events` VALUES ('292','27','monitors','2012-05-15 07:04:52','inventory','4','glpi добавление объекта MON0027.');
INSERT INTO `glpi_events` VALUES ('293','27','monitors','2012-05-15 07:07:42','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('294','28','monitors','2012-05-15 07:08:57','inventory','4','glpi добавление объекта MON0028.');
INSERT INTO `glpi_events` VALUES ('295','29','monitors','2012-05-15 07:10:36','inventory','4','glpi добавление объекта MON0029.');
INSERT INTO `glpi_events` VALUES ('296','30','monitors','2012-05-15 07:12:24','inventory','4','glpi добавление объекта MON0030.');
INSERT INTO `glpi_events` VALUES ('297','31','monitors','2012-05-15 07:13:23','inventory','4','glpi добавление объекта MON0031.');
INSERT INTO `glpi_events` VALUES ('298','32','monitors','2012-05-15 07:14:37','inventory','4','glpi добавление объекта MON0032.');
INSERT INTO `glpi_events` VALUES ('299','13','computers','2012-05-15 07:49:57','inventory','4','glpi добавление объекта PC0013.');
INSERT INTO `glpi_events` VALUES ('300','10','DeviceProcessor','2012-05-15 07:51:34','inventory','4','glpi добавление объекта Core 2 Duo E4300.');
INSERT INTO `glpi_events` VALUES ('301','10','DeviceMotherboard','2012-05-15 07:53:15','inventory','4','glpi добавление объекта S775_P5GZ-MX.');
INSERT INTO `glpi_events` VALUES ('302','13','computers','2012-05-15 07:54:02','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('303','11','DeviceHardDrive','2012-05-15 07:55:49','inventory','4','glpi добавление объекта HD080HJ.');
INSERT INTO `glpi_events` VALUES ('304','-1','system','2012-05-15 07:56:00','login','3','max.krivoshlyk IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('305','-1','system','2012-05-15 07:56:01','login','1','connection failed:  (82.117.232.116)');
INSERT INTO `glpi_events` VALUES ('306','13','computers','2012-05-15 07:56:29','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('307','0','users','2012-05-15 07:56:55','setup','5','max.krivoshlyk  update the item  max.krivoshlyk.');
INSERT INTO `glpi_events` VALUES ('308','0','networkport','2012-05-15 07:57:35','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('309','-1','system','2012-05-15 07:59:13','login','3','denis.maksymenko IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('310','-1','system','2012-05-15 07:59:39','login','3','denis.maksymenko IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('311','-1','system','2012-05-15 08:01:39','login','3','denis.maksymenko IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('312','14','computers','2012-05-15 08:07:31','inventory','4','glpi добавление объекта PC0014.');
INSERT INTO `glpi_events` VALUES ('313','14','computers','2012-05-15 08:08:07','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('314','12','DeviceHardDrive','2012-05-15 08:09:56','inventory','4','glpi добавление объекта WD1600AAJS-00B4A0.');
INSERT INTO `glpi_events` VALUES ('315','14','computers','2012-05-15 08:10:36','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('316','0','networkport','2012-05-15 08:10:55','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('317','15','computers','2012-05-15 08:25:10','inventory','4','glpi добавление объекта PC0015.');
INSERT INTO `glpi_events` VALUES ('318','15','computers','2012-05-15 08:26:08','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('319','15','computers','2012-05-15 08:32:54','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('320','15','computers','2012-05-15 08:33:06','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('321','0','networkport','2012-05-15 08:33:26','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('322','16','computers','2012-05-15 08:36:19','inventory','4','glpi добавление объекта PC0016.');
INSERT INTO `glpi_events` VALUES ('323','16','computers','2012-05-15 08:45:20','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('324','16','computers','2012-05-15 08:46:36','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('325','16','computers','2012-05-15 08:46:45','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('326','0','networkport','2012-05-15 08:47:06','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('327','17','computers','2012-05-15 08:50:06','inventory','4','glpi добавление объекта PC0017.');
INSERT INTO `glpi_events` VALUES ('328','17','computers','2012-05-15 08:52:18','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('329','17','computers','2012-05-15 08:53:25','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('330','17','computers','2012-05-15 08:53:39','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('331','0','networkport','2012-05-15 08:53:57','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('332','4','computers','2012-05-15 08:55:52','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('333','4','networkport','2012-05-15 08:56:34','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('334','33','monitors','2012-05-15 09:32:47','inventory','4','glpi добавление объекта MON0033.');
INSERT INTO `glpi_events` VALUES ('335','34','monitors','2012-05-15 09:34:54','inventory','4','glpi добавление объекта MON0034.');
INSERT INTO `glpi_events` VALUES ('336','35','monitors','2012-05-15 09:36:40','inventory','4','glpi добавление объекта MON0035.');
INSERT INTO `glpi_events` VALUES ('337','35','monitors','2012-05-15 09:37:10','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('338','36','monitors','2012-05-15 09:38:22','inventory','4','glpi добавление объекта MON0035.');
INSERT INTO `glpi_events` VALUES ('339','37','monitors','2012-05-15 09:41:45','inventory','4','glpi добавление объекта MON0036.');
INSERT INTO `glpi_events` VALUES ('340','16','Manufacturer','2012-05-15 09:42:32','setup','4','glpi added OPTIQUEST.');
INSERT INTO `glpi_events` VALUES ('341','14','MonitorModel','2012-05-15 09:43:11','setup','4','glpi added Q9.');
INSERT INTO `glpi_events` VALUES ('342','38','monitors','2012-05-15 09:43:35','inventory','4','glpi добавление объекта MON0037.');
INSERT INTO `glpi_events` VALUES ('343','39','monitors','2012-05-15 09:45:02','inventory','4','glpi добавление объекта MON0038.');
INSERT INTO `glpi_events` VALUES ('344','40','monitors','2012-05-15 09:46:17','inventory','4','glpi добавление объекта MON0039.');
INSERT INTO `glpi_events` VALUES ('345','15','MonitorModel','2012-05-15 09:47:36','setup','4','glpi added 246ELH.');
INSERT INTO `glpi_events` VALUES ('346','41','monitors','2012-05-15 09:48:51','inventory','4','glpi добавление объекта MON0040.');
INSERT INTO `glpi_events` VALUES ('347','-1','system','2012-05-16 02:54:44','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('348','18','computers','2012-05-16 02:57:19','inventory','4','glpi добавление объекта PC0018.');
INSERT INTO `glpi_events` VALUES ('349','11','DeviceMotherboard','2012-05-16 02:58:33','inventory','4','glpi добавление объекта S1155_GA-Z68M-D2H.');
INSERT INTO `glpi_events` VALUES ('350','18','computers','2012-05-16 02:58:57','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('351','6','DeviceGraphicCard','2012-05-16 02:59:50','inventory','4','glpi добавление объекта HD4300.');
INSERT INTO `glpi_events` VALUES ('352','18','computers','2012-05-16 03:00:37','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('353','18','computers','2012-05-16 03:00:48','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('354','0','networkport','2012-05-16 03:01:08','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('355','19','computers','2012-05-16 03:02:40','inventory','4','glpi добавление объекта PC0019.');
INSERT INTO `glpi_events` VALUES ('356','12','DeviceMotherboard','2012-05-16 03:03:33','inventory','4','glpi добавление объекта S775_Topsfield DP43TF.');
INSERT INTO `glpi_events` VALUES ('357','17','Manufacturer','2012-05-16 03:04:23','setup','4','glpi added TRANSCEND.');
INSERT INTO `glpi_events` VALUES ('358','6','DeviceMemory','2012-05-16 03:04:40','inventory','4','glpi добавление объекта 2GB_DDR2_TRANSCEND.');
INSERT INTO `glpi_events` VALUES ('359','19','computers','2012-05-16 03:05:01','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('360','7','DeviceGraphicCard','2012-05-16 03:06:05','inventory','4','glpi добавление объекта 9400GT.');
INSERT INTO `glpi_events` VALUES ('361','13','DeviceHardDrive','2012-05-16 03:07:02','inventory','4','glpi добавление объекта HD252HJ.');
INSERT INTO `glpi_events` VALUES ('362','0','networkport','2012-05-16 03:07:38','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('363','19','computers','2012-05-16 03:08:17','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('364','20','computers','2012-05-16 03:09:24','inventory','4','glpi добавление объекта PC0020.');
INSERT INTO `glpi_events` VALUES ('365','7','DeviceMemory','2012-05-16 03:10:59','inventory','4','glpi добавление объекта 2GB_DDR2_HYNIX.');
INSERT INTO `glpi_events` VALUES ('366','20','computers','2012-05-16 03:11:14','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('367','0','networkport','2012-05-16 03:12:03','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('368','20','computers','2012-05-16 03:12:25','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('369','21','computers','2012-05-16 03:14:00','inventory','4','glpi добавление объекта PC0021.');
INSERT INTO `glpi_events` VALUES ('370','11','DeviceProcessor','2012-05-16 03:15:08','inventory','4','glpi добавление объекта Core 2 Quad Q9300.');
INSERT INTO `glpi_events` VALUES ('371','18','Manufacturer','2012-05-16 03:15:40','setup','4','glpi added ASROCK.');
INSERT INTO `glpi_events` VALUES ('372','13','DeviceMotherboard','2012-05-16 03:15:52','inventory','4','glpi добавление объекта S775_G41C-VS.');
INSERT INTO `glpi_events` VALUES ('373','21','computers','2012-05-16 03:17:03','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('374','21','computers','2012-05-16 03:17:13','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('375','0','networkport','2012-05-16 03:18:26','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('376','22','computers','2012-05-16 03:19:55','inventory','4','glpi добавление объекта PC0022.');
INSERT INTO `glpi_events` VALUES ('377','22','computers','2012-05-16 03:21:09','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('378','0','networkport','2012-05-16 03:22:21','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('379','22','computers','2012-05-16 03:23:01','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('380','22','computers','2012-05-16 03:23:10','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('381','21','computers','2012-05-16 03:23:45','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('382','21','computers','2012-05-16 03:23:51','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('383','23','computers','2012-05-16 03:24:51','inventory','4','glpi добавление объекта PC0023.');
INSERT INTO `glpi_events` VALUES ('384','23','computers','2012-05-16 03:25:04','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('385','3','OperatingSystem','2012-05-16 03:27:04','setup','4','glpi added MAC OS X.');
INSERT INTO `glpi_events` VALUES ('386','24','computers','2012-05-16 03:27:29','inventory','4','glpi добавление объекта MACMINI0001.');
INSERT INTO `glpi_events` VALUES ('387','25','computers','2012-05-16 03:28:47','inventory','4','glpi добавление объекта MACMINI0002.');
INSERT INTO `glpi_events` VALUES ('388','16','MonitorModel','2012-05-16 03:30:16','setup','4','glpi added 2494.');
INSERT INTO `glpi_events` VALUES ('389','42','monitors','2012-05-16 03:30:28','inventory','4','glpi добавление объекта MON0041.');
INSERT INTO `glpi_events` VALUES ('390','25','computers','2012-05-16 03:30:40','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('391','26','computers','2012-05-16 03:32:56','inventory','4','glpi добавление объекта PC0024.');
INSERT INTO `glpi_events` VALUES ('392','43','monitors','2012-05-16 03:34:52','inventory','4','glpi добавление объекта MON0042.');
INSERT INTO `glpi_events` VALUES ('393','19','Manufacturer','2012-05-16 03:35:42','setup','4','glpi added Foxconn.');
INSERT INTO `glpi_events` VALUES ('394','14','DeviceMotherboard','2012-05-16 03:36:15','inventory','4','glpi добавление объекта S754_6100K8MB-RS(H).');
INSERT INTO `glpi_events` VALUES ('395','12','DeviceProcessor','2012-05-16 03:36:58','inventory','4','glpi добавление объекта Sempron.');
INSERT INTO `glpi_events` VALUES ('396','8','DeviceMemory','2012-05-16 03:38:23','inventory','4','glpi добавление объекта 1GB_DDR1_NONAME.');
INSERT INTO `glpi_events` VALUES ('397','26','computers','2012-05-16 03:38:36','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('398','0','networkport','2012-05-16 03:39:41','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('399','26','computers','2012-05-16 03:40:03','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('400','44','monitors','2012-05-16 03:42:16','inventory','4','glpi добавление объекта MON0043.');
INSERT INTO `glpi_events` VALUES ('401','27','computers','2012-05-16 03:43:28','inventory','4','glpi добавление объекта PC0025.');
INSERT INTO `glpi_events` VALUES ('402','27','computers','2012-05-16 03:45:19','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('403','45','monitors','2012-05-16 03:46:35','inventory','4','glpi добавление объекта MON0044.');
INSERT INTO `glpi_events` VALUES ('404','28','computers','2012-05-16 03:47:17','inventory','4','glpi добавление объекта PC0026.');
INSERT INTO `glpi_events` VALUES ('405','15','DeviceMotherboard','2012-05-16 03:50:09','inventory','4','glpi добавление объекта S754_K8NF6G-VSTA.');
INSERT INTO `glpi_events` VALUES ('406','3','OperatingSystemVersion','2012-05-16 03:53:46','setup','4','glpi added Ubuntu 10.04.');
INSERT INTO `glpi_events` VALUES ('407','28','computers','2012-05-16 03:53:53','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('408','28','computers','2012-05-16 03:55:11','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('409','4','OperatingSystemVersion','2012-05-16 03:57:11','setup','4','glpi added 11.04.');
INSERT INTO `glpi_events` VALUES ('410','27','computers','2012-05-16 03:57:17','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('411','8','DeviceMemory','2012-05-16 03:59:24','setup','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('412','46','monitors','2012-05-16 04:13:08','inventory','4','glpi добавление объекта MON0045.');
INSERT INTO `glpi_events` VALUES ('413','29','computers','2012-05-16 04:14:30','inventory','4','glpi добавление объекта MACMINI0003.');
INSERT INTO `glpi_events` VALUES ('414','29','computers','2012-05-16 04:15:02','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('415','29','computers','2012-05-16 04:15:32','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('416','1','ComputerModel','2012-05-16 04:16:59','setup','4','glpi added 12.1.');
INSERT INTO `glpi_events` VALUES ('417','30','computers','2012-05-16 04:17:27','inventory','4','glpi добавление объекта IMAC0001.');
INSERT INTO `glpi_events` VALUES ('418','47','monitors','2012-05-16 04:19:07','inventory','4','glpi добавление объекта MON0046.');
INSERT INTO `glpi_events` VALUES ('419','48','monitors','2012-05-16 04:20:01','inventory','4','glpi добавление объекта MON0047.');
INSERT INTO `glpi_events` VALUES ('420','31','computers','2012-05-16 04:21:06','inventory','4','glpi добавление объекта PC0027.');
INSERT INTO `glpi_events` VALUES ('421','31','computers','2012-05-16 04:21:18','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('422','31','computers','2012-05-16 04:21:22','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('423','13','DeviceProcessor','2012-05-16 04:23:14','inventory','4','glpi добавление объекта Core 2 Duo E7600.');
INSERT INTO `glpi_events` VALUES ('424','49','monitors','2012-05-16 04:28:31','inventory','4','glpi добавление объекта MON0048.');
INSERT INTO `glpi_events` VALUES ('425','50','monitors','2012-05-16 04:29:19','inventory','4','glpi добавление объекта MON0049.');
INSERT INTO `glpi_events` VALUES ('426','5','OperatingSystemVersion','2012-05-16 04:30:57','setup','4','glpi added XP_HOME.');
INSERT INTO `glpi_events` VALUES ('427','32','computers','2012-05-16 04:31:05','inventory','4','glpi добавление объекта PC0028.');
INSERT INTO `glpi_events` VALUES ('428','16','DeviceMotherboard','2012-05-16 04:32:24','inventory','4','glpi добавление объекта S775_P5QL.');
INSERT INTO `glpi_events` VALUES ('429','14','DeviceProcessor','2012-05-16 04:33:24','inventory','4','glpi добавление объекта Dual-Core E5300.');
INSERT INTO `glpi_events` VALUES ('430','32','computers','2012-05-16 04:36:59','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('431','32','computers','2012-05-16 04:37:03','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('432','6','computers','2012-05-16 05:22:54','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('433','6','computers','2012-05-16 05:22:57','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('434','7','computers','2012-05-16 05:23:26','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('435','18','computers','2012-05-16 05:23:42','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('436','18','computers','2012-05-16 05:24:57','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('437','7','computers','2012-05-16 05:25:36','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('438','17','monitors','2012-05-16 05:26:09','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('439','34','monitors','2012-05-16 05:26:51','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('440','6','computers','2012-05-16 05:27:28','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('441','21','computers','2012-05-16 05:28:03','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('442','21','computers','2012-05-16 05:28:05','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('443','6','computers','2012-05-16 05:28:16','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('444','6','computers','2012-05-16 05:28:21','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('445','21','computers','2012-05-16 05:28:55','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('446','1','computers','2012-05-16 05:29:16','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('447','1','computers','2012-05-16 05:29:18','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('448','21','computers','2012-05-16 05:29:30','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('449','21','computers','2012-05-16 05:29:35','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('450','1','computers','2012-05-16 05:30:16','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('451','0','users','2012-05-16 05:34:50','setup','5','glpi  обновление объекта  oleg.plitnik.');
INSERT INTO `glpi_events` VALUES ('452','0','users','2012-05-16 05:36:01','setup','5','glpi  обновление объекта  alexander.skripnik.');
INSERT INTO `glpi_events` VALUES ('453','6','computers','2012-05-16 05:36:16','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('454','21','computers','2012-05-16 05:37:00','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('455','71','users','2012-05-16 05:41:58','setup','4','glpi добавление объекта Rezerv.');
INSERT INTO `glpi_events` VALUES ('456','1','computers','2012-05-16 05:42:24','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('457','41','monitors','2012-05-16 05:42:49','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('458','23','computers','2012-05-16 05:47:09','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('459','2','computers','2012-05-16 05:48:05','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('460','47','monitors','2012-05-16 05:50:05','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('461','-1','system','2012-05-16 06:19:45','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('462','2','computers','2012-05-16 09:51:26','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('463','1','networkport','2012-05-16 09:53:31','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('464','4','computers','2012-05-16 09:54:42','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('465','3','computers','2012-05-16 09:55:40','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('466','3','networkport','2012-05-16 09:56:13','inventory','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('467','8','DeviceMemory','2012-05-16 09:56:51','setup','4','glpi обновление объекта');
INSERT INTO `glpi_events` VALUES ('468','26','computers','2012-05-16 09:57:08','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('469','27','computers','2012-05-16 09:57:50','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('470','0','networkport','2012-05-16 09:58:33','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('471','0','networkport','2012-05-16 09:59:14','inventory','5','glpi добавление сетевого порта');
INSERT INTO `glpi_events` VALUES ('472','-1','system','2012-05-16 11:12:03','login','3','denis.maksymenko IP connection: 94.179.201.173');
INSERT INTO `glpi_events` VALUES ('473','0','users','2012-05-16 11:13:16','setup','5','denis.maksymenko  update the item  denis.maksymenko.');
INSERT INTO `glpi_events` VALUES ('474','-1','system','2012-05-17 03:54:10','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('475','-1','system','2012-05-17 04:19:21','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('476','1','NetworkEquipmentModel','2012-05-17 04:21:03','setup','4','glpi added DES3200.');
INSERT INTO `glpi_events` VALUES ('477','20','Manufacturer','2012-05-17 04:21:14','setup','4','glpi added D-Link.');
INSERT INTO `glpi_events` VALUES ('478','1','networkequipment','2012-05-17 04:21:43','inventory','4','glpi добавление объекта :  SW0001.');
INSERT INTO `glpi_events` VALUES ('479','2','NetworkEquipmentModel','2012-05-17 04:23:03','setup','4','glpi added GREEN.');
INSERT INTO `glpi_events` VALUES ('480','2','networkequipment','2012-05-17 04:23:17','inventory','4','glpi добавление объекта :  SW0002.');
INSERT INTO `glpi_events` VALUES ('481','3','NetworkEquipmentModel','2012-05-17 04:23:54','setup','4','glpi added WI-FI DWL-2100AP.');
INSERT INTO `glpi_events` VALUES ('482','3','networkequipment','2012-05-17 04:24:16','inventory','4','glpi добавление объекта :  SW0004.');
INSERT INTO `glpi_events` VALUES ('483','1','NetworkEquipmentType','2012-05-17 04:31:34','setup','4','glpi added SWITCH.');
INSERT INTO `glpi_events` VALUES ('484','2','NetworkEquipmentType','2012-05-17 04:31:44','setup','4','glpi added ROUTER.');
INSERT INTO `glpi_events` VALUES ('485','-1','system','2012-05-17 11:11:19','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('486','4','computers','2012-05-17 11:11:52','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('487','4','computers','2012-05-17 11:11:58','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('488','4','computers','2012-05-17 11:13:45','inventory','5','glpi отключить объект');
INSERT INTO `glpi_events` VALUES ('489','4','computers','2012-05-17 11:13:57','inventory','5','glpi подключение объекта');
INSERT INTO `glpi_events` VALUES ('490','2','computers','2012-05-17 11:14:49','inventory','4','glpi изменение компонентов');
INSERT INTO `glpi_events` VALUES ('491','-1','system','2012-05-18 02:36:03','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('492','-1','system','2012-05-18 02:37:10','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('493','-1','system','2012-05-18 02:37:24','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('494','0','entity','2012-05-18 02:38:16','setup','4','glpi удаление пользователя из организации');
INSERT INTO `glpi_events` VALUES ('495','9','users','2012-05-18 02:38:22','setup','4','glpi добавление пользователя в организацию');
INSERT INTO `glpi_events` VALUES ('496','-1','system','2012-05-18 02:38:31','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('497','-1','system','2012-05-18 02:38:51','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('498','0','entity','2012-05-18 02:39:42','setup','4','glpi удаление пользователя из организации');
INSERT INTO `glpi_events` VALUES ('499','9','users','2012-05-18 02:39:47','setup','4','glpi добавление пользователя в организацию');
INSERT INTO `glpi_events` VALUES ('500','0','entity','2012-05-18 02:39:54','setup','4','glpi удаление пользователя из организации');
INSERT INTO `glpi_events` VALUES ('501','9','users','2012-05-18 02:40:00','setup','4','glpi добавление пользователя в организацию');
INSERT INTO `glpi_events` VALUES ('502','-1','system','2012-05-18 02:40:10','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('503','0','users','2012-05-18 02:40:23','setup','5','dmitry.vilkhivskiy  update the item  dmitry.vilkhivskiy.');
INSERT INTO `glpi_events` VALUES ('504','0','users','2012-05-18 02:40:56','setup','5','dmitry.vilkhivskiy  обновление объекта  glpi.');
INSERT INTO `glpi_events` VALUES ('505','-1','system','2012-05-18 02:41:04','login','3','glpi IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('506','-1','system','2012-05-18 02:41:11','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('507','34','monitors','2012-05-18 02:44:18','inventory','4','dmitry.vilkhivskiy обновление объекта');
INSERT INTO `glpi_events` VALUES ('508','17','monitors','2012-05-18 02:47:10','inventory','4','dmitry.vilkhivskiy обновление объекта');
INSERT INTO `glpi_events` VALUES ('509','-1','system','2012-05-18 02:47:51','login','3','dmitriy.yenin IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('510','34','monitors','2012-05-18 02:48:30','inventory','4','dmitry.vilkhivskiy обновление объекта');
INSERT INTO `glpi_events` VALUES ('511','21','computers','2012-05-18 02:49:04','inventory','5','dmitry.vilkhivskiy подключение объекта');
INSERT INTO `glpi_events` VALUES ('512','21','computers','2012-05-18 02:49:38','inventory','5','dmitry.vilkhivskiy отключить объект');
INSERT INTO `glpi_events` VALUES ('513','-1','system','2012-05-18 04:58:57','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('514','30','computers','2012-05-18 05:01:00','inventory','5','dmitry.vilkhivskiy подключение объекта');
INSERT INTO `glpi_events` VALUES ('515','30','computers','2012-05-18 05:01:06','inventory','5','dmitry.vilkhivskiy отключить объект');
INSERT INTO `glpi_events` VALUES ('516','-1','system','2012-05-18 05:03:53','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('517','4','computers','2012-05-18 05:04:42','inventory','5','dmitry.vilkhivskiy подключение объекта');
INSERT INTO `glpi_events` VALUES ('518','4','computers','2012-05-18 05:05:09','inventory','5','dmitry.vilkhivskiy отключить объект');
INSERT INTO `glpi_events` VALUES ('519','-1','system','2012-05-18 05:14:39','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('520','-1','system','2012-05-18 06:32:45','login','3','dmitriy.yenin IP соединение: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('521','-1','system','2012-05-24 07:18:41','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('522','-1','system','2012-05-25 04:08:01','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('523','-1','system','2012-05-29 07:47:27','login','3','dmitriy.yenin IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('524','-1','system','2012-05-29 07:52:41','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('525','0','entity','2012-05-29 07:53:55','setup','4','dmitry.vilkhivskiy удаление пользователя из организации');
INSERT INTO `glpi_events` VALUES ('526','8','users','2012-05-29 07:54:01','setup','4','dmitry.vilkhivskiy добавление пользователя в организацию');
INSERT INTO `glpi_events` VALUES ('527','-1','system','2012-05-29 07:54:15','login','3','dmitriy.yenin IP connection: 82.117.232.116');
INSERT INTO `glpi_events` VALUES ('528','-1','system','2012-05-29 07:59:01','login','3','dmitry.vilkhivskiy IP connection: 82.117.232.116');

### Dump table glpi_fieldblacklists

DROP TABLE IF EXISTS `glpi_fieldblacklists`;
CREATE TABLE `glpi_fieldblacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_fieldunicities

DROP TABLE IF EXISTS `glpi_fieldunicities`;
CREATE TABLE `glpi_fieldunicities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `fields` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `action_refuse` tinyint(1) NOT NULL DEFAULT '0',
  `action_notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores field unicity criterias';


### Dump table glpi_filesystems

DROP TABLE IF EXISTS `glpi_filesystems`;
CREATE TABLE `glpi_filesystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_filesystems` VALUES ('1','ext',NULL);
INSERT INTO `glpi_filesystems` VALUES ('2','ext2',NULL);
INSERT INTO `glpi_filesystems` VALUES ('3','ext3',NULL);
INSERT INTO `glpi_filesystems` VALUES ('4','ext4',NULL);
INSERT INTO `glpi_filesystems` VALUES ('5','FAT',NULL);
INSERT INTO `glpi_filesystems` VALUES ('6','FAT32',NULL);
INSERT INTO `glpi_filesystems` VALUES ('7','VFAT',NULL);
INSERT INTO `glpi_filesystems` VALUES ('8','HFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('9','HPFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('10','HTFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('11','JFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('12','JFS2',NULL);
INSERT INTO `glpi_filesystems` VALUES ('13','NFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('14','NTFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('15','ReiserFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('16','SMBFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('17','UDF',NULL);
INSERT INTO `glpi_filesystems` VALUES ('18','UFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('19','XFS',NULL);
INSERT INTO `glpi_filesystems` VALUES ('20','ZFS',NULL);

### Dump table glpi_groups

DROP TABLE IF EXISTS `glpi_groups`;
CREATE TABLE `glpi_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `ldap_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ldap_value` text COLLATE utf8_unicode_ci,
  `ldap_group_dn` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_requester` tinyint(1) NOT NULL DEFAULT '1',
  `is_assign` tinyint(1) NOT NULL DEFAULT '1',
  `is_notify` tinyint(1) NOT NULL DEFAULT '1',
  `is_itemgroup` tinyint(1) NOT NULL DEFAULT '1',
  `is_usergroup` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `ldap_field` (`ldap_field`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `ldap_value` (`ldap_value`(200)),
  KEY `ldap_group_dn` (`ldap_group_dn`(200)),
  KEY `groups_id` (`groups_id`),
  KEY `is_requester` (`is_requester`),
  KEY `is_assign` (`is_assign`),
  KEY `is_notify` (`is_notify`),
  KEY `is_itemgroup` (`is_itemgroup`),
  KEY `is_usergroup` (`is_usergroup`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_groups` VALUES ('1','0','0','BOSSdev','',NULL,NULL,NULL,'2012-05-14 07:47:49','0','BOSSdev','1',NULL,NULL,'1','1','1','1','1');
INSERT INTO `glpi_groups` VALUES ('2','0','0','Flexaspect','',NULL,NULL,NULL,'2012-05-14 07:48:04','0','Flexaspect','1',NULL,NULL,'1','1','1','1','1');
INSERT INTO `glpi_groups` VALUES ('3','0','0','Ukad','',NULL,NULL,NULL,'2012-05-14 07:48:21','0','Ukad','1',NULL,NULL,'1','1','1','1','1');

### Dump table glpi_groups_knowbaseitems

DROP TABLE IF EXISTS `glpi_groups_knowbaseitems`;
CREATE TABLE `glpi_groups_knowbaseitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_groups_problems

DROP TABLE IF EXISTS `glpi_groups_problems`;
CREATE TABLE `glpi_groups_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_groups_reminders

DROP TABLE IF EXISTS `glpi_groups_reminders`;
CREATE TABLE `glpi_groups_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_groups_tickets

DROP TABLE IF EXISTS `glpi_groups_tickets`;
CREATE TABLE `glpi_groups_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_groups_users

DROP TABLE IF EXISTS `glpi_groups_users`;
CREATE TABLE `glpi_groups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `is_userdelegate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`groups_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_manager` (`is_manager`),
  KEY `is_userdelegate` (`is_userdelegate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_holidays

DROP TABLE IF EXISTS `glpi_holidays`;
CREATE TABLE `glpi_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_perpetual` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_perpetual` (`is_perpetual`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_infocoms

DROP TABLE IF EXISTS `glpi_infocoms`;
CREATE TABLE `glpi_infocoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `buy_date` date DEFAULT NULL,
  `use_date` date DEFAULT NULL,
  `warranty_duration` int(11) NOT NULL DEFAULT '0',
  `warranty_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `order_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `immo_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `warranty_value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `sink_time` int(11) NOT NULL DEFAULT '0',
  `sink_type` int(11) NOT NULL DEFAULT '0',
  `sink_coeff` float NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `bill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `alert` int(11) NOT NULL DEFAULT '0',
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `inventory_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `buy_date` (`buy_date`),
  KEY `alert` (`alert`),
  KEY `budgets_id` (`budgets_id`),
  KEY `suppliers_id` (`suppliers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_interfacetypes

DROP TABLE IF EXISTS `glpi_interfacetypes`;
CREATE TABLE `glpi_interfacetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_interfacetypes` VALUES ('1','IDE',NULL);
INSERT INTO `glpi_interfacetypes` VALUES ('2','SATA',NULL);
INSERT INTO `glpi_interfacetypes` VALUES ('3','SCSI',NULL);
INSERT INTO `glpi_interfacetypes` VALUES ('4','USB',NULL);
INSERT INTO `glpi_interfacetypes` VALUES ('5','AGP','');
INSERT INTO `glpi_interfacetypes` VALUES ('6','PCI','');
INSERT INTO `glpi_interfacetypes` VALUES ('7','PCIe','');
INSERT INTO `glpi_interfacetypes` VALUES ('8','PCI-X','');
INSERT INTO `glpi_interfacetypes` VALUES ('9','PCI-EX','');
INSERT INTO `glpi_interfacetypes` VALUES ('10','SATA2','');
INSERT INTO `glpi_interfacetypes` VALUES ('11','SATA3','');

### Dump table glpi_items_problems

DROP TABLE IF EXISTS `glpi_items_problems`;
CREATE TABLE `glpi_items_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_itilcategories

DROP TABLE IF EXISTS `glpi_itilcategories`;
CREATE TABLE `glpi_itilcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_helpdeskvisible` tinyint(1) NOT NULL DEFAULT '1',
  `tickettemplates_id_incident` int(11) NOT NULL DEFAULT '0',
  `tickettemplates_id_demand` int(11) NOT NULL DEFAULT '0',
  `is_incident` int(11) NOT NULL DEFAULT '1',
  `is_request` int(11) NOT NULL DEFAULT '1',
  `is_problem` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `tickettemplates_id_incident` (`tickettemplates_id_incident`),
  KEY `tickettemplates_id_demand` (`tickettemplates_id_demand`),
  KEY `is_incident` (`is_incident`),
  KEY `is_request` (`is_request`),
  KEY `is_problem` (`is_problem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_knowbaseitemcategories

DROP TABLE IF EXISTS `glpi_knowbaseitemcategories`;
CREATE TABLE `glpi_knowbaseitemcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`knowbaseitemcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_knowbaseitems

DROP TABLE IF EXISTS `glpi_knowbaseitems`;
CREATE TABLE `glpi_knowbaseitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci,
  `answer` longtext COLLATE utf8_unicode_ci,
  `is_faq` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `is_faq` (`is_faq`),
  KEY `date_mod` (`date_mod`),
  FULLTEXT KEY `fulltext` (`name`,`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_knowbaseitems_profiles

DROP TABLE IF EXISTS `glpi_knowbaseitems_profiles`;
CREATE TABLE `glpi_knowbaseitems_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_knowbaseitems_users

DROP TABLE IF EXISTS `glpi_knowbaseitems_users`;
CREATE TABLE `glpi_knowbaseitems_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_links

DROP TABLE IF EXISTS `glpi_links`;
CREATE TABLE `glpi_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_links_itemtypes

DROP TABLE IF EXISTS `glpi_links_itemtypes`;
CREATE TABLE `glpi_links_itemtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `links_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`links_id`),
  KEY `links_id` (`links_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_locations

DROP TABLE IF EXISTS `glpi_locations`;
CREATE TABLE `glpi_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `building` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`locations_id`,`name`),
  KEY `locations_id` (`locations_id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_locations` VALUES ('1','0','0','201','0','201','','1',NULL,'{\"1\":\"1\"}','','');
INSERT INTO `glpi_locations` VALUES ('2','0','0','202','0','202','','1',NULL,NULL,'','');
INSERT INTO `glpi_locations` VALUES ('3','0','0','203','0','203','','1',NULL,NULL,'','');
INSERT INTO `glpi_locations` VALUES ('4','0','0','204','0','204','','1',NULL,NULL,'','');
INSERT INTO `glpi_locations` VALUES ('5','0','0','205','0','205','','1',NULL,NULL,'','');
INSERT INTO `glpi_locations` VALUES ('6','0','0','206','0','206','','1',NULL,NULL,'','');
INSERT INTO `glpi_locations` VALUES ('7','0','0','207','0','207','','1',NULL,NULL,'','');

### Dump table glpi_logs

DROP TABLE IF EXISTS `glpi_logs`;
CREATE TABLE `glpi_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `linked_action` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php HISTORY_* constant',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `id_search_option` int(11) NOT NULL DEFAULT '0' COMMENT 'see search.constant.php for value',
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `itemtype_link` (`itemtype_link`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_logs` VALUES ('1','User','5','','0','glpi','2012-05-14 07:22:49','8','1','0');
INSERT INTO `glpi_logs` VALUES ('2','User','3','','0','glpi','2012-05-14 07:23:10','8','1','0');
INSERT INTO `glpi_logs` VALUES ('3','User','4','','0','glpi','2012-05-14 07:23:23','8','1','0');
INSERT INTO `glpi_logs` VALUES ('4','User','2','','0','glpi','2012-05-14 07:35:33','17','','ru_RU');
INSERT INTO `glpi_logs` VALUES ('5','User','6','Profile_User','17','glpi','2012-05-14 07:37:30','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('6','User','6','0','20','glpi','2012-05-14 07:37:30','0','','');
INSERT INTO `glpi_logs` VALUES ('7','User','7','Profile_User','17','glpi','2012-05-14 07:38:09','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('8','User','7','0','20','glpi','2012-05-14 07:38:09','0','','');
INSERT INTO `glpi_logs` VALUES ('9','User','8','Profile_User','17','glpi','2012-05-14 07:39:27','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('10','User','8','0','20','glpi','2012-05-14 07:39:27','0','','');
INSERT INTO `glpi_logs` VALUES ('11','User','9','Profile_User','17','glpi','2012-05-14 07:40:48','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('12','User','9','0','20','glpi','2012-05-14 07:40:48','0','','');
INSERT INTO `glpi_logs` VALUES ('13','User','7','Profile_User','17','glpi','2012-05-14 07:43:15','0','','Admin, Головная организация');
INSERT INTO `glpi_logs` VALUES ('14','User','6','Profile_User','17','glpi','2012-05-14 07:43:40','0','','Admin, Головная организация');
INSERT INTO `glpi_logs` VALUES ('15','User','6','Profile_User','17','glpi','2012-05-14 07:43:46','0','','Admin, Головная организация');
INSERT INTO `glpi_logs` VALUES ('16','User','6','Profile_User','19','glpi','2012-05-14 07:43:55','0','Self-Service, Головная организация, D','');
INSERT INTO `glpi_logs` VALUES ('17','User','6','Profile_User','19','glpi','2012-05-14 07:44:00','0','Admin, Головная организация','');
INSERT INTO `glpi_logs` VALUES ('18','User','8','Profile_User','19','glpi','2012-05-14 07:44:15','0','Self-Service, Головная организация, D','');
INSERT INTO `glpi_logs` VALUES ('19','User','8','Profile_User','17','glpi','2012-05-14 07:44:20','0','','Admin, Головная организация');
INSERT INTO `glpi_logs` VALUES ('20','User','9','Profile_User','19','glpi','2012-05-14 07:44:33','0','Self-Service, Головная организация, D','');
INSERT INTO `glpi_logs` VALUES ('21','User','9','Profile_User','17','glpi','2012-05-14 07:44:39','0','','Admin, Головная организация');
INSERT INTO `glpi_logs` VALUES ('22','User','7','Profile_User','19','glpi','2012-05-14 07:44:53','0','Self-Service, Головная организация, D','');
INSERT INTO `glpi_logs` VALUES ('23','User','9','','0','Vilkhivskiy Dmitry','2012-05-14 07:45:26','17','','ru_RU');
INSERT INTO `glpi_logs` VALUES ('24','User','9','','0','Vilkhivskiy Dmitry','2012-05-14 07:45:57','81','Младший системный администратор','&nbsp;');
INSERT INTO `glpi_logs` VALUES ('25','User','8','','0','Vilkhivskiy Dmitry','2012-05-14 07:46:29','81','&nbsp;','System Administrator');
INSERT INTO `glpi_logs` VALUES ('26','User','9','','0','Vilkhivskiy Dmitry','2012-05-14 07:46:43','81','&nbsp;','System Administrator');
INSERT INTO `glpi_logs` VALUES ('27','User','10','Profile_User','17','glpi','2012-05-14 07:54:24','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('28','User','10','0','20','glpi','2012-05-14 07:54:24','0','','');
INSERT INTO `glpi_logs` VALUES ('29','User','11','Profile_User','17','glpi','2012-05-14 07:56:47','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('30','User','11','0','20','glpi','2012-05-14 07:56:47','0','','');
INSERT INTO `glpi_logs` VALUES ('31','User','12','Profile_User','17','glpi','2012-05-14 07:57:53','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('32','User','12','0','20','glpi','2012-05-14 07:57:53','0','','');
INSERT INTO `glpi_logs` VALUES ('33','User','13','Profile_User','17','glpi','2012-05-14 08:00:50','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('34','User','13','0','20','glpi','2012-05-14 08:00:50','0','','');
INSERT INTO `glpi_logs` VALUES ('35','User','14','Profile_User','17','glpi','2012-05-14 08:01:15','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('36','User','14','0','20','glpi','2012-05-14 08:01:15','0','','');
INSERT INTO `glpi_logs` VALUES ('37','User','15','Profile_User','17','glpi','2012-05-14 08:01:39','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('38','User','15','0','20','glpi','2012-05-14 08:01:39','0','','');
INSERT INTO `glpi_logs` VALUES ('39','User','16','Profile_User','17','glpi','2012-05-14 08:02:13','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('40','User','16','0','20','glpi','2012-05-14 08:02:13','0','','');
INSERT INTO `glpi_logs` VALUES ('41','User','17','Profile_User','17','glpi','2012-05-14 08:02:39','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('42','User','17','0','20','glpi','2012-05-14 08:02:39','0','','');
INSERT INTO `glpi_logs` VALUES ('43','User','18','Profile_User','17','glpi','2012-05-14 08:03:09','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('44','User','18','0','20','glpi','2012-05-14 08:03:09','0','','');
INSERT INTO `glpi_logs` VALUES ('45','User','19','Profile_User','17','glpi','2012-05-14 08:03:43','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('46','User','19','0','20','glpi','2012-05-14 08:03:43','0','','');
INSERT INTO `glpi_logs` VALUES ('47','User','20','Profile_User','17','glpi','2012-05-14 08:04:10','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('48','User','20','0','20','glpi','2012-05-14 08:04:10','0','','');
INSERT INTO `glpi_logs` VALUES ('49','User','21','Profile_User','17','glpi','2012-05-14 08:04:35','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('50','User','21','0','20','glpi','2012-05-14 08:04:35','0','','');
INSERT INTO `glpi_logs` VALUES ('51','User','22','Profile_User','17','glpi','2012-05-14 08:04:54','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('52','User','22','0','20','glpi','2012-05-14 08:04:54','0','','');
INSERT INTO `glpi_logs` VALUES ('53','User','23','Profile_User','17','glpi','2012-05-14 08:05:14','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('54','User','23','0','20','glpi','2012-05-14 08:05:14','0','','');
INSERT INTO `glpi_logs` VALUES ('55','User','24','Profile_User','17','glpi','2012-05-14 08:05:32','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('56','User','24','0','20','glpi','2012-05-14 08:05:32','0','','');
INSERT INTO `glpi_logs` VALUES ('57','User','25','Profile_User','17','glpi','2012-05-14 08:05:52','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('58','User','25','0','20','glpi','2012-05-14 08:05:52','0','','');
INSERT INTO `glpi_logs` VALUES ('59','User','26','Profile_User','17','glpi','2012-05-14 08:06:15','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('60','User','26','0','20','glpi','2012-05-14 08:06:15','0','','');
INSERT INTO `glpi_logs` VALUES ('61','User','27','Profile_User','17','glpi','2012-05-14 08:06:35','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('62','User','27','0','20','glpi','2012-05-14 08:06:35','0','','');
INSERT INTO `glpi_logs` VALUES ('63','User','28','Profile_User','17','glpi','2012-05-14 08:07:00','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('64','User','28','0','20','glpi','2012-05-14 08:07:00','0','','');
INSERT INTO `glpi_logs` VALUES ('65','User','29','Profile_User','17','glpi','2012-05-14 08:07:31','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('66','User','29','0','20','glpi','2012-05-14 08:07:31','0','','');
INSERT INTO `glpi_logs` VALUES ('67','User','30','Profile_User','17','glpi','2012-05-14 08:07:58','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('68','User','30','0','20','glpi','2012-05-14 08:07:58','0','','');
INSERT INTO `glpi_logs` VALUES ('69','User','31','Profile_User','17','glpi','2012-05-14 08:08:33','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('70','User','31','0','20','glpi','2012-05-14 08:08:33','0','','');
INSERT INTO `glpi_logs` VALUES ('71','User','32','Profile_User','17','glpi','2012-05-14 08:09:00','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('72','User','32','0','20','glpi','2012-05-14 08:09:00','0','','');
INSERT INTO `glpi_logs` VALUES ('73','User','33','Profile_User','17','glpi','2012-05-14 08:09:31','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('74','User','33','0','20','glpi','2012-05-14 08:09:31','0','','');
INSERT INTO `glpi_logs` VALUES ('75','User','34','Profile_User','17','glpi','2012-05-14 08:09:49','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('76','User','34','0','20','glpi','2012-05-14 08:09:49','0','','');
INSERT INTO `glpi_logs` VALUES ('77','User','35','Profile_User','17','glpi','2012-05-14 08:10:23','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('78','User','35','0','20','glpi','2012-05-14 08:10:23','0','','');
INSERT INTO `glpi_logs` VALUES ('79','User','36','Profile_User','17','glpi','2012-05-14 08:10:58','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('80','User','36','0','20','glpi','2012-05-14 08:10:58','0','','');
INSERT INTO `glpi_logs` VALUES ('81','User','37','Profile_User','17','glpi','2012-05-14 08:11:30','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('82','User','37','0','20','glpi','2012-05-14 08:11:30','0','','');
INSERT INTO `glpi_logs` VALUES ('83','User','38','Profile_User','17','glpi','2012-05-14 08:12:03','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('84','User','38','0','20','glpi','2012-05-14 08:12:03','0','','');
INSERT INTO `glpi_logs` VALUES ('85','User','39','Profile_User','17','glpi','2012-05-14 08:12:33','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('86','User','39','0','20','glpi','2012-05-14 08:12:33','0','','');
INSERT INTO `glpi_logs` VALUES ('87','User','40','Profile_User','17','glpi','2012-05-14 08:13:06','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('88','User','40','0','20','glpi','2012-05-14 08:13:06','0','','');
INSERT INTO `glpi_logs` VALUES ('89','User','41','Profile_User','17','glpi','2012-05-14 08:13:29','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('90','User','41','0','20','glpi','2012-05-14 08:13:29','0','','');
INSERT INTO `glpi_logs` VALUES ('91','User','42','Profile_User','17','glpi','2012-05-14 08:14:05','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('92','User','42','0','20','glpi','2012-05-14 08:14:05','0','','');
INSERT INTO `glpi_logs` VALUES ('93','User','43','Profile_User','17','glpi','2012-05-14 08:14:25','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('94','User','43','0','20','glpi','2012-05-14 08:14:25','0','','');
INSERT INTO `glpi_logs` VALUES ('95','User','44','Profile_User','17','glpi','2012-05-14 08:14:41','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('96','User','44','0','20','glpi','2012-05-14 08:14:41','0','','');
INSERT INTO `glpi_logs` VALUES ('97','User','45','Profile_User','17','glpi','2012-05-14 08:15:22','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('98','User','45','0','20','glpi','2012-05-14 08:15:22','0','','');
INSERT INTO `glpi_logs` VALUES ('99','User','46','Profile_User','17','glpi','2012-05-14 08:16:33','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('100','User','46','0','20','glpi','2012-05-14 08:16:33','0','','');
INSERT INTO `glpi_logs` VALUES ('101','User','47','Profile_User','17','glpi','2012-05-14 08:16:51','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('102','User','47','0','20','glpi','2012-05-14 08:16:51','0','','');
INSERT INTO `glpi_logs` VALUES ('103','User','48','Profile_User','17','glpi','2012-05-14 08:17:35','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('104','User','48','0','20','glpi','2012-05-14 08:17:35','0','','');
INSERT INTO `glpi_logs` VALUES ('105','User','49','Profile_User','17','glpi','2012-05-14 08:18:08','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('106','User','49','0','20','glpi','2012-05-14 08:18:08','0','','');
INSERT INTO `glpi_logs` VALUES ('107','User','50','Profile_User','17','glpi','2012-05-14 08:18:26','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('108','User','50','0','20','glpi','2012-05-14 08:18:26','0','','');
INSERT INTO `glpi_logs` VALUES ('109','User','51','Profile_User','17','glpi','2012-05-14 08:18:54','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('110','User','51','0','20','glpi','2012-05-14 08:18:54','0','','');
INSERT INTO `glpi_logs` VALUES ('111','User','52','Profile_User','17','glpi','2012-05-14 08:19:31','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('112','User','52','0','20','glpi','2012-05-14 08:19:31','0','','');
INSERT INTO `glpi_logs` VALUES ('113','User','53','Profile_User','17','glpi','2012-05-14 08:19:59','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('114','User','53','0','20','glpi','2012-05-14 08:19:59','0','','');
INSERT INTO `glpi_logs` VALUES ('115','User','54','Profile_User','17','glpi','2012-05-14 08:20:57','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('116','User','54','0','20','glpi','2012-05-14 08:20:57','0','','');
INSERT INTO `glpi_logs` VALUES ('117','User','55','Profile_User','17','glpi','2012-05-14 08:21:48','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('118','User','55','0','20','glpi','2012-05-14 08:21:48','0','','');
INSERT INTO `glpi_logs` VALUES ('119','User','56','Profile_User','17','glpi','2012-05-14 08:22:06','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('120','User','56','0','20','glpi','2012-05-14 08:22:06','0','','');
INSERT INTO `glpi_logs` VALUES ('121','User','57','Profile_User','17','glpi','2012-05-14 08:22:51','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('122','User','57','0','20','glpi','2012-05-14 08:22:51','0','','');
INSERT INTO `glpi_logs` VALUES ('123','User','58','Profile_User','17','glpi','2012-05-14 08:23:14','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('124','User','58','0','20','glpi','2012-05-14 08:23:14','0','','');
INSERT INTO `glpi_logs` VALUES ('125','User','59','Profile_User','17','glpi','2012-05-14 08:23:53','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('126','User','59','0','20','glpi','2012-05-14 08:23:53','0','','');
INSERT INTO `glpi_logs` VALUES ('127','User','60','Profile_User','17','glpi','2012-05-14 08:24:15','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('128','User','60','0','20','glpi','2012-05-14 08:24:15','0','','');
INSERT INTO `glpi_logs` VALUES ('129','User','61','Profile_User','17','glpi','2012-05-14 08:24:50','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('130','User','61','0','20','glpi','2012-05-14 08:24:50','0','','');
INSERT INTO `glpi_logs` VALUES ('131','User','62','Profile_User','17','glpi','2012-05-14 08:25:10','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('132','User','62','0','20','glpi','2012-05-14 08:25:10','0','','');
INSERT INTO `glpi_logs` VALUES ('133','User','63','Profile_User','17','glpi','2012-05-14 08:25:37','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('134','User','63','0','20','glpi','2012-05-14 08:25:37','0','','');
INSERT INTO `glpi_logs` VALUES ('135','User','64','Profile_User','17','glpi','2012-05-14 08:25:59','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('136','User','64','0','20','glpi','2012-05-14 08:25:59','0','','');
INSERT INTO `glpi_logs` VALUES ('137','User','65','Profile_User','17','glpi','2012-05-14 08:26:23','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('138','User','65','0','20','glpi','2012-05-14 08:26:23','0','','');
INSERT INTO `glpi_logs` VALUES ('139','User','66','Profile_User','17','glpi','2012-05-14 08:28:13','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('140','User','66','0','20','glpi','2012-05-14 08:28:13','0','','');
INSERT INTO `glpi_logs` VALUES ('141','User','67','Profile_User','17','glpi','2012-05-14 08:28:28','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('142','User','67','0','20','glpi','2012-05-14 08:28:28','0','','');
INSERT INTO `glpi_logs` VALUES ('143','User','17','','0','glpi','2012-05-14 08:30:13','34','Afanasye','Afanasyev');
INSERT INTO `glpi_logs` VALUES ('144','Location','1','0','20','glpi','2012-05-14 08:38:08','0','','');
INSERT INTO `glpi_logs` VALUES ('145','Location','2','0','20','glpi','2012-05-14 08:38:13','0','','');
INSERT INTO `glpi_logs` VALUES ('146','Location','3','0','20','glpi','2012-05-14 08:38:17','0','','');
INSERT INTO `glpi_logs` VALUES ('147','Location','4','0','20','glpi','2012-05-14 08:38:21','0','','');
INSERT INTO `glpi_logs` VALUES ('148','Location','5','0','20','glpi','2012-05-14 08:38:25','0','','');
INSERT INTO `glpi_logs` VALUES ('149','Location','6','0','20','glpi','2012-05-14 08:38:30','0','','');
INSERT INTO `glpi_logs` VALUES ('150','Location','7','0','20','glpi','2012-05-14 08:38:35','0','','');
INSERT INTO `glpi_logs` VALUES ('151','Monitor','1','0','20','glpi','2012-05-14 08:47:16','0','','');
INSERT INTO `glpi_logs` VALUES ('152','Monitor','2','0','20','glpi','2012-05-14 08:50:35','0','','');
INSERT INTO `glpi_logs` VALUES ('153','Monitor','3','0','20','glpi','2012-05-14 08:54:39','0','','');
INSERT INTO `glpi_logs` VALUES ('154','Monitor','4','0','20','glpi','2012-05-14 08:56:21','0','','');
INSERT INTO `glpi_logs` VALUES ('155','Monitor','5','0','20','glpi','2012-05-14 09:02:21','0','','');
INSERT INTO `glpi_logs` VALUES ('156','Monitor','6','0','20','glpi','2012-05-14 09:05:58','0','','');
INSERT INTO `glpi_logs` VALUES ('157','Monitor','7','0','20','glpi','2012-05-14 09:08:10','0','','');
INSERT INTO `glpi_logs` VALUES ('158','Monitor','8','0','20','glpi','2012-05-14 09:10:11','0','','');
INSERT INTO `glpi_logs` VALUES ('159','Monitor','9','0','20','glpi','2012-05-14 09:12:22','0','','');
INSERT INTO `glpi_logs` VALUES ('160','Monitor','7','','0','glpi','2012-05-14 09:12:33','1','MON007','MON0007');
INSERT INTO `glpi_logs` VALUES ('161','Monitor','6','','0','glpi','2012-05-14 09:12:43','1','MON006','MON0006');
INSERT INTO `glpi_logs` VALUES ('162','Computer','1','0','20','glpi','2012-05-14 09:19:00','0','','');
INSERT INTO `glpi_logs` VALUES ('163','Computer','1','DeviceProcessor','1','glpi','2012-05-14 09:24:16','0','','Pentium E2200');
INSERT INTO `glpi_logs` VALUES ('164','Computer','1','DeviceMotherboard','1','glpi','2012-05-14 09:25:42','0','','S775_P5G-MX');
INSERT INTO `glpi_logs` VALUES ('165','Computer','1','DeviceMemory','1','glpi','2012-05-14 09:28:45','0','','2GB_DDR2_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('166','Computer','1','DeviceMemory','1','glpi','2012-05-14 09:28:53','0','','2GB_DDR2_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('167','Computer','1','DeviceGraphicCard','1','glpi','2012-05-14 09:31:11','0','','EAH4350');
INSERT INTO `glpi_logs` VALUES ('168','Computer','1','DeviceHardDrive','1','glpi','2012-05-14 09:33:47','0','','HD161HJ');
INSERT INTO `glpi_logs` VALUES ('169','Computer','1','Monitor','15','glpi','2012-05-14 09:34:34','0','','MON0001 (1)');
INSERT INTO `glpi_logs` VALUES ('170','Monitor','1','Computer','15','glpi','2012-05-14 09:34:34','0','','PC0001 (1)');
INSERT INTO `glpi_logs` VALUES ('171','Computer','1','Monitor','15','glpi','2012-05-14 09:34:47','0','','MON0002 (2)');
INSERT INTO `glpi_logs` VALUES ('172','Monitor','2','Computer','15','glpi','2012-05-14 09:34:47','0','','PC0001 (1)');
INSERT INTO `glpi_logs` VALUES ('173','Software','1','0','20','glpi','2012-05-14 09:38:13','0','','');
INSERT INTO `glpi_logs` VALUES ('174','Computer','1','','0','glpi','2012-05-14 09:41:25','44','','VP4RF-2WJ8G-C4GC4-97JB7-RYC9D');
INSERT INTO `glpi_logs` VALUES ('175','Computer','2','0','20','glpi','2012-05-14 09:50:06','0','','');
INSERT INTO `glpi_logs` VALUES ('176','Computer','2','DeviceMotherboard','1','glpi','2012-05-14 09:55:25','0','','S1155_GA-H61M-D2-B3');
INSERT INTO `glpi_logs` VALUES ('177','Computer','2','DeviceMemory','1','glpi','2012-05-14 09:56:23','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('178','Computer','2','DeviceProcessor','1','glpi','2012-05-14 09:57:52','0','','i5-2300');
INSERT INTO `glpi_logs` VALUES ('179','Computer','2','DeviceMemory','1','glpi','2012-05-14 09:58:00','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('180','Computer','2','DeviceHardDrive','1','glpi','2012-05-14 10:00:00','0','','HDT721016SLA380');
INSERT INTO `glpi_logs` VALUES ('181','Computer','2','Monitor','15','glpi','2012-05-14 10:03:00','0','','MON0004 (4)');
INSERT INTO `glpi_logs` VALUES ('182','Monitor','4','Computer','15','glpi','2012-05-14 10:03:00','0','','PC0002 (2)');
INSERT INTO `glpi_logs` VALUES ('183','Computer','2','Monitor','15','glpi','2012-05-14 10:03:11','0','','MON0003 (3)');
INSERT INTO `glpi_logs` VALUES ('184','Monitor','3','Computer','15','glpi','2012-05-14 10:03:11','0','','PC0002 (2)');
INSERT INTO `glpi_logs` VALUES ('185','Computer','2','NetworkPort','17','glpi','2012-05-14 10:04:59','0','','Сетевой порт : ID 1 (1)');
INSERT INTO `glpi_logs` VALUES ('186','NetworkPort','1','0','20','glpi','2012-05-14 10:04:59','0','','');
INSERT INTO `glpi_logs` VALUES ('187','Computer','1','NetworkPort','17','glpi','2012-05-14 10:07:15','0','','Сетевой порт : ID 2 (2)');
INSERT INTO `glpi_logs` VALUES ('188','NetworkPort','2','0','20','glpi','2012-05-14 10:07:15','0','','');
INSERT INTO `glpi_logs` VALUES ('189','Computer','3','0','20','glpi','2012-05-14 10:10:48','0','','');
INSERT INTO `glpi_logs` VALUES ('190','Computer','3','DeviceMotherboard','1','glpi','2012-05-14 10:14:07','0','','S1156_GA-P55A-UD3');
INSERT INTO `glpi_logs` VALUES ('191','Computer','3','DeviceProcessor','1','glpi','2012-05-14 10:14:22','0','','i5-760,');
INSERT INTO `glpi_logs` VALUES ('192','Computer','3','DeviceMemory','1','glpi','2012-05-14 10:14:32','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('193','Computer','3','DeviceMemory','1','glpi','2012-05-14 10:14:46','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('194','Computer','3','DeviceMemory','1','glpi','2012-05-14 10:14:46','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('195','Computer','3','DeviceMemory','1','glpi','2012-05-14 10:14:46','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('196','Computer','3','DeviceGraphicCard','1','glpi','2012-05-14 10:16:50','0','','8400GS');
INSERT INTO `glpi_logs` VALUES ('197','Computer','3','DeviceGraphicCard','1','glpi','2012-05-14 10:16:58','0','','GeForce 210 ');
INSERT INTO `glpi_logs` VALUES ('198','Computer','3','DeviceHardDrive','1','glpi','2012-05-14 10:18:45','0','','SH100S3120G ');
INSERT INTO `glpi_logs` VALUES ('199','Computer','3','Monitor','15','glpi','2012-05-14 10:19:08','0','','MON0005 (5)');
INSERT INTO `glpi_logs` VALUES ('200','Monitor','5','Computer','15','glpi','2012-05-14 10:19:08','0','','PC0003 (3)');
INSERT INTO `glpi_logs` VALUES ('201','Computer','3','Monitor','15','glpi','2012-05-14 10:19:20','0','','MON0006 (6)');
INSERT INTO `glpi_logs` VALUES ('202','Monitor','6','Computer','15','glpi','2012-05-14 10:19:20','0','','PC0003 (3)');
INSERT INTO `glpi_logs` VALUES ('203','Computer','3','Monitor','15','glpi','2012-05-14 10:19:30','0','','MON0007 (7)');
INSERT INTO `glpi_logs` VALUES ('204','Monitor','7','Computer','15','glpi','2012-05-14 10:19:30','0','','PC0003 (3)');
INSERT INTO `glpi_logs` VALUES ('205','Computer','2','DeviceGraphicCard','1','glpi','2012-05-14 10:21:04','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('206','Computer','3','NetworkPort','17','glpi','2012-05-14 10:21:46','0','','Сетевой порт : ID 3 (3)');
INSERT INTO `glpi_logs` VALUES ('207','NetworkPort','3','0','20','glpi','2012-05-14 10:21:46','0','','');
INSERT INTO `glpi_logs` VALUES ('208','Computer','4','0','20','glpi','2012-05-15 02:44:02','0','','');
INSERT INTO `glpi_logs` VALUES ('209','Computer','4','DeviceMotherboard','1','glpi','2012-05-15 02:46:55','0','','S775_P5G41TD-M Pro');
INSERT INTO `glpi_logs` VALUES ('210','Computer','4','DeviceMemory','1','glpi','2012-05-15 02:47:20','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('211','Computer','4','DeviceMemory','1','glpi','2012-05-15 02:47:34','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('212','Computer','4','DeviceGraphicCard','1','glpi','2012-05-15 02:48:11','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('213','Computer','4','DeviceHardDrive','1','glpi','2012-05-15 02:52:10','0','','HD502HJ ');
INSERT INTO `glpi_logs` VALUES ('214','Computer','4','DeviceProcessor','1','glpi','2012-05-15 02:52:37','0','','Core 2 Quad Q8300');
INSERT INTO `glpi_logs` VALUES ('215','Computer','4','NetworkPort','17','glpi','2012-05-15 02:53:11','0','','Сетевой порт : ID 4 (4)');
INSERT INTO `glpi_logs` VALUES ('216','NetworkPort','4','0','20','glpi','2012-05-15 02:53:11','0','','');
INSERT INTO `glpi_logs` VALUES ('217','Computer','4','Monitor','15','glpi','2012-05-15 02:55:47','0','','MON0008 (8)');
INSERT INTO `glpi_logs` VALUES ('218','Monitor','8','Computer','15','glpi','2012-05-15 02:55:47','0','','PC0004 (4)');
INSERT INTO `glpi_logs` VALUES ('219','Computer','4','Monitor','15','glpi','2012-05-15 02:55:58','0','','MON0009 (9)');
INSERT INTO `glpi_logs` VALUES ('220','Monitor','9','Computer','15','glpi','2012-05-15 02:55:58','0','','PC0004 (4)');
INSERT INTO `glpi_logs` VALUES ('221','Peripheral','1','0','20','glpi','2012-05-15 02:58:38','0','','');
INSERT INTO `glpi_logs` VALUES ('222','Computer','3','Peripheral','15','glpi','2012-05-15 02:59:08','0','','MAC MINI (1)');
INSERT INTO `glpi_logs` VALUES ('223','Peripheral','1','Computer','15','glpi','2012-05-15 02:59:08','0','','PC0003 (3)');
INSERT INTO `glpi_logs` VALUES ('224','User','9','','0','Vilkhivskiy Dmitry','2012-05-15 03:00:53','17','ru_RU','NULL');
INSERT INTO `glpi_logs` VALUES ('225','User','68','Profile_User','17','glpi','2012-05-15 03:14:43','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('226','User','68','0','20','glpi','2012-05-15 03:14:43','0','','');
INSERT INTO `glpi_logs` VALUES ('227','Monitor','10','0','20','glpi','2012-05-15 03:17:51','0','','');
INSERT INTO `glpi_logs` VALUES ('228','Monitor','11','0','20','glpi','2012-05-15 03:18:28','0','','');
INSERT INTO `glpi_logs` VALUES ('229','Monitor','10','','0','glpi','2012-05-15 03:19:01','5','','DL1A1146451941');
INSERT INTO `glpi_logs` VALUES ('230','Monitor','11','','0','glpi','2012-05-15 03:19:32','5','','HA19H9NP162119A');
INSERT INTO `glpi_logs` VALUES ('231','Monitor','12','0','20','glpi','2012-05-15 03:20:40','0','','');
INSERT INTO `glpi_logs` VALUES ('232','Monitor','13','0','20','glpi','2012-05-15 03:22:31','0','','');
INSERT INTO `glpi_logs` VALUES ('233','User','69','Profile_User','17','glpi','2012-05-15 03:24:28','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('234','User','69','0','20','glpi','2012-05-15 03:24:28','0','','');
INSERT INTO `glpi_logs` VALUES ('235','Monitor','14','0','20','glpi','2012-05-15 03:25:54','0','','');
INSERT INTO `glpi_logs` VALUES ('236','Monitor','15','0','20','glpi','2012-05-15 03:26:54','0','','');
INSERT INTO `glpi_logs` VALUES ('237','User','70','Profile_User','17','glpi','2012-05-15 03:28:20','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('238','User','70','0','20','glpi','2012-05-15 03:28:20','0','','');
INSERT INTO `glpi_logs` VALUES ('239','Monitor','16','0','20','glpi','2012-05-15 03:30:34','0','','');
INSERT INTO `glpi_logs` VALUES ('240','Monitor','17','0','20','glpi','2012-05-15 03:31:49','0','','');
INSERT INTO `glpi_logs` VALUES ('241','Computer','3','','0','glpi','2012-05-15 03:40:37','44','GRDK7-QVGRW-FC7PD-4WPD3-MF9BV','');
INSERT INTO `glpi_logs` VALUES ('242','Computer','5','0','20','glpi','2012-05-15 03:40:46','0','','');
INSERT INTO `glpi_logs` VALUES ('243','Computer','5','DeviceMotherboard','1','glpi','2012-05-15 03:42:59','0','','S1155_GA-H61MA-D3V ');
INSERT INTO `glpi_logs` VALUES ('244','Computer','5','DeviceProcessor','1','glpi','2012-05-15 03:44:05','0','','i5-2310');
INSERT INTO `glpi_logs` VALUES ('245','Computer','5','DeviceMemory','1','glpi','2012-05-15 03:45:19','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('246','Computer','5','DeviceMemory','1','glpi','2012-05-15 03:45:26','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('247','Computer','5','DeviceGraphicCard','1','glpi','2012-05-15 03:45:44','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('248','Computer','5','DeviceHardDrive','1','glpi','2012-05-15 03:47:30','0','','SVP200S3120G');
INSERT INTO `glpi_logs` VALUES ('249','Computer','5','NetworkPort','17','glpi','2012-05-15 03:49:37','0','','Сетевой порт : ID 5 (5)');
INSERT INTO `glpi_logs` VALUES ('251','Computer','5','NetworkPort','19','glpi','2012-05-15 03:50:08','0','N/A (5)','');
INSERT INTO `glpi_logs` VALUES ('252','Computer','5','NetworkPort','17','glpi','2012-05-15 03:50:24','0','','Сетевой порт : ID 6 (6)');
INSERT INTO `glpi_logs` VALUES ('253','NetworkPort','6','0','20','glpi','2012-05-15 03:50:24','0','','');
INSERT INTO `glpi_logs` VALUES ('254','Computer','5','Monitor','15','glpi','2012-05-15 03:51:12','0','','MON0010 (10)');
INSERT INTO `glpi_logs` VALUES ('255','Monitor','10','Computer','15','glpi','2012-05-15 03:51:12','0','','PC0005 (5)');
INSERT INTO `glpi_logs` VALUES ('256','Computer','5','Monitor','15','glpi','2012-05-15 03:51:20','0','','MON0011 (11)');
INSERT INTO `glpi_logs` VALUES ('257','Monitor','11','Computer','15','glpi','2012-05-15 03:51:20','0','','PC0005 (5)');
INSERT INTO `glpi_logs` VALUES ('258','Computer','6','0','20','glpi','2012-05-15 03:53:52','0','','');
INSERT INTO `glpi_logs` VALUES ('259','Computer','6','DeviceMotherboard','1','glpi','2012-05-15 04:04:40','0','','S1155_GA-H61M-D2-B3');
INSERT INTO `glpi_logs` VALUES ('260','User','8','','0','Yenin Dmitriy','2012-05-15 04:25:54','11','','0667869910');
INSERT INTO `glpi_logs` VALUES ('261','User','8','UserEmail','17','Yenin Dmitriy','2012-05-15 04:25:54','0','','admin@flexaspect.com');
INSERT INTO `glpi_logs` VALUES ('262','Computer','6','DeviceProcessor','1','glpi','2012-05-15 04:47:27','0','','i5-2500');
INSERT INTO `glpi_logs` VALUES ('263','Computer','6','DeviceMemory','1','glpi','2012-05-15 04:47:47','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('264','Computer','6','DeviceMemory','1','glpi','2012-05-15 04:47:52','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('265','Computer','6','DeviceGraphicCard','1','glpi','2012-05-15 04:48:07','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('266','Computer','6','DeviceHardDrive','1','glpi','2012-05-15 04:50:12','0','','SVP100ES2128G');
INSERT INTO `glpi_logs` VALUES ('267','Computer','6','NetworkPort','17','glpi','2012-05-15 04:51:26','0','','Сетевой порт : ID 7 (7)');
INSERT INTO `glpi_logs` VALUES ('268','NetworkPort','7','0','20','glpi','2012-05-15 04:51:26','0','','');
INSERT INTO `glpi_logs` VALUES ('269','Computer','6','Monitor','15','glpi','2012-05-15 04:52:07','0','','MON0012 (12)');
INSERT INTO `glpi_logs` VALUES ('270','Monitor','12','Computer','15','glpi','2012-05-15 04:52:07','0','','PC0006 (6)');
INSERT INTO `glpi_logs` VALUES ('271','Monitor','12','','0','glpi','2012-05-15 04:52:25','5','MY19HMDQ500479W','MY19HMDQ500479N');
INSERT INTO `glpi_logs` VALUES ('272','Computer','6','Monitor','15','glpi','2012-05-15 04:52:44','0','','MON0013 (13)');
INSERT INTO `glpi_logs` VALUES ('273','Monitor','13','Computer','15','glpi','2012-05-15 04:52:44','0','','PC0006 (6)');
INSERT INTO `glpi_logs` VALUES ('274','Computer','7','0','20','glpi','2012-05-15 04:55:10','0','','');
INSERT INTO `glpi_logs` VALUES ('275','Computer','7','','0','glpi','2012-05-15 04:56:05','46','&nbsp;','7_HOME_PREMIUM');
INSERT INTO `glpi_logs` VALUES ('276','Computer','7','','0','glpi','2012-05-15 04:56:05','44','','PQ6QV-GDRG6-3RHXV-PPG93-679GR');
INSERT INTO `glpi_logs` VALUES ('277','Computer','7','DeviceProcessor','1','glpi','2012-05-15 04:56:30','0','','i5-2300');
INSERT INTO `glpi_logs` VALUES ('278','Computer','7','DeviceMotherboard','1','glpi','2012-05-15 04:56:49','0','','S1155_GA-H61M-D2-B3');
INSERT INTO `glpi_logs` VALUES ('279','Computer','7','DeviceMemory','1','glpi','2012-05-15 04:57:09','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('280','Computer','7','DeviceMemory','1','glpi','2012-05-15 04:57:14','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('281','Computer','7','DeviceHardDrive','1','glpi','2012-05-15 04:57:43','0','','HD502HJ ');
INSERT INTO `glpi_logs` VALUES ('282','Computer','7','DeviceGraphicCard','1','glpi','2012-05-15 04:58:01','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('283','Computer','7','NetworkPort','17','glpi','2012-05-15 04:58:28','0','','Сетевой порт : ID 8 (8)');
INSERT INTO `glpi_logs` VALUES ('284','NetworkPort','8','0','20','glpi','2012-05-15 04:58:28','0','','');
INSERT INTO `glpi_logs` VALUES ('285','Computer','7','Monitor','15','glpi','2012-05-15 04:59:30','0','','MON0016 (16)');
INSERT INTO `glpi_logs` VALUES ('286','Monitor','16','Computer','15','glpi','2012-05-15 04:59:30','0','','PC0007 (7)');
INSERT INTO `glpi_logs` VALUES ('287','Computer','7','Monitor','15','glpi','2012-05-15 04:59:57','0','','MON0017 (17)');
INSERT INTO `glpi_logs` VALUES ('288','Monitor','17','Computer','15','glpi','2012-05-15 04:59:57','0','','PC0007 (7)');
INSERT INTO `glpi_logs` VALUES ('289','Computer','8','0','20','glpi','2012-05-15 05:01:50','0','','');
INSERT INTO `glpi_logs` VALUES ('290','Computer','8','DeviceProcessor','1','glpi','2012-05-15 05:02:49','0','','Core 2 Duo E8400');
INSERT INTO `glpi_logs` VALUES ('291','Computer','8','DeviceMotherboard','1','glpi','2012-05-15 05:03:38','0','','S775_P5Q SE');
INSERT INTO `glpi_logs` VALUES ('292','Computer','8','DeviceMemory','1','glpi','2012-05-15 05:06:15','0','','1GB_DDR2_SAMSUNG');
INSERT INTO `glpi_logs` VALUES ('293','Computer','8','DeviceMemory','1','glpi','2012-05-15 05:06:22','0','','1GB_DDR2_SAMSUNG');
INSERT INTO `glpi_logs` VALUES ('294','Computer','8','DeviceMemory','1','glpi','2012-05-15 05:06:22','0','','1GB_DDR2_SAMSUNG');
INSERT INTO `glpi_logs` VALUES ('295','Computer','8','DeviceMemory','1','glpi','2012-05-15 05:06:22','0','','1GB_DDR2_SAMSUNG');
INSERT INTO `glpi_logs` VALUES ('296','Computer','8','DeviceGraphicCard','1','glpi','2012-05-15 05:07:18','0','','EAH4350');
INSERT INTO `glpi_logs` VALUES ('297','Computer','8','DeviceGraphicCard','3','glpi','2012-05-15 05:07:45','0','EAH4350','');
INSERT INTO `glpi_logs` VALUES ('298','Computer','8','DeviceGraphicCard','1','glpi','2012-05-15 05:07:57','0','','HD4350');
INSERT INTO `glpi_logs` VALUES ('299','Computer','8','DeviceHardDrive','1','glpi','2012-05-15 05:09:27','0','','HD322HJ');
INSERT INTO `glpi_logs` VALUES ('300','Computer','8','NetworkPort','17','glpi','2012-05-15 05:09:59','0','','Сетевой порт : ID 9 (9)');
INSERT INTO `glpi_logs` VALUES ('301','NetworkPort','9','0','20','glpi','2012-05-15 05:09:59','0','','');
INSERT INTO `glpi_logs` VALUES ('302','Computer','8','Monitor','15','glpi','2012-05-15 05:10:20','0','','MON0014 (14)');
INSERT INTO `glpi_logs` VALUES ('303','Monitor','14','Computer','15','glpi','2012-05-15 05:10:20','0','','PC0008 (8)');
INSERT INTO `glpi_logs` VALUES ('304','Computer','8','Monitor','15','glpi','2012-05-15 05:10:27','0','','MON0015 (15)');
INSERT INTO `glpi_logs` VALUES ('305','Monitor','15','Computer','15','glpi','2012-05-15 05:10:27','0','','PC0008 (8)');
INSERT INTO `glpi_logs` VALUES ('306','Monitor','18','0','20','glpi','2012-05-15 05:26:45','0','','');
INSERT INTO `glpi_logs` VALUES ('307','Monitor','19','0','20','glpi','2012-05-15 05:27:46','0','','');
INSERT INTO `glpi_logs` VALUES ('308','Monitor','19','','0','glpi','2012-05-15 05:28:43','1','MAN0019','MON0019');
INSERT INTO `glpi_logs` VALUES ('309','Monitor','18','','0','glpi','2012-05-15 05:28:53','1','MAN0018','MON0018');
INSERT INTO `glpi_logs` VALUES ('310','Monitor','20','0','20','glpi','2012-05-15 05:30:53','0','','');
INSERT INTO `glpi_logs` VALUES ('311','Monitor','21','0','20','glpi','2012-05-15 05:32:49','0','','');
INSERT INTO `glpi_logs` VALUES ('312','Monitor','22','0','20','glpi','2012-05-15 05:33:57','0','','');
INSERT INTO `glpi_logs` VALUES ('313','Monitor','23','0','20','glpi','2012-05-15 05:35:05','0','','');
INSERT INTO `glpi_logs` VALUES ('314','Monitor','24','0','20','glpi','2012-05-15 05:36:19','0','','');
INSERT INTO `glpi_logs` VALUES ('315','Monitor','17','','0','glpi','2012-05-15 05:37:06','40','&nbsp;','710N');
INSERT INTO `glpi_logs` VALUES ('316','Computer','9','0','20','glpi','2012-05-15 05:42:58','0','','');
INSERT INTO `glpi_logs` VALUES ('317','Computer','9','DeviceMemory','1','glpi','2012-05-15 05:44:21','0','','4GB_DDR3_SAMSUNG');
INSERT INTO `glpi_logs` VALUES ('318','Computer','9','DeviceProcessor','1','glpi','2012-05-15 05:45:43','0','','i5-2300');
INSERT INTO `glpi_logs` VALUES ('319','Computer','9','DeviceMotherboard','1','glpi','2012-05-15 05:46:11','0','','S1155_GA-H61MA-D3V ');
INSERT INTO `glpi_logs` VALUES ('320','Computer','9','DeviceGraphicCard','1','glpi','2012-05-15 05:46:22','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('321','Computer','9','DeviceHardDrive','1','glpi','2012-05-15 05:47:07','0','','SH100S3120G ');
INSERT INTO `glpi_logs` VALUES ('322','Computer','9','Monitor','15','glpi','2012-05-15 05:47:47','0','','MON0018 (18)');
INSERT INTO `glpi_logs` VALUES ('323','Monitor','18','Computer','15','glpi','2012-05-15 05:47:47','0','','PC0009 (9)');
INSERT INTO `glpi_logs` VALUES ('324','Computer','9','Monitor','15','glpi','2012-05-15 05:48:17','0','','MON0019 (19)');
INSERT INTO `glpi_logs` VALUES ('325','Monitor','19','Computer','15','glpi','2012-05-15 05:48:17','0','','PC0009 (9)');
INSERT INTO `glpi_logs` VALUES ('326','Computer','9','NetworkPort','17','glpi','2012-05-15 05:48:42','0','','Сетевой порт : ID 10 (10)');
INSERT INTO `glpi_logs` VALUES ('327','NetworkPort','10','0','20','glpi','2012-05-15 05:48:42','0','','');
INSERT INTO `glpi_logs` VALUES ('328','Computer','10','0','20','glpi','2012-05-15 05:55:31','0','','');
INSERT INTO `glpi_logs` VALUES ('329','Computer','10','DeviceMotherboard','1','glpi','2012-05-15 05:56:10','0','','S1155_GA-H61M-D2H-USB3');
INSERT INTO `glpi_logs` VALUES ('330','Computer','10','DeviceProcessor','1','glpi','2012-05-15 05:58:31','0','','i5-2320');
INSERT INTO `glpi_logs` VALUES ('331','Computer','10','DeviceMemory','1','glpi','2012-05-15 06:04:20','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('332','Computer','10','DeviceMemory','1','glpi','2012-05-15 06:04:31','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('333','Computer','10','DeviceGraphicCard','1','glpi','2012-05-15 06:04:41','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('334','Computer','10','DeviceHardDrive','1','glpi','2012-05-15 06:06:44','0','','SNVP325S2128GB');
INSERT INTO `glpi_logs` VALUES ('335','Computer','10','Monitor','15','glpi','2012-05-15 06:07:43','0','','MON0020 (20)');
INSERT INTO `glpi_logs` VALUES ('336','Monitor','20','Computer','15','glpi','2012-05-15 06:07:43','0','','PC0010 (10)');
INSERT INTO `glpi_logs` VALUES ('337','Monitor','20','','0','glpi','2012-05-15 06:08:01','5','MB19HVNQ9014MK','MB19HVNQ901485K');
INSERT INTO `glpi_logs` VALUES ('338','Computer','10','Monitor','15','glpi','2012-05-15 06:08:23','0','','MON0021 (21)');
INSERT INTO `glpi_logs` VALUES ('339','Monitor','21','Computer','15','glpi','2012-05-15 06:08:23','0','','PC0010 (10)');
INSERT INTO `glpi_logs` VALUES ('340','Computer','10','NetworkPort','17','glpi','2012-05-15 06:09:23','0','','Сетевой порт : ID 11 (11)');
INSERT INTO `glpi_logs` VALUES ('341','NetworkPort','11','0','20','glpi','2012-05-15 06:09:23','0','','');
INSERT INTO `glpi_logs` VALUES ('342','Computer','11','0','20','glpi','2012-05-15 06:11:24','0','','');
INSERT INTO `glpi_logs` VALUES ('343','Computer','11','DeviceProcessor','1','glpi','2012-05-15 06:11:50','0','','Core 2 Quad Q8300');
INSERT INTO `glpi_logs` VALUES ('344','Computer','11','DeviceMotherboard','1','glpi','2012-05-15 06:13:25','0','','S775_P5G41T-M LE');
INSERT INTO `glpi_logs` VALUES ('345','Computer','11','DeviceMemory','1','glpi','2012-05-15 06:13:57','0','','4GB_DDR3_SAMSUNG');
INSERT INTO `glpi_logs` VALUES ('346','Computer','11','DeviceMemory','1','glpi','2012-05-15 06:14:01','0','','4GB_DDR3_SAMSUNG');
INSERT INTO `glpi_logs` VALUES ('347','Computer','11','DeviceGraphicCard','1','glpi','2012-05-15 06:14:20','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('348','Computer','11','DeviceHardDrive','1','glpi','2012-05-15 06:16:42','0','','ST3320418AS');
INSERT INTO `glpi_logs` VALUES ('349','Computer','11','NetworkPort','17','glpi','2012-05-15 06:17:18','0','','Сетевой порт : ID 12 (12)');
INSERT INTO `glpi_logs` VALUES ('350','NetworkPort','12','0','20','glpi','2012-05-15 06:17:18','0','','');
INSERT INTO `glpi_logs` VALUES ('351','Computer','11','Monitor','15','glpi','2012-05-15 06:18:36','0','','MON0022 (22)');
INSERT INTO `glpi_logs` VALUES ('352','Monitor','22','Computer','15','glpi','2012-05-15 06:18:36','0','','PC0011 (11)');
INSERT INTO `glpi_logs` VALUES ('353','Computer','12','0','20','glpi','2012-05-15 06:23:40','0','','');
INSERT INTO `glpi_logs` VALUES ('354','Computer','12','DeviceMotherboard','1','glpi','2012-05-15 06:24:49','0','','S775_P5G41T-M LX2/GB');
INSERT INTO `glpi_logs` VALUES ('355','Computer','12','DeviceProcessor','1','glpi','2012-05-15 06:25:34','0','','Core 2 Duo E7500');
INSERT INTO `glpi_logs` VALUES ('356','Computer','12','DeviceMemory','1','glpi','2012-05-15 06:25:48','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('357','Computer','12','DeviceMemory','1','glpi','2012-05-15 06:26:01','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('358','Computer','12','DeviceGraphicCard','1','glpi','2012-05-15 06:26:21','0','','HD4350');
INSERT INTO `glpi_logs` VALUES ('359','Computer','12','DeviceHardDrive','1','glpi','2012-05-15 06:28:34','0','','WD5000AADS-00S9B0');
INSERT INTO `glpi_logs` VALUES ('360','Computer','12','NetworkPort','17','glpi','2012-05-15 06:28:56','0','','Сетевой порт : ID 13 (13)');
INSERT INTO `glpi_logs` VALUES ('361','NetworkPort','13','0','20','glpi','2012-05-15 06:28:56','0','','');
INSERT INTO `glpi_logs` VALUES ('362','Computer','12','Monitor','15','glpi','2012-05-15 06:29:25','0','','MON0023 (23)');
INSERT INTO `glpi_logs` VALUES ('363','Monitor','23','Computer','15','glpi','2012-05-15 06:29:25','0','','PC0012 (12)');
INSERT INTO `glpi_logs` VALUES ('364','Computer','12','Monitor','15','glpi','2012-05-15 06:29:30','0','','MON0024 (24)');
INSERT INTO `glpi_logs` VALUES ('365','Monitor','24','Computer','15','glpi','2012-05-15 06:29:30','0','','PC0012 (12)');
INSERT INTO `glpi_logs` VALUES ('366','Monitor','1','','0','glpi','2012-05-15 06:57:23','49','BOSSdev','Ukad');
INSERT INTO `glpi_logs` VALUES ('367','Monitor','1','','0','glpi','2012-05-15 06:57:23','71','BOSSdev','Ukad');
INSERT INTO `glpi_logs` VALUES ('368','Computer','1','','0','glpi','2012-05-15 06:57:31','49','BOSSdev','Ukad');
INSERT INTO `glpi_logs` VALUES ('369','Computer','1','','0','glpi','2012-05-15 06:57:31','71','BOSSdev','Ukad');
INSERT INTO `glpi_logs` VALUES ('370','Monitor','2','','0','glpi','2012-05-15 06:57:31','71','BOSSdev','Ukad');
INSERT INTO `glpi_logs` VALUES ('371','Monitor','2','','0','glpi','2012-05-15 06:57:50','49','BOSSdev','Ukad');
INSERT INTO `glpi_logs` VALUES ('372','Monitor','25','0','20','glpi','2012-05-15 07:01:21','0','','');
INSERT INTO `glpi_logs` VALUES ('373','Monitor','26','0','20','glpi','2012-05-15 07:03:17','0','','');
INSERT INTO `glpi_logs` VALUES ('374','Monitor','27','0','20','glpi','2012-05-15 07:04:52','0','','');
INSERT INTO `glpi_logs` VALUES ('375','Monitor','27','','0','glpi','2012-05-15 07:07:42','23','SAMSUNG','LG');
INSERT INTO `glpi_logs` VALUES ('376','Monitor','28','0','20','glpi','2012-05-15 07:08:57','0','','');
INSERT INTO `glpi_logs` VALUES ('377','Monitor','29','0','20','glpi','2012-05-15 07:10:36','0','','');
INSERT INTO `glpi_logs` VALUES ('378','Monitor','30','0','20','glpi','2012-05-15 07:12:24','0','','');
INSERT INTO `glpi_logs` VALUES ('379','Monitor','31','0','20','glpi','2012-05-15 07:13:23','0','','');
INSERT INTO `glpi_logs` VALUES ('380','Monitor','32','0','20','glpi','2012-05-15 07:14:37','0','','');
INSERT INTO `glpi_logs` VALUES ('381','Computer','13','0','20','glpi','2012-05-15 07:49:57','0','','');
INSERT INTO `glpi_logs` VALUES ('382','Computer','13','DeviceProcessor','1','glpi','2012-05-15 07:51:45','0','','Core 2 Duo E4300');
INSERT INTO `glpi_logs` VALUES ('383','Computer','13','DeviceMotherboard','1','glpi','2012-05-15 07:53:33','0','','S775_P5GZ-MX');
INSERT INTO `glpi_logs` VALUES ('384','Computer','13','DeviceMemory','1','glpi','2012-05-15 07:53:55','0','','2GB_DDR2_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('385','Computer','13','DeviceMemory','1','glpi','2012-05-15 07:54:02','0','','2GB_DDR2_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('386','Computer','13','DeviceGraphicCard','1','glpi','2012-05-15 07:54:20','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('387','Computer','13','DeviceHardDrive','1','glpi','2012-05-15 07:56:00','0','','HD080HJ');
INSERT INTO `glpi_logs` VALUES ('388','Computer','13','Monitor','15','glpi','2012-05-15 07:56:29','0','','MON0025 (25)');
INSERT INTO `glpi_logs` VALUES ('389','Monitor','25','Computer','15','glpi','2012-05-15 07:56:29','0','','PC0013 (13)');
INSERT INTO `glpi_logs` VALUES ('390','Computer','13','NetworkPort','17','glpi','2012-05-15 07:57:35','0','','Сетевой порт : ID 14 (14)');
INSERT INTO `glpi_logs` VALUES ('391','NetworkPort','14','0','20','glpi','2012-05-15 07:57:35','0','','');
INSERT INTO `glpi_logs` VALUES ('392','Computer','14','0','20','glpi','2012-05-15 08:07:31','0','','');
INSERT INTO `glpi_logs` VALUES ('393','Computer','14','DeviceMotherboard','1','glpi','2012-05-15 08:07:52','0','','S775_P5G-MX');
INSERT INTO `glpi_logs` VALUES ('394','Computer','14','DeviceMemory','1','glpi','2012-05-15 08:08:02','0','','2GB_DDR2_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('395','Computer','14','DeviceMemory','1','glpi','2012-05-15 08:08:07','0','','2GB_DDR2_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('396','Computer','14','DeviceProcessor','1','glpi','2012-05-15 08:08:21','0','','Pentium E2200');
INSERT INTO `glpi_logs` VALUES ('397','Computer','14','DeviceGraphicCard','1','glpi','2012-05-15 08:08:37','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('398','Computer','14','DeviceHardDrive','1','glpi','2012-05-15 08:10:08','0','','WD1600AAJS-00B4A0');
INSERT INTO `glpi_logs` VALUES ('399','Computer','14','Monitor','15','glpi','2012-05-15 08:10:36','0','','MON0026 (26)');
INSERT INTO `glpi_logs` VALUES ('400','Monitor','26','Computer','15','glpi','2012-05-15 08:10:36','0','','PC0014 (14)');
INSERT INTO `glpi_logs` VALUES ('401','Computer','14','NetworkPort','17','glpi','2012-05-15 08:10:55','0','','Сетевой порт : ID 15 (15)');
INSERT INTO `glpi_logs` VALUES ('402','NetworkPort','15','0','20','glpi','2012-05-15 08:10:55','0','','');
INSERT INTO `glpi_logs` VALUES ('403','Computer','15','0','20','glpi','2012-05-15 08:25:10','0','','');
INSERT INTO `glpi_logs` VALUES ('404','Computer','15','DeviceProcessor','1','glpi','2012-05-15 08:25:37','0','','i5-2300');
INSERT INTO `glpi_logs` VALUES ('405','Computer','15','DeviceMemory','1','glpi','2012-05-15 08:25:59','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('406','Computer','15','DeviceMemory','1','glpi','2012-05-15 08:26:08','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('407','Computer','15','DeviceGraphicCard','1','glpi','2012-05-15 08:26:50','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('408','Computer','15','DeviceMotherboard','1','glpi','2012-05-15 08:27:06','0','','S1155_GA-H61M-D2-B3');
INSERT INTO `glpi_logs` VALUES ('409','Computer','15','DeviceHardDrive','1','glpi','2012-05-15 08:32:05','0','','HD502HJ ');
INSERT INTO `glpi_logs` VALUES ('410','Computer','15','Monitor','15','glpi','2012-05-15 08:32:54','0','','MON0027 (27)');
INSERT INTO `glpi_logs` VALUES ('411','Monitor','27','Computer','15','glpi','2012-05-15 08:32:54','0','','PC0015 (15)');
INSERT INTO `glpi_logs` VALUES ('412','Computer','15','Monitor','15','glpi','2012-05-15 08:33:06','0','','MON0028 (28)');
INSERT INTO `glpi_logs` VALUES ('413','Monitor','28','Computer','15','glpi','2012-05-15 08:33:06','0','','PC0015 (15)');
INSERT INTO `glpi_logs` VALUES ('414','Computer','15','NetworkPort','17','glpi','2012-05-15 08:33:26','0','','Сетевой порт : ID 16 (16)');
INSERT INTO `glpi_logs` VALUES ('415','NetworkPort','16','0','20','glpi','2012-05-15 08:33:26','0','','');
INSERT INTO `glpi_logs` VALUES ('416','Computer','16','0','20','glpi','2012-05-15 08:36:19','0','','');
INSERT INTO `glpi_logs` VALUES ('417','Computer','16','DeviceProcessor','1','glpi','2012-05-15 08:44:49','0','','Pentium E2200');
INSERT INTO `glpi_logs` VALUES ('418','Computer','16','DeviceMotherboard','1','glpi','2012-05-15 08:45:03','0','','S775_P5G-MX');
INSERT INTO `glpi_logs` VALUES ('419','Computer','16','DeviceMemory','1','glpi','2012-05-15 08:45:15','0','','2GB_DDR2_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('420','Computer','16','DeviceMemory','1','glpi','2012-05-15 08:45:20','0','','2GB_DDR2_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('421','Computer','16','DeviceGraphicCard','1','glpi','2012-05-15 08:45:32','0','','8400GS');
INSERT INTO `glpi_logs` VALUES ('422','Computer','16','DeviceHardDrive','1','glpi','2012-05-15 08:45:58','0','','HD161HJ');
INSERT INTO `glpi_logs` VALUES ('423','Computer','16','Monitor','15','glpi','2012-05-15 08:46:36','0','','MON0029 (29)');
INSERT INTO `glpi_logs` VALUES ('424','Monitor','29','Computer','15','glpi','2012-05-15 08:46:36','0','','PC0016 (16)');
INSERT INTO `glpi_logs` VALUES ('425','Computer','16','Monitor','15','glpi','2012-05-15 08:46:45','0','','MON0030 (30)');
INSERT INTO `glpi_logs` VALUES ('426','Monitor','30','Computer','15','glpi','2012-05-15 08:46:45','0','','PC0016 (16)');
INSERT INTO `glpi_logs` VALUES ('427','Computer','16','NetworkPort','17','glpi','2012-05-15 08:47:06','0','','Сетевой порт : ID 17 (17)');
INSERT INTO `glpi_logs` VALUES ('428','NetworkPort','17','0','20','glpi','2012-05-15 08:47:06','0','','');
INSERT INTO `glpi_logs` VALUES ('429','Computer','17','0','20','glpi','2012-05-15 08:50:06','0','','');
INSERT INTO `glpi_logs` VALUES ('430','Computer','17','DeviceProcessor','1','glpi','2012-05-15 08:50:47','0','','Core 2 Duo E7500');
INSERT INTO `glpi_logs` VALUES ('431','Computer','17','DeviceMotherboard','1','glpi','2012-05-15 08:51:15','0','','S775_P5G41T-M LX2/GB');
INSERT INTO `glpi_logs` VALUES ('432','Computer','17','DeviceGraphicCard','1','glpi','2012-05-15 08:51:43','0','','HD4350');
INSERT INTO `glpi_logs` VALUES ('433','Computer','17','DeviceMemory','1','glpi','2012-05-15 08:52:11','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('434','Computer','17','DeviceMemory','1','glpi','2012-05-15 08:52:18','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('435','Computer','17','DeviceHardDrive','1','glpi','2012-05-15 08:52:57','0','','HDT721016SLA380');
INSERT INTO `glpi_logs` VALUES ('436','Computer','17','Monitor','15','glpi','2012-05-15 08:53:25','0','','MON0031 (31)');
INSERT INTO `glpi_logs` VALUES ('437','Monitor','31','Computer','15','glpi','2012-05-15 08:53:25','0','','PC0017 (17)');
INSERT INTO `glpi_logs` VALUES ('438','Computer','17','Monitor','15','glpi','2012-05-15 08:53:39','0','','MON0032 (32)');
INSERT INTO `glpi_logs` VALUES ('439','Monitor','32','Computer','15','glpi','2012-05-15 08:53:39','0','','PC0017 (17)');
INSERT INTO `glpi_logs` VALUES ('440','Computer','17','NetworkPort','17','glpi','2012-05-15 08:53:57','0','','Сетевой порт : ID 18 (18)');
INSERT INTO `glpi_logs` VALUES ('441','NetworkPort','18','0','20','glpi','2012-05-15 08:53:57','0','','');
INSERT INTO `glpi_logs` VALUES ('442','Computer','4','','0','glpi','2012-05-15 08:55:52','46','&nbsp;','7_HOME_PREMIUM');
INSERT INTO `glpi_logs` VALUES ('443','NetworkPort','4','','0','glpi','2012-05-15 08:56:34','4','','20-CF-30-0E-8D-16');
INSERT INTO `glpi_logs` VALUES ('444','Monitor','33','0','20','glpi','2012-05-15 09:32:47','0','','');
INSERT INTO `glpi_logs` VALUES ('445','Monitor','34','0','20','glpi','2012-05-15 09:34:54','0','','');
INSERT INTO `glpi_logs` VALUES ('446','Monitor','35','0','20','glpi','2012-05-15 09:36:40','0','','');
INSERT INTO `glpi_logs` VALUES ('447','Monitor','35','','0','glpi','2012-05-15 09:37:10','1','MON0035','MON0036');
INSERT INTO `glpi_logs` VALUES ('448','Monitor','36','0','20','glpi','2012-05-15 09:38:22','0','','');
INSERT INTO `glpi_logs` VALUES ('449','Monitor','37','0','20','glpi','2012-05-15 09:41:45','0','','');
INSERT INTO `glpi_logs` VALUES ('450','Monitor','38','0','20','glpi','2012-05-15 09:43:35','0','','');
INSERT INTO `glpi_logs` VALUES ('451','Monitor','39','0','20','glpi','2012-05-15 09:45:02','0','','');
INSERT INTO `glpi_logs` VALUES ('452','Monitor','40','0','20','glpi','2012-05-15 09:46:17','0','','');
INSERT INTO `glpi_logs` VALUES ('453','Monitor','41','0','20','glpi','2012-05-15 09:48:51','0','','');
INSERT INTO `glpi_logs` VALUES ('454','Computer','18','0','20','glpi','2012-05-16 02:57:19','0','','');
INSERT INTO `glpi_logs` VALUES ('455','Computer','18','DeviceProcessor','1','glpi','2012-05-16 02:57:40','0','','i5-2500');
INSERT INTO `glpi_logs` VALUES ('456','Computer','18','DeviceMotherboard','1','glpi','2012-05-16 02:58:40','0','','S1155_GA-Z68M-D2H');
INSERT INTO `glpi_logs` VALUES ('457','Computer','18','DeviceMemory','1','glpi','2012-05-16 02:58:52','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('458','Computer','18','DeviceMemory','1','glpi','2012-05-16 02:58:57','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('459','Computer','18','DeviceGraphicCard','1','glpi','2012-05-16 02:59:59','0','','HD4300');
INSERT INTO `glpi_logs` VALUES ('460','Computer','18','DeviceHardDrive','1','glpi','2012-05-16 03:00:26','0','','SVP100ES2128G');
INSERT INTO `glpi_logs` VALUES ('461','Computer','18','Monitor','15','glpi','2012-05-16 03:00:37','0','','MON0033 (33)');
INSERT INTO `glpi_logs` VALUES ('462','Monitor','33','Computer','15','glpi','2012-05-16 03:00:37','0','','PC0018 (18)');
INSERT INTO `glpi_logs` VALUES ('463','Computer','18','Monitor','15','glpi','2012-05-16 03:00:48','0','','MON0034 (34)');
INSERT INTO `glpi_logs` VALUES ('464','Monitor','34','Computer','15','glpi','2012-05-16 03:00:48','0','','PC0018 (18)');
INSERT INTO `glpi_logs` VALUES ('465','Computer','18','NetworkPort','17','glpi','2012-05-16 03:01:08','0','','Сетевой порт : ID 19 (19)');
INSERT INTO `glpi_logs` VALUES ('466','NetworkPort','19','0','20','glpi','2012-05-16 03:01:08','0','','');
INSERT INTO `glpi_logs` VALUES ('467','Computer','19','0','20','glpi','2012-05-16 03:02:40','0','','');
INSERT INTO `glpi_logs` VALUES ('468','Computer','19','DeviceProcessor','1','glpi','2012-05-16 03:02:59','0','','Core 2 Duo E8400');
INSERT INTO `glpi_logs` VALUES ('469','Computer','19','DeviceMotherboard','1','glpi','2012-05-16 03:03:41','0','','S775_Topsfield DP43TF');
INSERT INTO `glpi_logs` VALUES ('470','Computer','19','DeviceMemory','1','glpi','2012-05-16 03:04:56','0','','2GB_DDR2_TRANSCEND');
INSERT INTO `glpi_logs` VALUES ('471','Computer','19','DeviceMemory','1','glpi','2012-05-16 03:05:01','0','','2GB_DDR2_TRANSCEND');
INSERT INTO `glpi_logs` VALUES ('472','Computer','19','DeviceGraphicCard','1','glpi','2012-05-16 03:06:12','0','','9400GT');
INSERT INTO `glpi_logs` VALUES ('473','Computer','19','DeviceHardDrive','1','glpi','2012-05-16 03:07:09','0','','HD252HJ');
INSERT INTO `glpi_logs` VALUES ('474','Computer','19','NetworkPort','17','glpi','2012-05-16 03:07:38','0','','Сетевой порт : ID 20 (20)');
INSERT INTO `glpi_logs` VALUES ('475','NetworkPort','20','0','20','glpi','2012-05-16 03:07:38','0','','');
INSERT INTO `glpi_logs` VALUES ('476','Computer','19','Monitor','15','glpi','2012-05-16 03:08:17','0','','MON0035 (36)');
INSERT INTO `glpi_logs` VALUES ('477','Monitor','36','Computer','15','glpi','2012-05-16 03:08:17','0','','PC0019 (19)');
INSERT INTO `glpi_logs` VALUES ('478','Computer','20','0','20','glpi','2012-05-16 03:09:24','0','','');
INSERT INTO `glpi_logs` VALUES ('479','Computer','20','DeviceProcessor','1','glpi','2012-05-16 03:09:44','0','','Core 2 Duo E4300');
INSERT INTO `glpi_logs` VALUES ('480','Computer','20','DeviceMotherboard','1','glpi','2012-05-16 03:09:55','0','','S775_P5GZ-MX');
INSERT INTO `glpi_logs` VALUES ('481','Computer','20','DeviceMemory','1','glpi','2012-05-16 03:11:07','0','','2GB_DDR2_HYNIX');
INSERT INTO `glpi_logs` VALUES ('482','Computer','20','DeviceMemory','1','glpi','2012-05-16 03:11:14','0','','2GB_DDR2_HYNIX');
INSERT INTO `glpi_logs` VALUES ('483','Computer','20','DeviceGraphicCard','1','glpi','2012-05-16 03:11:24','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('484','Computer','20','NetworkPort','17','glpi','2012-05-16 03:12:03','0','','Сетевой порт : ID 21 (21)');
INSERT INTO `glpi_logs` VALUES ('485','NetworkPort','21','0','20','glpi','2012-05-16 03:12:03','0','','');
INSERT INTO `glpi_logs` VALUES ('486','Computer','20','Monitor','15','glpi','2012-05-16 03:12:25','0','','MON0036 (35)');
INSERT INTO `glpi_logs` VALUES ('487','Monitor','35','Computer','15','glpi','2012-05-16 03:12:25','0','','PC0020 (20)');
INSERT INTO `glpi_logs` VALUES ('488','Computer','21','0','20','glpi','2012-05-16 03:14:00','0','','');
INSERT INTO `glpi_logs` VALUES ('489','Computer','21','DeviceProcessor','1','glpi','2012-05-16 03:16:02','0','','Core 2 Quad Q9300');
INSERT INTO `glpi_logs` VALUES ('490','Computer','21','DeviceMotherboard','1','glpi','2012-05-16 03:16:19','0','','S775_G41C-VS');
INSERT INTO `glpi_logs` VALUES ('491','Computer','21','DeviceGraphicCard','1','glpi','2012-05-16 03:16:27','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('492','Computer','21','DeviceMemory','1','glpi','2012-05-16 03:16:35','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('493','Computer','21','DeviceMemory','1','glpi','2012-05-16 03:17:03','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('494','Computer','21','DeviceGraphicCard','3','glpi','2012-05-16 03:17:13','0','Integrated','');
INSERT INTO `glpi_logs` VALUES ('495','Computer','21','DeviceGraphicCard','1','glpi','2012-05-16 03:17:25','0','','HD4300');
INSERT INTO `glpi_logs` VALUES ('496','Computer','21','DeviceHardDrive','1','glpi','2012-05-16 03:17:56','0','','WD5000AADS-00S9B0');
INSERT INTO `glpi_logs` VALUES ('497','Computer','21','NetworkPort','17','glpi','2012-05-16 03:18:26','0','','Сетевой порт : ID 22 (22)');
INSERT INTO `glpi_logs` VALUES ('498','NetworkPort','22','0','20','glpi','2012-05-16 03:18:26','0','','');
INSERT INTO `glpi_logs` VALUES ('499','Computer','22','0','20','glpi','2012-05-16 03:19:55','0','','');
INSERT INTO `glpi_logs` VALUES ('500','Computer','22','DeviceProcessor','1','glpi','2012-05-16 03:20:32','0','','i5-2310');
INSERT INTO `glpi_logs` VALUES ('501','Computer','22','DeviceMotherboard','1','glpi','2012-05-16 03:20:44','0','','S1155_GA-H61M-D2-B3');
INSERT INTO `glpi_logs` VALUES ('502','Computer','22','DeviceMemory','1','glpi','2012-05-16 03:21:04','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('503','Computer','22','DeviceMemory','1','glpi','2012-05-16 03:21:09','0','','4GB_DDR3_HYNIX');
INSERT INTO `glpi_logs` VALUES ('504','Computer','22','DeviceGraphicCard','1','glpi','2012-05-16 03:21:18','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('505','Computer','22','DeviceHardDrive','1','glpi','2012-05-16 03:21:53','0','','SVP100ES2128G');
INSERT INTO `glpi_logs` VALUES ('506','Computer','22','NetworkPort','17','glpi','2012-05-16 03:22:21','0','','Сетевой порт : ID 23 (23)');
INSERT INTO `glpi_logs` VALUES ('507','NetworkPort','23','0','20','glpi','2012-05-16 03:22:21','0','','');
INSERT INTO `glpi_logs` VALUES ('508','Computer','22','Monitor','15','glpi','2012-05-16 03:23:01','0','','MON0038 (39)');
INSERT INTO `glpi_logs` VALUES ('509','Monitor','39','Computer','15','glpi','2012-05-16 03:23:01','0','','PC0022 (22)');
INSERT INTO `glpi_logs` VALUES ('510','Computer','22','Monitor','15','glpi','2012-05-16 03:23:10','0','','MON0039 (40)');
INSERT INTO `glpi_logs` VALUES ('511','Monitor','40','Computer','15','glpi','2012-05-16 03:23:10','0','','PC0022 (22)');
INSERT INTO `glpi_logs` VALUES ('512','Computer','21','Monitor','15','glpi','2012-05-16 03:23:45','0','','MON0036 (37)');
INSERT INTO `glpi_logs` VALUES ('513','Monitor','37','Computer','15','glpi','2012-05-16 03:23:45','0','','PC0021 (21)');
INSERT INTO `glpi_logs` VALUES ('514','Computer','21','Monitor','15','glpi','2012-05-16 03:23:51','0','','MON0037 (38)');
INSERT INTO `glpi_logs` VALUES ('515','Monitor','38','Computer','15','glpi','2012-05-16 03:23:51','0','','PC0021 (21)');
INSERT INTO `glpi_logs` VALUES ('516','Computer','23','0','20','glpi','2012-05-16 03:24:51','0','','');
INSERT INTO `glpi_logs` VALUES ('517','Monitor','41','','0','glpi','2012-05-16 03:25:04','71','Ukad','&nbsp;');
INSERT INTO `glpi_logs` VALUES ('518','Computer','23','Monitor','15','glpi','2012-05-16 03:25:04','0','','MON0040 (41)');
INSERT INTO `glpi_logs` VALUES ('519','Monitor','41','Computer','15','glpi','2012-05-16 03:25:04','0','','PC0023 (23)');
INSERT INTO `glpi_logs` VALUES ('520','Peripheral','1','0','13','glpi','2012-05-16 03:26:27','0','','');
INSERT INTO `glpi_logs` VALUES ('521','Computer','24','0','20','glpi','2012-05-16 03:27:29','0','','');
INSERT INTO `glpi_logs` VALUES ('522','Computer','25','0','20','glpi','2012-05-16 03:28:47','0','','');
INSERT INTO `glpi_logs` VALUES ('523','Monitor','42','0','20','glpi','2012-05-16 03:30:28','0','','');
INSERT INTO `glpi_logs` VALUES ('524','Computer','25','Monitor','15','glpi','2012-05-16 03:30:40','0','','MON0041 (42)');
INSERT INTO `glpi_logs` VALUES ('525','Monitor','42','Computer','15','glpi','2012-05-16 03:30:40','0','','MACMINI0002 (25)');
INSERT INTO `glpi_logs` VALUES ('526','Computer','26','0','20','glpi','2012-05-16 03:32:56','0','','');
INSERT INTO `glpi_logs` VALUES ('527','Monitor','43','0','20','glpi','2012-05-16 03:34:52','0','','');
INSERT INTO `glpi_logs` VALUES ('528','Computer','26','DeviceProcessor','1','glpi','2012-05-16 03:37:30','0','','Sempron');
INSERT INTO `glpi_logs` VALUES ('529','Computer','26','DeviceMotherboard','1','glpi','2012-05-16 03:37:43','0','','S754_6100K8MB-RS(H)');
INSERT INTO `glpi_logs` VALUES ('530','Computer','26','DeviceMemory','1','glpi','2012-05-16 03:38:31','0','','1GB_DDR1_NONAME');
INSERT INTO `glpi_logs` VALUES ('531','Computer','26','DeviceMemory','1','glpi','2012-05-16 03:38:36','0','','1GB_DDR1_NONAME');
INSERT INTO `glpi_logs` VALUES ('532','Computer','26','DeviceHardDrive','1','glpi','2012-05-16 03:38:55','0','','HD080HJ');
INSERT INTO `glpi_logs` VALUES ('533','Computer','26','DeviceGraphicCard','1','glpi','2012-05-16 03:39:17','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('534','Computer','26','NetworkPort','17','glpi','2012-05-16 03:39:41','0','','Сетевой порт : ID 24 (24)');
INSERT INTO `glpi_logs` VALUES ('535','NetworkPort','24','0','20','glpi','2012-05-16 03:39:41','0','','');
INSERT INTO `glpi_logs` VALUES ('536','Computer','26','Monitor','15','glpi','2012-05-16 03:40:03','0','','MON0042 (43)');
INSERT INTO `glpi_logs` VALUES ('537','Monitor','43','Computer','15','glpi','2012-05-16 03:40:03','0','','PC0024 (26)');
INSERT INTO `glpi_logs` VALUES ('538','Monitor','44','0','20','glpi','2012-05-16 03:42:16','0','','');
INSERT INTO `glpi_logs` VALUES ('539','Computer','27','0','20','glpi','2012-05-16 03:43:28','0','','');
INSERT INTO `glpi_logs` VALUES ('540','Computer','27','DeviceProcessor','1','glpi','2012-05-16 03:43:47','0','','Sempron');
INSERT INTO `glpi_logs` VALUES ('541','Computer','27','Monitor','15','glpi','2012-05-16 03:45:19','0','','MON0043 (44)');
INSERT INTO `glpi_logs` VALUES ('542','Monitor','44','Computer','15','glpi','2012-05-16 03:45:19','0','','PC0025 (27)');
INSERT INTO `glpi_logs` VALUES ('543','Monitor','45','0','20','glpi','2012-05-16 03:46:35','0','','');
INSERT INTO `glpi_logs` VALUES ('544','Computer','28','0','20','glpi','2012-05-16 03:47:17','0','','');
INSERT INTO `glpi_logs` VALUES ('545','Computer','28','DeviceProcessor','1','glpi','2012-05-16 03:48:07','0','','i5-2300');
INSERT INTO `glpi_logs` VALUES ('546','Computer','28','DeviceMotherboard','1','glpi','2012-05-16 03:48:36','0','','S1155_GA-H61M-D2-B3');
INSERT INTO `glpi_logs` VALUES ('547','Computer','27','DeviceMotherboard','1','glpi','2012-05-16 03:50:17','0','','S754_K8NF6G-VSTA');
INSERT INTO `glpi_logs` VALUES ('548','Computer','28','DeviceHardDrive','1','glpi','2012-05-16 03:52:31','0','','HD502HJ ');
INSERT INTO `glpi_logs` VALUES ('549','Computer','28','','0','glpi','2012-05-16 03:53:53','46','&nbsp;','Ubuntu 10.04');
INSERT INTO `glpi_logs` VALUES ('550','Computer','28','DeviceGraphicCard','1','glpi','2012-05-16 03:54:06','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('551','Computer','28','Monitor','15','glpi','2012-05-16 03:55:11','0','','MON0044 (45)');
INSERT INTO `glpi_logs` VALUES ('552','Monitor','45','Computer','15','glpi','2012-05-16 03:55:11','0','','PC0026 (28)');
INSERT INTO `glpi_logs` VALUES ('553','Computer','27','','0','glpi','2012-05-16 03:57:17','46','&nbsp;','11.04');
INSERT INTO `glpi_logs` VALUES ('554','Computer','27','DeviceHardDrive','1','glpi','2012-05-16 03:57:54','0','','HD080HJ');
INSERT INTO `glpi_logs` VALUES ('555','Computer','27','DeviceGraphicCard','1','glpi','2012-05-16 03:58:37','0','','Integrated');
INSERT INTO `glpi_logs` VALUES ('556','Monitor','46','0','20','glpi','2012-05-16 04:13:08','0','','');
INSERT INTO `glpi_logs` VALUES ('557','Computer','29','0','20','glpi','2012-05-16 04:14:30','0','','');
INSERT INTO `glpi_logs` VALUES ('558','Computer','29','','0','glpi','2012-05-16 04:15:02','70','alexander.sidorov','dmitry.seredinov');
INSERT INTO `glpi_logs` VALUES ('559','Computer','29','Monitor','15','glpi','2012-05-16 04:15:32','0','','MON0045 (46)');
INSERT INTO `glpi_logs` VALUES ('560','Monitor','46','Computer','15','glpi','2012-05-16 04:15:32','0','','MACMINI0003 (29)');
INSERT INTO `glpi_logs` VALUES ('561','Computer','30','0','20','glpi','2012-05-16 04:17:27','0','','');
INSERT INTO `glpi_logs` VALUES ('562','Monitor','47','0','20','glpi','2012-05-16 04:19:07','0','','');
INSERT INTO `glpi_logs` VALUES ('563','Monitor','48','0','20','glpi','2012-05-16 04:20:01','0','','');
INSERT INTO `glpi_logs` VALUES ('564','Computer','31','0','20','glpi','2012-05-16 04:21:06','0','','');
INSERT INTO `glpi_logs` VALUES ('565','Computer','31','Monitor','15','glpi','2012-05-16 04:21:18','0','','MON0046 (47)');
INSERT INTO `glpi_logs` VALUES ('566','Monitor','47','Computer','15','glpi','2012-05-16 04:21:18','0','','PC0027 (31)');
INSERT INTO `glpi_logs` VALUES ('567','Computer','31','Monitor','15','glpi','2012-05-16 04:21:22','0','','MON0047 (48)');
INSERT INTO `glpi_logs` VALUES ('568','Monitor','48','Computer','15','glpi','2012-05-16 04:21:22','0','','PC0027 (31)');
INSERT INTO `glpi_logs` VALUES ('569','Computer','31','DeviceMotherboard','1','glpi','2012-05-16 04:22:02','0','','S775_P5Q SE');
INSERT INTO `glpi_logs` VALUES ('570','Computer','31','DeviceProcessor','1','glpi','2012-05-16 04:23:21','0','','Core 2 Duo E7600');
INSERT INTO `glpi_logs` VALUES ('571','Computer','31','DeviceHardDrive','1','glpi','2012-05-16 04:24:45','0','','ST3320418AS');
INSERT INTO `glpi_logs` VALUES ('572','Monitor','49','0','20','glpi','2012-05-16 04:28:31','0','','');
INSERT INTO `glpi_logs` VALUES ('573','Monitor','50','0','20','glpi','2012-05-16 04:29:19','0','','');
INSERT INTO `glpi_logs` VALUES ('574','Computer','32','0','20','glpi','2012-05-16 04:31:05','0','','');
INSERT INTO `glpi_logs` VALUES ('575','Computer','32','DeviceMotherboard','1','glpi','2012-05-16 04:32:31','0','','S775_P5QL');
INSERT INTO `glpi_logs` VALUES ('576','Computer','32','DeviceProcessor','1','glpi','2012-05-16 04:33:31','0','','Dual-Core E5300');
INSERT INTO `glpi_logs` VALUES ('577','Computer','32','DeviceHardDrive','1','glpi','2012-05-16 04:34:37','0','','ST3320418AS');
INSERT INTO `glpi_logs` VALUES ('578','Computer','32','Monitor','15','glpi','2012-05-16 04:36:59','0','','MON0048 (49)');
INSERT INTO `glpi_logs` VALUES ('579','Monitor','49','Computer','15','glpi','2012-05-16 04:36:59','0','','PC0028 (32)');
INSERT INTO `glpi_logs` VALUES ('580','Computer','32','Monitor','15','glpi','2012-05-16 04:37:03','0','','MON0049 (50)');
INSERT INTO `glpi_logs` VALUES ('581','Monitor','50','Computer','15','glpi','2012-05-16 04:37:03','0','','PC0028 (32)');
INSERT INTO `glpi_logs` VALUES ('582','Computer','6','Monitor','16','glpi','2012-05-16 05:22:54','0','MON0012 (12)','');
INSERT INTO `glpi_logs` VALUES ('583','Monitor','12','Computer','16','glpi','2012-05-16 05:22:54','0','PC0006 (6)','');
INSERT INTO `glpi_logs` VALUES ('584','Computer','6','Monitor','16','glpi','2012-05-16 05:22:57','0','MON0013 (13)','');
INSERT INTO `glpi_logs` VALUES ('585','Monitor','13','Computer','16','glpi','2012-05-16 05:22:57','0','PC0006 (6)','');
INSERT INTO `glpi_logs` VALUES ('586','Monitor','12','','0','glpi','2012-05-16 05:23:26','70','vadim.matsukatov','nadejda.lyabik');
INSERT INTO `glpi_logs` VALUES ('587','Computer','7','Monitor','15','glpi','2012-05-16 05:23:26','0','','MON0012 (12)');
INSERT INTO `glpi_logs` VALUES ('588','Monitor','12','Computer','15','glpi','2012-05-16 05:23:26','0','','PC0007 (7)');
INSERT INTO `glpi_logs` VALUES ('589','Monitor','13','','0','glpi','2012-05-16 05:23:42','3','202','205');
INSERT INTO `glpi_logs` VALUES ('590','Monitor','13','','0','glpi','2012-05-16 05:23:42','70','vadim.matsukatov','oleg.plitnik');
INSERT INTO `glpi_logs` VALUES ('591','Computer','18','Monitor','15','glpi','2012-05-16 05:23:42','0','','MON0013 (13)');
INSERT INTO `glpi_logs` VALUES ('592','Monitor','13','Computer','15','glpi','2012-05-16 05:23:42','0','','PC0018 (18)');
INSERT INTO `glpi_logs` VALUES ('593','Computer','18','Monitor','16','glpi','2012-05-16 05:24:57','0','MON0034 (34)','');
INSERT INTO `glpi_logs` VALUES ('594','Monitor','34','Computer','16','glpi','2012-05-16 05:24:57','0','PC0018 (18)','');
INSERT INTO `glpi_logs` VALUES ('595','Computer','7','Monitor','16','glpi','2012-05-16 05:25:36','0','MON0017 (17)','');
INSERT INTO `glpi_logs` VALUES ('596','Monitor','17','Computer','16','glpi','2012-05-16 05:25:36','0','PC0007 (7)','');
INSERT INTO `glpi_logs` VALUES ('597','Monitor','17','','0','glpi','2012-05-16 05:26:09','70','nadejda.lyabik','&nbsp;');
INSERT INTO `glpi_logs` VALUES ('598','Monitor','34','','0','glpi','2012-05-16 05:26:51','70','oleg.plitnik','&nbsp;');
INSERT INTO `glpi_logs` VALUES ('599','Computer','6','','0','glpi','2012-05-16 05:27:28','70','vadim.matsukatov','alexander.skripnik');
INSERT INTO `glpi_logs` VALUES ('600','Computer','21','Monitor','16','glpi','2012-05-16 05:28:03','0','MON0036 (37)','');
INSERT INTO `glpi_logs` VALUES ('601','Monitor','37','Computer','16','glpi','2012-05-16 05:28:03','0','PC0021 (21)','');
INSERT INTO `glpi_logs` VALUES ('602','Computer','21','Monitor','16','glpi','2012-05-16 05:28:05','0','MON0037 (38)','');
INSERT INTO `glpi_logs` VALUES ('603','Monitor','38','Computer','16','glpi','2012-05-16 05:28:05','0','PC0021 (21)','');
INSERT INTO `glpi_logs` VALUES ('604','Monitor','37','','0','glpi','2012-05-16 05:28:16','3','205','202');
INSERT INTO `glpi_logs` VALUES ('605','Computer','6','Monitor','15','glpi','2012-05-16 05:28:16','0','','MON0036 (37)');
INSERT INTO `glpi_logs` VALUES ('606','Monitor','37','Computer','15','glpi','2012-05-16 05:28:16','0','','PC0006 (6)');
INSERT INTO `glpi_logs` VALUES ('607','Monitor','38','','0','glpi','2012-05-16 05:28:21','3','205','202');
INSERT INTO `glpi_logs` VALUES ('608','Computer','6','Monitor','15','glpi','2012-05-16 05:28:21','0','','MON0037 (38)');
INSERT INTO `glpi_logs` VALUES ('609','Monitor','38','Computer','15','glpi','2012-05-16 05:28:21','0','','PC0006 (6)');
INSERT INTO `glpi_logs` VALUES ('610','Computer','21','','0','glpi','2012-05-16 05:28:55','70','alexander.skripnik','valeriy.matsukatov');
INSERT INTO `glpi_logs` VALUES ('611','Computer','1','Monitor','16','glpi','2012-05-16 05:29:16','0','MON0001 (1)','');
INSERT INTO `glpi_logs` VALUES ('612','Monitor','1','Computer','16','glpi','2012-05-16 05:29:16','0','PC0001 (1)','');
INSERT INTO `glpi_logs` VALUES ('613','Computer','1','Monitor','16','glpi','2012-05-16 05:29:18','0','MON0002 (2)','');
INSERT INTO `glpi_logs` VALUES ('614','Monitor','2','Computer','16','glpi','2012-05-16 05:29:18','0','PC0001 (1)','');
INSERT INTO `glpi_logs` VALUES ('615','Monitor','1','','0','glpi','2012-05-16 05:29:30','3','201','205');
INSERT INTO `glpi_logs` VALUES ('616','Computer','21','Monitor','15','glpi','2012-05-16 05:29:30','0','','MON0001 (1)');
INSERT INTO `glpi_logs` VALUES ('617','Monitor','1','Computer','15','glpi','2012-05-16 05:29:30','0','','PC0021 (21)');
INSERT INTO `glpi_logs` VALUES ('618','Monitor','2','','0','glpi','2012-05-16 05:29:35','3','201','205');
INSERT INTO `glpi_logs` VALUES ('619','Computer','21','Monitor','15','glpi','2012-05-16 05:29:35','0','','MON0002 (2)');
INSERT INTO `glpi_logs` VALUES ('620','Monitor','2','Computer','15','glpi','2012-05-16 05:29:35','0','','PC0021 (21)');
INSERT INTO `glpi_logs` VALUES ('621','Computer','1','','0','glpi','2012-05-16 05:30:16','70','valeriy.matsukatov','&nbsp;');
INSERT INTO `glpi_logs` VALUES ('622','User','47','','0','glpi','2012-05-16 05:34:50','3','&nbsp;','205');
INSERT INTO `glpi_logs` VALUES ('623','User','16','','0','glpi','2012-05-16 05:36:01','3','&nbsp;','205');
INSERT INTO `glpi_logs` VALUES ('624','Computer','6','','0','glpi','2012-05-16 05:36:16','3','202','205');
INSERT INTO `glpi_logs` VALUES ('625','Monitor','38','','0','glpi','2012-05-16 05:36:16','3','202','205');
INSERT INTO `glpi_logs` VALUES ('626','Monitor','37','','0','glpi','2012-05-16 05:36:16','3','202','205');
INSERT INTO `glpi_logs` VALUES ('627','Computer','21','','0','glpi','2012-05-16 05:37:00','3','205','201');
INSERT INTO `glpi_logs` VALUES ('628','Monitor','2','','0','glpi','2012-05-16 05:37:00','3','205','201');
INSERT INTO `glpi_logs` VALUES ('629','Monitor','1','','0','glpi','2012-05-16 05:37:00','3','205','201');
INSERT INTO `glpi_logs` VALUES ('630','User','71','Profile_User','17','glpi','2012-05-16 05:41:58','0','','Self-Service, Головная организация, D');
INSERT INTO `glpi_logs` VALUES ('631','User','71','0','20','glpi','2012-05-16 05:41:58','0','','');
INSERT INTO `glpi_logs` VALUES ('632','Computer','1','','0','glpi','2012-05-16 05:42:24','70','&nbsp;','Rezerv');
INSERT INTO `glpi_logs` VALUES ('633','Monitor','41','','0','glpi','2012-05-16 05:42:49','71','&nbsp;','Ukad');
INSERT INTO `glpi_logs` VALUES ('634','Monitor','17','','0','glpi','2012-05-16 05:43:11','70','&nbsp;','Rezerv');
INSERT INTO `glpi_logs` VALUES ('635','Monitor','34','','0','glpi','2012-05-16 05:43:11','70','&nbsp;','Rezerv');
INSERT INTO `glpi_logs` VALUES ('636','Computer','20','DeviceHardDrive','1','glpi','2012-05-16 05:46:24','0','','HD080HJ');
INSERT INTO `glpi_logs` VALUES ('637','Computer','23','','0','glpi','2012-05-16 05:47:09','71','&nbsp;','Ukad');
INSERT INTO `glpi_logs` VALUES ('638','Computer','2','','0','glpi','2012-05-16 05:48:05','44','QMFMB-F6GJ9-FX8JW-KHT7H-373B6','');
INSERT INTO `glpi_logs` VALUES ('639','Monitor','47','','0','glpi','2012-05-16 05:50:05','23','&nbsp;','SAMSUNG');
INSERT INTO `glpi_logs` VALUES ('640','Computer','2','','0','glpi','2012-05-16 09:51:26','44','','TV6CX-J7DYC-33VXK-9V6GY-Q9CD8');
INSERT INTO `glpi_logs` VALUES ('641','NetworkPort','1','','0','glpi','2012-05-16 09:53:31','4','','50-E5-49-21-31-50');
INSERT INTO `glpi_logs` VALUES ('642','Computer','4','','0','glpi','2012-05-16 09:54:42','44','','D897F-4C4Y8-HFVXG-MG7R3-KMDVX');
INSERT INTO `glpi_logs` VALUES ('643','Computer','3','','0','glpi','2012-05-16 09:55:40','44','','TFYHH-442GJ-7VDH6-YRX6H-79V4D');
INSERT INTO `glpi_logs` VALUES ('644','NetworkPort','3','','0','glpi','2012-05-16 09:56:13','4','','1C-6F-65-3E-05-DA');
INSERT INTO `glpi_logs` VALUES ('645','Computer','26','DeviceMemory','2','glpi','2012-05-16 09:57:08','0','0','1024');
INSERT INTO `glpi_logs` VALUES ('646','Computer','27','DeviceMemory','1','glpi','2012-05-16 09:57:43','0','','1GB_DDR1_NONAME');
INSERT INTO `glpi_logs` VALUES ('647','Computer','27','DeviceMemory','1','glpi','2012-05-16 09:57:50','0','','1GB_DDR1_NONAME');
INSERT INTO `glpi_logs` VALUES ('648','Computer','27','NetworkPort','17','glpi','2012-05-16 09:58:33','0','','Сетевой порт : ID 25 (25)');
INSERT INTO `glpi_logs` VALUES ('649','NetworkPort','25','0','20','glpi','2012-05-16 09:58:33','0','','');
INSERT INTO `glpi_logs` VALUES ('650','Computer','28','NetworkPort','17','glpi','2012-05-16 09:59:14','0','','Сетевой порт : ID 26 (26)');
INSERT INTO `glpi_logs` VALUES ('651','NetworkPort','26','0','20','glpi','2012-05-16 09:59:14','0','','');
INSERT INTO `glpi_logs` VALUES ('652','Computer','28','DeviceMemory','1','glpi','2012-05-16 09:59:39','0','','4GB_DDR3_KINGSTON');
INSERT INTO `glpi_logs` VALUES ('653','User','6','','0','Maksymenko Denis','2012-05-16 11:13:16','17','','ru_RU');
INSERT INTO `glpi_logs` VALUES ('654','NetworkEquipment','1','0','20','glpi','2012-05-17 04:21:43','0','','');
INSERT INTO `glpi_logs` VALUES ('655','NetworkEquipment','2','0','20','glpi','2012-05-17 04:23:17','0','','');
INSERT INTO `glpi_logs` VALUES ('656','NetworkEquipment','3','0','20','glpi','2012-05-17 04:24:16','0','','');
INSERT INTO `glpi_logs` VALUES ('657','Monitor','17','','0','glpi','2012-05-17 11:11:52','3','202','201');
INSERT INTO `glpi_logs` VALUES ('658','Monitor','17','','0','glpi','2012-05-17 11:11:52','70','Rezerv','nickolay.chizhikov');
INSERT INTO `glpi_logs` VALUES ('659','Computer','4','Monitor','15','glpi','2012-05-17 11:11:52','0','','MON0017 (17)');
INSERT INTO `glpi_logs` VALUES ('660','Monitor','17','Computer','15','glpi','2012-05-17 11:11:52','0','','PC0004 (4)');
INSERT INTO `glpi_logs` VALUES ('661','Computer','4','Monitor','16','glpi','2012-05-17 11:11:58','0','MON0017 (17)','');
INSERT INTO `glpi_logs` VALUES ('662','Monitor','17','Computer','16','glpi','2012-05-17 11:11:58','0','PC0004 (4)','');
INSERT INTO `glpi_logs` VALUES ('663','Computer','4','Monitor','16','glpi','2012-05-17 11:13:45','0','MON0009 (9)','');
INSERT INTO `glpi_logs` VALUES ('664','Monitor','9','Computer','16','glpi','2012-05-17 11:13:45','0','PC0004 (4)','');
INSERT INTO `glpi_logs` VALUES ('665','Computer','4','Monitor','15','glpi','2012-05-17 11:13:57','0','','MON0009 (9)');
INSERT INTO `glpi_logs` VALUES ('666','Monitor','9','Computer','15','glpi','2012-05-17 11:13:57','0','','PC0004 (4)');
INSERT INTO `glpi_logs` VALUES ('667','Computer','2','DeviceMotherboard','1','glpi','2012-05-17 11:14:33','0','','S775_P5G41TD-M Pro');
INSERT INTO `glpi_logs` VALUES ('668','Computer','2','DeviceMotherboard','3','glpi','2012-05-17 11:14:49','0','S775_P5G41TD-M Pro','');
INSERT INTO `glpi_logs` VALUES ('669','User','9','Profile_User','19','glpi','2012-05-18 02:38:16','0','Admin, Головная организация','');
INSERT INTO `glpi_logs` VALUES ('670','User','9','Profile_User','17','glpi','2012-05-18 02:38:22','0','','Self-Service, Головная организация');
INSERT INTO `glpi_logs` VALUES ('671','User','9','Profile_User','19','glpi','2012-05-18 02:39:42','0','Self-Service, Головная организация','');
INSERT INTO `glpi_logs` VALUES ('672','User','9','Profile_User','17','glpi','2012-05-18 02:39:47','0','','Super-Admin, Головная организация');
INSERT INTO `glpi_logs` VALUES ('673','User','9','Profile_User','19','glpi','2012-05-18 02:39:54','0','Super-Admin, Головная организация','');
INSERT INTO `glpi_logs` VALUES ('674','User','9','Profile_User','17','glpi','2012-05-18 02:40:00','0','','Super-Admin, Головная организация, R');
INSERT INTO `glpi_logs` VALUES ('675','User','9','','0','Vilkhivskiy Dmitry','2012-05-18 02:40:23','17','','ru_RU');
INSERT INTO `glpi_logs` VALUES ('676','User','2','','0','Vilkhivskiy Dmitry','2012-05-18 02:40:56','8','1','0');
INSERT INTO `glpi_logs` VALUES ('677','Monitor','34','','0','Vilkhivskiy Dmitry','2012-05-18 02:44:18','11','0','23');
INSERT INTO `glpi_logs` VALUES ('678','Monitor','17','','0','Vilkhivskiy Dmitry','2012-05-18 02:47:10','70','nickolay.chizhikov','Rezerv');
INSERT INTO `glpi_logs` VALUES ('679','Monitor','34','','0','Vilkhivskiy Dmitry','2012-05-18 02:48:30','70','Rezerv','valeriy.matsukatov');
INSERT INTO `glpi_logs` VALUES ('680','Monitor','34','','0','Vilkhivskiy Dmitry','2012-05-18 02:49:04','3','205','201');
INSERT INTO `glpi_logs` VALUES ('681','Computer','21','Monitor','15','Vilkhivskiy Dmitry','2012-05-18 02:49:04','0','','MON0034 (34)');
INSERT INTO `glpi_logs` VALUES ('682','Monitor','34','Computer','15','Vilkhivskiy Dmitry','2012-05-18 02:49:04','0','','PC0021 (21)');
INSERT INTO `glpi_logs` VALUES ('683','Computer','21','Monitor','16','Vilkhivskiy Dmitry','2012-05-18 02:49:38','0','MON0002 (2)','');
INSERT INTO `glpi_logs` VALUES ('684','Monitor','2','Computer','16','Vilkhivskiy Dmitry','2012-05-18 02:49:38','0','PC0021 (21)','');
INSERT INTO `glpi_logs` VALUES ('685','Monitor','2','','0','Vilkhivskiy Dmitry','2012-05-18 05:01:00','3','201','207');
INSERT INTO `glpi_logs` VALUES ('686','Monitor','2','','0','Vilkhivskiy Dmitry','2012-05-18 05:01:00','70','valeriy.matsukatov','yuriy.zisin');
INSERT INTO `glpi_logs` VALUES ('687','Computer','30','Monitor','15','Vilkhivskiy Dmitry','2012-05-18 05:01:00','0','','MON0002 (2)');
INSERT INTO `glpi_logs` VALUES ('688','Monitor','2','Computer','15','Vilkhivskiy Dmitry','2012-05-18 05:01:00','0','','IMAC0001 (30)');
INSERT INTO `glpi_logs` VALUES ('689','Computer','30','Monitor','16','Vilkhivskiy Dmitry','2012-05-18 05:01:06','0','MON0002 (2)','');
INSERT INTO `glpi_logs` VALUES ('690','Monitor','2','Computer','16','Vilkhivskiy Dmitry','2012-05-18 05:01:06','0','IMAC0001 (30)','');
INSERT INTO `glpi_logs` VALUES ('691','Monitor','2','','0','Vilkhivskiy Dmitry','2012-05-18 05:04:42','3','207','201');
INSERT INTO `glpi_logs` VALUES ('692','Monitor','2','','0','Vilkhivskiy Dmitry','2012-05-18 05:04:42','70','yuriy.zisin','nickolay.chizhikov');
INSERT INTO `glpi_logs` VALUES ('693','Computer','4','Monitor','15','Vilkhivskiy Dmitry','2012-05-18 05:04:42','0','','MON0002 (2)');
INSERT INTO `glpi_logs` VALUES ('694','Monitor','2','Computer','15','Vilkhivskiy Dmitry','2012-05-18 05:04:42','0','','PC0004 (4)');
INSERT INTO `glpi_logs` VALUES ('695','Computer','4','Monitor','16','Vilkhivskiy Dmitry','2012-05-18 05:05:09','0','MON0009 (9)','');
INSERT INTO `glpi_logs` VALUES ('696','Monitor','9','Computer','16','Vilkhivskiy Dmitry','2012-05-18 05:05:09','0','PC0004 (4)','');
INSERT INTO `glpi_logs` VALUES ('697','User','8','Profile_User','19','Vilkhivskiy Dmitry','2012-05-29 07:53:55','0','Admin, Головная организация','');
INSERT INTO `glpi_logs` VALUES ('698','User','8','Profile_User','17','Vilkhivskiy Dmitry','2012-05-29 07:54:01','0','','Super-Admin, Головная организация, R');
INSERT INTO `glpi_logs` VALUES ('699','PluginGenericobjectType','1','0','20','Vilkhivskiy Dmitry','2012-05-29 08:01:24','0','','');
INSERT INTO `glpi_logs` VALUES ('700','PluginGenericobjectType','1','','0','Vilkhivskiy Dmitry','2012-05-29 08:01:37','5','0','1');
INSERT INTO `glpi_logs` VALUES ('701','PluginGenericobjectType','2','0','20','Vilkhivskiy Dmitry','2012-05-29 08:19:41','0','','');
INSERT INTO `glpi_logs` VALUES ('702','PluginGenericobjectType','2','','0','Vilkhivskiy Dmitry','2012-05-29 08:19:52','5','0','1');
INSERT INTO `glpi_logs` VALUES ('703','PluginGenericobjectType','3','0','20','Vilkhivskiy Dmitry','2012-05-29 08:30:20','0','','');
INSERT INTO `glpi_logs` VALUES ('704','PluginGenericobjectType','3','','0','Vilkhivskiy Dmitry','2012-05-29 08:30:27','5','0','1');
INSERT INTO `glpi_logs` VALUES ('705','PluginGenericobjectType','4','0','20','Vilkhivskiy Dmitry','2012-05-29 08:36:58','0','','');
INSERT INTO `glpi_logs` VALUES ('706','PluginGenericobjectType','4','','0','Vilkhivskiy Dmitry','2012-05-29 08:37:19','5','0','1');
INSERT INTO `glpi_logs` VALUES ('707','PluginGenericobjectType','5','0','20','Vilkhivskiy Dmitry','2012-05-29 08:42:20','0','','');
INSERT INTO `glpi_logs` VALUES ('708','PluginGenericobjectType','5','','0','Vilkhivskiy Dmitry','2012-05-29 08:42:27','5','0','1');

### Dump table glpi_mailcollectors

DROP TABLE IF EXISTS `glpi_mailcollectors`;
CREATE TABLE `glpi_mailcollectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesize_max` int(11) NOT NULL DEFAULT '2097152',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_manufacturers

DROP TABLE IF EXISTS `glpi_manufacturers`;
CREATE TABLE `glpi_manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_manufacturers` VALUES ('1','LG','');
INSERT INTO `glpi_manufacturers` VALUES ('2','SAMSUNG','');
INSERT INTO `glpi_manufacturers` VALUES ('3','PHILIPS','');
INSERT INTO `glpi_manufacturers` VALUES ('4','INTEL','');
INSERT INTO `glpi_manufacturers` VALUES ('5','AMD','');
INSERT INTO `glpi_manufacturers` VALUES ('6','Asus','');
INSERT INTO `glpi_manufacturers` VALUES ('7','KINGSTON','');
INSERT INTO `glpi_manufacturers` VALUES ('8','Microsoft','');
INSERT INTO `glpi_manufacturers` VALUES ('9','Gigabyte','');
INSERT INTO `glpi_manufacturers` VALUES ('10','Hitachi','');
INSERT INTO `glpi_manufacturers` VALUES ('11','NVIDIA','');
INSERT INTO `glpi_manufacturers` VALUES ('12','Apple','');
INSERT INTO `glpi_manufacturers` VALUES ('13','HYNIX','');
INSERT INTO `glpi_manufacturers` VALUES ('14','SEAGATE','');
INSERT INTO `glpi_manufacturers` VALUES ('15','Western Digital','');
INSERT INTO `glpi_manufacturers` VALUES ('16','OPTIQUEST','');
INSERT INTO `glpi_manufacturers` VALUES ('17','TRANSCEND','');
INSERT INTO `glpi_manufacturers` VALUES ('18','ASROCK','');
INSERT INTO `glpi_manufacturers` VALUES ('19','Foxconn','');
INSERT INTO `glpi_manufacturers` VALUES ('20','D-Link','');

### Dump table glpi_monitormodels

DROP TABLE IF EXISTS `glpi_monitormodels`;
CREATE TABLE `glpi_monitormodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_monitormodels` VALUES ('1','L1730P','');
INSERT INTO `glpi_monitormodels` VALUES ('2','923NW','');
INSERT INTO `glpi_monitormodels` VALUES ('3','943N','');
INSERT INTO `glpi_monitormodels` VALUES ('4','W2346T','');
INSERT INTO `glpi_monitormodels` VALUES ('5','W2346S','');
INSERT INTO `glpi_monitormodels` VALUES ('6','943','');
INSERT INTO `glpi_monitormodels` VALUES ('7','W2346','');
INSERT INTO `glpi_monitormodels` VALUES ('8','190S','');
INSERT INTO `glpi_monitormodels` VALUES ('9','241SL','');
INSERT INTO `glpi_monitormodels` VALUES ('10','E2320','');
INSERT INTO `glpi_monitormodels` VALUES ('11','710N','');
INSERT INTO `glpi_monitormodels` VALUES ('12','940N','');
INSERT INTO `glpi_monitormodels` VALUES ('13','971P','');
INSERT INTO `glpi_monitormodels` VALUES ('14','Q9','');
INSERT INTO `glpi_monitormodels` VALUES ('15','246ELH','');
INSERT INTO `glpi_monitormodels` VALUES ('16','2494','');

### Dump table glpi_monitors

DROP TABLE IF EXISTS `glpi_monitors`;
CREATE TABLE `glpi_monitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `have_micro` tinyint(1) NOT NULL DEFAULT '0',
  `have_speaker` tinyint(1) NOT NULL DEFAULT '0',
  `have_subd` tinyint(1) NOT NULL DEFAULT '0',
  `have_bnc` tinyint(1) NOT NULL DEFAULT '0',
  `have_dvi` tinyint(1) NOT NULL DEFAULT '0',
  `have_pivot` tinyint(1) NOT NULL DEFAULT '0',
  `have_hdmi` tinyint(1) NOT NULL DEFAULT '0',
  `have_displayport` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `monitortypes_id` int(11) NOT NULL DEFAULT '0',
  `monitormodels_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notepad` longtext COLLATE utf8_unicode_ci,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `monitormodels_id` (`monitormodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `monitortypes_id` (`monitortypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_monitors` VALUES ('1','0','MON0001','2012-05-16 05:37:00','','','9','3','','','','17','0','0','0','0','0','0','0','0','1','0','1','1','0','0','0',NULL,NULL,'60','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('2','0','MON0002','2012-05-18 05:04:42','','','9','3','','HA19H9FS204859T','','19','0','0','0','0','0','0','0','0','1','0','2','2','0','0','0',NULL,NULL,'45','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('3','0','MON0003','2012-05-14 08:54:39','','','9','3','','MY19HCZ12655','','19','0','0','0','0','0','0','0','0','1','0','3','2','0','0','0',NULL,NULL,'62','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('4','0','MON0004','2012-05-14 08:56:21','','','9','3','','004MAWL6H633','','20','0','0','0','0','0','0','0','0','1','0','4','1','0','0','0',NULL,NULL,'62','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('5','0','MON0005','2012-05-14 09:02:21','','','9','3','','912NDQAF7396','','23','0','0','0','0','0','0','0','0','1','0','5','1','0','0','0',NULL,NULL,'22','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('6','0','MON0006','2012-05-14 09:12:43','','','9','3','','LS19MYAKBBA/EN','','19','0','0','0','0','0','0','0','0','1','0','6','2','0','0','0',NULL,NULL,'22','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('7','0','MON0007','2012-05-14 09:12:33','','','9','3','','005MANJ61727','','23','0','0','0','0','0','0','0','0','1','0','4','1','0','0','0',NULL,NULL,'22','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('8','0','MON0008','2012-05-14 09:10:11','','','9','3','','011NDMT2T331','','23','0','0','0','0','0','0','0','0','1','0','7','1','0','0','0',NULL,NULL,'45','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('9','0','MON0009','2012-05-14 09:12:22','','','9','3','','BZ3A0647331165','','19','0','0','0','0','0','0','0','0','1','0','8','3','0','0','0',NULL,NULL,'45','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('10','0','MON0010','2012-05-15 03:19:01','','','9','3','','DL1A1146451941','','24','0','0','0','0','0','0','0','0','2','0','9','3','0','0','0',NULL,NULL,'68','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('11','0','MON0011','2012-05-15 03:19:32','','','9','3','','HA19H9NP162119A','','19','0','0','0','0','0','0','0','0','2','0','3','2','0','0','0',NULL,NULL,'68','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('12','0','MON0012','2012-05-16 05:23:26','','','9','3','','MY19HMDQ500479N','','0','0','0','0','0','0','0','0','0','2','0','3','2','0','0','0',NULL,NULL,'70','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('13','0','MON0013','2012-05-16 05:23:42','','','9','3','','CL23H9XZ600611E','','0','0','0','0','0','0','0','0','0','5','0','10','2','0','0','0',NULL,NULL,'47','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('14','0','MON0014','2012-05-15 03:25:54','','','9','3','','MY19H9FSD21697N','','0','0','0','0','0','0','0','0','0','2','0','6','2','0','0','0',NULL,NULL,'69','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('15','0','MON0015','2012-05-15 03:26:54','','','9','3','','912WDJXF7412','','0','0','0','0','0','0','0','0','0','2','0','5','1','0','0','0',NULL,NULL,'69','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('16','0','MON0016','2012-05-15 03:30:34','','','9','3','','005MAPN61832','','0','0','0','0','0','0','0','0','0','2','0','4','1','0','0','0',NULL,NULL,'70','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('17','0','MON0017','2012-05-18 02:47:10','','','9','3','','MS17HMEXC08008M','','0','0','0','0','0','0','0','0','0','1','0','11','2','0','0','0',NULL,NULL,'71','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('18','0','MON0018','2012-05-15 05:28:53','','','9','3','','HA19H9NLCO3269D','','0','0','0','0','0','0','0','0','0','3','0','12','2','0','0','0',NULL,NULL,'17','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('19','0','MON0019','2012-05-15 05:28:43','','','9','3','','DL1A1146451898','','0','0','0','0','0','0','0','0','0','3','0','9','2','0','0','0',NULL,NULL,'17','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('20','0','MON0020','2012-05-15 06:08:01','','','9','3','','MB19HVNQ901485K','','0','0','0','0','0','0','0','0','0','3','0','13','2','0','0','0',NULL,NULL,'43','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('21','0','MON0021','2012-05-15 05:32:49','','','9','3','','102NDLS19648','','0','0','0','0','0','0','0','0','0','3','0','7','1','0','0','0',NULL,NULL,'43','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('22','0','MON0022','2012-05-15 05:33:57','','','9','3','','HA19H9FS2031902','','0','0','0','0','0','0','0','0','0','3','0','2','2','0','0','0',NULL,NULL,'24','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('23','0','MON0023','2012-05-15 05:35:05','','','9','3','','HA19H9NP4473854','','0','0','0','0','0','0','0','0','0','3','0','12','2','0','0','0',NULL,NULL,'39','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('24','0','MON0024','2012-05-15 05:36:19','','','9','3','','011NDTC2T329','','0','0','0','0','0','0','0','0','0','3','0','7','1','0','0','0',NULL,NULL,'39','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('25','0','MON0025','2012-05-15 07:01:21','','','9','3','','DL1A1146461937','','0','0','0','0','0','0','0','0','0','4','0','9','3','0','0','0',NULL,NULL,'50','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('26','0','MON0026','2012-05-15 07:03:17','','','9','3','','001NDNV26559','','0','0','0','0','0','0','0','0','0','4','0','5','1','0','0','0',NULL,NULL,'54','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('27','0','MON0027','2012-05-15 07:07:42','','','9','3','','004MAXS6H634','','0','0','0','0','0','0','0','0','0','4','0','4','1','0','0','0',NULL,NULL,'25','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('28','0','MON0028','2012-05-15 07:08:57','','','9','3','','011NDEZ2T332','','0','0','0','0','0','0','0','0','0','4','0','7','1','0','0','0',NULL,NULL,'25','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('29','0','MON0029','2012-05-15 07:10:36','','','9','3','','MY19HMCSA07397P','','0','0','0','0','0','0','0','0','0','4','0','6','2','0','0','0',NULL,NULL,'28','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('30','0','MON0030','2012-05-15 07:12:24','','','9','3','','MY19HMDQ5005172','','0','0','0','0','0','0','0','0','0','4','0','3','2','0','0','0',NULL,NULL,'28','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('31','0','MON0031','2012-05-15 07:13:23','','','9','3','','912NDXQF7410','','0','0','0','0','0','0','0','0','0','4','0','5','1','0','0','0',NULL,NULL,'64','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('32','0','MON0032','2012-05-15 07:14:37','','','9','3','','MY19HMBSA38550R','','0','0','0','0','0','0','0','0','0','4','0','6','2','0','0','0',NULL,NULL,'64','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('33','0','MON0033','2012-05-15 09:32:47','','','9','0','','HA19HS4P41104OC','','0','0','0','0','0','0','0','0','0','5','0','12','2','0','0','0',NULL,NULL,'47','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('34','0','MON0034','2012-05-18 02:49:04','','','9','3','','102NDAY19632','','23','0','0','0','0','0','0','0','0','1','0','7','1','0','0','0',NULL,NULL,'60','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('35','0','MON0036','2012-05-15 09:37:10','','','9','3','','912NDQAF7396','','0','0','0','0','0','0','0','0','0','5','0','5','1','0','0','0',NULL,NULL,'12','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('36','0','MON0035','2012-05-15 09:38:22','','','9','0','','102NDEZ1T092','','0','0','0','0','0','0','0','0','0','5','0','7','1','0','0','0',NULL,NULL,'58','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('37','0','MON0036','2012-05-16 05:36:16','','','9','3','','011NDUN2T334','','0','0','0','0','0','0','0','0','0','5','0','7','1','0','0','0',NULL,NULL,'16','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('38','0','MON0037','2012-05-16 05:36:16','','','9','3','','QD8062905963','','0','0','0','0','0','0','0','0','0','5','0','14','16','0','0','0',NULL,NULL,'16','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('39','0','MON0038','2012-05-15 09:45:02','','','9','3','','DL1A1146451986','','0','0','0','0','0','0','0','0','0','5','0','9','3','0','0','0',NULL,NULL,'37','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('40','0','MON0039','2012-05-15 09:46:17','','','9','3','','HA19HMBP412261Y','','0','0','0','0','0','0','0','0','0','5','0','12','2','0','0','0',NULL,NULL,'37','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('41','0','MON0040','2012-05-16 05:42:49','','','9','3','','UF5A1135000783','','0','0','0','0','0','0','0','0','0','5','0','15','3','0','0','0',NULL,NULL,'6','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('42','0','MON0041','2012-05-16 03:30:28','','','9','3','','K124H9XZ502027N','','0','0','0','0','0','0','0','0','0','6','0','16','2','0','0','0',NULL,NULL,'15','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('43','0','MON0042','2012-05-16 03:34:52','','','9','3','','HA19H9NLC03278Z','','0','0','0','0','0','0','0','0','0','6','0','12','2','0','0','0',NULL,NULL,'21','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('44','0','MON0043','2012-05-16 03:42:16','','','9','3','','MY19HMBQ401063L','','0','0','0','0','0','0','0','0','0','6','0','3','2','0','0','0',NULL,NULL,'36','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('45','0','MON0044','2012-05-16 03:46:35','','','9','3','','912NDBPF7389','','0','0','0','0','0','0','0','0','0','6','0','5','1','0','0','0',NULL,NULL,'38','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('46','0','MON0045','2012-05-16 04:13:08','','','9','3','','DL1A1146451925','','0','0','0','0','0','0','0','0','0','7','0','9','3','0','0','0',NULL,NULL,'31','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('47','0','MON0046','2012-05-16 05:50:05','','','9','3','','MY19HMDQ500497B','','0','0','0','0','0','0','0','0','0','7','0','3','2','0','0','0',NULL,NULL,'33','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('48','0','MON0047','2012-05-16 04:20:01','','','9','3','','MY19HMDQ500434W','','0','0','0','0','0','0','0','0','0','7','0','3','2','0','0','0',NULL,NULL,'33','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('49','0','MON0048','2012-05-16 04:28:31','','','9','3','','HA19H9NL823183Y','','0','0','0','0','0','0','0','0','0','7','0','12','2','0','0','0',NULL,NULL,'48','3','0','0.0000');
INSERT INTO `glpi_monitors` VALUES ('50','0','MON0049','2012-05-16 04:29:19','','','9','3','','HA19HMCL917339D','','0','0','0','0','0','0','0','0','0','7','0','12','2','0','0','0',NULL,NULL,'48','3','0','0.0000');

### Dump table glpi_monitortypes

DROP TABLE IF EXISTS `glpi_monitortypes`;
CREATE TABLE `glpi_monitortypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_netpoints

DROP TABLE IF EXISTS `glpi_netpoints`;
CREATE TABLE `glpi_netpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `complete` (`entities_id`,`locations_id`,`name`),
  KEY `location_name` (`locations_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_networkequipmentfirmwares

DROP TABLE IF EXISTS `glpi_networkequipmentfirmwares`;
CREATE TABLE `glpi_networkequipmentfirmwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_networkequipmentmodels

DROP TABLE IF EXISTS `glpi_networkequipmentmodels`;
CREATE TABLE `glpi_networkequipmentmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_networkequipmentmodels` VALUES ('1','DES3200','');
INSERT INTO `glpi_networkequipmentmodels` VALUES ('2','GREEN','');
INSERT INTO `glpi_networkequipmentmodels` VALUES ('3','WI-FI DWL-2100AP','');

### Dump table glpi_networkequipments

DROP TABLE IF EXISTS `glpi_networkequipments`;
CREATE TABLE `glpi_networkequipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `networks_id` int(11) NOT NULL DEFAULT '0',
  `networkequipmenttypes_id` int(11) NOT NULL DEFAULT '0',
  `networkequipmentmodels_id` int(11) NOT NULL DEFAULT '0',
  `networkequipmentfirmwares_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notepad` longtext COLLATE utf8_unicode_ci,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `domains_id` (`domains_id`),
  KEY `networkequipmentfirmwares_id` (`networkequipmentfirmwares_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `networkequipmentmodels_id` (`networkequipmentmodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `networkequipmenttypes_id` (`networkequipmenttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_networkequipments` VALUES ('1','0','0','SW0001','','','','','','9','3','2012-05-17 04:21:43','','1','0','0','0','1','0','20','0','0',NULL,'','',NULL,'0','3','0','0.0000');
INSERT INTO `glpi_networkequipments` VALUES ('2','0','0','SW0002','','','','','','9','0','2012-05-17 04:23:17','','1','0','0','0','2','0','20','0','0',NULL,'','',NULL,'0','0','0','0.0000');
INSERT INTO `glpi_networkequipments` VALUES ('3','0','0','SW0004','','','','','','9','3','2012-05-17 04:24:16','','1','0','0','0','3','0','20','0','0',NULL,'','',NULL,'0','3','0','0.0000');

### Dump table glpi_networkequipmenttypes

DROP TABLE IF EXISTS `glpi_networkequipmenttypes`;
CREATE TABLE `glpi_networkequipmenttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_networkequipmenttypes` VALUES ('1','SWITCH','');
INSERT INTO `glpi_networkequipmenttypes` VALUES ('2','ROUTER','');

### Dump table glpi_networkinterfaces

DROP TABLE IF EXISTS `glpi_networkinterfaces`;
CREATE TABLE `glpi_networkinterfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_networkports

DROP TABLE IF EXISTS `glpi_networkports`;
CREATE TABLE `glpi_networkports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `logical_number` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `networkinterfaces_id` int(11) NOT NULL DEFAULT '0',
  `netpoints_id` int(11) NOT NULL DEFAULT '0',
  `netmask` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subnet` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `on_device` (`items_id`,`itemtype`),
  KEY `networkinterfaces_id` (`networkinterfaces_id`),
  KEY `netpoints_id` (`netpoints_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_networkports` VALUES ('1','2','Computer','0','0','0','','192.168.0.70','50-E5-49-21-31-50','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('2','1','Computer','0','0','0','','192.168.0.64','','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('3','3','Computer','0','0','0','','192.168.0.51','1C-6F-65-3E-05-DA','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('4','4','Computer','0','0','0','','192.168.0.67','20-CF-30-0E-8D-16','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('6','5','Computer','0','0','0','','192.168.0.134','50-E5-49-CA-76-27','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('7','6','Computer','0','0','0','','192.168.0.139 ','50-E5-49-22-68-33','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('8','7','Computer','0','0','0','','192.168.0.133','50-E5-49-21-30-26','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('9','8','Computer','0','0','0','','192.168.0.135','00-23-54-08-F2-24','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('10','9','Computer','0','0','0','','192.168.0.55','50-E5-49-CA-78-D0','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('11','10','Computer','0','0','0','','192.168.0.58','50-E5-49-D3-FD-86','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('12','11','Computer','0','0','0','','192.168.0.68','70-71-BC-88-87-27','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('13','12','Computer','0','0','0','','192.168.0.47','E0-CB-4E-B5-2C-C7','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('14','13','Computer','0','0','0','','192.168.0.46','00-1A-92-92-CB-97','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('15','14','Computer','0','0','0','','192.168.0.137','00-1D-60-8D-93-2E','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('16','15','Computer','0','0','0','','192.168.0.33','1C-6F-65-DF-E6-69','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('17','16','Computer','0','0','0','','192.168.0.57','00-1D-60-90-EA-A4','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('18','17','Computer','0','0','0','','192.168.0.48','E0-CB-4E-B5-2C-D3','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('19','18','Computer','0','0','0','','192.168.0.150','50-E5-49-57-7F-FA','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('20','19','Computer','0','0','0','','192.168.0.42','00-1C-C0-79-F1-F0','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('21','20','Computer','0','0','0','','192.168.0.69','00-1A-92-32-DE-D6','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('22','21','Computer','0','0','0','','192.168.0.61','00-25-22-13-5D-39','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('23','22','Computer','0','0','0','','192.168.0.50','50-E5-49-3E-85-7D','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('24','26','Computer','0','0','0','','192.168.0.22','00-15-58-51-4E-F9','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('25','27','Computer','0','0','0','','192.168.0.36','00:13:8F:E4:0B:4F','0','0','','','','');
INSERT INTO `glpi_networkports` VALUES ('26','28','Computer','0','0','0','','192.168.0.232','50:E5:49:21:39:0D','0','0','','','','');

### Dump table glpi_networkports_networkports

DROP TABLE IF EXISTS `glpi_networkports_networkports`;
CREATE TABLE `glpi_networkports_networkports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id_1` int(11) NOT NULL DEFAULT '0',
  `networkports_id_2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id_1`,`networkports_id_2`),
  KEY `networkports_id_2` (`networkports_id_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_networkports_vlans

DROP TABLE IF EXISTS `glpi_networkports_vlans`;
CREATE TABLE `glpi_networkports_vlans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `vlans_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id`,`vlans_id`),
  KEY `vlans_id` (`vlans_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_networks

DROP TABLE IF EXISTS `glpi_networks`;
CREATE TABLE `glpi_networks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_notifications

DROP TABLE IF EXISTS `glpi_notifications`;
CREATE TABLE `glpi_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notificationtemplates_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_notifications` VALUES ('1','Alert Tickets not closed','0','Ticket','alertnotclosed','mail','6','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('2','New Ticket','0','Ticket','new','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('3','Update Ticket','0','Ticket','update','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('4','Close Ticket','0','Ticket','closed','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('5','Add Followup','0','Ticket','add_followup','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('6','Add Task','0','Ticket','add_task','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('7','Update Followup','0','Ticket','update_followup','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('8','Update Task','0','Ticket','update_task','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('9','Delete Followup','0','Ticket','delete_followup','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('10','Delete Task','0','Ticket','delete_task','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('11','Resolve ticket','0','Ticket','solved','mail','4','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('12','Ticket Validation','0','Ticket','validation','mail','7','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('13','New Reservation','0','Reservation','new','mail','2','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('14','Update Reservation','0','Reservation','update','mail','2','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('15','Delete Reservation','0','Reservation','delete','mail','2','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('16','Alert Reservation','0','Reservation','alert','mail','3','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('17','Contract Notice','0','Contract','notice','mail','12','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('18','Contract End','0','Contract','end','mail','12','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('19','MySQL Synchronization','0','DBConnection','desynchronization','mail','1','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('20','Cartridges','0','Cartridge','alert','mail','8','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('21','Consumables','0','Consumable','alert','mail','9','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('22','Infocoms','0','Infocom','alert','mail','10','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('23','Software Licenses','0','SoftwareLicense','alert','mail','11','','1','1','2010-02-16 16:41:39');
INSERT INTO `glpi_notifications` VALUES ('24','Ticket Recall','0','Ticket','recall','mail','4','','1','1','2011-03-04 11:35:13');
INSERT INTO `glpi_notifications` VALUES ('25','Password Forget','0','User','passwordforget','mail','13','','1','1','2011-03-04 11:35:13');
INSERT INTO `glpi_notifications` VALUES ('26','Ticket Satisfaction','0','Ticket','satisfaction','mail','14','','1','1','2011-03-04 11:35:15');
INSERT INTO `glpi_notifications` VALUES ('27','Item not unique','0','FieldUnicity','refuse','mail','15','','1','1','2011-03-04 11:35:16');
INSERT INTO `glpi_notifications` VALUES ('28','Crontask Watcher','0','Crontask','alert','mail','16','','1','1','2011-03-04 11:35:16');
INSERT INTO `glpi_notifications` VALUES ('29','New Problem','0','Problem','new','mail','17','','1','1','2011-12-06 09:48:33');
INSERT INTO `glpi_notifications` VALUES ('30','Update Problem','0','Problem','update','mail','17','','1','1','2011-12-06 09:48:33');
INSERT INTO `glpi_notifications` VALUES ('31','Resolve Problem','0','Problem','solved','mail','17','','1','1','2011-12-06 09:48:33');
INSERT INTO `glpi_notifications` VALUES ('32','Add Task','0','Problem','add_task','mail','17','','1','1','2011-12-06 09:48:33');
INSERT INTO `glpi_notifications` VALUES ('33','Update Task','0','Problem','update_task','mail','17','','1','1','2011-12-06 09:48:33');
INSERT INTO `glpi_notifications` VALUES ('34','Delete Task','0','Problem','delete_task','mail','17','','1','1','2011-12-06 09:48:33');
INSERT INTO `glpi_notifications` VALUES ('35','Close Problem','0','Problem','closed','mail','17','','1','1','2011-12-06 09:48:33');
INSERT INTO `glpi_notifications` VALUES ('36','Delete Problem','0','Problem','delete','mail','17','','1','1','2011-12-06 09:48:33');

### Dump table glpi_notificationtargets

DROP TABLE IF EXISTS `glpi_notificationtargets`;
CREATE TABLE `glpi_notificationtargets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `notifications_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items` (`type`,`items_id`),
  KEY `notifications_id` (`notifications_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_notificationtargets` VALUES ('1','3','1','13');
INSERT INTO `glpi_notificationtargets` VALUES ('2','1','1','13');
INSERT INTO `glpi_notificationtargets` VALUES ('3','3','2','2');
INSERT INTO `glpi_notificationtargets` VALUES ('4','1','1','2');
INSERT INTO `glpi_notificationtargets` VALUES ('5','1','1','3');
INSERT INTO `glpi_notificationtargets` VALUES ('6','1','1','5');
INSERT INTO `glpi_notificationtargets` VALUES ('7','1','1','4');
INSERT INTO `glpi_notificationtargets` VALUES ('8','2','1','3');
INSERT INTO `glpi_notificationtargets` VALUES ('9','4','1','3');
INSERT INTO `glpi_notificationtargets` VALUES ('10','3','1','2');
INSERT INTO `glpi_notificationtargets` VALUES ('11','3','1','3');
INSERT INTO `glpi_notificationtargets` VALUES ('12','3','1','5');
INSERT INTO `glpi_notificationtargets` VALUES ('13','3','1','4');
INSERT INTO `glpi_notificationtargets` VALUES ('14','1','1','19');
INSERT INTO `glpi_notificationtargets` VALUES ('15','14','1','12');
INSERT INTO `glpi_notificationtargets` VALUES ('16','3','1','14');
INSERT INTO `glpi_notificationtargets` VALUES ('17','1','1','14');
INSERT INTO `glpi_notificationtargets` VALUES ('18','3','1','15');
INSERT INTO `glpi_notificationtargets` VALUES ('19','1','1','15');
INSERT INTO `glpi_notificationtargets` VALUES ('20','1','1','6');
INSERT INTO `glpi_notificationtargets` VALUES ('21','3','1','6');
INSERT INTO `glpi_notificationtargets` VALUES ('22','1','1','7');
INSERT INTO `glpi_notificationtargets` VALUES ('23','3','1','7');
INSERT INTO `glpi_notificationtargets` VALUES ('24','1','1','8');
INSERT INTO `glpi_notificationtargets` VALUES ('25','3','1','8');
INSERT INTO `glpi_notificationtargets` VALUES ('26','1','1','9');
INSERT INTO `glpi_notificationtargets` VALUES ('27','3','1','9');
INSERT INTO `glpi_notificationtargets` VALUES ('28','1','1','10');
INSERT INTO `glpi_notificationtargets` VALUES ('29','3','1','10');
INSERT INTO `glpi_notificationtargets` VALUES ('30','1','1','11');
INSERT INTO `glpi_notificationtargets` VALUES ('31','3','1','11');
INSERT INTO `glpi_notificationtargets` VALUES ('32','19','1','25');
INSERT INTO `glpi_notificationtargets` VALUES ('33','3','1','26');
INSERT INTO `glpi_notificationtargets` VALUES ('34','21','1','2');
INSERT INTO `glpi_notificationtargets` VALUES ('35','21','1','3');
INSERT INTO `glpi_notificationtargets` VALUES ('36','21','1','5');
INSERT INTO `glpi_notificationtargets` VALUES ('37','21','1','4');
INSERT INTO `glpi_notificationtargets` VALUES ('38','21','1','6');
INSERT INTO `glpi_notificationtargets` VALUES ('39','21','1','7');
INSERT INTO `glpi_notificationtargets` VALUES ('40','21','1','8');
INSERT INTO `glpi_notificationtargets` VALUES ('41','21','1','9');
INSERT INTO `glpi_notificationtargets` VALUES ('42','21','1','10');
INSERT INTO `glpi_notificationtargets` VALUES ('43','21','1','11');
INSERT INTO `glpi_notificationtargets` VALUES ('44','21','1','26');
INSERT INTO `glpi_notificationtargets` VALUES ('45','19','1','27');
INSERT INTO `glpi_notificationtargets` VALUES ('46','1','1','28');
INSERT INTO `glpi_notificationtargets` VALUES ('47','3','1','29');
INSERT INTO `glpi_notificationtargets` VALUES ('48','1','1','29');
INSERT INTO `glpi_notificationtargets` VALUES ('49','21','1','29');
INSERT INTO `glpi_notificationtargets` VALUES ('50','2','1','30');
INSERT INTO `glpi_notificationtargets` VALUES ('51','4','1','30');
INSERT INTO `glpi_notificationtargets` VALUES ('52','3','1','30');
INSERT INTO `glpi_notificationtargets` VALUES ('53','1','1','30');
INSERT INTO `glpi_notificationtargets` VALUES ('54','21','1','30');
INSERT INTO `glpi_notificationtargets` VALUES ('55','3','1','31');
INSERT INTO `glpi_notificationtargets` VALUES ('56','1','1','31');
INSERT INTO `glpi_notificationtargets` VALUES ('57','21','1','31');
INSERT INTO `glpi_notificationtargets` VALUES ('58','3','1','32');
INSERT INTO `glpi_notificationtargets` VALUES ('59','1','1','32');
INSERT INTO `glpi_notificationtargets` VALUES ('60','21','1','32');
INSERT INTO `glpi_notificationtargets` VALUES ('61','3','1','33');
INSERT INTO `glpi_notificationtargets` VALUES ('62','1','1','33');
INSERT INTO `glpi_notificationtargets` VALUES ('63','21','1','33');
INSERT INTO `glpi_notificationtargets` VALUES ('64','3','1','34');
INSERT INTO `glpi_notificationtargets` VALUES ('65','1','1','34');
INSERT INTO `glpi_notificationtargets` VALUES ('66','21','1','34');
INSERT INTO `glpi_notificationtargets` VALUES ('67','3','1','35');
INSERT INTO `glpi_notificationtargets` VALUES ('68','1','1','35');
INSERT INTO `glpi_notificationtargets` VALUES ('69','21','1','35');
INSERT INTO `glpi_notificationtargets` VALUES ('70','3','1','36');
INSERT INTO `glpi_notificationtargets` VALUES ('71','1','1','36');
INSERT INTO `glpi_notificationtargets` VALUES ('72','21','1','36');

### Dump table glpi_notificationtemplates

DROP TABLE IF EXISTS `glpi_notificationtemplates`;
CREATE TABLE `glpi_notificationtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `css` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `itemtype` (`itemtype`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_notificationtemplates` VALUES ('1','MySQL Synchronization','DBConnection','2010-02-01 15:51:46','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('2','Reservations','Reservation','2010-02-03 14:03:45','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('3','Alert Reservation','Reservation','2010-02-03 14:03:45','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('4','Tickets','Ticket','2010-02-07 21:39:15','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('5','Tickets (Simple)','Ticket','2010-02-07 21:39:15','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('6','Alert Tickets not closed','Ticket','2010-02-07 21:39:15','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('7','Tickets Validation','Ticket','2010-02-26 21:39:15','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('8','Cartridges','Cartridge','2010-02-16 13:17:24','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('9','Consumables','Consumable','2010-02-16 13:17:38','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('10','Infocoms','Infocom','2010-02-16 13:17:55','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('11','Licenses','SoftwareLicense','2010-02-16 13:18:12','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('12','Contracts','Contract','2010-02-16 13:18:12','',NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('13','Password Forget','User','2011-03-04 11:35:13',NULL,NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('14','Ticket Satisfaction','Ticket','2011-03-04 11:35:15',NULL,NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('15','Item not unique','FieldUnicity','2011-03-04 11:35:16',NULL,NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('16','Crontask','Crontask','2011-03-04 11:35:16',NULL,NULL);
INSERT INTO `glpi_notificationtemplates` VALUES ('17','Problems','Problem','2011-12-06 09:48:33',NULL,NULL);

### Dump table glpi_notificationtemplatetranslations

DROP TABLE IF EXISTS `glpi_notificationtemplatetranslations`;
CREATE TABLE `glpi_notificationtemplatetranslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificationtemplates_id` int(11) NOT NULL DEFAULT '0',
  `language` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('1','1','','##lang.dbconnection.title##','##lang.dbconnection.delay## : ##dbconnection.delay##
','&lt;p&gt;##lang.dbconnection.delay## : ##dbconnection.delay##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('2','2','','##reservation.action##','======================================================================
##lang.reservation.user##: ##reservation.user##
##lang.reservation.item.name##: ##reservation.itemtype## - ##reservation.item.name##
##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech## ##ENDIFreservation.tech##
##lang.reservation.begin##: ##reservation.begin##
##lang.reservation.end##: ##reservation.end##
##lang.reservation.comment##: ##reservation.comment##
======================================================================
','&lt;!-- description{ color: inherit; background: #ebebeb;border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; } --&gt;
&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.user##:&lt;/span&gt;##reservation.user##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.item.name##:&lt;/span&gt;##reservation.itemtype## - ##reservation.item.name##&lt;br /&gt;##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech####ENDIFreservation.tech##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.begin##:&lt;/span&gt; ##reservation.begin##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.end##:&lt;/span&gt;##reservation.end##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.comment##:&lt;/span&gt; ##reservation.comment##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('3','3','','##reservation.action##  ##reservation.entity##','##lang.reservation.entity## : ##reservation.entity## 

 
##FOREACHreservations## 
##lang.reservation.itemtype## : ##reservation.itemtype##

 ##lang.reservation.item## : ##reservation.item##
 
 ##reservation.url## 

 ##ENDFOREACHreservations##','&lt;p&gt;##lang.reservation.entity## : ##reservation.entity## &lt;br /&gt; &lt;br /&gt;
##FOREACHreservations## &lt;br /&gt;##lang.reservation.itemtype## :  ##reservation.itemtype##&lt;br /&gt;
 ##lang.reservation.item## :  ##reservation.item##&lt;br /&gt; &lt;br /&gt;
 &lt;a href=\"##reservation.url##\"&gt; ##reservation.url##&lt;/a&gt;&lt;br /&gt;
 ##ENDFOREACHreservations##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('4','4','','##ticket.action## ##ticket.title##',' ##IFticket.storestatus=solved##
 ##lang.ticket.url## : ##ticket.urlapprove##
 ##lang.ticket.autoclosewarning##
 ##lang.ticket.solvedate## : ##ticket.solvedate##
 ##lang.ticket.solution.type## : ##ticket.solution.type##
 ##lang.ticket.solution.description## : ##ticket.solution.description## ##ENDIFticket.storestatus##
 ##ELSEticket.storestatus## ##lang.ticket.url## : ##ticket.url## ##ENDELSEticket.storestatus##

 ##lang.ticket.description##

 ##lang.ticket.title## : ##ticket.title##
 ##lang.ticket.authors## : ##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors## ##ELSEticket.authors##--##ENDELSEticket.authors##
 ##lang.ticket.creationdate## : ##ticket.creationdate##
 ##lang.ticket.closedate## : ##ticket.closedate##
 ##lang.ticket.requesttype## : ##ticket.requesttype##
##IFticket.itemtype## ##lang.ticket.item.name## : ##ticket.itemtype## - ##ticket.item.name## ##IFticket.item.model## - ##ticket.item.model## ##ENDIFticket.item.model## ##IFticket.item.serial## - ##ticket.item.serial## ##ENDIFticket.item.serial##  ##IFticket.item.otherserial## -##ticket.item.otherserial## ##ENDIFticket.item.otherserial## ##ENDIFticket.itemtype##
##IFticket.assigntousers## ##lang.ticket.assigntousers## : ##ticket.assigntousers## ##ENDIFticket.assigntousers##
 ##lang.ticket.status## : ##ticket.status##
##IFticket.assigntogroups## ##lang.ticket.assigntogroups## : ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##
 ##lang.ticket.urgency## : ##ticket.urgency##
 ##lang.ticket.impact## : ##ticket.impact##
 ##lang.ticket.priority## : ##ticket.priority##
##IFticket.user.email## ##lang.ticket.user.email## : ##ticket.user.email ##ENDIFticket.user.email##
##IFticket.category## ##lang.ticket.category## : ##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##
 ##lang.ticket.content## : ##ticket.content##
 ##IFticket.storestatus=closed##

 ##lang.ticket.solvedate## : ##ticket.solvedate##
 ##lang.ticket.solution.type## : ##ticket.solution.type##
 ##lang.ticket.solution.description## : ##ticket.solution.description##
 ##ENDIFticket.storestatus##
 ##lang.ticket.numberoffollowups## : ##ticket.numberoffollowups##

##FOREACHfollowups##

 [##followup.date##] ##lang.followup.isprivate## : ##followup.isprivate##
 ##lang.followup.author## ##followup.author##
 ##lang.followup.description## ##followup.description##
 ##lang.followup.date## ##followup.date##
 ##lang.followup.requesttype## ##followup.requesttype##

##ENDFOREACHfollowups##
 ##lang.ticket.numberoftasks## : ##ticket.numberoftasks##

##FOREACHtasks##

 [##task.date##] ##lang.task.isprivate## : ##task.isprivate##
 ##lang.task.author## ##task.author##
 ##lang.task.description## ##task.description##
 ##lang.task.time## ##task.time##
 ##lang.task.category## ##task.category##

##ENDFOREACHtasks##','<!-- description{ color: inherit; background: #ebebeb; border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; }    -->
<div>##IFticket.storestatus=solved##</div>
<div>##lang.ticket.url## : <a href=\"##ticket.urlapprove##\">##ticket.urlapprove##</a> <strong>&#160;</strong></div>
<div><strong>##lang.ticket.autoclosewarning##</strong></div>
<div><span style=\"color: #888888;\"><strong><span style=\"text-decoration: underline;\">##lang.ticket.solvedate##</span></strong></span> : ##ticket.solvedate##<br /><span style=\"text-decoration: underline; color: #888888;\"><strong>##lang.ticket.solution.type##</strong></span> : ##ticket.solution.type##<br /><span style=\"text-decoration: underline; color: #888888;\"><strong>##lang.ticket.solution.description##</strong></span> : ##ticket.solution.description## ##ENDIFticket.storestatus##</div>
<div>##ELSEticket.storestatus## ##lang.ticket.url## : <a href=\"##ticket.url##\">##ticket.url##</a> ##ENDELSEticket.storestatus##</div>
<p class=\"description b\"><strong>##lang.ticket.description##</strong></p>
<p><span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.title##</span>&#160;:##ticket.title## <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.authors##</span>&#160;:##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors##    ##ELSEticket.authors##--##ENDELSEticket.authors## <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.creationdate##</span>&#160;:##ticket.creationdate## <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.closedate##</span>&#160;:##ticket.closedate## <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.requesttype##</span>&#160;:##ticket.requesttype##<br /> ##IFticket.itemtype## <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.item.name##</span>&#160;: ##ticket.itemtype## - ##ticket.item.name##    ##IFticket.item.model## - ##ticket.item.model##    ##ENDIFticket.item.model## ##IFticket.item.serial## -##ticket.item.serial## ##ENDIFticket.item.serial##&#160; ##IFticket.item.otherserial## -##ticket.item.otherserial##  ##ENDIFticket.item.otherserial## ##ENDIFticket.itemtype## <br /> ##IFticket.assigntousers## <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.assigntousers##</span>&#160;: ##ticket.assigntousers## ##ENDIFticket.assigntousers##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\">##lang.ticket.status## </span>&#160;: ##ticket.status##<br /> ##IFticket.assigntogroups## <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.assigntogroups##</span>&#160;: ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.urgency##</span>&#160;: ##ticket.urgency##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.impact##</span>&#160;: ##ticket.impact##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.priority##</span>&#160;: ##ticket.priority## <br /> ##IFticket.user.email##<span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.user.email##</span>&#160;: ##ticket.user.email ##ENDIFticket.user.email##    <br /> ##IFticket.category##<span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\">##lang.ticket.category## </span>&#160;:##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##    <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.content##</span>&#160;: ##ticket.content##</p>
<br />##IFticket.storestatus=closed##<br /><span style=\"text-decoration: underline;\"><strong><span style=\"color: #888888;\">##lang.ticket.solvedate##</span></strong></span> : ##ticket.solvedate##<br /><span style=\"color: #888888;\"><strong><span style=\"text-decoration: underline;\">##lang.ticket.solution.type##</span></strong></span> : ##ticket.solution.type##<br /><span style=\"text-decoration: underline; color: #888888;\"><strong>##lang.ticket.solution.description##</strong></span> : ##ticket.solution.description##<br />##ENDIFticket.storestatus##</p>
<div class=\"description b\">##lang.ticket.numberoffollowups##&#160;: ##ticket.numberoffollowups##</div>
<p>##FOREACHfollowups##</p>
<div class=\"description b\"><br /> <strong> [##followup.date##] <em>##lang.followup.isprivate## : ##followup.isprivate## </em></strong><br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.followup.author## </span> ##followup.author##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.followup.description## </span> ##followup.description##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.followup.date## </span> ##followup.date##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.followup.requesttype## </span> ##followup.requesttype##</div>
<p>##ENDFOREACHfollowups##</p>
<div class=\"description b\">##lang.ticket.numberoftasks##&#160;: ##ticket.numberoftasks##</div>
<p>##FOREACHtasks##</p>
<div class=\"description b\"><br /> <strong> [##task.date##] <em>##lang.task.isprivate## : ##task.isprivate## </em></strong><br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.task.author##</span> ##task.author##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.task.description##</span> ##task.description##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.task.time##</span> ##task.time##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.task.category##</span> ##task.category##</div>
<p>##ENDFOREACHtasks##</p>');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('5','12','','##contract.action##  ##contract.entity##','##lang.contract.entity## : ##contract.entity##

##FOREACHcontracts##
##lang.contract.name## : ##contract.name##
##lang.contract.number## : ##contract.number##
##lang.contract.time## : ##contract.time##
##IFcontract.type####lang.contract.type## : ##contract.type####ENDIFcontract.type##
##contract.url##
##ENDFOREACHcontracts##','&lt;p&gt;##lang.contract.entity## : ##contract.entity##&lt;br /&gt;
&lt;br /&gt;##FOREACHcontracts##&lt;br /&gt;##lang.contract.name## :
##contract.name##&lt;br /&gt;
##lang.contract.number## : ##contract.number##&lt;br /&gt;
##lang.contract.time## : ##contract.time##&lt;br /&gt;
##IFcontract.type####lang.contract.type## : ##contract.type##
##ENDIFcontract.type##&lt;br /&gt;
&lt;a href=\"##contract.url##\"&gt;
##contract.url##&lt;/a&gt;&lt;br /&gt;
##ENDFOREACHcontracts##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('6','5','','##ticket.action## ##ticket.title##','##lang.ticket.url## : ##ticket.url## 

##lang.ticket.description## 


##lang.ticket.title## &#160;:##ticket.title## 

##lang.ticket.authors## &#160;:##IFticket.authors##
##ticket.authors## ##ENDIFticket.authors##
##ELSEticket.authors##--##ENDELSEticket.authors## &#160; 

##IFticket.category## ##lang.ticket.category## &#160;:##ticket.category##
##ENDIFticket.category## ##ELSEticket.category##
##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##

##lang.ticket.content## &#160;: ##ticket.content##
##IFticket.itemtype##
##lang.ticket.item.name## &#160;: ##ticket.itemtype## - ##ticket.item.name##
##ENDIFticket.itemtype##','&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.url##\"&gt;
##ticket.url##&lt;/a&gt;&lt;/div&gt;
&lt;div class=\"description b\"&gt;
##lang.ticket.description##&lt;/div&gt;
&lt;p&gt;&lt;span
style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;
##lang.ticket.title##&lt;/span&gt;&#160;:##ticket.title##
&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;
##lang.ticket.authors##&lt;/span&gt;
##IFticket.authors## ##ticket.authors##
##ENDIFticket.authors##
##ELSEticket.authors##--##ENDELSEticket.authors##
&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;&#160
;&lt;/span&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;
##IFticket.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;
##lang.ticket.category## &lt;/span&gt;&#160;:##ticket.category##
##ENDIFticket.category## ##ELSEticket.category##
##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##
&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;
##lang.ticket.content##&lt;/span&gt;&#160;:
##ticket.content##&lt;br /&gt;##IFticket.itemtype##
&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;
##lang.ticket.item.name##&lt;/span&gt;&#160;:
##ticket.itemtype## - ##ticket.item.name##
##ENDIFticket.itemtype##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('15','15','','##lang.unicity.action##','##lang.unicity.entity## : ##unicity.entity## 

##lang.unicity.itemtype## : ##unicity.itemtype## 

##lang.unicity.message## : ##unicity.message## 

##lang.unicity.action_user## : ##unicity.action_user## 

##lang.unicity.action_type## : ##unicity.action_type## 

##lang.unicity.date## : ##unicity.date##','&lt;p&gt;##lang.unicity.entity## : ##unicity.entity##&lt;/p&gt;
&lt;p&gt;##lang.unicity.itemtype## : ##unicity.itemtype##&lt;/p&gt;
&lt;p&gt;##lang.unicity.message## : ##unicity.message##&lt;/p&gt;
&lt;p&gt;##lang.unicity.action_user## : ##unicity.action_user##&lt;/p&gt;
&lt;p&gt;##lang.unicity.action_type## : ##unicity.action_type##&lt;/p&gt;
&lt;p&gt;##lang.unicity.date## : ##unicity.date##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('7','7','','##ticket.action## ##ticket.title##','##FOREACHvalidations##

##IFvalidation.storestatus=waiting##
##validation.submission.title##
##lang.validation.commentsubmission## : ##validation.commentsubmission##
##ENDIFvalidation.storestatus##
##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##

##lang.ticket.url## : ##ticket.urlvalidation##

##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##
##IFvalidation.commentvalidation##
##lang.validation.commentvalidation## : ##validation.commentvalidation##
##ENDIFvalidation.commentvalidation##
##ENDFOREACHvalidations##','&lt;div&gt;##FOREACHvalidations##&lt;/div&gt;
&lt;p&gt;##IFvalidation.storestatus=waiting##&lt;/p&gt;
&lt;div&gt;##validation.submission.title##&lt;/div&gt;
&lt;div&gt;##lang.validation.commentsubmission## : ##validation.commentsubmission##&lt;/div&gt;
&lt;div&gt;##ENDIFvalidation.storestatus##&lt;/div&gt;
&lt;div&gt;##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##&lt;/div&gt;
&lt;div&gt;&lt;/div&gt;
&lt;div&gt;
&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.urlvalidation##\"&gt; ##ticket.urlvalidation## &lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;p&gt;##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##
&lt;br /&gt; ##IFvalidation.commentvalidation##&lt;br /&gt; ##lang.validation.commentvalidation## :
&#160; ##validation.commentvalidation##&lt;br /&gt; ##ENDIFvalidation.commentvalidation##
&lt;br /&gt;##ENDFOREACHvalidations##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('8','6','','##ticket.action## ##ticket.entity##','##lang.ticket.entity## : ##ticket.entity##
 
##FOREACHtickets##

##lang.ticket.title## : ##ticket.title##
 ##lang.ticket.status## : ##ticket.status##

 ##ticket.url## 
 ##ENDFOREACHtickets##','&lt;table class=\"tab_cadre\" border=\"1\" cellspacing=\"2\" cellpadding=\"3\"&gt;
&lt;tbody&gt;
&lt;tr&gt;
&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.authors##&lt;/span&gt;&lt;/td&gt;
&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.title##&lt;/span&gt;&lt;/td&gt;
&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.priority##&lt;/span&gt;&lt;/td&gt;
&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.status##&lt;/span&gt;&lt;/td&gt;
&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.attribution##&lt;/span&gt;&lt;/td&gt;
&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.creationdate##&lt;/span&gt;&lt;/td&gt;
&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.content##&lt;/span&gt;&lt;/td&gt;
&lt;/tr&gt;
##FOREACHtickets##                   
&lt;tr&gt;
&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.authors##&lt;/span&gt;&lt;/td&gt;
&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;&lt;a href=\"##ticket.url##\"&gt;##ticket.title##&lt;/a&gt;&lt;/span&gt;&lt;/td&gt;
&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.priority##&lt;/span&gt;&lt;/td&gt;
&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.status##&lt;/span&gt;&lt;/td&gt;
&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##IFticket.assigntousers####ticket.assigntousers##&lt;br /&gt;##ENDIFticket.assigntousers####IFticket.assigntogroups##&lt;br /&gt;##ticket.assigntogroups## ##ENDIFticket.assigntogroups####IFticket.assigntosupplier##&lt;br /&gt;##ticket.assigntosupplier## ##ENDIFticket.assigntosupplier##&lt;/span&gt;&lt;/td&gt;
&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.creationdate##&lt;/span&gt;&lt;/td&gt;
&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.content##&lt;/span&gt;&lt;/td&gt;
&lt;/tr&gt;
##ENDFOREACHtickets##
&lt;/tbody&gt;
&lt;/table&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('9','9','','##consumable.action##  ##consumable.entity##','##lang.consumable.entity## : ##consumable.entity##
 

##FOREACHconsumables##
##lang.consumable.item## : ##consumable.item##
 

##lang.consumable.reference## : ##consumable.reference##

##lang.consumable.remaining## : ##consumable.remaining##

##consumable.url## 

##ENDFOREACHconsumables##','&lt;p&gt;
##lang.consumable.entity## : ##consumable.entity##
&lt;br /&gt; &lt;br /&gt;##FOREACHconsumables##
&lt;br /&gt;##lang.consumable.item## : ##consumable.item##&lt;br /&gt;
&lt;br /&gt;##lang.consumable.reference## : ##consumable.reference##&lt;br /&gt;
##lang.consumable.remaining## : ##consumable.remaining##&lt;br /&gt;
&lt;a href=\"##consumable.url##\"&gt; ##consumable.url##&lt;/a&gt;&lt;br /&gt;
   ##ENDFOREACHconsumables##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('10','8','','##cartridge.action##  ##cartridge.entity##','##lang.cartridge.entity## : ##cartridge.entity##
 

##FOREACHcartridges##
##lang.cartridge.item## : ##cartridge.item##
 

##lang.cartridge.reference## : ##cartridge.reference##

##lang.cartridge.remaining## : ##cartridge.remaining##

##cartridge.url## 
 ##ENDFOREACHcartridges##','&lt;p&gt;##lang.cartridge.entity## : ##cartridge.entity##
&lt;br /&gt; &lt;br /&gt;##FOREACHcartridges##
&lt;br /&gt;##lang.cartridge.item## :
##cartridge.item##&lt;br /&gt; &lt;br /&gt;
##lang.cartridge.reference## :
##cartridge.reference##&lt;br /&gt;
##lang.cartridge.remaining## :
##cartridge.remaining##&lt;br /&gt;
&lt;a href=\"##cartridge.url##\"&gt;
##cartridge.url##&lt;/a&gt;&lt;br /&gt;
##ENDFOREACHcartridges##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('11','10','','##infocom.action##  ##infocom.entity##','##lang.infocom.entity## : ##infocom.entity## 
 

##FOREACHinfocoms## 

##lang.infocom.itemtype## : ##infocom.itemtype##

##lang.infocom.item## : ##infocom.item##
 

##lang.infocom.expirationdate## : ##infocom.expirationdate##

##infocom.url## 
 ##ENDFOREACHinfocoms##','&lt;p&gt;##lang.infocom.entity## : ##infocom.entity##
&lt;br /&gt; &lt;br /&gt;##FOREACHinfocoms##
&lt;br /&gt;##lang.infocom.itemtype## : ##infocom.itemtype##&lt;br /&gt;
##lang.infocom.item## : ##infocom.item##&lt;br /&gt; &lt;br /&gt;
##lang.infocom.expirationdate## : ##infocom.expirationdate##
&lt;br /&gt; &lt;a href=\"##infocom.url##\"&gt;
##infocom.url##&lt;/a&gt;&lt;br /&gt;
##ENDFOREACHinfocoms##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('12','11','','##license.action##  ##license.entity##','##lang.license.entity## : ##license.entity##

##FOREACHlicenses## 

##lang.license.item## : ##license.item##

##lang.license.serial## : ##license.serial##

##lang.license.expirationdate## : ##license.expirationdate##

##license.url## 
 ##ENDFOREACHlicenses##','&lt;p&gt;
##lang.license.entity## : ##license.entity##&lt;br /&gt;
##FOREACHlicenses##
&lt;br /&gt;##lang.license.item## : ##license.item##&lt;br /&gt;
##lang.license.serial## : ##license.serial##&lt;br /&gt;
##lang.license.expirationdate## : ##license.expirationdate##
&lt;br /&gt; &lt;a href=\"##license.url##\"&gt; ##license.url##
&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHlicenses##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('13','13','','##user.action##','##user.realname## ##user.firstname##

##lang.passwordforget.information##

##lang.passwordforget.link## ##user.passwordforgeturl##','&lt;p&gt;&lt;strong&gt;##user.realname## ##user.firstname##&lt;/strong&gt;&lt;/p&gt;
&lt;p&gt;##lang.passwordforget.information##&lt;/p&gt;
&lt;p&gt;##lang.passwordforget.link## &lt;a title=\"##user.passwordforgeturl##\" href=\"##user.passwordforgeturl##\"&gt;##user.passwordforgeturl##&lt;/a&gt;&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('14','14','','##ticket.action## ##ticket.title##','##lang.ticket.title## : ##ticket.title##

##lang.ticket.closedate## : ##ticket.closedate##

##lang.satisfaction.text## ##ticket.urlsatisfaction##','&lt;p&gt;##lang.ticket.title## : ##ticket.title##&lt;/p&gt;
&lt;p&gt;##lang.ticket.closedate## : ##ticket.closedate##&lt;/p&gt;
&lt;p&gt;##lang.satisfaction.text## &lt;a href=\"##ticket.urlsatisfaction##\"&gt;##ticket.urlsatisfaction##&lt;/a&gt;&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('16','16','','##crontask.action##','##lang.crontask.warning## 

##FOREACHcrontasks## 
 ##crontask.name## : ##crontask.description##
 
##ENDFOREACHcrontasks##','&lt;p&gt;##lang.crontask.warning##&lt;/p&gt;
&lt;p&gt;##FOREACHcrontasks## &lt;br /&gt;&lt;a href=\"##crontask.url##\"&gt;##crontask.name##&lt;/a&gt; : ##crontask.description##&lt;br /&gt; &lt;br /&gt;##ENDFOREACHcrontasks##&lt;/p&gt;');
INSERT INTO `glpi_notificationtemplatetranslations` VALUES ('17','17','','##problem.action## ##problem.title##','##IFproblem.storestatus=solved##
 ##lang.problem.url## : ##problem.urlapprove##
 ##lang.problem.solvedate## : ##problem.solvedate##
 ##lang.problem.solution.type## : ##problem.solution.type##
 ##lang.problem.solution.description## : ##problem.solution.description## ##ENDIFproblem.storestatus##
 ##ELSEproblem.storestatus## ##lang.problem.url## : ##problem.url## ##ENDELSEproblem.storestatus##

 ##lang.problem.description##

 ##lang.problem.title## &#160;:##problem.title##
 ##lang.problem.authors## &#160;:##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors## ##ELSEproblem.authors##--##ENDELSEproblem.authors##
 ##lang.problem.creationdate## &#160;:##problem.creationdate##
 ##IFproblem.assigntousers## ##lang.problem.assigntousers## &#160;: ##problem.assigntousers## ##ENDIFproblem.assigntousers##
 ##lang.problem.status## &#160;: ##problem.status##
 ##IFproblem.assigntogroups## ##lang.problem.assigntogroups## &#160;: ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##
 ##lang.problem.urgency## &#160;: ##problem.urgency##
 ##lang.problem.impact## &#160;: ##problem.impact##
 ##lang.problem.priority## : ##problem.priority##
##IFproblem.category## ##lang.problem.category## &#160;:##problem.category## ##ENDIFproblem.category## ##ELSEproblem.category## ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##
 ##lang.problem.content## &#160;: ##problem.content##

##IFproblem.storestatus=closed##
 ##lang.problem.solvedate## : ##problem.solvedate##
 ##lang.problem.solution.type## : ##problem.solution.type##
 ##lang.problem.solution.description## : ##problem.solution.description##
##ENDIFproblem.storestatus##
 ##lang.problem.numberoftickets##&#160;: ##problem.numberoftickets##

##FOREACHtickets##
 [##ticket.date##] ##lang.problem.title## : ##ticket.title##
 ##lang.problem.content## ##ticket.content##

##ENDFOREACHtickets##
 ##lang.problem.numberoftasks##&#160;: ##problem.numberoftasks##

##FOREACHtasks##
 [##task.date##]
 ##lang.task.author## ##task.author##
 ##lang.task.description## ##task.description##
 ##lang.task.time## ##task.time##
 ##lang.task.category## ##task.category##

##ENDFOREACHtasks##
','&lt;p&gt;##IFproblem.storestatus=solved##&lt;/p&gt;
&lt;div&gt;##lang.problem.url## : &lt;a href=\"##problem.urlapprove##\"&gt;##problem.urlapprove##&lt;/a&gt;&lt;/div&gt;
&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description## ##ENDIFproblem.storestatus##&lt;/div&gt;
&lt;div&gt;##ELSEproblem.storestatus## ##lang.problem.url## : &lt;a href=\"##problem.url##\"&gt;##problem.url##&lt;/a&gt; ##ENDELSEproblem.storestatus##&lt;/div&gt;
&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.problem.description##&lt;/strong&gt;&lt;/p&gt;
&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.title##&lt;/span&gt;&#160;:##problem.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.authors##&lt;/span&gt;&#160;:##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors##    ##ELSEproblem.authors##--##ENDELSEproblem.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.creationdate##&lt;/span&gt;&#160;:##problem.creationdate## &lt;br /&gt; ##IFproblem.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntousers##&lt;/span&gt;&#160;: ##problem.assigntousers## ##ENDIFproblem.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.status## &lt;/span&gt;&#160;: ##problem.status##&lt;br /&gt; ##IFproblem.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntogroups##&lt;/span&gt;&#160;: ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.urgency##&lt;/span&gt;&#160;: ##problem.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.impact##&lt;/span&gt;&#160;: ##problem.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.priority##&lt;/span&gt; : ##problem.priority## &lt;br /&gt;##IFproblem.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.category## &lt;/span&gt;&#160;:##problem.category##  ##ENDIFproblem.category## ##ELSEproblem.category##  ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.content##&lt;/span&gt;&#160;: ##problem.content##&lt;/p&gt;
&lt;p&gt;##IFproblem.storestatus=closed##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description##&lt;br /&gt;##ENDIFproblem.storestatus##&lt;/p&gt;
&lt;div class=\"description b\"&gt;##lang.problem.numberoftickets##&#160;: ##problem.numberoftickets##&lt;/div&gt;
&lt;p&gt;##FOREACHtickets##&lt;/p&gt;
&lt;div&gt;&lt;strong&gt; [##ticket.date##] &lt;em&gt;##lang.problem.title## : &lt;a href=\"##ticket.url##\"&gt;##ticket.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.content## &lt;/span&gt; ##ticket.content##
&lt;p&gt;##ENDFOREACHtickets##&lt;/p&gt;
&lt;div class=\"description b\"&gt;##lang.problem.numberoftasks##&#160;: ##problem.numberoftasks##&lt;/div&gt;
&lt;p&gt;##FOREACHtasks##&lt;/p&gt;
&lt;div class=\"description b\"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;
&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;
&lt;/div&gt;');

### Dump table glpi_notimportedemails

DROP TABLE IF EXISTS `glpi_notimportedemails`;
CREATE TABLE `glpi_notimportedemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `mailcollectors_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `subject` text,
  `messageid` varchar(255) NOT NULL,
  `reason` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `mailcollectors_id` (`mailcollectors_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


### Dump table glpi_ocsadmininfoslinks

DROP TABLE IF EXISTS `glpi_ocsadmininfoslinks`;
CREATE TABLE `glpi_ocsadmininfoslinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `glpi_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocs_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocsservers_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ocsservers_id` (`ocsservers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_ocslinks

DROP TABLE IF EXISTS `glpi_ocslinks`;
CREATE TABLE `glpi_ocslinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `ocsid` int(11) NOT NULL DEFAULT '0',
  `ocs_deviceid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_auto_update` tinyint(1) NOT NULL DEFAULT '1',
  `last_update` datetime DEFAULT NULL,
  `last_ocs_update` datetime DEFAULT NULL,
  `computer_update` longtext COLLATE utf8_unicode_ci,
  `import_device` longtext COLLATE utf8_unicode_ci,
  `import_disk` longtext COLLATE utf8_unicode_ci,
  `import_software` longtext COLLATE utf8_unicode_ci,
  `import_monitor` longtext COLLATE utf8_unicode_ci,
  `import_peripheral` longtext COLLATE utf8_unicode_ci,
  `import_printer` longtext COLLATE utf8_unicode_ci,
  `ocsservers_id` int(11) NOT NULL DEFAULT '0',
  `import_ip` longtext COLLATE utf8_unicode_ci,
  `ocs_agent_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `import_vm` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ocsid`,`ocsservers_id`),
  KEY `last_update` (`last_update`),
  KEY `ocs_deviceid` (`ocs_deviceid`),
  KEY `last_ocs_update` (`ocsservers_id`,`last_ocs_update`),
  KEY `computers_id` (`computers_id`),
  KEY `use_auto_update` (`use_auto_update`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_ocsservers

DROP TABLE IF EXISTS `glpi_ocsservers`;
CREATE TABLE `glpi_ocsservers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocs_db_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocs_db_passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocs_db_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocs_db_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocs_db_utf8` tinyint(1) NOT NULL DEFAULT '0',
  `checksum` int(11) NOT NULL DEFAULT '0',
  `import_periph` tinyint(1) NOT NULL DEFAULT '0',
  `import_monitor` tinyint(1) NOT NULL DEFAULT '0',
  `import_software` tinyint(1) NOT NULL DEFAULT '0',
  `import_printer` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_name` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_os` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_serial` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_model` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_manufacturer` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_type` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_domain` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_contact` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_comment` tinyint(1) NOT NULL DEFAULT '0',
  `import_device_processor` tinyint(1) NOT NULL DEFAULT '0',
  `import_device_memory` tinyint(1) NOT NULL DEFAULT '0',
  `import_device_hdd` tinyint(1) NOT NULL DEFAULT '0',
  `import_device_iface` tinyint(1) NOT NULL DEFAULT '0',
  `import_device_gfxcard` tinyint(1) NOT NULL DEFAULT '0',
  `import_device_sound` tinyint(1) NOT NULL DEFAULT '0',
  `import_device_drive` tinyint(1) NOT NULL DEFAULT '0',
  `import_device_port` tinyint(1) NOT NULL DEFAULT '0',
  `import_device_modem` tinyint(1) NOT NULL DEFAULT '0',
  `import_registry` tinyint(1) NOT NULL DEFAULT '0',
  `import_os_serial` tinyint(1) NOT NULL DEFAULT '0',
  `import_ip` tinyint(1) NOT NULL DEFAULT '0',
  `import_disk` tinyint(1) NOT NULL DEFAULT '0',
  `import_monitor_comment` tinyint(1) NOT NULL DEFAULT '0',
  `states_id_default` int(11) NOT NULL DEFAULT '0',
  `tag_limit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_exclude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_soft_dict` tinyint(1) NOT NULL DEFAULT '0',
  `cron_sync_number` int(11) DEFAULT '1',
  `deconnection_behavior` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocs_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_behavior` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `import_vms` tinyint(1) NOT NULL DEFAULT '0',
  `import_general_uuid` tinyint(1) NOT NULL DEFAULT '0',
  `ocs_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `is_active` (`is_active`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_ocsservers` VALUES ('1','localhost','ocs','ocs','localhost','ocsweb','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','',NULL,'0','1',NULL,'',NULL,NULL,'1','1','0','0',NULL);

### Dump table glpi_operatingsystems

DROP TABLE IF EXISTS `glpi_operatingsystems`;
CREATE TABLE `glpi_operatingsystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_operatingsystems` VALUES ('1','Microsoft Windows','');
INSERT INTO `glpi_operatingsystems` VALUES ('2','GNU/Linux','');
INSERT INTO `glpi_operatingsystems` VALUES ('3','MAC OS X','');

### Dump table glpi_operatingsystemservicepacks

DROP TABLE IF EXISTS `glpi_operatingsystemservicepacks`;
CREATE TABLE `glpi_operatingsystemservicepacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_operatingsystemversions

DROP TABLE IF EXISTS `glpi_operatingsystemversions`;
CREATE TABLE `glpi_operatingsystemversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_operatingsystemversions` VALUES ('1','XP PRO','');
INSERT INTO `glpi_operatingsystemversions` VALUES ('2','7_HOME_PREMIUM','');
INSERT INTO `glpi_operatingsystemversions` VALUES ('3','Ubuntu 10.04','');
INSERT INTO `glpi_operatingsystemversions` VALUES ('4','11.04','');
INSERT INTO `glpi_operatingsystemversions` VALUES ('5','XP_HOME','');

### Dump table glpi_peripheralmodels

DROP TABLE IF EXISTS `glpi_peripheralmodels`;
CREATE TABLE `glpi_peripheralmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_peripherals

DROP TABLE IF EXISTS `glpi_peripherals`;
CREATE TABLE `glpi_peripherals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `peripheraltypes_id` int(11) NOT NULL DEFAULT '0',
  `peripheralmodels_id` int(11) NOT NULL DEFAULT '0',
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notepad` longtext COLLATE utf8_unicode_ci,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `peripheralmodels_id` (`peripheralmodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `peripheraltypes_id` (`peripheraltypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_peripherals` VALUES ('1','0','MAC MINI','2012-05-16 03:26:27','','','9','3','','C07H52U2D3D0','','1','0','0','MAC MINI','12','0','1','0',NULL,NULL,'22','3','0','0.0000');

### Dump table glpi_peripheraltypes

DROP TABLE IF EXISTS `glpi_peripheraltypes`;
CREATE TABLE `glpi_peripheraltypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_phonemodels

DROP TABLE IF EXISTS `glpi_phonemodels`;
CREATE TABLE `glpi_phonemodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_phonepowersupplies

DROP TABLE IF EXISTS `glpi_phonepowersupplies`;
CREATE TABLE `glpi_phonepowersupplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_phones

DROP TABLE IF EXISTS `glpi_phones`;
CREATE TABLE `glpi_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firmware` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `phonetypes_id` int(11) NOT NULL DEFAULT '0',
  `phonemodels_id` int(11) NOT NULL DEFAULT '0',
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonepowersupplies_id` int(11) NOT NULL DEFAULT '0',
  `number_line` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_headset` tinyint(1) NOT NULL DEFAULT '0',
  `have_hp` tinyint(1) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notepad` longtext COLLATE utf8_unicode_ci,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `phonemodels_id` (`phonemodels_id`),
  KEY `phonepowersupplies_id` (`phonepowersupplies_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `phonetypes_id` (`phonetypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_phonetypes

DROP TABLE IF EXISTS `glpi_phonetypes`;
CREATE TABLE `glpi_phonetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_plugin_genericobject_hdds

DROP TABLE IF EXISTS `glpi_plugin_genericobject_hdds`;
CREATE TABLE `glpi_plugin_genericobject_hdds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `notepad` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PluginGenericobjectHdd';

INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('1','0','0','160','',NULL,'2012-05-29 08:42:42');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('2','0','0','160','',NULL,'2012-05-29 08:42:49');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('3','0','0','120','',NULL,'2012-05-29 08:42:55');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('4','0','0','500','',NULL,'2012-05-29 08:43:00');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('5','0','0','120','',NULL,'2012-05-29 08:43:08');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('6','0','0','128','',NULL,'2012-05-29 08:43:14');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('7','0','0','500','',NULL,'2012-05-29 08:43:20');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('8','0','0','320','',NULL,'2012-05-29 08:43:26');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('9','0','0','120','',NULL,'2012-05-29 08:43:33');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('10','0','0','128','',NULL,'2012-05-29 08:43:39');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('11','0','0','320','',NULL,'2012-05-29 08:43:44');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('12','0','0','500','',NULL,'2012-05-29 08:43:52');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('13','0','0','80','',NULL,'2012-05-29 08:43:57');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('14','0','0','160','',NULL,'2012-05-29 08:44:02');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('15','0','0','500','',NULL,'2012-05-29 08:44:07');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('16','0','0','160','',NULL,'2012-05-29 08:44:15');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('17','0','0','160','',NULL,'2012-05-29 08:44:19');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('18','0','0','128','',NULL,'2012-05-29 08:44:25');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('19','0','0','250','',NULL,'2012-05-29 08:44:29');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('20','0','0','80','',NULL,'2012-05-29 08:44:35');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('21','0','0','500','',NULL,'2012-05-29 08:44:41');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('22','0','0','128','',NULL,'2012-05-29 08:44:47');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('23','0','0','80','',NULL,'2012-05-29 08:44:53');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('24','0','0','80','',NULL,'2012-05-29 08:44:59');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('25','0','0','500','',NULL,'2012-05-29 08:45:05');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('26','0','0','320','',NULL,'2012-05-29 08:45:11');
INSERT INTO `glpi_plugin_genericobject_hdds` VALUES ('27','0','0','320','',NULL,'2012-05-29 08:45:19');

### Dump table glpi_plugin_genericobject_motherboards

DROP TABLE IF EXISTS `glpi_plugin_genericobject_motherboards`;
CREATE TABLE `glpi_plugin_genericobject_motherboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `notepad` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PluginGenericobjectMotherboard';

INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('1','0','0','S775_P5G-MX','',NULL,'2012-05-29 08:30:53');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('2','0','0','S1155_GA-H61M-D2-B3','',NULL,'2012-05-29 08:30:59');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('3','0','0','S1156_GA-P55A-UD3','',NULL,'2012-05-29 08:31:08');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('4','0','0','S775_P5G41TD-M Pro','',NULL,'2012-05-29 08:31:15');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('5','0','0','S1155_GA-H61MA-D3V','',NULL,'2012-05-29 08:31:23');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('6','0','0','S1155_GA-H61M-D2-B3','',NULL,'2012-05-29 08:31:29');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('7','0','0','S1155_GA-H61M-D2-B3','',NULL,'2012-05-29 08:31:49');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('8','0','0','S775_P5Q SE','',NULL,'2012-05-29 08:31:56');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('9','0','0','S1155_GA-H61MA-D3V','',NULL,'2012-05-29 08:32:01');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('10','0','0','S1155_GA-H61M-D2H-USB3','',NULL,'2012-05-29 08:32:15');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('11','0','0','S775_P5G41T-M LE','',NULL,'2012-05-29 08:32:23');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('12','0','0','S775_P5G41T-M LX2/GB','',NULL,'2012-05-29 08:32:31');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('13','0','0','S775_P5GZ-MX','',NULL,'2012-05-29 08:32:37');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('14','0','0','S775_P5G-MX','',NULL,'2012-05-29 08:32:44');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('15','0','0','S1155_GA-H61M-D2-B3','',NULL,'2012-05-29 08:32:52');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('16','0','0','S775_P5G-MX','',NULL,'2012-05-29 08:32:59');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('17','0','0','S775_P5G41T-M LX2/GB','',NULL,'2012-05-29 08:33:05');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('18','0','0','S1155_GA-Z68M-D2H','',NULL,'2012-05-29 08:33:11');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('19','0','0','S775_Topsfield DP43TF','',NULL,'2012-05-29 08:33:48');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('20','0','0','S775_P5GZ-MX','',NULL,'2012-05-29 08:33:54');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('21','0','0','S775_G41C-VS','',NULL,'2012-05-29 08:34:00');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('22','0','0','S1155_GA-H61M-D2-B3','',NULL,'2012-05-29 08:34:07');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('23','0','0','S754_6100K8MB-RS(H)','',NULL,'2012-05-29 08:34:14');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('24','0','0','S754_K8NF6G-VSTA','',NULL,'2012-05-29 08:34:22');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('25','0','0','S1155_GA-H61M-D2-B3','',NULL,'2012-05-29 08:34:29');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('26','0','0','S775_P5Q SE','',NULL,'2012-05-29 08:34:36');
INSERT INTO `glpi_plugin_genericobject_motherboards` VALUES ('27','0','0','S775_P5QL','',NULL,'2012-05-29 08:34:42');

### Dump table glpi_plugin_genericobject_processors

DROP TABLE IF EXISTS `glpi_plugin_genericobject_processors`;
CREATE TABLE `glpi_plugin_genericobject_processors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `notepad` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PluginGenericobjectProcessor';

INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('1','0','0','Pentium E2200','',NULL,'2012-05-29 08:20:11');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('2','0','0','i5-2300','',NULL,'2012-05-29 08:20:16');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('3','0','0','i5-760','',NULL,'2012-05-29 08:20:34');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('4','0','0','Core 2 Quad Q8300','',NULL,'2012-05-29 08:20:39');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('5','0','0','i5-2310','',NULL,'2012-05-29 08:20:47');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('6','0','0','i5-2500','',NULL,'2012-05-29 08:20:53');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('7','0','0','i5-2300','',NULL,'2012-05-29 08:20:59');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('8','0','0','Core 2 Duo E8400','',NULL,'2012-05-29 08:21:07');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('9','0','0','i5-2300','',NULL,'2012-05-29 08:21:15');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('10','0','0','i5-2320','',NULL,'2012-05-29 08:21:21');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('11','0','0','Core 2 Quad Q8300','',NULL,'2012-05-29 08:21:27');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('12','0','0','Core 2 Duo E7500','',NULL,'2012-05-29 08:21:33');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('13','0','0','Core 2 Duo E4300','',NULL,'2012-05-29 08:21:40');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('14','0','0','Pentium E2200','',NULL,'2012-05-29 08:21:45');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('15','0','0','i5-2300','',NULL,'2012-05-29 08:21:51');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('16','0','0','Pentium E2200','',NULL,'2012-05-29 08:21:58');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('17','0','0','Core 2 Duo E7500','',NULL,'2012-05-29 08:22:09');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('18','0','0','i5-2500','',NULL,'2012-05-29 08:22:15');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('19','0','0','Core 2 Duo E8400	','',NULL,'2012-05-29 08:22:23');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('20','0','0','Core 2 Duo E4300','',NULL,'2012-05-29 08:22:29');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('21','0','0','Core 2 Quad Q9300','',NULL,'2012-05-29 08:22:35');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('22','0','0','i5-2310','',NULL,'2012-05-29 08:22:43');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('23','0','0','Sempron','',NULL,'2012-05-29 08:22:51');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('24','0','0','Sempron','',NULL,'2012-05-29 08:22:56');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('25','0','0','i5-2300','',NULL,'2012-05-29 08:23:05');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('26','0','0','Core 2 Duo E7600','',NULL,'2012-05-29 08:23:11');
INSERT INTO `glpi_plugin_genericobject_processors` VALUES ('27','0','0','Dual-Core E5300','',NULL,'2012-05-29 08:23:18');

### Dump table glpi_plugin_genericobject_profiles

DROP TABLE IF EXISTS `glpi_plugin_genericobject_profiles`;
CREATE TABLE `glpi_plugin_genericobject_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `right` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `open_ticket` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`profiles_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_plugin_genericobject_profiles` VALUES ('1','4','PluginGenericobjectRam','w','1');
INSERT INTO `glpi_plugin_genericobject_profiles` VALUES ('2','4','PluginGenericobjectProcessor','w','1');
INSERT INTO `glpi_plugin_genericobject_profiles` VALUES ('3','4','PluginGenericobjectMotherboard','w','1');
INSERT INTO `glpi_plugin_genericobject_profiles` VALUES ('4','4','PluginGenericobjectOs','w','1');
INSERT INTO `glpi_plugin_genericobject_profiles` VALUES ('5','4','PluginGenericobjectHdd','w','1');

### Dump table glpi_plugin_genericobject_rams

DROP TABLE IF EXISTS `glpi_plugin_genericobject_rams`;
CREATE TABLE `glpi_plugin_genericobject_rams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `notepad` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PluginGenericobjectRam';

INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('1','0','0','2GB_DDR2_KINGSTON','',NULL,'2012-05-29 08:02:38');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('2','0','0','2GB_DDR2_KINGSTON','',NULL,'2012-05-29 08:03:03');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('3','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:03:25');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('4','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:03:29');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('5','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:03:37');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('6','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:03:40');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('7','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:03:43');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('8','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:03:46');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('9','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:03:55');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('10','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:03:58');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('11','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:04:09');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('12','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:04:12');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('13','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:04:25');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('14','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:04:28');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('15','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:04:38');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('16','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:04:41');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('17','0','0','1GB_DDR2_SAMSUNG','',NULL,'2012-05-29 08:04:52');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('18','0','0','1GB_DDR2_SAMSUNG','',NULL,'2012-05-29 08:04:55');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('19','0','0','1GB_DDR2_SAMSUNG','',NULL,'2012-05-29 08:04:58');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('20','0','0','1GB_DDR2_SAMSUNG','',NULL,'2012-05-29 08:05:00');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('21','0','0','4GB_DDR3_SAMSUNG','',NULL,'2012-05-29 08:05:15');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('22','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:05:26');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('23','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:05:29');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('24','0','0','4GB_DDR3_SAMSUNG','',NULL,'2012-05-29 08:05:40');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('25','0','0','4GB_DDR3_SAMSUNG','',NULL,'2012-05-29 08:05:43');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('26','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:05:54');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('27','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:06:01');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('28','0','0','2GB_DDR2_KINGSTON','',NULL,'2012-05-29 08:06:08');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('29','0','0','2GB_DDR2_KINGSTON','',NULL,'2012-05-29 08:06:14');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('30','0','0','2GB_DDR2_KINGSTON','',NULL,'2012-05-29 08:06:23');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('31','0','0','2GB_DDR2_KINGSTON','',NULL,'2012-05-29 08:06:26');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('32','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:15:48');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('33','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:15:53');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('34','0','0','2GB_DDR2_KINGSTON','',NULL,'2012-05-29 08:16:01');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('35','0','0','2GB_DDR2_KINGSTON','',NULL,'2012-05-29 08:16:04');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('36','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:16:18');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('37','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:16:21');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('38','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:17:03');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('39','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:17:07');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('40','0','0','2GB_DDR2_TRANSCEND','',NULL,'2012-05-29 08:17:15');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('41','0','0','2GB_DDR2_TRANSCEND','',NULL,'2012-05-29 08:17:18');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('42','0','0','2GB_DDR2_HYNIX','',NULL,'2012-05-29 08:17:28');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('43','0','0','2GB_DDR2_HYNIX','',NULL,'2012-05-29 08:17:31');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('44','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:17:38');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('45','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:17:41');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('46','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:17:48');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('47','0','0','4GB_DDR3_HYNIX','',NULL,'2012-05-29 08:17:54');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('48','0','0','1GB_DDR1_NONAME','',NULL,'2012-05-29 08:18:02');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('49','0','0','1GB_DDR1_NONAME','',NULL,'2012-05-29 08:18:07');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('50','0','0','1GB_DDR1_NONAME','',NULL,'2012-05-29 08:18:14');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('51','0','0','1GB_DDR1_NONAME','',NULL,'2012-05-29 08:18:17');
INSERT INTO `glpi_plugin_genericobject_rams` VALUES ('52','0','0','4GB_DDR3_KINGSTON','',NULL,'2012-05-29 08:18:29');

### Dump table glpi_plugin_genericobject_types

DROP TABLE IF EXISTS `glpi_plugin_genericobject_types`;
CREATE TABLE `glpi_plugin_genericobject_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_unicity` tinyint(1) NOT NULL DEFAULT '0',
  `use_history` tinyint(1) NOT NULL DEFAULT '0',
  `use_infocoms` tinyint(1) NOT NULL DEFAULT '0',
  `use_contracts` tinyint(1) NOT NULL DEFAULT '0',
  `use_documents` tinyint(1) NOT NULL DEFAULT '0',
  `use_tickets` tinyint(1) NOT NULL DEFAULT '0',
  `use_links` tinyint(1) NOT NULL DEFAULT '0',
  `use_loans` tinyint(1) NOT NULL DEFAULT '0',
  `use_network_ports` tinyint(1) NOT NULL DEFAULT '0',
  `use_direct_connections` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_datainjection` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_pdf` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_order` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_uninstall` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_geninventorynumber` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Object types definition table';

INSERT INTO `glpi_plugin_genericobject_types` VALUES ('1','0','PluginGenericobjectRam','1','ram','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `glpi_plugin_genericobject_types` VALUES ('2','0','PluginGenericobjectProcessor','1','processor','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `glpi_plugin_genericobject_types` VALUES ('3','0','PluginGenericobjectMotherboard','1','motherboard','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `glpi_plugin_genericobject_types` VALUES ('4','0','PluginGenericobjectOs','1','os','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO `glpi_plugin_genericobject_types` VALUES ('5','0','PluginGenericobjectHdd','1','hdd','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');

### Dump table glpi_plugingenericobjectos

DROP TABLE IF EXISTS `glpi_plugingenericobjectos`;
CREATE TABLE `glpi_plugingenericobjectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `notepad` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PluginGenericobjectOs';

INSERT INTO `glpi_plugingenericobjectos` VALUES ('1','0','0','XP PRO','',NULL,'2012-05-29 08:38:28');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('2','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:38:35');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('3','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:38:40');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('4','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:38:47');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('5','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:38:55');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('6','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:39:02');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('7','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:39:09');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('8','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:39:16');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('9','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:39:32');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('10','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:39:40');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('11','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:39:47');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('12','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:39:54');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('13','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:40:00');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('14','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:40:07');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('15','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:40:15');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('16','0','0','XP PRO','',NULL,'2012-05-29 08:40:22');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('17','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:40:29');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('18','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:40:35');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('19','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:40:41');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('20','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:40:47');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('21','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:40:53');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('22','0','0','7_HOME_PREMIUM','',NULL,'2012-05-29 08:41:00');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('23','0','0','XP PRO','',NULL,'2012-05-29 08:41:06');
INSERT INTO `glpi_plugingenericobjectos` VALUES ('24','0','0','XP_HOME','',NULL,'2012-05-29 08:41:13');

### Dump table glpi_plugins

DROP TABLE IF EXISTS `glpi_plugins`;
CREATE TABLE `glpi_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php PLUGIN_* constant',
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`directory`),
  KEY `state` (`state`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_plugins` VALUES ('1','genericobject','Objects management','2.1.0','1','Alexandre Delaunay & Walid Nouh','https://forge.indepnet.net/projects/show/genericobject','GPLv2+');

### Dump table glpi_printermodels

DROP TABLE IF EXISTS `glpi_printermodels`;
CREATE TABLE `glpi_printermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_printers

DROP TABLE IF EXISTS `glpi_printers`;
CREATE TABLE `glpi_printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_serial` tinyint(1) NOT NULL DEFAULT '0',
  `have_parallel` tinyint(1) NOT NULL DEFAULT '0',
  `have_usb` tinyint(1) NOT NULL DEFAULT '0',
  `have_wifi` tinyint(1) NOT NULL DEFAULT '0',
  `have_ethernet` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `memory_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `networks_id` int(11) NOT NULL DEFAULT '0',
  `printertypes_id` int(11) NOT NULL DEFAULT '0',
  `printermodels_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `init_pages_counter` int(11) NOT NULL DEFAULT '0',
  `last_pages_counter` int(11) NOT NULL DEFAULT '0',
  `notepad` longtext COLLATE utf8_unicode_ci,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `domains_id` (`domains_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `printermodels_id` (`printermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `printertypes_id` (`printertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `last_pages_counter` (`last_pages_counter`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_printertypes

DROP TABLE IF EXISTS `glpi_printertypes`;
CREATE TABLE `glpi_printertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_problems

DROP TABLE IF EXISTS `glpi_problems`;
CREATE TABLE `glpi_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `solvedate` datetime DEFAULT NULL,
  `closedate` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `users_id_recipient` int(11) NOT NULL DEFAULT '0',
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `suppliers_id_assign` int(11) NOT NULL DEFAULT '0',
  `urgency` int(11) NOT NULL DEFAULT '1',
  `impact` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '1',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `impactcontent` longtext COLLATE utf8_unicode_ci,
  `causecontent` longtext COLLATE utf8_unicode_ci,
  `symptomcontent` longtext COLLATE utf8_unicode_ci,
  `solutiontypes_id` int(11) NOT NULL DEFAULT '0',
  `solution` text COLLATE utf8_unicode_ci,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `begin_waiting_date` datetime DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT '0',
  `close_delay_stat` int(11) NOT NULL DEFAULT '0',
  `solve_delay_stat` int(11) NOT NULL DEFAULT '0',
  `notepad` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`(1)),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `suppliers_id_assign` (`suppliers_id_assign`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `due_date` (`due_date`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_problems_tickets

DROP TABLE IF EXISTS `glpi_problems_tickets`;
CREATE TABLE `glpi_problems_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_problems_users

DROP TABLE IF EXISTS `glpi_problems_users`;
CREATE TABLE `glpi_problems_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_problemtasks

DROP TABLE IF EXISTS `glpi_problemtasks`;
CREATE TABLE `glpi_problemtasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `problems_id` (`problems_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `state` (`state`),
  KEY `taskcategories_id` (`taskcategories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_profiles

DROP TABLE IF EXISTS `glpi_profiles`;
CREATE TABLE `glpi_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interface` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'helpdesk',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `computer` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `software` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `networking` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `printer` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peripheral` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cartridge` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumable` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_enterprise` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contract` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `infocom` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `knowbase` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `knowbase_admin` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `faq` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reservation_helpdesk` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reservation_central` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reports` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocsng` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_ocsng` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sync_ocsng` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dropdown` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_dropdown` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typedoc` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_rule_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_ocs` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_ldap` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_softwarecategories` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_config` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_config_global` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `check_update` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_authtype` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfer` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logs` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reminder_public` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bookmark_public` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backup` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delete_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_followups` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_add_followups` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `global_add_followups` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `global_add_tasks` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_priority` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `own_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `steal_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_all_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_assign_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_full_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observe_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_followups` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_tasks` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_planning` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_group_planning` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_all_planning` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statistic` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_update` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `helpdesk_hardware` int(11) NOT NULL DEFAULT '0',
  `helpdesk_item_type` text COLLATE utf8_unicode_ci,
  `ticket_status` text COLLATE utf8_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `show_group_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_group_hardware` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_dictionnary_software` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_dictionnary_dropdown` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `import_externalauth_users` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_mailcollector` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `validate_ticket` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_validation` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendar` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sla` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_dictionnary_printer` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clean_ocsng` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_own_followups` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delete_followups` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_helpdesk` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_my_problem` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_all_problem` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edit_all_problem` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_status` text COLLATE utf8_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `create_ticket_on_login` tinyint(1) NOT NULL DEFAULT '0',
  `tickettemplate` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticketrecurrent` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interface` (`interface`),
  KEY `is_default` (`is_default`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_profiles` VALUES ('1','Self-Service','helpdesk','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'r','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'r',NULL,NULL,'1',NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,'1','1','[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\"]',NULL,'0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL);
INSERT INTO `glpi_profiles` VALUES ('2','Observer','central','0','r','r','r','r','r','r','r','r','r','r','r','r','r','r','r',NULL,'r','1','r','r',NULL,'r',NULL,NULL,NULL,NULL,'r','r',NULL,NULL,NULL,NULL,NULL,NULL,'w',NULL,'r',NULL,'r','r','r',NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','0','0','0','0','0','1','0','0','1','1','0','1','0','0','1','0','0','1','1','1','[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\"]',NULL,'0','0',NULL,NULL,'r',NULL,NULL,NULL,NULL,NULL,'1','1',NULL,NULL,NULL,NULL,NULL,'0',NULL,'1','1',NULL,NULL,'0',NULL,NULL);
INSERT INTO `glpi_profiles` VALUES ('3','Admin','central','0','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w',NULL,'w','1','w','r','w','r','w','w','w','w','w','w',NULL,NULL,NULL,NULL,NULL,NULL,'w','w','r','r','w','w','w',NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','3','[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\"]',NULL,'0','0',NULL,NULL,'w','w',NULL,NULL,NULL,NULL,'1','1','w',NULL,NULL,'w','1','1',NULL,'1','1','1',NULL,'0',NULL,NULL);
INSERT INTO `glpi_profiles` VALUES ('4','Super-Admin','central','0','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','1','w','1','w','r','w','r','w','w','w','w','w','w','w','r','w','w','w','w','w','w','r','w','w','w','w','w','w','r','w','w','w','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','3','[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\"]',NULL,'0','0','w','w','w','w','w','w',NULL,NULL,'1','1','w','w','w','w','1','1','w','1','1','1',NULL,'0','w','w');
INSERT INTO `glpi_profiles` VALUES ('5','Hotliner','central','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'1',NULL,'1',NULL,'1',NULL,NULL,NULL,'1','1',NULL,'1','1',NULL,NULL,'1',NULL,NULL,'1','1','3','[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\"]',NULL,NULL,NULL,NULL,NULL,NULL,'w',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,'1',NULL,NULL,'1','r',NULL);
INSERT INTO `glpi_profiles` VALUES ('6','Technician','central','0','w','w','w','w','w','w','w','w','w','w',NULL,'w',NULL,NULL,'w',NULL,'w','1','w','r',NULL,'r','w',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'w',NULL,'r','r','r',NULL,'w',NULL,NULL,'1',NULL,'1',NULL,'1','1','1',NULL,'1',NULL,NULL,'1','1','1','1','1','1','1',NULL,NULL,'1','1','3','[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\"]',NULL,NULL,NULL,NULL,NULL,NULL,'w',NULL,NULL,NULL,NULL,NULL,'1',NULL,'r',NULL,NULL,'1',NULL,NULL,'1','1',NULL,NULL,'0','r','r');
INSERT INTO `glpi_profiles` VALUES ('7','Supervisor','central','0','w','w','w','w','w','w','w','w','w','w',NULL,'w',NULL,NULL,'w',NULL,'w','1','w','r',NULL,'r','w',NULL,'w',NULL,NULL,NULL,NULL,'r','w',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'w',NULL,'r','r','r','r','w',NULL,NULL,'1','1','1',NULL,'1','1','1','1','1','1','1','1','1','1','1','1','1','1',NULL,'1','1','1','3','[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\"]',NULL,NULL,NULL,NULL,NULL,NULL,'w',NULL,'w',NULL,NULL,'1','1','w','w',NULL,NULL,'1','1',NULL,'1','1','1',NULL,'0','w','w');

### Dump table glpi_profiles_reminders

DROP TABLE IF EXISTS `glpi_profiles_reminders`;
CREATE TABLE `glpi_profiles_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_profiles_users

DROP TABLE IF EXISTS `glpi_profiles_users`;
CREATE TABLE `glpi_profiles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `users_id` (`users_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_profiles_users` VALUES ('2','2','4','0','1','0');
INSERT INTO `glpi_profiles_users` VALUES ('3','3','1','0','1','0');
INSERT INTO `glpi_profiles_users` VALUES ('4','4','6','0','1','0');
INSERT INTO `glpi_profiles_users` VALUES ('5','5','2','0','1','0');
INSERT INTO `glpi_profiles_users` VALUES ('17','12','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('15','10','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('80','8','4','0','1','0');
INSERT INTO `glpi_profiles_users` VALUES ('79','9','4','0','1','0');
INSERT INTO `glpi_profiles_users` VALUES ('10','7','3','0','0','0');
INSERT INTO `glpi_profiles_users` VALUES ('11','6','3','0','0','0');
INSERT INTO `glpi_profiles_users` VALUES ('16','11','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('18','13','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('19','14','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('20','15','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('21','16','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('22','17','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('23','18','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('24','19','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('25','20','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('26','21','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('27','22','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('28','23','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('29','24','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('30','25','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('31','26','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('32','27','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('33','28','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('34','29','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('35','30','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('36','31','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('37','32','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('38','33','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('39','34','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('40','35','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('41','36','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('42','37','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('43','38','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('44','39','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('45','40','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('46','41','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('47','42','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('48','43','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('49','44','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('50','45','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('51','46','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('52','47','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('53','48','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('54','49','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('55','50','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('56','51','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('57','52','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('58','53','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('59','54','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('60','55','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('61','56','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('62','57','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('63','58','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('64','59','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('65','60','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('66','61','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('67','62','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('68','63','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('69','64','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('70','65','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('71','66','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('72','67','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('73','68','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('74','69','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('75','70','1','0','0','1');
INSERT INTO `glpi_profiles_users` VALUES ('76','71','1','0','0','1');

### Dump table glpi_registrykeys

DROP TABLE IF EXISTS `glpi_registrykeys`;
CREATE TABLE `glpi_registrykeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `hive` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocs_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_reminders

DROP TABLE IF EXISTS `glpi_reminders`;
CREATE TABLE `glpi_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `is_planned` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `begin_view_date` datetime DEFAULT NULL,
  `end_view_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `is_planned` (`is_planned`),
  KEY `state` (`state`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_reminders_users

DROP TABLE IF EXISTS `glpi_reminders_users`;
CREATE TABLE `glpi_reminders_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_requesttypes

DROP TABLE IF EXISTS `glpi_requesttypes`;
CREATE TABLE `glpi_requesttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_helpdesk_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail_default` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_helpdesk_default` (`is_helpdesk_default`),
  KEY `is_mail_default` (`is_mail_default`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_requesttypes` VALUES ('1','Helpdesk','1','0',NULL);
INSERT INTO `glpi_requesttypes` VALUES ('2','E-Mail','0','1',NULL);
INSERT INTO `glpi_requesttypes` VALUES ('3','Phone','0','0',NULL);
INSERT INTO `glpi_requesttypes` VALUES ('4','Direct','0','0',NULL);
INSERT INTO `glpi_requesttypes` VALUES ('5','Written','0','0',NULL);
INSERT INTO `glpi_requesttypes` VALUES ('6','Other','0','0',NULL);

### Dump table glpi_reservationitems

DROP TABLE IF EXISTS `glpi_reservationitems`;
CREATE TABLE `glpi_reservationitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_reservations

DROP TABLE IF EXISTS `glpi_reservations`;
CREATE TABLE `glpi_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationitems_id` int(11) NOT NULL DEFAULT '0',
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `group` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `reservationitems_id` (`reservationitems_id`),
  KEY `users_id` (`users_id`),
  KEY `resagroup` (`reservationitems_id`,`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_ruleactions

DROP TABLE IF EXISTS `glpi_ruleactions`;
CREATE TABLE `glpi_ruleactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'VALUE IN (assign, regex_result, append_regex_result, affectbyip, affectbyfqdn, affectbymac)',
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `field_value` (`field`(50),`value`(50))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_ruleactions` VALUES ('1','1','assign','entities_id','0');
INSERT INTO `glpi_ruleactions` VALUES ('2','2','assign','entities_id','0');
INSERT INTO `glpi_ruleactions` VALUES ('3','3','assign','entities_id','0');
INSERT INTO `glpi_ruleactions` VALUES ('4','4','assign','_refuse_email_no_response','1');
INSERT INTO `glpi_ruleactions` VALUES ('5','5','assign','_refuse_email_no_response','1');

### Dump table glpi_rulecachecomputermodels

DROP TABLE IF EXISTS `glpi_rulecachecomputermodels`;
CREATE TABLE `glpi_rulecachecomputermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecachecomputertypes

DROP TABLE IF EXISTS `glpi_rulecachecomputertypes`;
CREATE TABLE `glpi_rulecachecomputertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecachemanufacturers

DROP TABLE IF EXISTS `glpi_rulecachemanufacturers`;
CREATE TABLE `glpi_rulecachemanufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecachemonitormodels

DROP TABLE IF EXISTS `glpi_rulecachemonitormodels`;
CREATE TABLE `glpi_rulecachemonitormodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecachemonitortypes

DROP TABLE IF EXISTS `glpi_rulecachemonitortypes`;
CREATE TABLE `glpi_rulecachemonitortypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecachenetworkequipmentmodels

DROP TABLE IF EXISTS `glpi_rulecachenetworkequipmentmodels`;
CREATE TABLE `glpi_rulecachenetworkequipmentmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecachenetworkequipmenttypes

DROP TABLE IF EXISTS `glpi_rulecachenetworkequipmenttypes`;
CREATE TABLE `glpi_rulecachenetworkequipmenttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecacheoperatingsystems

DROP TABLE IF EXISTS `glpi_rulecacheoperatingsystems`;
CREATE TABLE `glpi_rulecacheoperatingsystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecacheoperatingsystemservicepacks

DROP TABLE IF EXISTS `glpi_rulecacheoperatingsystemservicepacks`;
CREATE TABLE `glpi_rulecacheoperatingsystemservicepacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecacheoperatingsystemversions

DROP TABLE IF EXISTS `glpi_rulecacheoperatingsystemversions`;
CREATE TABLE `glpi_rulecacheoperatingsystemversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecacheperipheralmodels

DROP TABLE IF EXISTS `glpi_rulecacheperipheralmodels`;
CREATE TABLE `glpi_rulecacheperipheralmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecacheperipheraltypes

DROP TABLE IF EXISTS `glpi_rulecacheperipheraltypes`;
CREATE TABLE `glpi_rulecacheperipheraltypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecachephonemodels

DROP TABLE IF EXISTS `glpi_rulecachephonemodels`;
CREATE TABLE `glpi_rulecachephonemodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecachephonetypes

DROP TABLE IF EXISTS `glpi_rulecachephonetypes`;
CREATE TABLE `glpi_rulecachephonetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecacheprintermodels

DROP TABLE IF EXISTS `glpi_rulecacheprintermodels`;
CREATE TABLE `glpi_rulecacheprintermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecacheprinters

DROP TABLE IF EXISTS `glpi_rulecacheprinters`;
CREATE TABLE `glpi_rulecacheprinters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_manufacturer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ignore_ocs_import` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_global` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecacheprintertypes

DROP TABLE IF EXISTS `glpi_rulecacheprintertypes`;
CREATE TABLE `glpi_rulecacheprintertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecachesoftwares

DROP TABLE IF EXISTS `glpi_rulecachesoftwares`;
CREATE TABLE `glpi_rulecachesoftwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_manufacturer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ignore_ocs_import` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_helpdesk_visible` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_entities_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `old_value` (`old_value`),
  KEY `rules_id` (`rules_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_rulecriterias

DROP TABLE IF EXISTS `glpi_rulecriterias`;
CREATE TABLE `glpi_rulecriterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `criteria` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `condition` (`condition`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_rulecriterias` VALUES ('1','1','TAG','0','*');
INSERT INTO `glpi_rulecriterias` VALUES ('2','2','uid','0','*');
INSERT INTO `glpi_rulecriterias` VALUES ('3','2','samaccountname','0','*');
INSERT INTO `glpi_rulecriterias` VALUES ('4','2','MAIL_EMAIL','0','*');
INSERT INTO `glpi_rulecriterias` VALUES ('5','3','subject','6','/.*/');
INSERT INTO `glpi_rulecriterias` VALUES ('6','4','x-auto-response-suppress','6','/\\S+/');
INSERT INTO `glpi_rulecriterias` VALUES ('7','5','auto-submitted','6','/\\S+/');
INSERT INTO `glpi_rulecriterias` VALUES ('8','5','auto-submitted','1','no');

### Dump table glpi_rulerightparameters

DROP TABLE IF EXISTS `glpi_rulerightparameters`;
CREATE TABLE `glpi_rulerightparameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_rulerightparameters` VALUES ('1','(LDAP)Organization','o','');
INSERT INTO `glpi_rulerightparameters` VALUES ('2','(LDAP)Common Name','cn','');
INSERT INTO `glpi_rulerightparameters` VALUES ('3','(LDAP)Department Number','departmentnumber','');
INSERT INTO `glpi_rulerightparameters` VALUES ('4','(LDAP)Email','mail','');
INSERT INTO `glpi_rulerightparameters` VALUES ('5','Object Class','objectclass','');
INSERT INTO `glpi_rulerightparameters` VALUES ('6','(LDAP)User ID','uid','');
INSERT INTO `glpi_rulerightparameters` VALUES ('7','(LDAP)Telephone Number','phone','');
INSERT INTO `glpi_rulerightparameters` VALUES ('8','(LDAP)Employee Number','employeenumber','');
INSERT INTO `glpi_rulerightparameters` VALUES ('9','(LDAP)Manager','manager','');
INSERT INTO `glpi_rulerightparameters` VALUES ('10','(LDAP)DistinguishedName','dn','');
INSERT INTO `glpi_rulerightparameters` VALUES ('12','(AD)User ID','samaccountname','');
INSERT INTO `glpi_rulerightparameters` VALUES ('13','(LDAP) Title','title','');

### Dump table glpi_rules

DROP TABLE IF EXISTS `glpi_rules`;
CREATE TABLE `glpi_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `sub_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ranking` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `match` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `sub_type` (`sub_type`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_rules` VALUES ('1','0','RuleOcs','1','Root','','AND','1',NULL,NULL,'0');
INSERT INTO `glpi_rules` VALUES ('2','0','RuleRight','1','Root','','OR','1',NULL,NULL,'0');
INSERT INTO `glpi_rules` VALUES ('3','0','RuleMailCollector','3','Root','','OR','1',NULL,NULL,'0');
INSERT INTO `glpi_rules` VALUES ('4','0','RuleMailCollector','1','Auto-Reply X-Auto-Response-Suppress','Exclude Auto-Reply emails using X-Auto-Response-Suppress header','AND','1',NULL,'2011-01-18 11:40:42','1');
INSERT INTO `glpi_rules` VALUES ('5','0','RuleMailCollector','2','Auto-Reply Auto-Submitted','Exclude Auto-Reply emails using Auto-Submitted header','AND','1',NULL,'2011-01-18 11:40:42','1');

### Dump table glpi_slalevelactions

DROP TABLE IF EXISTS `glpi_slalevelactions`;
CREATE TABLE `glpi_slalevelactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_slalevels

DROP TABLE IF EXISTS `glpi_slalevels`;
CREATE TABLE `glpi_slalevels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slas_id` int(11) NOT NULL DEFAULT '0',
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `slas_id` (`slas_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_slalevels_tickets

DROP TABLE IF EXISTS `glpi_slalevels_tickets`;
CREATE TABLE `glpi_slalevels_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_slas

DROP TABLE IF EXISTS `glpi_slas`;
CREATE TABLE `glpi_slas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `resolution_time` int(11) NOT NULL,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `calendars_id` (`calendars_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_softwarecategories

DROP TABLE IF EXISTS `glpi_softwarecategories`;
CREATE TABLE `glpi_softwarecategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_softwarecategories` VALUES ('1','FUSION',NULL);

### Dump table glpi_softwarelicenses

DROP TABLE IF EXISTS `glpi_softwarelicenses`;
CREATE TABLE `glpi_softwarelicenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `softwares_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `softwarelicensetypes_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `softwareversions_id_buy` int(11) NOT NULL DEFAULT '0',
  `softwareversions_id_use` int(11) NOT NULL DEFAULT '0',
  `expire` date DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `expire` (`expire`),
  KEY `softwareversions_id_buy` (`softwareversions_id_buy`),
  KEY `entities_id` (`entities_id`),
  KEY `softwares_id` (`softwares_id`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  KEY `softwareversions_id_use` (`softwareversions_id_use`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_softwarelicensetypes

DROP TABLE IF EXISTS `glpi_softwarelicensetypes`;
CREATE TABLE `glpi_softwarelicensetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_softwarelicensetypes` VALUES ('1','OEM','');

### Dump table glpi_softwares

DROP TABLE IF EXISTS `glpi_softwares`;
CREATE TABLE `glpi_softwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_update` tinyint(1) NOT NULL DEFAULT '0',
  `softwares_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `notepad` longtext COLLATE utf8_unicode_ci,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_helpdesk_visible` tinyint(1) NOT NULL DEFAULT '1',
  `softwarecategories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_update` (`is_update`),
  KEY `softwarecategories_id` (`softwarecategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `softwares_id` (`softwares_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_softwares` VALUES ('1','0','0','Microsoft Windows XP PRO','','1','9','1','0','0','8','0','0',NULL,'2012-05-14 09:38:13',NULL,'60','1','0.0000','1','0');

### Dump table glpi_softwareversions

DROP TABLE IF EXISTS `glpi_softwareversions`;
CREATE TABLE `glpi_softwareversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `softwares_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `operatingsystems_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `softwares_id` (`softwares_id`),
  KEY `states_id` (`states_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `operatingsystems_id` (`operatingsystems_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_solutiontemplates

DROP TABLE IF EXISTS `glpi_solutiontemplates`;
CREATE TABLE `glpi_solutiontemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `solutiontypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_solutiontypes

DROP TABLE IF EXISTS `glpi_solutiontypes`;
CREATE TABLE `glpi_solutiontypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_states

DROP TABLE IF EXISTS `glpi_states`;
CREATE TABLE `glpi_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `states_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `unicity` (`states_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_suppliers

DROP TABLE IF EXISTS `glpi_suppliers`;
CREATE TABLE `glpi_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliertypes_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notepad` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `suppliertypes_id` (`suppliertypes_id`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_suppliertypes

DROP TABLE IF EXISTS `glpi_suppliertypes`;
CREATE TABLE `glpi_suppliertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_taskcategories

DROP TABLE IF EXISTS `glpi_taskcategories`;
CREATE TABLE `glpi_taskcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_helpdeskvisible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_ticketfollowups

DROP TABLE IF EXISTS `glpi_ticketfollowups`;
CREATE TABLE `glpi_ticketfollowups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `requesttypes_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `users_id` (`users_id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `is_private` (`is_private`),
  KEY `requesttypes_id` (`requesttypes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_ticketrecurrents

DROP TABLE IF EXISTS `glpi_ticketrecurrents`;
CREATE TABLE `glpi_ticketrecurrents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `begin_date` datetime DEFAULT NULL,
  `periodicity` int(11) NOT NULL DEFAULT '0',
  `create_before` int(11) NOT NULL DEFAULT '0',
  `next_creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `next_creation_date` (`next_creation_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_tickets

DROP TABLE IF EXISTS `glpi_tickets`;
CREATE TABLE `glpi_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `closedate` datetime DEFAULT NULL,
  `solvedate` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'new',
  `users_id_recipient` int(11) NOT NULL DEFAULT '0',
  `requesttypes_id` int(11) NOT NULL DEFAULT '0',
  `suppliers_id_assign` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `urgency` int(11) NOT NULL DEFAULT '1',
  `impact` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '1',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `solutiontypes_id` int(11) NOT NULL DEFAULT '0',
  `solution` text COLLATE utf8_unicode_ci,
  `global_validation` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'none',
  `slas_id` int(11) NOT NULL DEFAULT '0',
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `due_date` datetime DEFAULT NULL,
  `begin_waiting_date` datetime DEFAULT NULL,
  `sla_waiting_duration` int(11) NOT NULL DEFAULT '0',
  `waiting_duration` int(11) NOT NULL DEFAULT '0',
  `close_delay_stat` int(11) NOT NULL DEFAULT '0',
  `solve_delay_stat` int(11) NOT NULL DEFAULT '0',
  `takeintoaccount_delay_stat` int(11) NOT NULL DEFAULT '0',
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `request_type` (`requesttypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `suppliers_id_assign` (`suppliers_id_assign`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `global_validation` (`global_validation`),
  KEY `slas_id` (`slas_id`),
  KEY `slalevels_id` (`slalevels_id`),
  KEY `due_date` (`due_date`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `type` (`type`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_tickets_tickets

DROP TABLE IF EXISTS `glpi_tickets_tickets`;
CREATE TABLE `glpi_tickets_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id_1` int(11) NOT NULL DEFAULT '0',
  `tickets_id_2` int(11) NOT NULL DEFAULT '0',
  `link` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `unicity` (`tickets_id_1`,`tickets_id_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_tickets_users

DROP TABLE IF EXISTS `glpi_tickets_users`;
CREATE TABLE `glpi_tickets_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '1',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_ticketsatisfactions

DROP TABLE IF EXISTS `glpi_ticketsatisfactions`;
CREATE TABLE `glpi_ticketsatisfactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `date_begin` datetime DEFAULT NULL,
  `date_answered` datetime DEFAULT NULL,
  `satisfaction` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_id` (`tickets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_tickettasks

DROP TABLE IF EXISTS `glpi_tickettasks`;
CREATE TABLE `glpi_tickettasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `users_id` (`users_id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `is_private` (`is_private`),
  KEY `taskcategories_id` (`taskcategories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_tickettemplatehiddenfields

DROP TABLE IF EXISTS `glpi_tickettemplatehiddenfields`;
CREATE TABLE `glpi_tickettemplatehiddenfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_tickettemplatemandatoryfields

DROP TABLE IF EXISTS `glpi_tickettemplatemandatoryfields`;
CREATE TABLE `glpi_tickettemplatemandatoryfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_tickettemplatemandatoryfields` VALUES ('1','1','0','0','21');

### Dump table glpi_tickettemplatepredefinedfields

DROP TABLE IF EXISTS `glpi_tickettemplatepredefinedfields`;
CREATE TABLE `glpi_tickettemplatepredefinedfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_tickettemplates

DROP TABLE IF EXISTS `glpi_tickettemplates`;
CREATE TABLE `glpi_tickettemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_tickettemplates` VALUES ('1','Default','0','1',NULL);

### Dump table glpi_ticketvalidations

DROP TABLE IF EXISTS `glpi_ticketvalidations`;
CREATE TABLE `glpi_ticketvalidations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `users_id_validate` int(11) NOT NULL DEFAULT '0',
  `comment_submission` text COLLATE utf8_unicode_ci,
  `comment_validation` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'waiting',
  `submission_date` datetime DEFAULT NULL,
  `validation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `tickets_id` (`tickets_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_transfers

DROP TABLE IF EXISTS `glpi_transfers`;
CREATE TABLE `glpi_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keep_ticket` int(11) NOT NULL DEFAULT '0',
  `keep_networklink` int(11) NOT NULL DEFAULT '0',
  `keep_reservation` int(11) NOT NULL DEFAULT '0',
  `keep_history` int(11) NOT NULL DEFAULT '0',
  `keep_device` int(11) NOT NULL DEFAULT '0',
  `keep_infocom` int(11) NOT NULL DEFAULT '0',
  `keep_dc_monitor` int(11) NOT NULL DEFAULT '0',
  `clean_dc_monitor` int(11) NOT NULL DEFAULT '0',
  `keep_dc_phone` int(11) NOT NULL DEFAULT '0',
  `clean_dc_phone` int(11) NOT NULL DEFAULT '0',
  `keep_dc_peripheral` int(11) NOT NULL DEFAULT '0',
  `clean_dc_peripheral` int(11) NOT NULL DEFAULT '0',
  `keep_dc_printer` int(11) NOT NULL DEFAULT '0',
  `clean_dc_printer` int(11) NOT NULL DEFAULT '0',
  `keep_supplier` int(11) NOT NULL DEFAULT '0',
  `clean_supplier` int(11) NOT NULL DEFAULT '0',
  `keep_contact` int(11) NOT NULL DEFAULT '0',
  `clean_contact` int(11) NOT NULL DEFAULT '0',
  `keep_contract` int(11) NOT NULL DEFAULT '0',
  `clean_contract` int(11) NOT NULL DEFAULT '0',
  `keep_software` int(11) NOT NULL DEFAULT '0',
  `clean_software` int(11) NOT NULL DEFAULT '0',
  `keep_document` int(11) NOT NULL DEFAULT '0',
  `clean_document` int(11) NOT NULL DEFAULT '0',
  `keep_cartridgeitem` int(11) NOT NULL DEFAULT '0',
  `clean_cartridgeitem` int(11) NOT NULL DEFAULT '0',
  `keep_cartridge` int(11) NOT NULL DEFAULT '0',
  `keep_consumable` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `keep_disk` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_transfers` VALUES ('1','complete','2','2','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1',NULL,NULL,'1');

### Dump table glpi_usercategories

DROP TABLE IF EXISTS `glpi_usercategories`;
CREATE TABLE `glpi_usercategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_useremails

DROP TABLE IF EXISTS `glpi_useremails`;
CREATE TABLE `glpi_useremails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`email`),
  KEY `email` (`email`),
  KEY `is_default` (`is_default`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_useremails` VALUES ('1','8','1','0','admin@flexaspect.com');

### Dump table glpi_users

DROP TABLE IF EXISTS `glpi_users`;
CREATE TABLE `glpi_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `language` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see define.php CFG_GLPI[language] array',
  `use_mode` int(11) NOT NULL DEFAULT '0',
  `list_limit` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `auths_id` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_sync` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `usertitles_id` int(11) NOT NULL DEFAULT '0',
  `usercategories_id` int(11) NOT NULL DEFAULT '0',
  `date_format` int(11) DEFAULT NULL,
  `number_format` int(11) DEFAULT NULL,
  `names_format` int(11) DEFAULT NULL,
  `csv_delimiter` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_ids_visible` tinyint(1) DEFAULT NULL,
  `dropdown_chars_limit` int(11) DEFAULT NULL,
  `use_flat_dropdowntree` tinyint(1) DEFAULT NULL,
  `show_jobs_at_login` tinyint(1) DEFAULT NULL,
  `priority_1` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_2` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_3` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_4` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_5` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_6` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_categorized_soft_expanded` tinyint(1) DEFAULT NULL,
  `is_not_categorized_soft_expanded` tinyint(1) DEFAULT NULL,
  `followup_private` tinyint(1) DEFAULT NULL,
  `task_private` tinyint(1) DEFAULT NULL,
  `default_requesttypes_id` int(11) DEFAULT NULL,
  `password_forget_token` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_forget_token_date` datetime DEFAULT NULL,
  `user_dn` text COLLATE utf8_unicode_ci,
  `registration_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_count_on_tabs` tinyint(1) DEFAULT NULL,
  `refresh_ticket_list` int(11) DEFAULT NULL,
  `set_default_tech` tinyint(1) DEFAULT NULL,
  `personal_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_token_date` datetime DEFAULT NULL,
  `display_count_on_home` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`name`),
  KEY `firstname` (`firstname`),
  KEY `realname` (`realname`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `locations_id` (`locations_id`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `usercategories_id` (`usercategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `authitem` (`authtype`,`auths_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_users` VALUES ('2','glpi','0915bd0a5c6e56d8f38ca2b390857d4949073f41','','','','',NULL,'0','ru_RU','0','20','0',NULL,'0','1','2012-05-18 02:41:04','2012-05-18 02:40:56',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('3','post-only','3177926a7314de24680a9938aaa97703','','','','',NULL,'0',NULL,'0','20','0',NULL,'0','0',NULL,'2012-05-14 07:23:10',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('4','tech','d9f9133fb120cd6096870bc2b496805b','','','','',NULL,'0',NULL,'0','20','0',NULL,'0','0',NULL,'2012-05-14 07:23:23',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('5','normal','fea087517c26fadd409bd4b9dc642555','','','','',NULL,'0',NULL,'0','20','0',NULL,'0','0',NULL,'2012-05-14 07:22:49',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('6','denis.maksymenko','3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d','','','','Maksymenko','Denis','0','ru_RU','0','50','1','','0','1','2012-05-16 11:12:03','2012-05-16 11:13:16',NULL,'0','0','0','0','0','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('7','max.krivoshlyk','86efe52e33e9c9d54b2601f1441097cdc4e19845','','','','Krivoshlyk','Maxim','0',NULL,'0',NULL,'1','','0','1','2012-05-15 07:56:00','2012-05-15 07:56:55',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('8','dmitriy.yenin','e79c8737598696721e6a0de745a359f03fc11b2d','','','0667869910','Yenin','Dmitriy','0',NULL,'0',NULL,'1','','0','1','2012-05-29 07:54:15','2012-05-15 04:25:54',NULL,'0','0','0','3','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('9','dmitry.vilkhivskiy','3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d','','','','Vilkhivskiy','Dmitry','0','ru_RU','0',NULL,'1','','0','1','2012-05-29 07:59:01','2012-05-18 05:34:16',NULL,'0','0','0','3','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'5d5re42z0eknk6fgqwm39xpyifqzm06qnah2dj1my','2012-05-18 05:34:16',NULL);
INSERT INTO `glpi_users` VALUES ('10','alex.devyatkin',NULL,'','','','Devyatkin','Alex','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 07:54:24',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('11','alex.gaevoy',NULL,'','','','Gaevoy','Alex','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 07:56:47',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('12','alexander.gres',NULL,'','','','Gres','Alexander','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 07:57:53',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('13','alexander.perevalov',NULL,'','','','Perevalov','Alexander','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:00:50',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('14','alexander.razvalinov',NULL,'','','','Razvalinov','Alexander','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:01:15',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('15','alexander.sidorov',NULL,'','','','Sidorov','Alexander','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:01:39',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('16','alexander.skripnik',NULL,'','','','Skripnik','Alexandr','5',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-16 05:36:01',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('17','alexey.afanasyev',NULL,'','','','Afanasyev','Alexey','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:30:13',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('18','alexey.bobylev',NULL,'','','','Bobylev','Alexey','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:03:09',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('19','alexey.scherbakov',NULL,'','','','Scherbakov','Alexey ','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:03:43',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('20','alla.zagorulko',NULL,'','','','Zagorulko','Alla','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:04:10',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('21','andrey.lushpigan',NULL,'','','','Lushpigan','Andrey','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:04:35',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('22','artem.loboda',NULL,'','','','Loboda','Artem','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:04:54',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('23','artem.pyhtin',NULL,'','','','Pyhtin','Artem','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:05:14',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('24','artur.fisun',NULL,'','','','Fisun','Artur','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:05:32',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('25','denis.kovalev',NULL,'','','','Kovalev','Denis','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:05:52',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('26','dmitriy.galuschkin',NULL,'','','','Galuschkin','Dmitriy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:06:15',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('27','dmitriy.kotelevskiy',NULL,'','','','Kotelevskiy','Dmitriy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:06:35',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('28','dmitriy.ovsyannikov',NULL,'','','','Ovsyannikov','Dmitriy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:07:00',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('29','dmitriy.voronin',NULL,'','','','Voronin','Dmitriy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:07:31',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('30','dmitriy.zhdankin',NULL,'','','','Zhdankin','Dmitriy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:07:58',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('31','dmitry.seredinov',NULL,'','','','Seredinov','Dmitry','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:08:33',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('32','eduard.marakhovsky',NULL,'','','','Marakhovsky','Eduard','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:09:00',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('33','elena.zisina',NULL,'','','','Zisina','Elena','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:09:31',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('34','evgeniy.arsenyev',NULL,'','','','Arsenyev','Evgeniy ','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:09:49',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('35','evgeniy.kholodnyak',NULL,'','','','Kholodnyak','Evgeniy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:10:23',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('36','evgeniy.udalov',NULL,'','','','Udalov','Evgeniy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:10:58',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('37','fedor.krutko',NULL,'','','','Krutko','Fedor','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:11:30',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('38','igor.demo',NULL,'','','','Demo','Igor','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:12:03',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('39','igor.skalov',NULL,'','','','Skalov','Igor','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:12:33',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('40','kirill.samojlenko',NULL,'','','','Samojlenko','Kirill','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:13:06',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('41','maxim.kapustin',NULL,'','','','Kapustin','Maxim','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:13:29',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('42','maxim.kosenko',NULL,'','','','Kosenko','Maxim','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:14:05',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('43','natalya.skoromnaya',NULL,'','','','Skoromnaya','Natalya','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:14:25',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('44','natalya.vasilenko',NULL,'','','','Vasilenko','Natalya','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:14:41',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('45','nickolay.chizhikov',NULL,'','','','Chizhikov','Nickolay','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:15:22',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('46','oleg.milkin',NULL,'','','','Milkin','Oleg','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:16:33',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('47','oleg.plitnik',NULL,'','','','Plitnik','Oleg','5',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-16 05:34:50',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('48','pavel.kolesnikov',NULL,'','','','Kolesnikov','Pavel','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:17:35',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('49','pavel.melikhov',NULL,'','','','Melikhov','Pavel','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:18:08',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('50','pavel.sukhanov',NULL,'','','','Sukhanov','Pavel ','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:18:26',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('51','roman.lavrinenko',NULL,'','','','Lavrinenko','Roman','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:18:54',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('52','roman.mazurika',NULL,'','','','Roman','Mazurika','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:19:31',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('53','ruslan.getmansky',NULL,'','','','Getmansky','Ruslan','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:19:59',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('54','sergey.boiko',NULL,'','','','Sergey','Boiko','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:20:57',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('55','sergey.grebeniuk',NULL,'','','','Grebeniuk','Sergey','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:21:48',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('56','sergey.laptiy',NULL,'','','','Laptiy','Sergey','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:22:06',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('57','sergey.malyshkin',NULL,'','','','Malyshkin','Sergey','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:22:51',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('58','tatiana.kunah',NULL,'','','','Kunah','Tatiana','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:23:14',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('59','vadim.matsukatov',NULL,'','','','Matsukatov','Vadim','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:23:53',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('60','valeriy.matsukatov',NULL,'','','','Matsukatov','Valeriy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:24:15',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('61','vasiliy.belokon',NULL,'','','','Belokon','Vasiliy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:24:50',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('62','vitaliy.orehov',NULL,'','','','Orehov','Vitaliy ','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:25:10',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('63','vitaliy.supronuk',NULL,'','','','Supronuk','Vitaliy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:25:37',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('64','vladimir.kozhushniy',NULL,'','','','Kozhushniy','Vladimir','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:25:59',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('65','vladimir.maryenko',NULL,'','','','Maryenko','Vladimir','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:26:23',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('66','vladimir.rakovsky',NULL,'','','','Rakovsky','Vladimir','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:28:13',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('67','yuriy.zisin',NULL,'','','','Zisin','Yuriy','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-14 08:28:28',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('68','denis.djelomanov',NULL,'','','','Djelomanov','Denis','2',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-15 03:14:43',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('69','ivan.doroshenko',NULL,'','','','Doroshenko','Ivan','2',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-15 03:24:28',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('70','nadejda.lyabik',NULL,'','','','Lyabik','Nadejda','2',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-15 03:28:20',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `glpi_users` VALUES ('71','Rezerv',NULL,'','','','','','0',NULL,'0',NULL,'1','','0','1',NULL,'2012-05-16 05:41:58',NULL,'0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);

### Dump table glpi_usertitles

DROP TABLE IF EXISTS `glpi_usertitles`;
CREATE TABLE `glpi_usertitles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `glpi_usertitles` VALUES ('3','System Administrator','');

### Dump table glpi_virtualmachinestates

DROP TABLE IF EXISTS `glpi_virtualmachinestates`;
CREATE TABLE `glpi_virtualmachinestates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_virtualmachinesystems

DROP TABLE IF EXISTS `glpi_virtualmachinesystems`;
CREATE TABLE `glpi_virtualmachinesystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_virtualmachinetypes

DROP TABLE IF EXISTS `glpi_virtualmachinetypes`;
CREATE TABLE `glpi_virtualmachinetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


### Dump table glpi_vlans

DROP TABLE IF EXISTS `glpi_vlans`;
CREATE TABLE `glpi_vlans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `tag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

