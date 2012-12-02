-- 1
DROP TABLE IF EXISTS acl_entry;
CREATE TABLE `acl_entry`(
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `acl_object_identity` bigint(20) unsigned NOT NULL,
  `ace_order` int(10) unsigned NOT NULL,
  `sid` bigint(20) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `acl_entry_idx_1` (`acl_object_identity`,`ace_order`),
  KEY `sid` (`sid`)
  /*,
  CONSTRAINT `acl_entry_ibfk_1` FOREIGN KEY (`acl_object_identity`) REFERENCES `acl_object_identity` (`id`),
  CONSTRAINT `acl_entry_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `acl_sid` (`id`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS acl_class;
CREATE TABLE `acl_class` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `class` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS acl_object_identity;
CREATE TABLE `acl_object_identity` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `object_id_class` bigint(20) unsigned NOT NULL,
  `object_id_identity` bigint(20) unsigned NOT NULL,
  `parent_object` bigint(20) unsigned default NULL,
  `owner_sid` bigint(20) unsigned default NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `acl_object_identity_idx_1` (`object_id_class`,`object_id_identity`),
  KEY `parent_object` (`parent_object`),
  KEY `owner_sid` (`owner_sid`)
  /*,
  CONSTRAINT `acl_object_identity_ibfk_1` FOREIGN KEY (`object_id_class`) REFERENCES `acl_class` (`id`),
  CONSTRAINT `acl_object_identity_ibfk_2` FOREIGN KEY (`parent_object`) REFERENCES `acl_object_identity` (`id`),
  CONSTRAINT `acl_object_identity_ibfk_3` FOREIGN KEY (`owner_sid`) REFERENCES `acl_sid` (`id`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS acl_sid;
CREATE TABLE `acl_sid` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `principal` tinyint(1) NOT NULL,
  `sid` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `acl_sid_idx_1` (`sid`,`principal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS authorities;
  CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`)
--   ,CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS group_authorities;
CREATE TABLE `group_authorities` (
  `group_id` bigint(20) unsigned NOT NULL,
  `authority` varchar(50) NOT NULL,
  KEY `group_id` (`group_id`)
--   ,CONSTRAINT `group_authorities_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS group_members;
CREATE TABLE `group_members` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `group_id` (`group_id`)
  /*,
  CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS groups;
CREATE TABLE `groups` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS group_authorities;
CREATE TABLE `group_authorities` (
  `group_id` bigint(20) unsigned NOT NULL,
  `authority` varchar(50) NOT NULL,
  KEY `group_id` (`group_id`)/*,
  CONSTRAINT `group_authorities_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS persistent_logins;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(25) NOT NULL default '1232' ,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS roles;
 CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `role_name` varchar(256) NOT NULL default 'User',
  `authority` varchar(256) NOT NULL default 'ROLE_USER',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;