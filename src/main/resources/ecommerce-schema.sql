-- 1
DROP TABLE IF EXISTS `ecommerce_catalogue`;
CREATE TABLE `ecommerce_catalogue` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `url_relativity` tinyint(3) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `ems_object_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `position` int(5) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ecommerce_catalogue_items`;
CREATE TABLE `ecommerce_catalogue_items` (
  `catalogue_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY  (`catalogue_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- alter table `ecommerce_customer` drop FOREIGN KEY `user`;
DROP TABLE IF EXISTS `ecommerce_customer`;
CREATE TABLE `ecommerce_customer` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `first_name` varchar(128) default NULL,
  `last_name` varchar(128) default NULL,
  `credit_status` varchar(128) default NULL,
  `account_status` varchar(128) default NULL,
  `email` varchar(128) default NULL,
  `login` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`)
--  , KEY `user` (`login`)
-- ,  CONSTRAINT `user` FOREIGN KEY (`login`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS `ecommerce_list_country`;
CREATE TABLE `ecommerce_list_country` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `country` varchar(255) NOT NULL default '',
  `isocode` char(2) default '',
  `currency` varchar(255) NOT NULL default '',
  `symbol` varchar(10) NOT NULL default '',
  `symbol_html` varchar(10) NOT NULL default '',
  `code` char(3) NOT NULL default '',
  `has_regions` tinyint(1) unsigned NOT NULL default '0',
  `tax` varchar(8) NOT NULL default '',
  `continent` varchar(20) NOT NULL default '',
  `visible` tinyint(1) unsigned NOT NULL default '1',
  `is_default_country` tinyint(1) unsigned default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ecommerce_order`;
CREATE TABLE `ecommerce_order` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `position` int(3) unsigned NOT NULL default '0',
  `type_id` int(5) unsigned NOT NULL default '0',
  `owner_id` int(10) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `url_relativity` int(11) unsigned NOT NULL default '0',
  `total_price` double default NULL,
  `order_status` varchar(256) default NULL,
  `submitted_date` timestamp NULL default NULL,
  `customer_id` int(11) default NULL,
  `order_number` varchar(128) default NULL,
  `order_type` varchar(128) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `ecommerce_order_item`;
CREATE TABLE `ecommerce_order_item` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `unit_price` double NOT NULL default '0',
  `order_id` int(11) NOT NULL default '0',
  `extended_price` double NOT NULL default '0',
  `order_item_number` int(11) NOT NULL default '0',
  `quantity` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ecommerce_photo`;
CREATE TABLE `ecommerce_photo` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `position` int(5) unsigned NOT NULL default '1',
  `type_id` int(10) unsigned NOT NULL default '0',
  `owner_id` int(10) unsigned NOT NULL default '0',
  `relative_url` varchar(100) default NULL,
  `url_relativity` tinyint(3) unsigned NOT NULL default '0',
  `product_id` int(11) unsigned default '0',
  `season` varchar(15) default 'summer',
  `format` varchar(10) default '4x5',
  `daytime` varchar(30) default 'day',
  `country_id` int(4) unsigned default '1',
  `region_id` int(5) unsigned default '0',
  `city_id` int(4) unsigned default NULL,
  `content_id` int(4) unsigned default NULL,
  `file_id` int(4) unsigned default NULL,
  `author_id` int(4) unsigned default NULL,
  `date` date default NULL,
  `active` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ecommerce_product`;
CREATE TABLE `ecommerce_product` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `model` varchar(128) default NULL,
  `vendor` varchar(256) default NULL,
  `sku` varchar(128) default NULL,
  `upc` varchar(128) default NULL,
  `sellingUOM` varchar(128) default NULL,
  `base_price` double(9,2) default NULL,
  `special_price` double(9,2) default NULL,
  `discount` int(5) default '0',
  `minimum_selling_units` int(5) default NULL,
  `on_hand_quantity` int(5) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
