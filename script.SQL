SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS administrators
;
DROP TABLE IF EXISTS assignments
;
DROP TABLE IF EXISTS attachments
;
DROP TABLE IF EXISTS attributes
;
DROP TABLE IF EXISTS concepts
;
DROP TABLE IF EXISTS diagrams
;
DROP TABLE IF EXISTS formal_technical_reviews
;
DROP TABLE IF EXISTS programmers
;
DROP TABLE IF EXISTS rtf_attributes
;
DROP TABLE IF EXISTS rtf_concepts
;
DROP TABLE IF EXISTS rtf_domains
;
DROP TABLE IF EXISTS rtf_use_cases
;
DROP TABLE IF EXISTS scores
;
DROP TABLE IF EXISTS sections
;
DROP TABLE IF EXISTS subsystems
;
DROP TABLE IF EXISTS system_types
;
DROP TABLE IF EXISTS systems
;

CREATE TABLE administrators
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	last_name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	email VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	encrypted_password VARCHAR(128) COLLATE utf8_unicode_ci NOT NULL,
	reset_password_token VARCHAR(50) COLLATE utf8_unicode_ci ,
	reset_password_sent_at DATETIME,
	remember_created_at DATETIME,
	sign_in_count INTEGER,
	current_sign_in_at DATETIME,
	last_sign_in_at DATETIME,
	current_sign_in_ip VARCHAR(255) COLLATE utf8_unicode_ci ,
	last_sign_in_ip VARCHAR(50) COLLATE utf8_unicode_ci ,
	failed_attempts VARCHAR(255) COLLATE utf8_unicode_ci ,
	unlock_token VARCHAR(11) COLLATE utf8_unicode_ci ,
	locked_at DATETIME,
	authentication_token VARCHAR(255) COLLATE utf8_unicode_ci ,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_administrator_email(email),
	UNIQUE UQ_administrator_id(id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3
;

INSERT INTO `administrators` (`id`, `first_name`, `last_name`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `failed_attempts`, `unlock_token`, `locked_at`, `authentication_token`, `created_at`, `updated_at`) VALUES
(1, 'María de Lourdes', 'Hernández Rodríguez', 'mhernand@lania.mx', '$2a$10$HQHVzwZT5pGc7HeuLw6xMOZnlegvhte4cWaU9bN1cbMltru8uJ0CO', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, '2012-07-12 15:40:26', '2012-07-12 15:39:09', '127.0.0.1', '127.0.0.1', '0', '', '0000-00-00 00:00:00','', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 'Juan Manuel', 'Gutiérrez Méndez', 'juan@lania.mx', '$2a$10$rFFh.2A6DAuUGSXdAHgBcuE7KqwOvkCNIffbl0CTC/gAziYscflTq', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, '2012-07-12 15:40:26', '2012-07-12 15:39:09', '127.0.0.1', '127.0.0.1', '0', '', '0000-00-00 00:00:00','', '2012-07-12 15:39:39', '2012-07-12 15:39:39'),
(3, 'Yesenia', 'Hernández', 'yhernandez@lania.mx', '$2a$10$Ymc3w7pCW1G/CevopjN36OafQdymMjbsKOar2qEy9cXtmhxzalXHW', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, '2012-07-12 15:40:26', '2012-07-12 15:39:09', '127.0.0.1', '127.0.0.1', '0', '', '0000-00-00 00:00:00','', '2012-07-12 15:39:39', '2012-07-12 15:39:39');
CREATE TABLE assignments
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	attribute_id INTEGER NOT NULL,
	diagram_id INTEGER NOT NULL,
	weight FLOAT(0) NOT NULL,
	system_type_id INTEGER NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_assignment_id(id),
	KEY (attribute_id),
	KEY (diagram_id),
	KEY (system_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=169
;

INSERT INTO `assignments` (`id`, `system_type_id`, `diagram_id`, `attribute_id`, `weight`,  `created_at`, `updated_at`) VALUES

(1, 1, 1, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 1, 1, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(3, 1, 1, 3, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(4, 1, 1, 4, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(5, 1, 1, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(6, 1, 1, 6, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(7, 1, 1, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(8, 1, 2, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(9, 1, 2, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(10, 1, 2, 3, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(11, 1, 2, 4, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(12, 1, 2, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(13, 1, 2, 6, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(14, 1, 2, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(15, 1, 3, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(16, 1, 3, 2, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(17, 1, 3, 3, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(18, 1, 3, 4, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(19, 1, 3, 5, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(20, 1, 3, 6, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(21, 1, 3, 7, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(22, 1, 4, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(23, 1, 4, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(24, 1, 4, 3, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(25, 1, 4, 4, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(26, 1, 4, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(27, 1, 4, 6, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(28, 1, 4, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),


(29, 2, 1, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(30, 2, 1, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(31, 2, 1, 3, 0.15,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(32, 2, 1, 4, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(33, 2, 1, 5, 0.15,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(34, 2, 1, 6, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(35, 2, 1, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(36, 2, 2, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(37, 2, 2, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(38, 2, 2, 3, 0.15,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(39, 2, 2, 4, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(40, 2, 2, 5, 0.15,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(41, 2, 2, 6, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(42, 2, 2, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(43, 2, 3, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(44, 2, 3, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(45, 2, 3, 3, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(46, 2, 3, 4, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(47, 2, 3, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(48, 2, 3, 6, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(49, 2, 3, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(50, 2, 4, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(51, 2, 4, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(52, 2, 4, 3, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(53, 2, 4, 4, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(54, 2, 4, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(55, 2, 4, 6, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(56, 2, 4, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),


(57, 3, 1, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(58, 3, 1, 2, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(59, 3, 1, 3, 0.15,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(60, 3, 1, 4, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(61, 3, 1, 5, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(62, 3, 1, 6, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(63, 3, 1, 7, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(64, 3, 2, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(65, 3, 2, 2, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(66, 3, 2, 3, 0.25,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(67, 3, 2, 4, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(68, 3, 2, 5, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(69, 3, 2, 6, 0.15,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(70, 3, 2, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(71, 3, 3, 1, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(72, 3, 3, 2, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(73, 3, 3, 3, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(74, 3, 3, 4, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(75, 3, 3, 5, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(76, 3, 3, 6, 0.15,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(77, 3, 3, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(78, 3, 4, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(79, 3, 4, 2, 0.25,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(80, 3, 4, 3, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(81, 3, 4, 4, 0.25,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(82, 3, 4, 5, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(83, 3, 4, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(84, 3, 4, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),


(85, 4, 1, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(86, 4, 1, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(87, 4, 1, 3, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(88, 4, 1, 4, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(89, 4, 1, 5, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(90, 4, 1, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(91, 4, 1, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(92, 4, 2, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(93, 4, 2, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(94, 4, 2, 3, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(95, 4, 2, 4, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(96, 4, 2, 5, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(97, 4, 2, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(98, 4, 2, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(99, 4, 3, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(100, 4, 3, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(101, 4, 3, 3, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(102, 4, 3, 4, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(103, 4, 3, 5, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(104, 4, 3, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(105, 4, 3, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(106, 4, 4, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(107, 4, 4, 2, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(108, 4, 4, 3, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(109, 4, 4, 4, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(110, 4, 4, 5, 0.2,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(111, 4, 4, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(112, 4, 4, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(113, 5, 1, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(114, 5, 1, 2, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(115, 5, 1, 3, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(116, 5, 1, 4, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(117, 5, 1, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(118, 5, 1, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(119, 5, 1, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(120, 5, 2, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(121, 5, 2, 2, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(122, 5, 2, 3, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(123, 5, 2, 4, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(124, 5, 2, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(125, 5, 2, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(126, 5, 2, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(127, 5, 3, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(128, 5, 3, 2, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(129, 5, 3, 3, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(130, 5, 3, 4, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(131, 5, 3, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(132, 5, 3, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(133, 5, 3, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(134, 5, 4, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(135, 5, 4, 2, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(136, 5, 4, 3, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(137, 5, 4, 4, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(138, 5, 4, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(139, 5, 4, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(140, 5, 4, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(141, 6, 1, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(142, 6, 1, 2, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(143, 6, 1, 3, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(144, 6, 1, 4, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(145, 6, 1, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(146, 6, 1, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(147, 6, 1, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(148, 6, 2, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(149, 6, 2, 2, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(150, 6, 2, 3, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(151, 6, 2, 4, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(152, 6, 2, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(153, 6, 2, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(154, 6, 2, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(155, 6, 3, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(156, 6, 3, 2, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(157, 6, 3, 3, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(158, 6, 3, 4, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(159, 6, 3, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(160, 6, 3, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(161, 6, 3, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(162, 6, 4, 1, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(163, 6, 4, 2, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(164, 6, 4, 3, 0.3,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(165, 6, 4, 4, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(166, 6, 4, 5, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(167, 6, 4, 6, 0.1,'2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(168, 6, 4, 7, 0.05,'2012-07-12 15:37:24', '2012-07-12 15:40:26');

CREATE TABLE attachments
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	attach_file_name VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
	attach_file_size INTEGER NOT NULL,
	attach_content_type VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	attach_updated_at DATETIME NOT NULL,
	formal_technical_review_id INTEGER NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at INTEGER NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_attachment_id(id),
	KEY (formal_technical_review_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
;


CREATE TABLE attributes
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_attribute_id(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8
;

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Anotado', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 'Completo', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(3, 'Consistente', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(4, 'Correcto', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(5, 'Exacto', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(6, 'Verificable', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(7, 'Trazable', '2012-07-12 15:37:24', '2012-07-12 15:40:26');

CREATE TABLE concepts
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	description TEXT COLLATE utf8_unicode_ci NOT NULL,
	folio VARCHAR(50) COLLATE utf8_unicode_ci ,
	is_automatic BOOL NOT NULL,
	attribute_id INTEGER NOT NULL,
	section_id INTEGER NOT NULL,
	diagram_id INTEGER NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_concept_id(id),
	KEY (attribute_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=87
;

INSERT INTO `concepts` (`id`, `description`, `folio`, `is_automatic`, `attribute_id`, `section_id`, `diagram_id`,`created_at`, `updated_at`) VALUES
(1, 'Cada actor representa un rol del sistema', 'CU_15', false, 4,1,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 'Su nombre refleja un rol realizado por una persona, base de datos u otro sistema', 'CU_16', false, 4,1,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(3, 'Reflejan todas las entidades que intercambian información', 'CU_1', true, 2,1,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(4, 'La relación entre el actor y el caso de uso refleja una funcionalidad del sistema', 'CU_17', false, 5,1,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(5, 'Cada nombre es expresado en singular', 'CU_2', true, 4,1,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(6, 'Existe un nombre asociado a cada actor', 'CU_3', true, 1,1,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(7, 'La relación de generalizacion refleja herencia entre el hijo y el padre', 'CU_18', false, 4,1,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(8, 'Expresan un requerimiento del sistema', 'CU_19', false, 4,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(9, 'Cada requerimiento no tiene conflictos entre sí', 'CU_20', false, 3,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(10, 'Su descripción es una frase verbal en infinitivo', 'CU_5', true, 1,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(11, 'Su descripción es precisa y sin ambiguedades', 'CU_21', false, 5,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(12, 'Están organizados en paquetes', 'CU_6', true, 4,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(13, 'Cada caso de uso es único', 'CU_22', false, 4,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(14, 'Cada nombre de caso de uso es único"', 'CU_7', true, 1,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(15, 'Los elementos del diagrama son del color indicado"', 'CU_8', false, 1,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(16, 'Cada requerimiento tiene relación con los casos de uso que lo implementa', 'CU_9', true, 7,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(17, 'Cuenta con al menos un caso de prueba', 'CU_10', true, 4,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(18, 'Cada caso de prueba es comprobable', 'CU_23', false, 6,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(19, 'Cada caso de prueba tiene asignado un estatus', 'CU_11', true, 1,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(20, 'Cada caso de prueba tiene asignado un tipo', 'CU_12', true, 1,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(21, 'Existe una descripción asociada a cada caso de uso', 'CU_4', true, 1,2,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(22, 'Están escritos en voz activa, en presente, describiendo acciones y respuestas del usuario y del sistema', 'CU_24', false, 4,3,1, '212-07-12 15:37:24', '2012-07-12 15:40:26'),
(23, 'Siguen la estructura verbo-sustantivo', 'CU_25', false, 4,3,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(24, 'Especifican escenarios detallados de lo que hace el usuario', 'CU_26', false, 4,3,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(25, 'Cada caso de uso cuenta con al menos un curso básico', 'CU_13', true, 2,3,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(26, 'Cada caso de uso cuenta con al menos un curso alterno', 'CU_14', true, 2,3,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(27, 'El nombre de cada diagrama de casos de uso refleja la funcionalidad del conjunto de casos de uso que contiene', 'CU_27', false, 4,4,1, '212-07-12 15:37:24', '2012-07-12 15:40:26'),
(28, 'Un caso de uso con el símbolo de composición, denota una referencia a un conjunto de casos de uso', 'CU_28', false, 4,4,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(29, 'Un elemento compuesto no tiene escenarios asociados', 'CU_32', true, 4,4,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(30, 'Agrupan casos de acuerdo al proceso que cubren', 'CU_29', false, 4,4,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(31, 'La relación include refleja la ejecución obligatoria del caso de uso asociado', 'CU_30', false, 5,5,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(32, 'La relación extends indica flujos alternos opcionales del caso de uso', 'CU_31', false, 5,5,1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(33, 'Representan de forma detallada una secuencia de actividades', 'DA_9', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(34, 'Capturan acciones y los resultados de estas acciones', 'DA_10', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(35, 'Representan caminos lógicos de un proceso', 'DA_11', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(36, 'El nombre de cada diagrama cumple con las especificaciones', 'DA_12', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(37, 'Todos los diagramas tienen un punto inicial', 'DA_13', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(38, 'Todos los diagramas tienen al menos un punto final', 'DA_14', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(39, 'Los objetos de conexión son usados adecuadamente', 'DA_15', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(40, 'Representan puntos de decisión o nodos fusión mediante gateways', 'DA_16', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(41, 'Las barras fork/join son usadas para representar la sincronización de actividades paralelas', 'DA_17', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(42, 'Utiliza regiones para representar actividades interrumpidas o procesos que se realizan múltiples veces', 'DA_18', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(43, 'Utiliza eventos de envío o recepción para representar envío de señales o peticiones, y aceptación o recepción de una petición', 'DA_19', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(44, 'Utiliza manejadores de excepciones para operaciones donde ocurren excepciones', 'CU_20', false, 4,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(45, 'Las anotaciones de texto son claras y sin ambigüedades', 'DA_21', false, 5,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(46, 'Los diagramas reflejan los requerimientos indicados en el documento F01 (propuesta técnica) y el modelo de dominio', 'DA_22', false, 7,6,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(47, 'Cada responsable de alguna actividad es representado por medio de carriles', 'DA_23', false, 4,7,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(48, 'Las actividades asignadas a cada responsable son apropiadas de acuerdo a su función', 'DA_24', false, 4,7,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(49, 'Cada responsable es identificado por el nombre de su rol (Ej. Gerente, Operador, Analista, etc.)', 'DA_25', false, 4,7,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(50, 'Los responsables considerados en los diagramas se relacionan con el mapa de actores del modelo de casos de uso', 'DA_26', false, 4,7,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(51, 'Es lógica y clara la secuencia de actividades de cada diagrama', 'DA_1', false, 5,8,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(52, 'Las actividades reflejan el control y flujo de datos de un proceso', 'DA_2', false, 4,8,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(53, 'Las acciones describen un proceso básico o una transformación que ocurre dentro del sistema', 'DA_3', false, 4,8,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(54, 'Las actividades estructuradas están identificadas por el símbolo “∞” y enlazan hacia un diagrama que describe su detalle', 'DA_4', false, 4,8,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(55, 'Las actividades estructuradas se relacionan con el tipo que representan (estructurada, condicional, secuencial, etc.)', 'DA_5', false, 4,8,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(56, 'Las actividades que no son claras tienen asociadas anotaciones de texto', 'DA_6', false, 1,8,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(57, 'Las actividades están escritas en infinitivo', 'DA_7', false, 4,8,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(58, 'Las actividades no generan conflictos entre sí', 'DA_8', false, 3,8,3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(59, 'Representa todas los objetos que intercambian información y sus asociaciones', 'MD_1', false, 2,9,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(60, 'Los objetos reflejan la perspectiva del usuario funcional o dueño del proceso de negocio', 'MD_2', false, 4,9,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(61, 'No existen subprocesos pendientes de especificar', 'MD_3', false, 2,9,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(62, 'Las relaciones entre objetos representan funcionalidad', 'MD_4', false, 3,9,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(63, 'El nombre del diagrama refleja el dominio de los objetos"', 'MD_5', false, 4,9,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(64, 'No existen objetos fuera del contexto', 'MD_6', false, 4,9,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(65, 'Los objetos están definidos sin ambigüedades', 'MD_7', false, 3,10,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(66, 'Los objetos no causan conflictos entre sí', 'MD_8', false, 3,10,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(67, 'Los objetos representan entidades de la realidad física', 'MD_9', false, 2,10,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(68, 'Los objetos se definen a través de sustantivos', 'MD_10', false, 1,10,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(69, 'Las asociaciones entre objetos se definen a través de frases verbales', 'MD_11', false, 1,10,2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),

(70, 'Representa una máquina de estados finito', 'DE_1', false, 3,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(71, 'Todos los diagramas tienen un punto inicial', 'DE_2', false, 4,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(72, 'Todos los diagramas tienen al menos un punto final', 'DE_3', false, 4,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(73, 'Una transición entre estados representa un cambio de un estado origen a un estado sucesor', 'DE_4', false, 4,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(74, 'El nombre del diagrama cumple con las especificaciones', 'DE_5', false, 1,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(75, 'Representa los diferentes estados de un objeto', 'DE_6', false, 3,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(76, 'Las etiquetas de transición están escritas en expresiones regulares', 'DE_7', false, 1,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(77, 'Cada objeto está en un estado en cierto instante', 'DE_8', false, 3,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(78, 'Todos los estaados están relacionados con un mismo objeto', 'DE_9', false, 4,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(79, 'La secuencia de estados del diagrama representa un ciclo de vida lógico', 'DE_10', false, 4,11,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(80, 'Es una de las posibles situaciones en la cual un estado puede existir', 'DE_11', false, 4,12,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(81, 'Abarca todas las condiciones en las cuales un objeto puede existir', 'DE_12', false, 4,12,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(82, 'Los atributos caracterizan el estado del objeto', 'DE_13', false, 3,12,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(83, 'El estado determina el comportamiento del objeto', 'DE_14', false, 3,12,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(84, 'Cada estado pertence a un objeto', 'DE_15', false, 3,12,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(85, 'Los estados no causan conflictos entre sí', 'DE_16', false, 3,12,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(86, 'El nombre del estado está acorde a la especificación', 'DE_17', false, 1,12,4, '2012-07-12 15:37:24', '2012-07-12 15:40:26');


CREATE TABLE diagrams
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	folio VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_diagram_id(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5
;

INSERT INTO `diagrams` (`id`, `name`, `folio`, `created_at`, `updated_at`) VALUES
(1, 'Diagrama de casos de uso', 'CU', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 'Modelo de dominio', 'MD', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(3, 'Diagrama de actividades', 'DA', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(4, 'Diagrama de estados', 'DE', '2012-07-12 15:37:24', '2012-07-12 15:40:26');

CREATE TABLE formal_technical_reviews
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	administrator_id INTEGER NOT NULL,
	programmer_id INTEGER NOT NULL,
	subsystem_id INTEGER NOT NULL,
	diagram_id INTEGER NOT NULL,
	result FLOAT(0),
	score_id INTEGER,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_formal_technical_review_id(id),
	KEY (administrator_id),
	KEY (diagram_id),
	KEY (programmer_id),
	KEY (score_id),
	KEY (subsystem_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
;


CREATE TABLE programmers
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	last_name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	email VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	encrypted_password VARCHAR(128) COLLATE utf8_unicode_ci NOT NULL,
	reset_password_token VARCHAR(50) COLLATE utf8_unicode_ci ,
	reset_password_sent_at DATETIME,
	remember_created_at DATETIME,
	sign_in_count INTEGER,
	current_sign_in_at DATETIME,
	last_sign_in_at DATETIME,
	current_sign_in_ip VARCHAR(255) COLLATE utf8_unicode_ci ,
	last_sign_in_ip VARCHAR(50) COLLATE utf8_unicode_ci ,
	failed_attempts VARCHAR(255) COLLATE utf8_unicode_ci ,
	unlock_token VARCHAR(11) COLLATE utf8_unicode_ci ,
	locked_at DATETIME,
	authentication_token VARCHAR(255) COLLATE utf8_unicode_ci ,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_programmers_email(email),
	UNIQUE UQ_programmers_id(id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3
;

INSERT INTO `programmers` (`id`, `first_name`, `last_name`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `failed_attempts`, `unlock_token`, `locked_at`, `authentication_token`, `created_at`, `updated_at`) VALUES
(1, 'Mayra Verónica', 'Cabrera Díaz', 'mcabrera@lania.mx', '$2a$10$MQOAPrAXfMxn8ra/frZHCeUOmZoBneTrfyeavTWbrSqvvK7YfV0ue', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, '2012-07-12 15:42:05', '2012-07-12 15:42:05', '127.0.0.1', '127.0.0.1', '0', '', '0000-00-00 00:00:00','', '2012-07-12 15:37:25', '2012-07-12 15:42:05'),
(2, 'Saul', 'Dominguez', 'saul@lania.mx', '$2a$10$rFFh.2A6DAuUGSXdAHgBcuE7KqwOvkCNIffbl0CTC/gAziYscflTq', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, '2012-07-12 15:42:05', '2012-07-12 15:42:05', '127.0.0.1', '127.0.0.1', '0', '', '0000-00-00 00:00:00','', '2012-07-12 15:37:25', '2012-07-12 15:37:25');

CREATE TABLE rtf_attributes
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	rtf_id INTEGER NOT NULL,
	attribute_id INTEGER NOT NULL,
	weight FLOAT(0) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_rtf_attribute_id(id),
	KEY (attribute_id),
	KEY (rtf_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
;


CREATE TABLE rtf_concepts
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	rtf_id INTEGER NOT NULL,
	concept_id INTEGER NOT NULL,
	weight FLOAT(0) NOT NULL,
	grade INTEGER ,
	total FLOAT(0) ,
	PRIMARY KEY (id),
	UNIQUE UQ_rtf_concept_id(id),
	KEY (concept_id),
	KEY (rtf_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
;


CREATE TABLE rtf_domains
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	attach_file_name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	attach_content_type VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	attach_file_size INTEGER NOT NULL,
	attach_updated_at DATETIME NOT NULL,
	formal_technical_review_id INTEGER ,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_rtf_domain_id(id),
	KEY (formal_technical_review_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
;


CREATE TABLE rtf_use_cases
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	attach_file_name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	attach_content_type VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	attach_file_size INTEGER NOT NULL,
	attach_updated_at DATETIME NOT NULL,
	formal_technical_review_id INTEGER,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_rtf_use_case_id(id),
	KEY (formal_technical_review_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
;


CREATE TABLE scores
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	description VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	start FLOAT(0) NOT NULL,
	end FLOAT(0) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_score_id(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6
;

INSERT INTO `scores` (`id`, `description`, `start`,`end`, `created_at`, `updated_at`) VALUES
(1, 'No aceptable', 0.0, 60.0, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 'Deficiente', 61.0, 70.0, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(3, 'Regular', 71.0, 80.0, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(4, 'Bueno', 81.0, 90.0, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(5, 'Muy bueno', 91.0, 100.0, '2012-07-12 15:37:24', '2012-07-12 15:40:26');


CREATE TABLE sections
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	diagram_id INTEGER NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_section_id(id),
	KEY (diagram_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13
;

INSERT INTO `sections` (`id`, `name`, `diagram_id`,`created_at`, `updated_at`) VALUES
(1, 'Actores', 1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 'Casos de uso', 1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(3, 'Escenarios', 1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(4, 'Diagrama', 1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(5, 'Relaciones', 1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(6, 'Diagrama', 3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(7, 'Responsable', 3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(8, 'Actividades', 3, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(9, 'Diagrama', 2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(10, 'Objeto', 2, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(11, 'Diagrama', 4, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(12, 'Estados', 4, '2012-07-12 15:37:24', '2012-07-12 15:40:26');


CREATE TABLE subsystems
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	description TEXT COLLATE utf8_unicode_ci NOT NULL,
	system_id INTEGER NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_subsystem_id(id),
	KEY (system_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4
;

INSERT INTO `subsystems` (`id`, `name`,  `description`, `system_id`,`created_at`, `updated_at`) VALUES
(1, 'SATI-Central', 'Organismo central del SATI', 1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 'SATI-Sucursal', 'Subsistema particular a una tienda IMSS', 1, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(3, 'LIS - General', 'Subsistema general de LIS', 2, '2012-07-12 15:37:24', '2012-07-12 15:40:26');


CREATE TABLE system_types
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_system_type_id(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7
;

INSERT INTO `system_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sistema de soporte', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 'Científico', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(3, 'Aplicaciones de negocios', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(4, 'Embebido', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(5, 'Sistema web', '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(6, 'Inteligencia Artificial', '2012-07-12 15:37:24', '2012-07-12 15:40:26');


CREATE TABLE systems
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
	description TEXT COLLATE utf8_unicode_ci NOT NULL,
	system_type_id INTEGER NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	UNIQUE UQ_system_id(id),
	KEY (system_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3
;

INSERT INTO `systems` (`id`, `name`, `description`, `system_type_id`, `created_at`, `updated_at`) VALUES
(1, 'SATI', 'Sistema de administración de tiendas IMSS', 5, '2012-07-12 15:37:24', '2012-07-12 15:40:26'),
(2, 'LIS', 'Sistema LIS', 3, '2012-07-12 15:37:24', '2012-07-12 15:40:26');



SET FOREIGN_KEY_CHECKS=1;


ALTER TABLE assignments ADD CONSTRAINT FK_assignment_attribute 
	FOREIGN KEY (attribute_id) REFERENCES attributes (id)
;

ALTER TABLE assignments ADD CONSTRAINT FK_assignment_diagram 
	FOREIGN KEY (diagram_id) REFERENCES diagrams (id)
;

ALTER TABLE assignments ADD CONSTRAINT FK_assignment_system_type 
	FOREIGN KEY (system_type_id) REFERENCES system_types (id)
;

ALTER TABLE attachments ADD CONSTRAINT FK_attachment_formal_technical_review 
	FOREIGN KEY (formal_technical_review_id) REFERENCES formal_technical_reviews (id)
;

ALTER TABLE concepts ADD CONSTRAINT FK_concept_attribute 
	FOREIGN KEY (attribute_id) REFERENCES attributes (id)
;

ALTER TABLE formal_technical_reviews ADD CONSTRAINT FK_formal_technical_review_administrators 
	FOREIGN KEY (administrator_id) REFERENCES administrators (id)
;

ALTER TABLE formal_technical_reviews ADD CONSTRAINT FK_formal_technical_review_diagram 
	FOREIGN KEY (diagram_id) REFERENCES diagrams (id)
;

ALTER TABLE formal_technical_reviews ADD CONSTRAINT FK_formal_technical_review_programmers 
	FOREIGN KEY (programmer_id) REFERENCES programmers (id)
;

ALTER TABLE formal_technical_reviews ADD CONSTRAINT FK_formal_technical_review_score 
	FOREIGN KEY (score_id) REFERENCES scores (id)
;

ALTER TABLE formal_technical_reviews ADD CONSTRAINT FK_formal_technical_review_subsystem 
	FOREIGN KEY (subsystem_id) REFERENCES subsystems (id)
;

ALTER TABLE rtf_attributes ADD CONSTRAINT FK_rtf_attribute_attribute 
	FOREIGN KEY (attribute_id) REFERENCES attributes (id)
;

ALTER TABLE rtf_attributes ADD CONSTRAINT FK_rtf_attribute_formal_technical_review 
	FOREIGN KEY (rtf_id) REFERENCES formal_technical_reviews (id)
;

ALTER TABLE rtf_concepts ADD CONSTRAINT FK_rtf_concept_concept 
	FOREIGN KEY (concept_id) REFERENCES concepts (id)
;

ALTER TABLE rtf_concepts ADD CONSTRAINT FK_rtf_concept_formal_technical_review 
	FOREIGN KEY (rtf_id) REFERENCES formal_technical_reviews (id)
;

ALTER TABLE rtf_domains ADD CONSTRAINT FK_rtf_domain_formal_technical_review 
	FOREIGN KEY (formal_technical_review_id) REFERENCES formal_technical_reviews (id)
;

ALTER TABLE rtf_use_cases ADD CONSTRAINT FK_rtf_use_case_formal_technical_review 
	FOREIGN KEY (formal_technical_review_id) REFERENCES formal_technical_reviews (id)
;

ALTER TABLE sections ADD CONSTRAINT FK_section_diagram 
	FOREIGN KEY (diagram_id) REFERENCES diagrams (id)
;

ALTER TABLE subsystems ADD CONSTRAINT FK_subsystem_system 
	FOREIGN KEY (system_id) REFERENCES systems (id)
;

ALTER TABLE systems ADD CONSTRAINT FK_system_system_type 
	FOREIGN KEY (system_type_id) REFERENCES system_types (id)
;
