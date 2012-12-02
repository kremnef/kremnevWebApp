CREATE TABLE `advertisement` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `content_id` int(10) unsigned NOT NULL,
  `price` decimal(10,2) default '0.00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--  1