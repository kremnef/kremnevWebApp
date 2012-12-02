-- 1
INSERT INTO `language` ( `code`, `name`, `charset`, `is_default_lang`, `is_published`, `url_relativity`, `relative_url`, `owner_id`, `type_id`, `position`)
VALUES
	('ru','Russian','UTF-8',1,1,0,'','1',6,1),
	('en','English','UTF-8',0,0,0,'','1',6,2),
	('sp','Spain','UTF-8',0,0,0,'','1',6,3);


INSERT INTO `object_type` (`class_name`, `name`, `embedded`, `has_children`)
VALUES
	('ru.strela.ems.core.model.SystemNode','Page',0,1),
	('ru.strela.ems.core.model.Navigation','Navigation',1,1),
	('ru.strela.ems.core.model.Content','Content',1,1),
	('ru.strela.ems.security.model.Customer','User',0,0),
	('ru.strela.ems.core.model.Language','Language',1,0),
	('ru.strela.ems.core.model.Folder','Folder',1,1),
	('ru.strela.ems.core.model.FileObject','FileObject',0,0),
	('ru.strela.ems.security.model.Group','UserGroup',0,1),
	('ru.strela.ems.security.model.Role','UserRole',0,0),
	('ru.strela.ems.core.model.SiteMap','SiteMap',1,0);


INSERT INTO `object_type_action` (`id`, `object_type_id`, `name`, `xslt_path`)
VALUES
	(1,1,'xml',''),
	(2,2,'xml',''),
	(3,3,'xml',''),
	(4,1,'show',''),
	(5,2,'showHor',''),
	(6,3,'showHTML',''),
	(7,2,'showVer',NULL),
	(8,3,'showImageBanner',NULL),
	(9,9,'show',NULL),
	(10,3,'showMovie',NULL),
	(11,6,'showLanguages',NULL),
	(12,7,'showHierarchy',NULL),
	(13,7,'showImages',NULL),
	(14,2,'showOL',NULL),
	(15,3,'showNewsList',NULL),
	(16,3,'showOLCollections',NULL),
	(17,3,'showFeedbackHTML',NULL),
	(18,7,'showRandomImage',NULL),
	(19,3,'showName',NULL),
	(20,3,'showFirstNewsItem',NULL),
	(21,3,'showProducts',NULL),
	(22,12,'showBreadCrumb',NULL),
    (23,2,'showHor2Levels',NULL);



INSERT INTO `document_type` (`path`, `name`, `description`, `type`, `advertisement`, `base_price`)
VALUES
	('/documenttypes/Article','Article','Статья',1,0,0.00),
	('/documenttypes/ImageBanner','ImageBanner','Банер',3,0,0.00),
	('/documenttypes/HtmlBlock','HtmlBlock','Html',4,0,0.00),
	('/documenttypes/Movie','Movie','Видеоролик',5,0,0.00),
	('/documenttypes/SMI','SMI','Публикация',6,0,0.00),
	('/documenttypes/News','News','Новость',12,0,0.00);

INSERT INTO `template` ( `template_uri`, `template_name`, `positions_amount`)
VALUES
	('index.xsl','index',10),
	('regular.xsl','regular',10);


