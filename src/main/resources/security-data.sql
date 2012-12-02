-- 1
INSERT INTO `authorities` (`username`, `authority`)
VALUES
	('admin','ROLE_ADMIN'),
	('editor','ROLE_EDITOR'),
	('guest','ROLE_USER');

INSERT INTO `group_authorities` (`group_id`, `authority`)
VALUES
	(1,'ROLE_USER'),
	(2,'ROLE_USER'),
	(2,'ROLE_ADMIN'),
	(3,'ROLE_EDITOR');

INSERT INTO `group_members` (`id`, `username`, `group_id`)
VALUES
	(1,'guest',1),
	(2,'admin',2),
	(3,'editor',3);

INSERT INTO `groups` (`id`, `group_name`)
VALUES
	(1,'Users'),
	(2,'Administrators'),
	(3,'Editors');

INSERT INTO `users` (`username`, `password`, `enabled`)
VALUES
	('admin','a40546cc4fd6a12572828bb803380888ad1bfdab',1),
	('editor','73f0b90053e8524c28903c64cc25984e69a8b609',1),
	('guest','225f8735e27294f150ed51ad0a9dbc586cdeedc3',1);


INSERT INTO `roles` (`role_name`, `authority`)
VALUES
	('Администраторы','ROLE_ADMIN'),
	('Редакторы','ROLE_USER'),
	('Гости','ROLE_DEP');