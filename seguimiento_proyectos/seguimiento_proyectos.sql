DROP DATABASE IF EXISTS seguimiento_proyectos;
CREATE DATABASE IF NOT EXISTS seguimiento_proyectos DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE seguimiento_proyectos;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE IF NOT EXISTS usuarios(
	codigo_usuario VARCHAR(30) NOT NULL PRIMARY KEY,
	nombres_usuario VARCHAR(150) NOT NULL COLLATE utf8_spanish_ci,
	apellidos_usuario VARCHAR(150) NOT NULL COLLATE utf8_spanish_ci,
	nacimiento_usuario DATE NOT NULL,
	password_usuario VARCHAR(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS proyectos;
CREATE TABLE IF NOT EXISTS proyectos(
	codigo_proyecto INT(7) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre_proyecto VARCHAR(150) NOT NULL COLLATE utf8_spanish_ci,
	descripcion_proyecto VARCHAR(255) DEFAULT NULL COLLATE utf8_spanish_ci,
	inicio_proyecto DATE NOT NULL,
	fin_proyecto DATE NOT NULL,
	responsable_proyecto VARCHAR(30) NOT NULL,
	CONSTRAINT fk_proyectos_usuarios FOREIGN KEY(responsable_proyecto) REFERENCES usuarios(codigo_usuario) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS tareas;
CREATE TABLE IF NOT EXISTS tareas(
	codigo_tarea INT(7) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre_tarea VARCHAR(150) NOT NULL COLLATE utf8_spanish_ci,
	descripcion_tarea VARCHAR(255) DEFAULT NULL COLLATE utf8_spanish_ci,
	codigo_proyecto INT(7) UNSIGNED NOT NULL,
	CONSTRAINT fk_tareas_proyectos FOREIGN KEY(codigo_proyecto) REFERENCES proyectos(codigo_proyecto) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS responsables;
CREATE TABLE IF NOT EXISTS responsables(
	codigo_responsable INT(7) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	codigo_tarea INT(7) UNSIGNED NOT NULL,
	codigo_usuario VARCHAR(30) NOT NULL,
	CONSTRAINT fk_responsables_usuarios FOREIGN KEY(codigo_usuario) REFERENCES usuarios(codigo_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_responsables_tareas FOREIGN KEY(codigo_tarea) REFERENCES tareas(codigo_tarea) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- ============================================================================================================================================================

INSERT INTO proyectos(codigo_proyecto,nombre_proyecto,descripcion_proyecto,inicio_proyecto,fin_proyecto,responsable_proyecto) VALUES
(101,'E. Sorto','San Miguel','1979-01-10','1986-01-07','It�s me, Mario!'),
(102,'S. Monjaras','San Juan Tepezontes','1979-04-04','1986-03-07','Titiushko'),
(103,'Q. Gonzalez','Sonsonate','1979-06-01','1986-07-01','Alejandro'),
(104,'S. Alegria','Atiquizaya','1979-09-05','1986-06-11','Erick'),
(105,'P. Cruz','Yamabal','1979-10-12','1986-05-04','Edenilson'),
(106,'D. Pozos','Ahuachapan','1979-11-02','1986-04-14','Yosely'),
(107,'A. Gutierrez','Torola','1979-12-09','1986-12-02','Marvin'),
(108,'A. Sorto','Apastepeque','1980-07-08','1986-11-12','Erika'),
(109,'X. Urbina','San Julian','1980-08-15','1986-10-05','Daniel'),
(110,'K. Galdamez','San Antonio Masahuat','1981-03-14','1986-08-08','Daniel'),
(111,'H. Reyes','Paraiso de Osorio','1981-05-11','1986-01-10','Claudia'),
(112,'G. Calderon','Joateca','1981-01-14','1986-02-10','Karen'),
(113,'C. Alvarado','San Vicente','1981-02-04','1985-08-11','Garcia'),
(114,'O. Duarte','San Vicente','1981-09-02','1985-06-14','It�s me, Mario!'),
(115,'K. Molina','Santa Ana','1981-04-01','1985-05-07','Sandra'),
(116,'J. Ponce','Cuisnahuat','1981-05-08','1985-03-10','Ivette'),
(117,'E. Lozano','Concepcion Quezaltepeque','1981-07-05','1985-12-05','Josue'),
(118,'P. Mendoza','El Congo','1981-08-12','1985-10-08','Titiushko'),
(119,'K. Perez','Morazan','1981-10-09','1985-07-04','Grissel'),
(120,'I. Perez','Ojos de Agua','1981-12-06','1985-04-10','Tatiana'),
(121,'C. Galdamez','La Union','1981-02-01','1985-09-01','Lisbeth'),
(122,'N. Duarte','San Miguel','1981-03-11','1985-02-03','Ivette'),
(123,'H. Duran','Chapeltique','1981-06-15','1985-01-13','Ingris'),
(124,'E. Brito','Chalatenango','1982-01-11','1985-07-07','Ingris'),
(125,'X. Mejia','San Buenaventura','1982-06-12','1985-05-10','Beatriz'),
(126,'H. Flores','Tacuba','1982-08-09','1985-03-13','Iris'),
(127,'A. Castro','La Union','1982-10-06','1985-10-11','Kevin'),
(128,'W. Romero','Santa Ana','1982-11-13','1985-08-14','Maria'),
(129,'P. Calderon','Morazan','1982-12-03','1985-04-03','Alejandro'),
(130,'Y. Ponce','Aguilares','1982-03-08','1985-12-08','Xiomara'),
(131,'Q. Hernandez','San Miguel','1982-04-15','1985-11-01','Vladimir'),
(132,'M. Vega','Morazan','1982-05-05','1985-09-04','Abigail'),
(133,'E. Bonilla','Chirilagua','1982-07-02','1985-06-10','Karen'),
(134,'M. Mejia','La Libertad','1983-01-08','1985-02-06','Yosely'),
(135,'D. Bonilla','Uluazapa','1983-02-15','1984-12-11','Evelyn'),
(136,'Y. Leon','Jayaque','1983-09-13','1984-10-14','Rodolfo'),
(137,'P. Henriquez','Caba?as','1983-11-10','1984-07-10','Iris'),
(138,'W. Perez','San Antonio Masahuat','1983-12-10','1984-06-03','Alfredo'),
(139,'N. Cabrera','San Luis La Herradura','1983-03-05','1984-05-13','Carlos'),
(140,'H. Gamez','Cuscatlan','1983-04-12','1984-04-06','Ana'),
(141,'X. Carrillo','Morazan','1983-05-02','1984-09-07','Rosa'),
(142,'D. Escobar','Guadalupe','1983-06-09','1984-08-10','Kevin'),
(143,'T. Martinez','San Ignacio','1983-08-06','1984-11-04','Ana'),
(144,'M. Molina','El Rosario','1983-10-03','1984-02-09','Jacqueline'),
(145,'C. Cubas','San Salvador','1983-01-05','1984-01-02','Yosely'),
(146,'I. Cruz','La Libertad','1983-02-12','1984-07-13','Garcia'),
(147,'X. Escobar','La Union','1983-10-10','1984-03-02','It�s me, Mario!'),
(148,'P. Cornejo','La Union','1984-04-09','1984-12-14','Carmen'),
(149,'E. Oviedo','Santa Ana','1984-06-06','1984-11-07','Nestor'),
(150,'I. Medrano','San Miguel','1984-08-03','1984-09-10','Marlene'),
(151,'X. Hernandez','San Salvador','1984-09-10','1984-08-03','Carmen'),
(152,'O. Contreras','Sonsonate','1984-11-07','1984-06-06','Jimmy'),
(153,'C. Medrano','La Laguna','1984-12-14','1984-04-09','Erika'),
(154,'G. Cornejo','San Vicente','1984-03-02','1983-10-10','Alexander'),
(155,'T. Vega','Jayaque','1984-07-13','1983-02-12','Emperatriz'),
(156,'K. Mendoza','Ilobasco','1984-01-02','1983-01-05','It�s me, Mario'),
(157,'X. Portillo','San Miguel','1984-02-09','1983-10-03','Sanchez'),
(158,'A. Duran','Santa Rosa de Lima','1984-11-04','1983-08-06','Ernesto'),
(159,'N. Sanchez','La Paz','1984-08-10','1983-06-09','Yosely'),
(160,'D. Flores','San Esteban Catarina','1984-09-07','1983-05-02','Edenilson'),
(161,'P. Gamez','Teotepeque','1984-04-06','1983-04-12','Maria'),
(162,'R. Oviedo','San Rafael','1984-05-13','1983-03-05','It�s me, Mario!'),
(163,'D. Carrillo','Cuscatlan','1984-06-03','1983-12-10','Jacqueline'),
(164,'S. Henriquez','San Isidro Labrador','1984-07-10','1983-11-10','Lisbeth'),
(165,'D. Fernandez','Ahuachapan','1984-10-14','1983-09-13','Ana'),
(166,'F. Mart?nez','Santa Ana','1984-12-11','1983-02-15','Abigail'),
(167,'Q. Reyes','San Cayetano Istepeque','1985-02-06','1983-01-08','Carlos'),
(168,'E. Urbina','Cuscatlan','1985-06-10','1982-07-02','Rodolfo'),
(169,'P. Orantes','Candelaria','1985-09-04','1982-05-05','Nestor'),
(170,'P. Oviedo','Usulutan','1985-11-01','1982-04-15','Marlene'),
(171,'A. Rivera','Tejutla','1985-12-08','1982-03-08','Ingris'),
(172,'N. Reyes','San Salvador','1985-04-03','1982-12-03','Lisbeth'),
(173,'X. Garcia','Tepecoyo','1985-08-14','1982-11-13','Yamileth'),
(174,'X. Duarte','Usulutan','1985-10-11','1982-10-06','Denis'),
(175,'G. Cubas','Yoloaiquin','1985-03-13','1982-08-09','Marlene'),
(176,'T. Angel','San Buenaventura','1985-05-10','1982-06-12','Evelyn'),
(177,'C. Hernandez','Cuscatlan','1985-07-07','1982-01-11','Alexander'),
(178,'B. Colocho','San Fernando','1985-01-13','1981-06-15','Alfredo'),
(179,'J. Alegria','Caba?as','1985-02-03','1981-03-11','Daniel'),
(180,'V. Ortega','La Libertad','1985-09-01','1981-02-01','Douglas'),
(181,'D. Trinidad','Tecoluca','1985-04-10','1981-12-06','Evelyn'),
(182,'C. Lozano','Caba?as','1985-07-04','1981-10-09','Erika'),
(183,'J. Castro','Santa Ana','1985-10-08','1981-08-12','Alejandro'),
(184,'U. Ortega','Usulutan','1985-12-05','1981-07-05','It�s me, Mario!'),
(185,'C. Ponce','Sonsonate','1985-03-10','1981-05-08','Boris'),
(186,'Z. Cerritos','San Jose Villanueva','1985-05-07','1981-04-01','Daniel'),
(187,'G. Osorio','Nahuizalco','1985-06-14','1981-09-02','Evelyn'),
(188,'Q. Alvarenga','San Antonio Pajonal','1985-08-11','1981-02-04','Ana'),
(189,'X. Vasquez','Santa Rosa Guachipilin','1986-02-10','1981-01-14','Sandra'),
(190,'T. Cubas','Santa Ana','1986-01-10','1981-05-11','Anthony'),
(191,'A. Molina','Sonsonate','1986-08-08','1981-03-14','Jose'),
(192,'J. Quijada','San Miguel','1986-10-05','1980-08-15','Josue'),
(193,'P. Mejia','Santa Ana','1986-11-12','1980-07-08','Herbert'),
(194,'K. Ortega','La Union','1986-12-02','1979-12-09','Ingris'),
(195,'Q. Roscala','Ahuachapan','1986-04-14','1979-11-02','Lisbeth'),
(196,'Y. Tobar','Concepcion Batres','1986-05-04','1979-10-12','Xiomara'),
(197,'D. Mart?nez','San Antonio del Monte','1986-06-11','1979-09-05','Jenifer'),
(198,'Y. Lopez','Panchimalco','1986-07-01','1979-06-01','Marta'),
(199,'D. Mart?nez','El Carrizal','1986-03-07','1979-04-04','Nestor'),
(200,'K. Guerrero','La Paz','1986-01-07','1979-01-10','Edwin');

INSERT INTO responsables(codigo_responsable,codigo_tarea,codigo_usuario) VALUES
('100','132','Denis'),
('101','172','Douglas'),
('102','189','Karen'),
('103','259','Edenilson'),
('104','105','Salvador'),
('105','240','Francisco'),
('106','124','Rosa'),
('107','108','Sanchez'),
('108','189','Titiushko'),
('109','157','Tony'),
('110','145','Douglas'),
('111','180','Ana'),
('112','135','Sandra'),
('113','272','Ana'),
('114','202','Jazmin'),
('115','226','Francisco'),
('116','291','Grissel'),
('117','136','It?s me, Mario'),
('118','245','Elizabeth'),
('119','195','Denis'),
('120','208','Hector'),
('121','298','Jazmin'),
('122','224','Edwin'),
('123','238','Salvador'),
('124','236','Ana'),
('125','108','Alejandra'),
('126','288','Yosely'),
('127','104','Salvador'),
('128','125','Marvin'),
('129','117','Novoa'),
('130','189','Maria'),
('131','143','Garcia'),
('132','225','It?s me, Mario!'),
('133','275','Jazmin'),
('134','276','Jenifer'),
('135','106','Iris'),
('136','286','Rodolfo'),
('137','130','Lisbeth'),
('138','298','Sanchez'),
('139','142','Titiushko'),
('140','258','Alfredo'),
('141','235','Marta'),
('142','207','Jazmin'),
('143','202','Xiomara'),
('144','290','Ana'),
('145','137','Maria'),
('146','151','Ivette'),
('147','235','Yamileth'),
('148','134','Edenilson'),
('149','188','Tatiana'),
('150','282','Yosely'),
('151','192','Carlos'),
('152','139','Yamileth'),
('153','138','Edgardo'),
('154','148','Garcia'),
('155','222','Erika'),
('156','254','Isabel'),
('157','136','Lisbeth'),
('158','101','Isabel'),
('159','275','Ivonne'),
('160','231','Herbert'),
('161','132','Xiomara'),
('162','289','Titiushko'),
('163','102','Jacqueline'),
('164','218','Beatriz'),
('165','277','Jenifer'),
('166','263','Novoa'),
('167','252','Garcia'),
('168','167','Titiushko'),
('169','121','Jimmy'),
('170','173','Beatriz'),
('171','276','Emperatriz'),
('172','226','Rosa'),
('173','212','Jazmin'),
('174','169','Jimmy'),
('175','123','Tony'),
('176','146','Alejandra'),
('177','103','Garcia'),
('178','201','Ivonne'),
('179','144','Karen'),
('180','277','Manuel'),
('181','141','Erika'),
('182','219','Emperatriz'),
('183','288','It?s me, Mario!'),
('184','170','Maria'),
('185','278','Alejandro'),
('186','173','Edwin'),
('187','106','Jimmy'),
('188','173','Xiomara'),
('189','264','Marlene'),
('190','213','Beatriz'),
('191','147','Abigail'),
('192','237','Grissel'),
('193','248','Guillermo'),
('194','288','Manuel'),
('195','161','Garcia'),
('196','112','Vladimir'),
('197','180','Novoa'),
('198','150','Tony'),
('199','299','Isabel'),
('200','147','Jose'),
('201','211','Sanchez'),
('202','148','Douglas'),
('203','110','Jimmy'),
('204','294','Iris'),
('205','290','Marta'),
('206','231','Ernesto'),
('207','145','Beatriz'),
('208','102','Alexander'),
('209','168','Yosely'),
('210','151','Erika'),
('211','153','Anthony'),
('212','121','Marvin'),
('213','194','Douglas'),
('214','256','Emperatriz'),
('215','285','Ingris'),
('216','100','Melissa'),
('217','119','Yosely'),
('218','297','Melissa'),
('219','290','Ivette'),
('220','191','Rodolfo'),
('221','292','Tatiana'),
('222','225','Jimmy'),
('223','118','Jose'),
('224','143','Edenilson'),
('225','263','Guillermo'),
('226','188','Jazmin'),
('227','120','Garcia'),
('228','105','Ivonne'),
('229','183','Denis'),
('230','137','Jazmin'),
('231','245','Kevin'),
('232','228','Daniel'),
('233','201','Francisco'),
('234','222','Ingris'),
('235','244','Kevin'),
('236','263','Sandra'),
('237','268','Francisco'),
('238','193','Ernesto'),
('239','266','Lisbeth'),
('240','158','Edgardo'),
('241','133','Maria'),
('242','200','Herbert'),
('243','262','Garcia'),
('244','264','Xiomara'),
('245','147','Alexander'),
('246','193','Hector'),
('247','181','Beatriz'),
('248','131','Jimmy'),
('249','259','Kevin'),
('250','122','Ernesto'),
('251','174','Grissel'),
('252','109','Evelyn'),
('253','219','Tony'),
('254','137','It?s me, Mario'),
('255','190','Alexander'),
('256','148','Ivonne'),
('257','178','Ana'),
('258','188','Jazmin'),
('259','179','Elizabeth'),
('260','198','Abigail'),
('261','286','Sandra'),
('262','224','Anthony'),
('263','292','Sanchez'),
('264','209','Edgardo'),
('265','291','Tony'),
('266','197','Manuel'),
('267','278','Lisbeth'),
('268','131','Lisbeth'),
('269','146','Manuel'),
('270','255','Iris'),
('271','288','Grissel'),
('272','114','Edenilson'),
('273','198','Erick'),
('274','150','Herbert'),
('275','271','Douglas'),
('276','108','Salvador'),
('277','199','Alexander'),
('278','230','Edenilson'),
('279','178','Marta'),
('280','262','Herbert'),
('281','299','Xiomara'),
('282','247','Denis'),
('283','158','Ana'),
('284','128','Jazmin'),
('285','247','Jacqueline'),
('286','149','Edwin'),
('287','161','Beatriz'),
('288','254','Jose'),
('289','193','Melissa'),
('290','287','It?s me, Mario!'),
('291','138','Rosa'),
('292','192','Kevin'),
('293','288','Ingris'),
('294','211','Melissa'),
('295','238','Isabel'),
('296','290','Ana'),
('297','282','Jimmy'),
('298','271','Josue'),
('299','212','Alfredo');

INSERT INTO tareas(codigo_tarea,nombre_tarea,descripcion_tarea,codigo_proyecto) VALUES
('100','V. Flores','Pasaquina','124'),
('101','C. Pacheco','Santa Ana','158'),
('102','G. Fernandez','Candelaria','105'),
('103','A. Mart?nez','Yoloaiquin','166'),
('104','M. Hilario','Caba?as','127'),
('105','F. Cubas','Nahulingo','185'),
('106','U. Castro','San Miguel','169'),
('107','S. Alvarado','Chalatenango','169'),
('108','Z. Gamez','Santa Clara','158'),
('109','B. Mencos','Chiltiupan','120'),
('110','J. Gonzalez','Usulutan','173'),
('111','H. Vega','Arambala','193'),
('112','R. Cornejo','Nuevo Cuscatlan','141'),
('113','W. Urbina','San Juan Opico','189'),
('114','E. Cruz','San Luis de la Reina','141'),
('115','X. Morales','La Paz','162'),
('116','S. Galdamez','San Jorge','101'),
('117','X. Novoa','Ahuachapan','116'),
('118','O. Urbina','Armenia','200'),
('119','W. Carrillo','Sonsonate','104'),
('120','L. Urbina','San Vicente','164'),
('121','J. Roscala','Santa Ana','127'),
('122','R. Portillo','Usulutan','173'),
('123','L. Tobar','Olocuilta','141'),
('124','B. Echeverria','San Antonio del Mosco','154'),
('125','O. Trinidad','La Paz','147'),
('126','V. Valencia','Cacaopera','186'),
('127','V. Avelar','San Salvador','199'),
('128','V. Ochoa','Conchagua','197'),
('129','S. Aguilar','San Pedro Puxtla','200'),
('130','H. Ponce','La Union','164'),
('131','H. Trinidad','Morazan','103'),
('132','Z. Cornejo','San Ildefonso','116'),
('133','C. Gutierrez','San Miguel','112'),
('134','F. Guzman','Morazan','132'),
('135','C. Ortiz','Morazan','179'),
('136','U. Escobar','La Libertad','138'),
('137','X. Garcia','La Union','107'),
('138','Y. Cruz','Armenia','114'),
('139','N. Ochoa','Ereguayquin','150'),
('140','N. Brito','Chalatenango','188'),
('141','L. Calderon','San Cayetano Istepeque','111'),
('142','S. Gomez','Meanguera del Golfo','137'),
('143','T. Alegria','Santa Ana','143'),
('144','J. Uceda','San Miguel','190'),
('145','Y. Valencia','Tamanique','149'),
('146','T. Carrillo','La Union','124'),
('147','B. Beltran','El Carmen','181'),
('148','Q. Vega','La Paz','169'),
('149','Q. Ayala','San Vicente','145'),
('150','H. Rafaelano','San Salvador','101'),
('151','S. Ayala','Rosario de Mora','191'),
('152','N. Martinez','Paraiso de Osorio','150'),
('153','V. Ponce','Tejutepeque','124'),
('154','P. Mencos','Usulutan','193'),
('155','Z. Diaz','Ahuachapan','197'),
('156','I. Rivas','Santa Rosa de Lima','159'),
('157','S. Cruz','Sonsonate','113'),
('158','Y. Osorio','Santa Rosa de Lima','125'),
('159','B. Romero','Caba?as','124'),
('160','H. Bonilla','Cuyultitlan','120'),
('161','O. Pozos','Ahuachapan','135'),
('162','O. Henriquez','Delgado','122'),
('163','F. Calderon','Perquin','197'),
('164','Q. Novoa','Usulutan','159'),
('165','P. Morales','San Vicente','115'),
('166','S. Angel','La Union','109'),
('167','S. Gamez','El Carmen','141'),
('168','Q. Ochoa','Cuscatlan','200'),
('169','C. Aguilar','Yamabal','179'),
('170','Q. Pozos','Cuyultitlan','110'),
('171','U. Perez','Chalatenango','182'),
('172','N. Gonzalez','Guatajiagua','168'),
('173','I. Contreras','Acajutla','152'),
('174','O. Sanchez','El Divisadero','151'),
('175','S. Mencos','Conchagua','143'),
('176','O. Carranza','La Paz','188'),
('177','N. Hilario','Atiquizaya','158'),
('178','U. Molina','Yayantique','157'),
('179','S. Avelar','La Libertad','150'),
('180','A. Calderon','Ahuachapan','186'),
('181','X. Alegria','Sociedad','123'),
('182','N. Castro','Nahuizalco','153'),
('183','B. Lozano','Usulutan','129'),
('184','C. Morales','Quelepa','186'),
('185','T. Calderon','El Porvenir','171'),
('186','A. Roscala','San Salvador','164'),
('187','A. Bonilla','La Libertad','104'),
('188','C. Rodriguez','Cinquera','114'),
('189','I. Angel','Jucuaran','128'),
('190','O. Urbina','Morazan','115'),
('191','T. Carranza','Tejutepeque','199'),
('192','G. Avelar','San Isidro','194'),
('193','W. Alvarado','Ahuachapan','119'),
('194','J. Novoa','San Salvador','130'),
('195','Q. Roscala','Cuscatlan','141'),
('196','T. Mart?nez','Armenia','151'),
('197','P. Fernandez','San Juan Opico','168'),
('198','S. Castro','San Cristobal','135'),
('199','U. Mart?nez','San Vicente','154'),
('200','Y. Leon','San Miguel','111'),
('201','U. Carranza','San Salvador','101'),
('202','U. Rivera','Chalatenango','155'),
('203','P. Gamez','Yoloaiquin','163'),
('204','B. Castro','La Paz','198'),
('205','S. Pozos','Dulce Nombre de Maria','143'),
('206','Y. Roscala','San Fernando','115'),
('207','E. Monjaras','La Union','193'),
('208','H. Romero','La Paz','137'),
('209','O. Leon','Santa Ana','118'),
('210','I. Mart?nez','Usulutan','140'),
('211','X. Medrano','Conchagua','169'),
('212','X. Quijada','San Salvador','154'),
('213','R. Leon','Morazan','151'),
('214','G. Alvarenga','Caba?as','155'),
('215','X. Gutierrez','Ahuachapan','117'),
('216','E. Contreras','San Salvador','173'),
('217','F. Alegria','Ahuachapan','168'),
('218','Y. Ortiz','San Salvador','184'),
('219','N. Hilario','Ciudad Arce','160'),
('220','J. Garcia','Ahuachapan','119'),
('221','L. Gomez','Tecoluca','194'),
('222','R. Ortiz','Santa Maria','154'),
('223','Z. Urbina','San Salvador','124'),
('224','R. Mart?nez','San Vicente','118'),
('225','R. Quijada','Gualococti','154'),
('226','R. Escobar','Santa Ana','188'),
('227','N. Beltran','Mejicanos','135'),
('228','K. Uceda','Cuscatlan','194'),
('229','C. Marquez','Caba?as','172'),
('230','E. Quijada','San Rafael Cedros','112'),
('231','K. Cerritos','San Isidro','117'),
('232','U. Reyes','La Union','172'),
('233','Z. Pozos','San Buenaventura','173'),
('234','M. Gonzalez','San Miguel','151'),
('235','W. Hernandez','Chalatenango','194'),
('236','B. Henriquez','Cuscatlan','178'),
('237','P. Romero','Ciudad Barrios','183'),
('238','U. Garcia','Nahuizalco','130'),
('239','E. Carranza','El Congo','193'),
('240','M. Avelar','Morazan','136'),
('241','D. Vega','Mercedes La Ceiba','127'),
('242','J. Valencia','Morazan','173'),
('243','O. Mart?nez','Ereguayquin','138'),
('244','H. Urbina','San Vicente','171'),
('245','X. Gutierrez','Tenancingo','130'),
('246','M. Gutierrez','Cuscatlan','107'),
('247','G. Rivas','La Union','154'),
('248','T. Escobar','Chalatenango','109'),
('249','D. Guerrero','Cuscatlan','116'),
('250','J. Vega','San Pablo Tacachico','155'),
('251','O. Fernandez','Turin','166'),
('252','D. Gonzalez','Chalatenango','174'),
('253','C. Contreras','Sonsonate','110'),
('254','H. Uceda','Usulutan','143'),
('255','S. Cruz','Santa Rita','200'),
('256','Q. Lopez','Usulutan','191'),
('257','Z. Angel','La Libertad','138'),
('258','M. Lopez','San Sebastian Salitrillo','196'),
('259','Y. Rivas','Jocoaitique','179'),
('260','O. Rivas','Concepcion Batres','186'),
('261','C. Contreras','Rosario de Mora','125'),
('262','E. Tobar','Cuscatlan','139'),
('263','M. Gamez','Chalatenango','129'),
('264','C. Orantes','Sonsonate','183'),
('265','R. Trinidad','Jocoro','195'),
('266','Q. Hernandez','Perquin','196'),
('267','Q. Angel','Azacualpa','176'),
('268','O. Cornejo','San Vicente','107'),
('269','Y. Guzman','Gualococti','174'),
('270','E. Garc','San Vicente','194'),
('271','Q. Cerritos','El Paisnal','144'),
('272','E. Pozos','San Agustin','184'),
('273','F. Alas','Santa Ana','187'),
('274','Y. Sorto','San Vicente','156'),
('275','S. Alas','Caba?as','157'),
('276','E. Molina','San Luis del Carmen','138'),
('277','R. Roscala','Oratorio de Concepcion','158'),
('278','F. Duran','Ahuachapan','108'),
('279','C. Perez','Izalco','142'),
('280','V. Sanchez','Tamanique','195'),
('281','P. Echeverria','San Luis del Carmen','113'),
('282','H. Quijada','Usulutan','175'),
('283','C. Ortega','San Vicente','123'),
('284','K. Trinidad','Cinquera','179'),
('285','F. Mart?nez','La Libertad','176'),
('286','K. Ortega','San Vicente','182'),
('287','Y. Alegria','Santa Cruz Analquito','125'),
('288','C. Valencia','Ahuachapan','115'),
('289','U. Reyes','Sensembra','173'),
('290','T. Castro','Jutiapa','154'),
('291','V. Angel','Usulutan','173'),
('292','F. Cornejo','Santa Ana','128'),
('293','P. Guerrero','Acajutla','128'),
('294','R. Martinez','San Salvador','116'),
('295','C. Alegria','Santa Ana','192'),
('296','Y. Vega','San Miguel','144'),
('297','W. Medrano','San Vicente','167'),
('298','I. Aguilar','Suchitoto','192'),
('299','Y. Carrillo','La Libertad','107');

INSERT INTO usuarios(codigo_usuario,nombres_usuario,apellidos_usuario,nacimiento_usuario,password_usuario) VALUES
('Titiushko','Tito Javier','Miguel Galdamez','1984-05-06','tito'),
('Rosa','Francisco Iliana','Vasquez Roscala','1986-02-10','20394'),
('It�s me, Mario','Willian Romeo','Guzman Contreras','1985-04-10','12011'),
('Grissel','Ernesto Johanna','Orellana Pacheco','1985-06-10','1708'),
('Evelyn','Jesus Claudia','Mencos Mejia','1984-08-10','D5T 5N3'),
('Elizabeth','Carmen Hector','Gomez Rafaelano','1983-10-10','J3W 5O1'),
('Edenilson','Miguel Jazmin','Trinidad Castro','1983-12-10','J7R 5S1'),
('Xiomara','Johanna Jose','Mendoza Valle','1981-02-01','Q7Z 7Y6'),
('Lisbeth','Katya Tony','Brito Gomez','1979-06-01','K6P 7O4'),
('Jazmin','Jesus Evelyn','Carranza Rodriguez','1986-07-01','D8V 3B2'),
('Daniel','Hilario Ivette','Cruz Angel','1985-09-01','K5G 4I2'),
('Yamileth','Jairo Claudia','Sorto Uceda','1985-11-01','36350'),
('Alfredo','Sandra Karen','Hernandez Cerritos','1984-01-02','7692'),
('Erika','Kevin Garcia','Vega Angel','1984-03-02','76574'),
('Yosely','Omar Johanna','Cabrera Hernandez','1983-05-02','F1V 6H8'),
('Ivette','Lisandro Roxana','Ponce Diaz','1982-07-02','O6M 9K4'),
('Alejandra','Jose Anthony','Bonilla Cerritos','1981-09-02','67826'),
('Edwin','Grissel Marvin','Cerritos Mencos','1979-11-02','9677'),
('Tatiana','Jenifer Ricardo','Oviedo Portillo','1986-12-02','C5O 4K9'),
('Sanchez','Gerardo Cecilia','Oviedo Rodriguez','1985-02-03','C6A 2Q1'),
('Guillermo','Isabel Alicia','Sanchez Ayala','1984-06-03','E3C 5L5'),
('Isabel','Boris Marta','Romero Reyes','1984-08-03','35230'),
('Josue','Garcia Rolando','Garcia Lopez','1983-10-03','S1F 4T4'),
('Denis','Yosely Ana','Fernandez Gonzalez','1982-12-03','41340'),
('Marlene','Yamileth Yosely','Ortiz Galdamez','1981-02-04','35960'),
('Emperatriz','Nestor Douglas','Gamez Cabrera','1979-04-04','27813'),
('Nestor','Saul Herbert','Ponce Castro','1985-09-04','X2J 9E7'),
('Garcia','Tony Alejandro','Ochoa Lopez','1984-11-04','67847'),
('Douglas','Xiomara Jesus','Portillo Ortiz','1983-03-05','Y6A 1Q6'),
('Iris','Roxana Marlene','Cornejo Tobar','1982-05-05','70668'),
('Jenifer','Jenifer Antonio','Gamez Rafaelano','1979-09-05','77161'),
('Edgardo','Maria Hector','Colocho Guerrero','1986-10-05','F4L 1Z7'),
('Salvador','Maria Alejandra','Oviedo Rivas','1985-12-05','12817'),
('Melissa','Carmen Tatiana','Orellana Duarte','1985-02-06','M2G 1A2'),
('Maria','Ingris Garcia','Cabrera Alegria','1984-04-06','O7G 5M2'),
('Jacqueline','Miguel Abigail','Portillo Mejia','1982-10-06','18739'),
('Kevin','Tony Marvin','Ayala Flores','1981-12-06','88891'),
('It�s me, Mario!','Ivan Claudia','Uceda Galdamez','1986-01-07','H6C 1W4'),
('Sandra','Tatiana Garcia','Beltran Guerrero','1985-07-07','81055'),
('Ana','Rosa Manuel','Brito Duarte','1984-09-07','I8P 2B4'),
('Hector','Christian Xiomara','Castro Lopez','1984-11-07','S6F 5H1'),
('Alejandro','Ricardo Roxana','Carranza Orantes','1982-03-08','U5M 2Q6'),
('Francisco','Claudia Romeo','Lozano Rivera','1980-07-08','35128'),
('Marvin','Abigail Ivette','Gutierrez Carranza','1985-10-08','I1P 2M0'),
('Jose','Grissel Daniel','Rafaelano Roscala','1984-02-09','H3L 8M6'),
('Manuel','Lisandro Tony','Quijada Novoa','1984-04-09','J1S 6A1'),
('Vladimir','Isabel Jimmy','Martinez Ponce','1983-06-09','20127'),
('Alexander','Jenifer Rolando','Gutierrez Escobar','1982-08-09','28285'),
('Ernesto','Lisbeth Carmen','Duran Henriquez','1981-10-09','36584'),
('Boris','Giovanni Oscar','Rivas Rodriguez','1979-12-09','P6L 3Q0'),
('Marta','Henry Edenilson','Rafaelano Valencia','1985-03-10','X7D 1K7'),
('Karen','Erick Edenilson','Lopez Osorio','1984-07-10','P5S 5F8'),
('Claudia','Luis Francisco','Garcia Valencia','1984-09-10','54502'),
('Rodolfo','Alicia Alexander','Valle Urbina','1983-11-10','40678'),
('Ivonne','Edwin Alfredo','Diaz Vega','1981-03-11','22651'),
('Beatriz','Nestor Henry','Rodriguez Rivas','1986-06-11','N3M 2O4'),
('Abigail','Henry Ernesto','Medrano Romero','1985-08-11','85011'),
('Novoa','Yamileth Gerardo','Carrillo Alegria','1985-10-11','17665'),
('Carlos','Josue Marlene','Brito Valencia','1984-12-11','L1M 9V9'),
('Herbert','Ernesto Elmer','Escobar Duarte','1982-06-12','Y5U 5E6'),
('Anthony','Armando Orellana','Marquez Osorio','1981-08-12','6779'),
('Erick','Guadalupe Yamileth','Marquez Alvarenga','1985-03-13','15668'),
('Jimmy','Yamileth Jose','Ortiz Contreras','1984-05-13','X8U 5M7'),
('Tony','Lisandro Alicia','Valencia Pacheco','1986-04-14','35251'),
('Ingris','Willian Ingris','Pena Alvarado','1982-04-15','6631'),
('Carmen','Marvin Claudia','Valencia Gamez','1981-06-15','19087');
