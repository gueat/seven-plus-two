-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: seven
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `app_order`
--

DROP TABLE IF EXISTS `app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(6) NOT NULL,
  `updatetime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_order_user_id_f25a9fc4_fk_seven_user_id` (`user_id`),
  CONSTRAINT `app_order_user_id_f25a9fc4_fk_seven_user_id` FOREIGN KEY (`user_id`) REFERENCES `seven_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order`
--

LOCK TABLES `app_order` WRITE;
/*!40000 ALTER TABLE `app_order` DISABLE KEYS */;
INSERT INTO `app_order` VALUES (8,'2019-03-17 03:17:17.715565','2019-03-17 03:17:17.715612',0,'15527926379789',3),(11,'2019-03-17 03:28:47.339006','2019-03-17 03:28:47.339051',1,'15527933275633',3),(12,'2019-03-17 04:08:56.425604','2019-03-17 04:08:56.425654',0,'15527957363386',3),(13,'2019-03-18 00:59:20.988464','2019-03-18 00:59:20.988538',1,'15528707609175',3),(14,'2019-03-18 00:59:43.293647','2019-03-18 00:59:43.293691',0,'15528707838864',3),(15,'2019-03-18 01:00:31.940413','2019-03-18 01:00:31.940476',0,'15528708315438',3),(16,'2019-03-18 03:51:07.712991','2019-03-18 03:51:07.713058',0,'15528810675867',3),(17,'2019-03-18 07:32:21.044976','2019-03-18 07:32:21.045018',0,'15528943411090',3),(18,'2019-03-18 07:37:21.279375','2019-03-18 07:37:21.279429',0,'15528946418955',3),(19,'2019-03-18 08:09:02.821349','2019-03-18 08:09:02.821394',0,'15528965422363',3),(20,'2019-03-18 08:09:19.386392','2019-03-18 08:09:19.386444',0,'15528965599638',3),(21,'2019-03-18 08:11:06.890814','2019-03-18 08:11:06.890865',0,'15528966661422',3),(22,'2019-03-18 08:11:44.325764','2019-03-18 08:11:44.325810',0,'15528967041875',3),(23,'2019-03-18 08:15:26.170794','2019-03-18 08:15:26.170841',0,'15528969263530',3),(24,'2019-03-18 08:15:46.477381','2019-03-18 08:15:46.477453',0,'15528969468142',3),(25,'2019-03-18 08:16:38.946851','2019-03-18 08:16:38.946896',0,'15528969984648',3),(26,'2019-03-18 08:19:43.038259','2019-03-18 08:19:43.038324',0,'15528971832771',3),(27,'2019-03-18 08:26:57.167642','2019-03-18 08:26:57.167691',0,'15528976171661',3),(28,'2019-03-18 08:28:54.342055','2019-03-18 08:28:54.342117',0,'15528977345361',3),(29,'2019-03-18 08:28:59.914808','2019-03-18 08:28:59.914935',0,'15528977392712',3),(30,'2019-03-18 09:11:22.512523','2019-03-18 09:11:22.512577',1,'15529002824392',3),(31,'2019-03-18 09:12:01.049487','2019-03-18 09:12:01.049589',0,'15529003217789',3),(32,'2019-03-18 10:57:01.326038','2019-03-18 10:57:01.326082',1,'15529066214093',3),(33,'2019-03-18 13:39:39.377831','2019-03-18 13:39:39.377991',0,'15529163798517',34),(34,'2019-03-19 01:45:09.066115','2019-03-19 01:45:09.066192',0,'15529599093298',3),(35,'2019-03-19 01:51:30.588792','2019-03-19 01:51:30.588856',0,'15529602908159',3),(36,'2019-03-19 01:53:24.944494','2019-03-19 01:53:24.944555',0,'15529604046470',3);
/*!40000 ALTER TABLE `app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_ordergoods`
--

DROP TABLE IF EXISTS `app_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_ordergoods_goods_id_b3c19f94_fk_seven_goods_id` (`goods_id`),
  KEY `app_ordergoods_order_id_ef926487_fk_app_order_id` (`order_id`),
  CONSTRAINT `app_ordergoods_goods_id_b3c19f94_fk_seven_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `seven_goods` (`id`),
  CONSTRAINT `app_ordergoods_order_id_ef926487_fk_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `app_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_ordergoods`
--

LOCK TABLES `app_ordergoods` WRITE;
/*!40000 ALTER TABLE `app_ordergoods` DISABLE KEYS */;
INSERT INTO `app_ordergoods` VALUES (1,2,6,8),(2,1,2,8),(3,2,5,8),(4,1,4,8),(5,2,3,11),(6,1,5,11),(7,1,2,13),(8,2,3,16),(9,1,2,16),(10,2,5,17),(11,1,3,17),(12,1,4,26),(13,1,2,27),(14,1,2,28),(15,1,2,30),(16,1,3,30),(17,1,5,30),(18,1,3,32),(19,1,1,33),(20,1,14,34),(21,1,7,34),(22,1,8,35);
/*!40000 ALTER TABLE `app_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add wheel',7,'add_wheel'),(20,'Can change wheel',7,'change_wheel'),(21,'Can delete wheel',7,'delete_wheel'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user'),(25,'Can add detail',9,'add_detail'),(26,'Can change detail',9,'change_detail'),(27,'Can delete detail',9,'delete_detail'),(28,'Can add goods',10,'add_goods'),(29,'Can change goods',10,'change_goods'),(30,'Can delete goods',10,'delete_goods'),(31,'Can add cart',11,'add_cart'),(32,'Can change cart',11,'change_cart'),(33,'Can delete cart',11,'delete_cart'),(34,'Can add order goods',12,'add_ordergoods'),(35,'Can change order goods',12,'change_ordergoods'),(36,'Can delete order goods',12,'delete_ordergoods'),(37,'Can add order',13,'add_order'),(38,'Can change order',13,'change_order'),(39,'Can delete order',13,'delete_order');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(11,'app','cart'),(9,'app','detail'),(10,'app','goods'),(13,'app','order'),(12,'app','ordergoods'),(8,'app','user'),(7,'app','wheel'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-14 09:54:58.592752'),(2,'auth','0001_initial','2019-03-14 09:54:59.943004'),(3,'admin','0001_initial','2019-03-14 09:55:00.070561'),(4,'admin','0002_logentry_remove_auto_add','2019-03-14 09:55:00.100912'),(5,'app','0001_initial','2019-03-14 09:55:00.132188'),(6,'contenttypes','0002_remove_content_type_name','2019-03-14 09:55:00.237390'),(7,'auth','0002_alter_permission_name_max_length','2019-03-14 09:55:00.289849'),(8,'auth','0003_alter_user_email_max_length','2019-03-14 09:55:00.368216'),(9,'auth','0004_alter_user_username_opts','2019-03-14 09:55:00.383988'),(10,'auth','0005_alter_user_last_login_null','2019-03-14 09:55:00.440936'),(11,'auth','0006_require_contenttypes_0002','2019-03-14 09:55:00.444742'),(12,'auth','0007_alter_validators_add_error_messages','2019-03-14 09:55:00.456971'),(13,'auth','0008_alter_user_username_max_length','2019-03-14 09:55:00.521859'),(14,'sessions','0001_initial','2019-03-14 09:55:00.580503'),(15,'app','0002_auto_20190315_0059','2019-03-15 00:59:45.527575'),(16,'app','0003_detail','2019-03-15 13:32:47.849642'),(17,'app','0004_goods','2019-03-15 13:52:22.733998'),(18,'app','0005_cart','2019-03-16 01:12:05.496875'),(19,'app','0006_order_ordergoods','2019-03-16 12:22:16.081165');
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
INSERT INTO `django_session` VALUES ('4eq4oisfmfhis9f11c76v3iw0l9jidyk','NGM2YjgwNjVjMDgxYmUxYmVhNjE4N2U2OGE4NTI5OTMzNGQwYzQ1Yzp7InRva2VuIjoiZTllMmJiM2MzMTQ5MGUwNTBjMzlhNGYwY2RiZjE2Y2EifQ==','2019-03-30 10:20:32.430478'),('5rt1f8j22njba54st5ms3ei2j0xwlsse','N2VmZTRhNTA1OTJhMTlhOTFmMmE1ZjhkODVlZDdiNGMxMTFiYWJiNTp7InRva2VuIjoiZTk3YTdkMjg0MzBmN2RiMWIwNmYxZTdiMWZmOTQ3NTMifQ==','2019-03-30 12:59:20.459417'),('6i1cb13jwq7s75t1fbg9ikh0zmcm4i8w','MjJkMmU5Y2ZkODc4NGJlY2QxMjZhZWI2YzFhMzQ4MjVkNmVjYzk3YTp7InRva2VuIjoiZDBiYTI3ZWY5NDQ4MjkwZjJkYTk5OGQxNTQzOTU2OWEifQ==','2019-04-01 08:16:35.154985'),('8udwkw0rbh80u6g80388rs2etkb95tu0','ODhjOTZlNGMwNzMwMzM0ZjI2YjViZWQzM2MwOTNkNzYzZGU2ZjQwMzp7InRva2VuIjoiYzUxZWI1ZmZkNDY2MDc1Y2Y5MmViMjBkNTkwZjdiNjMifQ==','2019-03-30 08:17:30.368979'),('9dw1q2gkpdfv7n7hfhhduier781vh4wq','MWFhYmUwN2RkNjk0MGJlYWM3YzJiMGQ2ZmU1ZGNmMTg0OWVmMDg4Yjp7InRva2VuIjoiNGYyYzZkZjVhMjUwMzliOTcxNGQ3MDczYTk1NDk2NDAifQ==','2019-03-30 09:25:48.393829'),('aofuq0l15qog1zn4hyobwmbxsvsu5249','NTI0YTZlM2M5NGU2NzQyMmI0NjQ1ZTdhMjI5YWVmYmVkZTZmOGZjYTp7InRva2VuIjoiMTljYzhhZWQ4ZGU1NTRmM2Q0NTZiZjJkZjI3MTQwNjkifQ==','2019-03-30 03:39:23.329252'),('b6gunmekx0tyb8xg1e7z4dks5r85hqxu','YzE0MjRmZGM3ZDEyYjNjODg2YjY5NjA4NGVmMzhhM2Q2YmViOTc2Yzp7InRva2VuIjoiYjk4M2RkM2FlNWY2ZWUzOGEzNDcxYWNlNWE1ODg1YjAifQ==','2019-03-30 08:11:27.662594'),('bor0xk52iu9dwh3fdr7rps8ue9zg9624','MzIxNmJlYjI0ZGEzY2I3YmFjZjM5MDY1ZGQwMTkwY2IyZDJmNGExMzp7InRva2VuIjoiNmNhNTc1YzkzYWM1YzE4NDZiMmUwYjJkZjRmZGYzODgifQ==','2019-03-30 03:36:15.354278'),('d67tk93uzlzpks5wt66nup1s4frfopld','NWZiYTJhYjYxZjI1OTBlYjI0NjBkNmM4MWNmMjI2NTViYTAxNTdlYjp7InRva2VuIjoiYzExNTUxMDUzMTEyZThmZDg5YTRhYmYwNGM3ODIwYjgifQ==','2019-03-30 06:10:18.186246'),('een9zamb2wpp49ymyi2tv9lxbv5nvn3j','NTE2NjJlNDQ0ZWUxNWIyN2EzNDYyMDkxNDJmNGNlMjk4ZGRhNTM1Zjp7InRva2VuIjoiY2ZhNTFkMDg2OTA0OTYyYjRjY2ZkNzc3Njg4Yjg4OWUifQ==','2019-03-30 08:37:14.739293'),('hihx4ff4b5usmd8i0foijvc1izxq99qi','MmIzYjgxYTQ4N2Q1MjFiOGMyMjYwNmM2OTc5YTUwOGYyNjEzYmE0ZDp7InRva2VuIjoiZGIwZjMyMDYwZDAzNTZjYjk5NDA3MWNhNWMwZWI3YmIifQ==','2019-03-30 03:31:34.575885'),('i1jqi6dm58kymb1t99x7vg4rsefz8a0r','NGYzYzk5ZDM0NzAwZGM4ZThkMjJjMDdmYzNlNjg1OTg0MzdhOTNjNDp7InRva2VuIjoiYWU4NDNhZDg5YmE5OGRlY2NjMDBmMzQ1ZjUwYjYyYmQifQ==','2019-04-02 02:59:50.199937'),('ibsrqfjd8wbqfjb5prm6vio370hp77ar','Y2FmOTkxOWU3YWMxMWI1OTVhZTFjMDA5ZjBkNDI5ODM4ZWEzZDVjNzp7InRva2VuIjoiZDcyNWMwZjQ1Njg2YTM5YjRmMzBhOGM3NTAzMTE3NTgifQ==','2019-04-01 02:29:05.363183'),('j4cqv9jecd2sz9u1jkpvm1y6kz5mwidc','ODM5YTMyYTMzNTIyZGUzMWU4MTliYWQ0YTBlMTdmMzZhNjFlMjQ5Yjp7InRva2VuIjoiNDBlNmJmNmRmNDIwNDM0ZGUyYjU5ZDQzZjU1NDA3NGIifQ==','2019-03-30 07:36:27.692542'),('jvmewddmvvmf0n4xtjh2os511bls7wv1','MjNhOTgwZGM2MGJhYzk1NDNlMGM1ZDkwODJmMGQzNzViZGE5NDU2Mzp7InRva2VuIjoiMmFiYTM3YmNkYTQzNTZjZWIyNGRmNWNkZGJiZjY2OTgifQ==','2019-03-29 10:55:40.830417'),('k7uylejlkc58o6cvi5yafbsiag1cc74d','ZGQ1MzVjMGNjMWE4Nzg1MDhjMTY3ZWE3YzhkNTlkYWViYjdhMGFmMzp7InRva2VuIjoiZDFlMzMwMGY1NWE3ODExMDcyODA5NDEwNDgwZTA1MTMifQ==','2019-03-30 12:56:47.787773'),('qm98c53ow56bpaybd6mxt33knozaxv4a','MzYxMzBkYzQ3MTM2NzAwNDA5ZjFkNjY4OWNiYmNkNmU3ZTIyNDM3Yzp7InRva2VuIjoiMGU4NTViOTc1OThiNWU1ZjZjZmZmZjliZDFlMzAzYjkifQ==','2019-03-30 12:37:13.842039'),('ruk6wdxfjpw4ubls5toaj4bkmr8xmn7y','ODVhZDUxYTBmMmE3N2VmZjcxYTIxZjA3YTFkMWI3MGU4ZTM3Nzk0OTp7InRva2VuIjoiMTJiM2JkZTQzNTcxMDliNmJmMjQwZmFiM2JiZDMwNWUifQ==','2019-04-01 01:08:50.341432'),('ua6ogo8qbcfu3ummvrv8acwx9ajp8qph','YTRiMWY4NDk3ZmFiZjAzNTk2ODBhMGRlM2YxZjRiZWFjN2JmMzcwOTp7InRva2VuIjoiMGU1MjY5Y2U5ODg4MTA0NDUxNzg5MDA1OTE0MTE5NDYifQ==','2019-04-01 05:58:07.496906'),('uxhpgyde2aq2dkd5l2garcf38ocg7uns','NWYzY2FhMmUwYTBlYjM1NDQ1NjE1NjE0MzIyNjYzZjM0MzdlNGU5Yjp7InRva2VuIjoiZTc4OTYyOWNjYzcwY2FhOWQ2NDBkZGZlNzhlZTMwZDgifQ==','2019-03-30 12:44:13.153190'),('woo3sqsb1q89mc30a4kok5kn9f8vojx0','NGRkNjk2ZTk2ODdmZWIzNzcyMGNkOTY0MjUxNjE1OGM1YTg4MTQxOTp7InRva2VuIjoiYzI3Y2QyMmNlMjA4MjYyNGI2NDdiMzIxMThmOTZiZTgifQ==','2019-03-30 07:08:26.070016');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seven_cart`
--

DROP TABLE IF EXISTS `seven_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seven_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seven_cart_goods_id_f7d9baf4_fk_seven_goods_id` (`goods_id`),
  KEY `seven_cart_user_id_85c5e53f_fk_seven_user_id` (`user_id`),
  CONSTRAINT `seven_cart_goods_id_f7d9baf4_fk_seven_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `seven_goods` (`id`),
  CONSTRAINT `seven_cart_user_id_85c5e53f_fk_seven_user_id` FOREIGN KEY (`user_id`) REFERENCES `seven_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seven_cart`
--

LOCK TABLES `seven_cart` WRITE;
/*!40000 ALTER TABLE `seven_cart` DISABLE KEYS */;
INSERT INTO `seven_cart` VALUES (7,2,1,0,2,26),(8,1,1,0,3,26),(25,1,0,0,13,3),(26,1,1,0,14,3);
/*!40000 ALTER TABLE `seven_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seven_detail`
--

DROP TABLE IF EXISTS `seven_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seven_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seven_detail`
--

LOCK TABLES `seven_detail` WRITE;
/*!40000 ALTER TABLE `seven_detail` DISABLE KEYS */;
INSERT INTO `seven_detail` VALUES (1,'static/detail/img/one/1_1.jpeg','1',199),(2,'static/detail/img/one/1_2.jpeg','2',299),(3,'static/detail/img/one/1_3.jpeg','3',399),(4,'static/detail/img/one/1_4.jpeg','4',199),(5,'static/detail/img/one/1_5.jpeg','5',299),(6,'static/detail/img/one/1_6.jpeg','6',399);
/*!40000 ALTER TABLE `seven_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seven_goods`
--

DROP TABLE IF EXISTS `seven_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seven_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` varchar(10) NOT NULL,
  `img` varchar(256) NOT NULL,
  `name` varchar(100) NOT NULL,
  `specifics` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `marketprice` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seven_goods`
--

LOCK TABLES `seven_goods` WRITE;
/*!40000 ALTER TABLE `seven_goods` DISABLE KEYS */;
INSERT INTO `seven_goods` VALUES (1,'001','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9ncm91cHMvZ29vZHMvMjAxNjA4MTkvMjAxNjA4MTkxMzI5MDgxODgyLmpwZw==.auto.jpg','1','[赠800ml运动水壶]LEIXE雷蝎',199,399),(2,'002','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9nb29kcy9nb29kcy8xNjgwNjEwNi8yMDE3MDMzMS8yMDE3MDMzMTE0MTg0MjUwOTguanBn.auto.jpg','2','户外必备行李箱',399,999),(3,'003','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9nb29kcy9nb29kcy8zNDAwMTc3NS8yMDE2MDkyMC8yMDE2MDkyMDE2MDM0MTUwMDAuanBn.auto.jpg','3','潮男运动裤，撩妹神器',235,376),(4,'004','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9nb29kcy9nb29kcy8zNjEwOTE2My8yMDE3MDMyMC8yMDE3MDMyMDIyMzUxMDgzMDEuanBn.auto.jpg','4','运动单肩包 出行、运动必备',89,299),(5,'005','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9nb29kcy9nb29kcy8zNjk1MDI3Ni8yMDE3MDMwNS8yMDE3MDMwNTE1MTY0MDQ3NjQuanBn.auto.jpg','5','女西裤 尽显苗条身材',145,286),(6,'006','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9nb29kcy9nb29kcy8zNzczMTUwNS8yMDE3MDQwNS8yMDE3MDQwNTEzMzk1NzE4MzYuanBn.auto.jpg','6','镂空鞋 夏天的舒适选择',145,322),(7,'007','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9nb29kcy9nb29kcy8zOTQyNDY3Ny8yMDE3MDQxMy8yMDE3MDQxMzE0MTkwODQ3NzQuanBn.auto.jpg','7','ROCKWAY太阳镜',439,1245),(8,'008','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9nb29kcy9nb29kcy8zOTY2MzQ5MS8yMDE3MDkyOS8yMDE3MDkyOTEyNTk0NDg4ODIuanBn.auto.jpg','8','OUNCE登山鞋 登上人生的巅峰',463,1245),(9,'009','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9nb29kcy9nb29kcy8zOTYyNzk2Ni8yMDE3MDIwNy8yMDE3MDIwNzEwMjcyNjExODEuanBn.auto.jpg','9','MAMOT衬衫',453,1999),(10,'010','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9nb29kcy9nb29kcy8zOTYyOTE3Ny8yMDE3MDQxMi8yMDE3MDQxMjE3MDU0Mjg0OTEuanBn.auto.jpg','10','吊床 宿舍神器',145,346),(11,'011','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9ncm91cHMvZ29vZHMvMjAxNjA4MTkvMjAxNjA4MTkxMzI5MDgxODgyLmpwZw==.auto.jpg','11','Fire—Maple水杯',153,643),(12,'012','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9ncm91cHMvZ29vZHMvMjAxNjEyMzAvMjAxNjEyMzAxNTE0NTM5ODkyLmpwZw==.auto.jpg','12','高度海拔手表',235,745),(13,'013','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9ncm91cHMvZ29vZHMvMjAxNzA1MDUvMjAxNzA1MDUxMDE2MTM5NDY2LmpwZw==.auto.jpg','13','男女通用咸鱼腰包',456,1245),(14,'014','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9ncm91cHMvZ29vZHMvMjAxNzA4MTYvMjAxNzA4MTYxNTEzMTg2NTkwLmpwZw==.auto.jpg','14','EVENT运动鞋',223,464),(15,'015','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9ncm91cHMvZ29vZHMvMjAxNzA5MDcvMjAxNzA5MDcxNDMxMzgxOTg3LmpwZw==.auto.jpg','15','睡眠头枕',123,456),(16,'016','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9ncm91cHMvZ29vZHMvMjAxNzA5MjkvMjAxNzA5MjkxMDI4MDk2ODA0LmpwZw==.auto.jpg','16','神魔乃保暖头巾',234,565),(17,'017','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9ncm91cHMvZ29vZHMvMjAxNzA5MTIvMjAxNzA5MTIxNTI0MjAzNTc1LmpwZw==.auto.jpg','17','vade运动服',563,1244),(18,'018','/static/index/img/groupn/L2VjbW1lL2x2eW91bWFsbC9ncm91cHMvZ29vZHMvMjAxNzA5MzAvMjAxNzA5MzAwOTM1MDU4NzMxLmpwZw==.auto.jpg','18','防水羽绒服',888,2888);
/*!40000 ALTER TABLE `seven_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seven_user`
--

DROP TABLE IF EXISTS `seven_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seven_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(256) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seven_user`
--

LOCK TABLES `seven_user` WRITE;
/*!40000 ALTER TABLE `seven_user` DISABLE KEYS */;
INSERT INTO `seven_user` VALUES (3,'qwe','4297f44b13955235245b2497399d7a93','13333333333'),(25,'aaa','4297f44b13955235245b2497399d7a93','13333333333'),(26,'qqq','4297f44b13955235245b2497399d7a93','13333333333'),(30,'admin','4297f44b13955235245b2497399d7a93','13333333333'),(34,'lintao','d179f580f290bdbeb8feccb2e54f04cd','13333344444'),(36,'','d41d8cd98f00b204e9800998ecf8427e',''),(37,'','d41d8cd98f00b204e9800998ecf8427e',''),(38,'','d41d8cd98f00b204e9800998ecf8427e',''),(39,'123','4297f44b13955235245b2497399d7a93','13333333333');
/*!40000 ALTER TABLE `seven_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seven_wheel`
--

DROP TABLE IF EXISTS `seven_wheel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seven_wheel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `trackid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seven_wheel`
--

LOCK TABLES `seven_wheel` WRITE;
/*!40000 ALTER TABLE `seven_wheel` DISABLE KEYS */;
INSERT INTO `seven_wheel` VALUES (1,'static/index/img/nav/pic1.jpg','1','1'),(2,'static/index/img/nav/pic2.jpg','2','2'),(3,'static/index/img/nav/pic3.jpg','3','3');
/*!40000 ALTER TABLE `seven_wheel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 12:34:43
