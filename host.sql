-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: host
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add host',7,'add_host'),(20,'Can change host',7,'change_host'),(21,'Can delete host',7,'delete_host'),(22,'Can add user_msg',8,'add_user_msg'),(23,'Can change user_msg',8,'change_user_msg'),(24,'Can delete user_msg',8,'delete_user_msg'),(25,'Can add lob',9,'add_lob'),(26,'Can change lob',9,'change_lob'),(27,'Can delete lob',9,'delete_lob');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'host_manage','host'),(9,'host_manage','lob'),(8,'host_manage','user_msg'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-22 14:41:36.902925'),(2,'auth','0001_initial','2017-05-22 14:41:37.393229'),(3,'admin','0001_initial','2017-05-22 14:41:37.531598'),(4,'admin','0002_logentry_remove_auto_add','2017-05-22 14:41:37.542626'),(5,'contenttypes','0002_remove_content_type_name','2017-05-22 14:41:37.625848'),(6,'auth','0002_alter_permission_name_max_length','2017-05-22 14:41:37.670967'),(7,'auth','0003_alter_user_email_max_length','2017-05-22 14:41:37.734136'),(8,'auth','0004_alter_user_username_opts','2017-05-22 14:41:37.746168'),(9,'auth','0005_alter_user_last_login_null','2017-05-22 14:41:37.791288'),(10,'auth','0006_require_contenttypes_0002','2017-05-22 14:41:37.794296'),(11,'auth','0007_alter_validators_add_error_messages','2017-05-22 14:41:37.805325'),(12,'auth','0008_alter_user_username_max_length','2017-05-22 14:41:37.856461'),(13,'host_manage','0001_initial','2017-05-22 14:41:38.148237'),(14,'sessions','0001_initial','2017-05-22 14:41:38.189347'),(15,'host_manage','0002_auto_20170523_0916','2017-05-23 01:16:37.160974');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0qti8qki79asuedz4ltvsejrcpfsmqu1','OTI4ZDQxY2I0MmNhNjE4MTE3YmMwNDRjNWUzMGU2Y2ZkZDFiODU5YTp7InVzZXJuYW1lIjoiYWRtaW4ifQ==','2017-06-14 09:07:05.556794'),('vhcs5xfiwf2oify3qhluq9c1stiy35ec','OTI4ZDQxY2I0MmNhNjE4MTE3YmMwNDRjNWUzMGU2Y2ZkZDFiODU5YTp7InVzZXJuYW1lIjoiYWRtaW4ifQ==','2017-06-10 13:38:32.724341');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_manage_host`
--

DROP TABLE IF EXISTS `host_manage_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_manage_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `port` int(11) NOT NULL,
  `host_user` varchar(30) NOT NULL,
  `host_password` varchar(30) NOT NULL,
  `lob_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `host_manage_host_lob_id_c09db18f_fk_host_manage_lob_id` (`lob_id`),
  CONSTRAINT `host_manage_host_lob_id_c09db18f_fk_host_manage_lob_id` FOREIGN KEY (`lob_id`) REFERENCES `host_manage_lob` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_manage_host`
--

LOCK TABLES `host_manage_host` WRITE;
/*!40000 ALTER TABLE `host_manage_host` DISABLE KEYS */;
INSERT INTO `host_manage_host` VALUES (2,'192.168.1.3',22,'root','123',2),(3,'192.168.1.4',22,'root','123',21),(4,'192.168.1.5',22,'root','123',3),(5,'192.168.1.100',22,'root','123',4),(6,'192.168.1.2',22,'root','123',2),(10,'192.168.1.200',222,'root','123',2),(11,'192.168.1.201',777,'root','123',13),(13,'127.0.0.1',22,'root','123',21),(14,'192.168.1.1',23,'root1','123',1),(15,'192.168.1.2',24,'root2','123',1),(16,'192.168.1.3',25,'root3','123',1),(17,'192.168.1.4',26,'root4','123',1),(213,'192.168.1.1',23,'root1','123',1),(214,'192.168.1.2',24,'root2','123',1),(215,'192.168.1.3',25,'root3','123',1),(216,'192.168.1.4',26,'root4','123',1),(217,'192.168.1.5',27,'root5','123',1),(218,'192.168.1.6',28,'root6','123',1),(219,'192.168.1.7',29,'root7','123',1),(220,'192.168.1.8',30,'root8','123',1),(221,'192.168.1.9',31,'root9','123',1),(222,'192.168.1.10',32,'root10','123',1),(223,'192.168.1.11',33,'root11','123',1),(224,'192.168.1.12',34,'root12','123',1),(225,'192.168.1.13',35,'root13','123',1),(226,'192.168.1.14',36,'root14','123',1),(227,'192.168.1.15',37,'root15','123',1),(228,'192.168.1.16',38,'root16','123',1),(229,'192.168.1.17',39,'root17','123',1),(230,'192.168.1.18',40,'root18','123',1),(231,'192.168.1.19',41,'root19','123',1),(232,'192.168.1.20',42,'root20','123',1),(233,'192.168.1.21',43,'root21','123',1),(234,'192.168.1.22',44,'root22','123',1),(235,'192.168.1.23',45,'root23','123',1),(236,'192.168.1.24',46,'root24','123',1),(237,'192.168.1.25',47,'root25','123',1),(238,'192.168.1.26',48,'root26','123',1),(239,'192.168.1.27',49,'root27','123',1),(240,'192.168.1.28',50,'root28','123',1),(241,'192.168.1.29',51,'root29','123',1),(242,'192.168.1.30',52,'root30','123',1),(243,'192.168.1.31',53,'root31','123',1),(244,'192.168.1.32',54,'root32','123',1),(245,'192.168.1.33',55,'root33','123',1),(246,'192.168.1.34',56,'root34','123',1),(247,'192.168.1.35',57,'root35','123',1),(248,'192.168.1.36',58,'root36','123',1),(249,'192.168.1.37',59,'root37','123',1),(250,'192.168.1.38',60,'root38','123',1),(251,'192.168.1.39',61,'root39','123',1),(252,'192.168.1.40',62,'root40','123',1),(253,'192.168.1.41',63,'root41','123',1),(254,'192.168.1.42',64,'root42','123',1),(255,'192.168.1.43',65,'root43','123',1),(256,'192.168.1.44',66,'root44','123',1),(257,'192.168.1.45',67,'root45','123',1),(258,'192.168.1.46',68,'root46','123',1),(259,'192.168.1.47',69,'root47','123',1),(260,'192.168.1.48',70,'root48','123',1),(261,'192.168.1.49',71,'root49','123',1),(262,'192.168.1.50',72,'root50','123',1),(263,'192.168.1.51',73,'root51','123',1),(264,'192.168.1.52',74,'root52','123',1),(265,'192.168.1.53',75,'root53','123',1),(266,'192.168.1.54',76,'root54','123',1),(267,'192.168.1.55',77,'root55','123',1),(268,'192.168.1.56',78,'root56','123',1),(269,'192.168.1.57',79,'root57','123',1),(270,'192.168.1.58',80,'root58','123',1),(271,'192.168.1.59',81,'root59','123',1),(272,'192.168.1.60',82,'root60','123',1),(273,'192.168.1.61',83,'root61','123',1),(274,'192.168.1.62',84,'root62','123',1),(275,'192.168.1.63',85,'root63','123',1),(276,'192.168.1.64',86,'root64','123',1),(277,'192.168.1.65',87,'root65','123',1),(278,'192.168.1.66',88,'root66','123',1),(279,'192.168.1.67',89,'root67','123',1),(280,'192.168.1.68',90,'root68','123',1),(281,'192.168.1.69',91,'root69','123',1),(282,'192.168.1.70',92,'root70','123',1),(283,'192.168.1.71',93,'root71','123',1),(284,'192.168.1.72',94,'root72','123',1),(285,'192.168.1.73',95,'root73','123',1),(286,'192.168.1.74',96,'root74','123',1),(287,'192.168.1.75',97,'root75','123',1),(288,'192.168.1.76',98,'root76','123',1),(289,'192.168.1.77',99,'root77','123',1),(290,'192.168.1.78',100,'root78','123',1),(291,'192.168.1.79',101,'root79','123',1),(292,'192.168.1.80',102,'root80','123',1),(293,'192.168.1.81',103,'root81','123',1),(294,'192.168.1.82',104,'root82','123',1),(295,'192.168.1.83',105,'root83','123',1),(296,'192.168.1.84',106,'root84','123',1),(297,'192.168.1.85',107,'root85','123',1),(298,'192.168.1.86',108,'root86','123',1),(299,'192.168.1.87',109,'root87','123',1),(300,'192.168.1.88',110,'root88','123',1),(301,'192.168.1.89',111,'root89','123',1),(302,'192.168.1.90',112,'root90','123',1),(303,'192.168.1.91',113,'root91','123',1),(304,'192.168.1.92',114,'root92','123',1),(305,'192.168.1.93',115,'root93','123',1),(306,'192.168.1.94',116,'root94','123',1),(307,'192.168.1.95',117,'root95','123',1),(308,'192.168.1.96',118,'root96','123',1),(309,'192.168.1.97',119,'root97','123',1),(310,'192.168.1.98',120,'root98','123',1),(311,'192.168.1.99',121,'root99','123',1),(312,'192.168.1.100',122,'root100','123',1),(313,'192.168.1.101',123,'root101','123',1),(314,'192.168.1.102',124,'root102','123',1),(315,'192.168.1.103',125,'root103','123',1),(316,'192.168.1.104',126,'root104','123',1),(317,'192.168.1.105',127,'root105','123',1),(318,'192.168.1.106',128,'root106','123',1),(319,'192.168.1.107',129,'root107','123',1),(320,'192.168.1.108',130,'root108','123',1),(321,'192.168.1.109',131,'root109','123',1),(322,'192.168.1.110',132,'root110','123',1),(323,'192.168.1.111',133,'root111','123',1),(324,'192.168.1.112',134,'root112','123',1),(325,'192.168.1.113',135,'root113','123',1),(326,'192.168.1.114',136,'root114','123',1),(327,'192.168.1.115',137,'root115','123',1),(328,'192.168.1.116',138,'root116','123',1),(329,'192.168.1.117',139,'root117','123',1),(330,'192.168.1.118',140,'root118','123',1),(331,'192.168.1.119',141,'root119','123',1),(332,'192.168.1.120',142,'root120','123',1),(333,'192.168.1.121',143,'root121','123',1),(334,'192.168.1.122',144,'root122','123',1),(335,'192.168.1.123',145,'root123','123',1),(336,'192.168.1.124',146,'root124','123',1),(337,'192.168.1.125',147,'root125','123',1),(338,'192.168.1.126',148,'root126','123',1),(339,'192.168.1.127',149,'root127','123',1),(340,'192.168.1.128',150,'root128','123',1),(341,'192.168.1.129',151,'root129','123',1),(342,'192.168.1.130',152,'root130','123',1),(343,'192.168.1.131',153,'root131','123',1),(344,'192.168.1.132',154,'root132','123',1),(345,'192.168.1.133',155,'root133','123',1),(346,'192.168.1.134',156,'root134','123',1),(347,'192.168.1.135',157,'root135','123',1),(348,'192.168.1.136',158,'root136','123',1),(349,'192.168.1.137',159,'root137','123',1),(350,'192.168.1.138',160,'root138','123',1),(351,'192.168.1.139',161,'root139','123',1),(352,'192.168.1.140',162,'root140','123',1),(353,'192.168.1.141',163,'root141','123',1),(354,'192.168.1.142',164,'root142','123',1),(355,'192.168.1.143',165,'root143','123',1),(356,'192.168.1.144',166,'root144','123',1),(357,'192.168.1.145',167,'root145','123',1),(358,'192.168.1.146',168,'root146','123',1),(359,'192.168.1.147',169,'root147','123',1),(360,'192.168.1.148',170,'root148','123',1),(361,'192.168.1.149',171,'root149','123',1),(362,'192.168.1.150',172,'root150','123',1),(363,'192.168.1.151',173,'root151','123',1),(364,'192.168.1.152',174,'root152','123',1),(365,'192.168.1.153',175,'root153','123',1),(366,'192.168.1.154',176,'root154','123',1),(367,'192.168.1.155',177,'root155','123',1),(368,'192.168.1.156',178,'root156','123',1),(369,'192.168.1.157',179,'root157','123',1),(370,'192.168.1.158',180,'root158','123',1),(371,'192.168.1.159',181,'root159','123',1),(372,'192.168.1.160',182,'root160','123',1),(373,'192.168.1.161',183,'root161','123',1),(374,'192.168.1.162',184,'root162','123',1),(375,'192.168.1.163',185,'root163','123',1),(376,'192.168.1.164',186,'root164','123',1),(377,'192.168.1.165',187,'root165','123',1),(378,'192.168.1.166',188,'root166','123',1),(379,'192.168.1.167',189,'root167','123',1),(380,'192.168.1.168',190,'root168','123',1),(381,'192.168.1.169',191,'root169','123',1),(382,'192.168.1.170',192,'root170','123',1),(383,'192.168.1.171',193,'root171','123',1),(384,'192.168.1.172',194,'root172','123',1),(385,'192.168.1.173',195,'root173','123',1),(386,'192.168.1.174',196,'root174','123',1),(387,'192.168.1.175',197,'root175','123',1),(388,'192.168.1.176',198,'root176','123',1),(389,'192.168.1.177',199,'root177','123',1),(390,'192.168.1.178',200,'root178','123',1),(391,'192.168.1.179',201,'root179','123',1),(392,'192.168.1.180',202,'root180','123',1),(393,'192.168.1.181',203,'root181','123',1),(394,'192.168.1.182',204,'root182','123',1),(395,'192.168.1.183',205,'root183','123',1),(396,'192.168.1.184',206,'root184','123',1),(397,'192.168.1.185',207,'root185','123',1),(398,'192.168.1.186',208,'root186','123',1),(399,'192.168.1.187',209,'root187','123',1),(400,'192.168.1.188',210,'root188','123',1),(401,'192.168.1.189',211,'root189','123',1),(402,'192.168.1.190',212,'root190','123',1),(403,'192.168.1.191',213,'root191','123',1),(404,'192.168.1.192',214,'root192','123',1),(405,'192.168.1.193',215,'root193','123',1),(406,'192.168.1.194',216,'root194','123',1),(407,'192.168.1.195',217,'root195','123',1),(408,'192.168.1.196',218,'root196','123',1),(409,'192.168.1.197',219,'root197','123',1),(410,'192.168.1.198',220,'root198','123',1),(411,'192.168.1.199',221,'root199','123',1),(412,'127.0.0.1',22222,'root123','123',21);
/*!40000 ALTER TABLE `host_manage_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_manage_lob`
--

DROP TABLE IF EXISTS `host_manage_lob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_manage_lob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_manage_lob`
--

LOCK TABLES `host_manage_lob` WRITE;
/*!40000 ALTER TABLE `host_manage_lob` DISABLE KEYS */;
INSERT INTO `host_manage_lob` VALUES (1,'OA'),(2,'会计'),(3,'资产管理'),(4,'测试系统'),(12,'test'),(13,'固定资产'),(15,'加一个'),(16,'加一个'),(17,'加一个'),(19,'新'),(21,'0529测试');
/*!40000 ALTER TABLE `host_manage_lob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_manage_user_msg`
--

DROP TABLE IF EXISTS `host_manage_user_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_manage_user_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_manage_user_msg`
--

LOCK TABLES `host_manage_user_msg` WRITE;
/*!40000 ALTER TABLE `host_manage_user_msg` DISABLE KEYS */;
INSERT INTO `host_manage_user_msg` VALUES (1,'王宇夫','admin','123'),(2,'测试','test','123'),(3,'测试1','root','123');
/*!40000 ALTER TABLE `host_manage_user_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_manage_user_msg_u_h`
--

DROP TABLE IF EXISTS `host_manage_user_msg_u_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_manage_user_msg_u_h` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_msg_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host_manage_user_msg_u_h_user_msg_id_host_id_49687c39_uniq` (`user_msg_id`,`host_id`),
  KEY `host_manage_user_msg_u_h_host_id_1a3fe0d0_fk_host_manage_host_id` (`host_id`),
  CONSTRAINT `host_manage_user_msg_u_h_host_id_1a3fe0d0_fk_host_manage_host_id` FOREIGN KEY (`host_id`) REFERENCES `host_manage_host` (`id`),
  CONSTRAINT `host_manage_user_msg_user_msg_id_6960afc2_fk_host_mana` FOREIGN KEY (`user_msg_id`) REFERENCES `host_manage_user_msg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_manage_user_msg_u_h`
--

LOCK TABLES `host_manage_user_msg_u_h` WRITE;
/*!40000 ALTER TABLE `host_manage_user_msg_u_h` DISABLE KEYS */;
INSERT INTO `host_manage_user_msg_u_h` VALUES (2,1,2),(3,1,3),(8,1,6),(9,1,10),(10,1,11),(12,1,13),(13,1,213),(14,1,214),(15,1,215),(16,1,216),(17,1,217),(18,1,218),(19,1,219),(20,1,220),(21,1,221),(22,1,222),(23,1,223),(24,1,224),(25,1,225),(26,1,226),(27,1,227),(28,1,228),(29,1,229),(30,1,230),(31,1,231),(32,1,232),(33,1,233),(34,1,234),(35,1,235),(36,1,236),(37,1,237),(38,1,238),(39,1,239),(40,1,240),(41,1,241),(42,1,242),(43,1,243),(44,1,244),(45,1,245),(46,1,246),(47,1,247),(48,1,248),(49,1,249),(50,1,250),(51,1,251),(52,1,252),(53,1,253),(54,1,254),(55,1,255),(56,1,256),(57,1,257),(58,1,258),(59,1,259),(60,1,260),(61,1,261),(62,1,262),(63,1,263),(64,1,264),(65,1,265),(66,1,266),(67,1,267),(68,1,268),(69,1,269),(70,1,270),(71,1,271),(72,1,272),(73,1,273),(74,1,274),(75,1,275),(76,1,276),(77,1,277),(78,1,278),(79,1,279),(80,1,280),(81,1,281),(82,1,282),(83,1,283),(84,1,284),(85,1,285),(86,1,286),(87,1,287),(88,1,288),(89,1,289),(90,1,290),(91,1,291),(92,1,292),(93,1,293),(94,1,294),(95,1,295),(96,1,296),(97,1,297),(98,1,298),(99,1,299),(100,1,300),(101,1,301),(102,1,302),(103,1,303),(104,1,304),(105,1,305),(106,1,306),(107,1,307),(108,1,308),(109,1,309),(110,1,310),(111,1,311),(112,1,312),(113,1,313),(114,1,314),(115,1,315),(116,1,316),(117,1,317),(118,1,318),(119,1,319),(120,1,320),(121,1,321),(122,1,322),(123,1,323),(124,1,324),(125,1,325),(126,1,326),(127,1,327),(128,1,328),(129,1,329),(130,1,330),(131,1,331),(132,1,332),(133,1,333),(134,1,334),(135,1,335),(136,1,336),(137,1,337),(138,1,338),(139,1,339),(140,1,340),(141,1,341),(142,1,342),(143,1,343),(144,1,344),(145,1,345),(146,1,346),(147,1,347),(148,1,348),(149,1,349),(150,1,350),(151,1,351),(152,1,352),(153,1,353),(154,1,354),(155,1,355),(156,1,356),(157,1,357),(158,1,358),(159,1,359),(160,1,360),(161,1,361),(162,1,362),(163,1,363),(164,1,364),(165,1,365),(166,1,366),(167,1,367),(168,1,368),(169,1,369),(170,1,370),(171,1,371),(172,1,372),(173,1,373),(174,1,374),(175,1,375),(176,1,376),(177,1,377),(178,1,378),(179,1,379),(180,1,380),(181,1,381),(182,1,382),(183,1,383),(184,1,384),(185,1,385),(186,1,386),(187,1,387),(188,1,388),(189,1,389),(190,1,390),(191,1,391),(192,1,392),(193,1,393),(194,1,394),(195,1,395),(196,1,396),(197,1,397),(198,1,398),(199,1,399),(200,1,400),(201,1,401),(202,1,402),(203,1,403),(204,1,404),(205,1,405),(206,1,406),(207,1,407),(208,1,408),(209,1,409),(210,1,410),(211,1,411),(212,1,412),(4,2,2),(5,3,4),(6,3,5);
/*!40000 ALTER TABLE `host_manage_user_msg_u_h` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-31 17:22:39
