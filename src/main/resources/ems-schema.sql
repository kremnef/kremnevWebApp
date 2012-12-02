-- 1
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) default NULL,
  `publish_datetime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `expire_datetime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `document_type_id` int(11) unsigned NOT NULL default '1',
  `repository_id` int(11) unsigned default '0',
  `url_relativity` tinyint(3) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `ems_object_id` int(10) unsigned NOT NULL,
  `position` int(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `document_type_id` (`document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `created_datetime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modified_datetime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `xml_source` text,
  `content_id` int(11) unsigned default NULL,
  `version` int(4) default '1',
  `version_comment` text,
  `version_modifier_id` int(4) default NULL,
  `ACL` text,
  `language_id` int(10) unsigned NOT NULL default '4',
  `state` varchar(255) default 'work',
  `title` varchar(255) default '',
  `description` text,
  `tags` tinytext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `document_file_object`;

CREATE TABLE `document_file_object` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `document_id` int(11) unsigned NOT NULL,
  `file_object_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `document_folder`;

CREATE TABLE `document_folder` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `document_id` int(11) unsigned NOT NULL,
  `folder_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `document_tag`;

CREATE TABLE `document_tag` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `document_id` int(11) unsigned default NULL,
  `tag_id` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `document_type`;

CREATE TABLE `document_type` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `path` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `description` tinytext,
  `type` tinyint(4) NOT NULL default '0',
  `advertisement` tinyint(1) unsigned NOT NULL default '0',
  `base_price` decimal(10,2) NOT NULL default '0.00',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `path` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `url_relativity` tinyint(3) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `ems_object_id` int(10) unsigned NOT NULL,
  `position` int(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `folder`;

CREATE TABLE `folder` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `path` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `url_relativity` tinyint(3) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `ems_object_id` int(10) unsigned NOT NULL,
  `position` int(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `image_gallery`;

CREATE TABLE `image_gallery` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `items_on_page` int(5) unsigned NOT NULL default '25',
  `name` varchar(255) NOT NULL default '',
  `url_relativity` tinyint(3) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `position` int(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `image_gallery_file_object`;

CREATE TABLE `image_gallery_file_object` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `image_gallery_id` int(10) unsigned NOT NULL,
  `file_object_id` int(10) unsigned NOT NULL,
  `position` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `image_gallery_id` (`image_gallery_id`),
  KEY `file_object_id` (`file_object_id`),
  KEY `image_gallery_file_object` (`image_gallery_id`,`file_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `code` char(10) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `charset` varchar(20) NOT NULL,
  `is_default_lang` tinyint(1) unsigned NOT NULL default '0',
  `is_published` tinyint(1) unsigned NOT NULL default '1',
  `url_relativity` tinyint(3) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `position` int(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `navigation`;

CREATE TABLE `navigation` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `system_node_id` int(11) unsigned default '0',
  `root_id` int(11) unsigned default '0',
  `outer_url` varchar(255) default NULL,
  `url_relativity` tinyint(3) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `ems_object_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `position` int(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `root_id` (`root_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `object`;

CREATE TABLE `object` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `system_name` varchar(45) NOT NULL,
  `parent_id` int(10) unsigned default NULL,
  `is_protected` tinyint(1) unsigned NOT NULL default '0',
  `is_published` tinyint(1) unsigned NOT NULL default '1',
  `entity` varchar(45) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `object_label`;

CREATE TABLE `object_label` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `language_code` char(10) NOT NULL default 'ru',
  `label` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `object_label_link`;

CREATE TABLE `object_label_link` (
  `object_id` int(10) unsigned NOT NULL,
  `object_label_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `Index` (`object_id`,`object_label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `object_type`;

CREATE TABLE `object_type` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `class_name` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `embedded` tinyint(3) unsigned NOT NULL,
  `has_children` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `object_type_action`;

CREATE TABLE `object_type_action` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `object_type_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `xslt_path` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `site_map`;

CREATE TABLE `site_map` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `url` varchar(255) NOT NULL,
  `system_node_id` int(11) unsigned NOT NULL default '0',
  `parent_id` int(11) unsigned default NULL,
  `object_id` int(11) unsigned NOT NULL default '0',
  `system_node_site_map_id` int(11) unsigned default NULL,
  `active_object_position` int(5) unsigned NOT NULL default '0',
  `main_object` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `site_map_object`;

CREATE TABLE `site_map_object` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `object_id` int(11) unsigned NOT NULL default '0',
  `site_map_id` int(11) unsigned NOT NULL default '0',
  `base_url` varchar(255) NOT NULL,
  `object_url` varchar(255) NOT NULL,
  `main_object_id` int(11) unsigned NOT NULL default '0',
  `position` int(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `system_node`;

CREATE TABLE `system_node` (
  `id` int(11) unsigned NOT NULL default '0',
  `name` varchar(255) default NULL,
  `publish_date_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `expire_date_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `creator` text,
  `repository_id` int(11) NOT NULL default '0',
  `node_type_id` int(11) default '0',
  `is_branch` tinyint(1) NOT NULL default '0',
  `template_id` int(5) NOT NULL default '1',
  `url_relativity` tinyint(3) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `ems_object_id` int(10) unsigned NOT NULL,
  `position` int(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `system_node_object`;

CREATE TABLE `system_node_object` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `system_node_id` int(10) unsigned NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `position` tinyint(3) unsigned NOT NULL,
  `type_action_id` int(10) unsigned NOT NULL,
  `levels` int(10) unsigned NOT NULL default '0',
  `object_type` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `system_node_id` (`system_node_id`),
  KEY `object_id` (`object_id`),
  KEY `system_node_object` (`system_node_id`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `tag` varchar(128) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






DROP TABLE IF EXISTS `template`;

CREATE TABLE `template` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `template_uri` varchar(255) NOT NULL,
  `template_name` varchar(128) NOT NULL,
  `positions_amount` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `transaction_history`;

CREATE TABLE `transaction_history` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `object_id` tinyint(3) unsigned NOT NULL,
  `user_id` tinyint(3) unsigned NOT NULL,
  `user_action` varchar(64) NOT NULL,
  `date` timestamp  NOT NULL,
  `ip_address` varchar(64) NOT NULL,

  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `content_linked`;


CREATE TABLE `content_linked` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `content_id` int(11) NOT NULL,
  `linked_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP VIEW IF EXISTS `typified_object`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `typified_object`
AS select
  `content`.`id` AS `id`,
  `content`.`name` AS `name`,
  `content`.`type_id` AS `type_id`,
  `content`.`owner_id` AS `owner_id`,
   `content`.`position` AS `position`
from `content` union select `file`.`id` AS `id`,`file`.`name` AS `name`,`file`.`type_id` AS `type_id`,`file`.`owner_id` AS `owner_id`, `file`.`position` AS `position` from `file` union select `folder`.`id` AS `id`,`folder`.`name` AS `name`,`folder`.`type_id` AS `type_id`, `folder`.`owner_id` AS `owner_id`, `folder`.`position` AS `position` from `folder` union select `language`.`id` AS `id`,`language`.`name` AS `name`,`language`.`type_id` AS `type_id`,`language`.`owner_id` AS `owner_id`, `language`.`position` AS `position` from `language` union select `navigation`.`id` AS `id`,`navigation`.`name` AS `name`,`navigation`.`type_id` AS `type_id`,`navigation`.`owner_id` AS `owner_id`, `navigation`.`position` AS `position` from `navigation` union select `system_node`.`id` AS `id`,`system_node`.`name` AS `name`,`system_node`.`type_id` AS `type_id`,`system_node`.`owner_id` AS `owner_id`, `system_node`.`position` AS `position` from `system_node`;