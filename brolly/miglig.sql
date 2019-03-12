-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: miglig
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add attachment',1,'add_attachment'),(2,'Can change attachment',1,'change_attachment'),(3,'Can delete attachment',1,'delete_attachment'),(4,'Can add user dashboard module',2,'add_userdashboardmodule'),(5,'Can change user dashboard module',2,'change_userdashboardmodule'),(6,'Can delete user dashboard module',2,'delete_userdashboardmodule'),(7,'Can add customer token',3,'add_customertoken'),(8,'Can change customer token',3,'change_customertoken'),(9,'Can delete customer token',3,'delete_customertoken'),(10,'Can add customer',4,'add_customer'),(11,'Can change customer',4,'change_customer'),(12,'Can delete customer',4,'delete_customer'),(13,'Can add customer otp',5,'add_customerotp'),(14,'Can change customer otp',5,'change_customerotp'),(15,'Can delete customer otp',5,'delete_customerotp'),(16,'Can add customer password',6,'add_customerpassword'),(17,'Can change customer password',6,'change_customerpassword'),(18,'Can delete customer password',6,'delete_customerpassword'),(19,'Can add customer password reset code',7,'add_customerpasswordresetcode'),(20,'Can change customer password reset code',7,'change_customerpasswordresetcode'),(21,'Can delete customer password reset code',7,'delete_customerpasswordresetcode'),(22,'Can add company',8,'add_company'),(23,'Can change company',8,'change_company'),(24,'Can delete company',8,'delete_company'),(25,'Can add bookmark',9,'add_bookmark'),(26,'Can change bookmark',9,'change_bookmark'),(27,'Can delete bookmark',9,'delete_bookmark'),(28,'Can add pinned application',10,'add_pinnedapplication'),(29,'Can change pinned application',10,'change_pinnedapplication'),(30,'Can delete pinned application',10,'delete_pinnedapplication'),(31,'Can add log entry',11,'add_logentry'),(32,'Can change log entry',11,'change_logentry'),(33,'Can delete log entry',11,'delete_logentry'),(34,'Can add permission',12,'add_permission'),(35,'Can change permission',12,'change_permission'),(36,'Can delete permission',12,'delete_permission'),(37,'Can add group',13,'add_group'),(38,'Can change group',13,'change_group'),(39,'Can delete group',13,'delete_group'),(40,'Can add user',14,'add_user'),(41,'Can change user',14,'change_user'),(42,'Can delete user',14,'delete_user'),(43,'Can add content type',15,'add_contenttype'),(44,'Can change content type',15,'change_contenttype'),(45,'Can delete content type',15,'delete_contenttype'),(46,'Can add session',16,'add_session'),(47,'Can change session',16,'change_session'),(48,'Can delete session',16,'delete_session'),(49,'Can add genre',17,'add_genre'),(50,'Can change genre',17,'change_genre'),(51,'Can delete genre',17,'delete_genre'),(52,'Can add album',18,'add_album'),(53,'Can change album',18,'change_album'),(54,'Can delete album',18,'delete_album'),(55,'Can add audio',19,'add_audio'),(56,'Can change audio',19,'change_audio'),(57,'Can delete audio',19,'delete_audio'),(58,'Can add video',20,'add_video'),(59,'Can change video',20,'change_video'),(60,'Can delete video',20,'delete_video');
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
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$BvMgNIoUuSAy$djzxDNq5rX3vfTrPHxx97qBavpJ46scMAL4Ne6bZL6Y=','2018-02-08 12:49:07.198740',1,'sandeep','','','',1,1,'2018-02-08 12:49:02.404552');
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
-- Table structure for table `common_genre`
--

DROP TABLE IF EXISTS `common_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `desription` varchar(450) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_genre`
--

LOCK TABLES `common_genre` WRITE;
/*!40000 ALTER TABLE `common_genre` DISABLE KEYS */;
INSERT INTO `common_genre` VALUES (1,'Regional','different language of different states','2018-02-19 21:15:16.000000');
/*!40000 ALTER TABLE `common_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_customer`
--

DROP TABLE IF EXISTS `customers_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `old_mobile` varchar(15) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_customer`
--

LOCK TABLES `customers_customer` WRITE;
/*!40000 ALTER TABLE `customers_customer` DISABLE KEYS */;
INSERT INTO `customers_customer` VALUES (1,'name','','name','9990909',NULL,0,'2018-02-09 23:10:13.201933'),(2,'name','','namlnknke','8989',NULL,0,'2018-02-09 23:12:44.434193'),(3,'name','','amlnknke','89489',NULL,0,'2018-02-09 23:14:52.583550');
/*!40000 ALTER TABLE `customers_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_customerotp`
--

DROP TABLE IF EXISTS `customers_customerotp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_customerotp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `valid` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_customerotp_user_id_253bf4b1_fk_customers_customer_id` (`user_id`),
  CONSTRAINT `customers_customerotp_user_id_253bf4b1_fk_customers_customer_id` FOREIGN KEY (`user_id`) REFERENCES `customers_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_customerotp`
--

LOCK TABLES `customers_customerotp` WRITE;
/*!40000 ALTER TABLE `customers_customerotp` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_customerotp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_customerpassword`
--

DROP TABLE IF EXISTS `customers_customerpassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_customerpassword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) NOT NULL,
  `password_open` varchar(100) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_customerpa_user_id_e2e3659d_fk_customers` (`user_id`),
  CONSTRAINT `customers_customerpa_user_id_e2e3659d_fk_customers` FOREIGN KEY (`user_id`) REFERENCES `customers_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_customerpassword`
--

LOCK TABLES `customers_customerpassword` WRITE;
/*!40000 ALTER TABLE `customers_customerpassword` DISABLE KEYS */;
INSERT INTO `customers_customerpassword` VALUES (1,'b068931cc450442b63f5b3d276ea4297','name','2018-02-09 23:12:44.502153',2,0),(2,'b068931cc450442b63f5b3d276ea4297','name','2018-02-09 23:14:52.622028',3,0);
/*!40000 ALTER TABLE `customers_customerpassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_customerpasswordresetcode`
--

DROP TABLE IF EXISTS `customers_customerpasswordresetcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_customerpasswordresetcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reset_code` varchar(100) NOT NULL,
  `expiry_date` date NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_customerpa_user_id_18bcea29_fk_customers` (`user_id`),
  CONSTRAINT `customers_customerpa_user_id_18bcea29_fk_customers` FOREIGN KEY (`user_id`) REFERENCES `customers_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_customerpasswordresetcode`
--

LOCK TABLES `customers_customerpasswordresetcode` WRITE;
/*!40000 ALTER TABLE `customers_customerpasswordresetcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_customerpasswordresetcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_customertoken`
--

DROP TABLE IF EXISTS `customers_customertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_customertoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(100) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_customerto_user_id_4d3e5537_fk_customers` (`user_id`),
  CONSTRAINT `customers_customerto_user_id_4d3e5537_fk_customers` FOREIGN KEY (`user_id`) REFERENCES `customers_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_customertoken`
--

LOCK TABLES `customers_customertoken` WRITE;
/*!40000 ALTER TABLE `customers_customertoken` DISABLE KEYS */;
INSERT INTO `customers_customertoken` VALUES (1,'k7p5igoc26rfxbp6r1ir2btv0ulm6cr1','2018-02-09 23:12:44.647898',2),(2,'wsf1aet0mi2mvfn1z24c7k0w0wyq8r76','2018-02-09 23:14:52.699502',3);
/*!40000 ALTER TABLE `customers_customertoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_userdashboardmodule`
--

DROP TABLE IF EXISTS `dashboard_userdashboardmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_userdashboardmodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `app_label` varchar(255) DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `column` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  `settings` longtext NOT NULL,
  `children` longtext NOT NULL,
  `collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_userdashboardmodule`
--

LOCK TABLES `dashboard_userdashboardmodule` WRITE;
/*!40000 ALTER TABLE `dashboard_userdashboardmodule` DISABLE KEYS */;
INSERT INTO `dashboard_userdashboardmodule` VALUES (7,'Quick links','jet.dashboard.modules.LinkList',NULL,1,0,0,'{\"deletable\": false, \"layout\": \"inline\", \"draggable\": false, \"collapsible\": false}','[{\"title\": \"Return to site\", \"url\": \"/\"}, {\"title\": \"Change password\", \"url\": \"/admin/password_change/\"}, {\"title\": \"Log out\", \"url\": \"/admin/logout/\"}]',0),(8,'Applications','jet.dashboard.modules.AppList',NULL,1,1,0,'{\"models\": null, \"exclude\": [\"auth.*\"]}','',0),(9,'Administration','jet.dashboard.modules.AppList',NULL,1,2,0,'{\"models\": [\"auth.*\"], \"exclude\": null}','',0),(10,'Recent Actions','jet.dashboard.modules.RecentActions',NULL,1,0,1,'{\"limit\": 10, \"include_list\": null, \"user\": null, \"exclude_list\": null}','',0),(11,'Latest Django News','jet.dashboard.modules.Feed',NULL,1,1,1,'{\"limit\": 5, \"feed_url\": \"http://www.djangoproject.com/rss/weblog/\"}','',0),(12,'Support','jet.dashboard.modules.LinkList',NULL,1,2,1,'{\"deletable\": true, \"layout\": \"stacked\", \"draggable\": true, \"collapsible\": true}','[{\"title\": \"Django documentation\", \"external\": true, \"url\": \"http://docs.djangoproject.com/\"}, {\"title\": \"Django \\\"django-users\\\" mailing list\", \"external\": true, \"url\": \"http://groups.google.com/group/django-users\"}, {\"title\": \"Django irc channel\", \"external\": true, \"url\": \"irc://irc.freenode.net/django\"}]',0),(13,'Application models','jet.dashboard.modules.ModelList','customers',1,0,0,'{\"exclude\": null, \"models\": [\"customers.*\"]}','',0),(14,'Recent Actions','jet.dashboard.modules.RecentActions','customers',1,1,0,'{\"user\": null, \"exclude_list\": null, \"limit\": 10, \"include_list\": [\"customers.*\"]}','',0);
/*!40000 ALTER TABLE `dashboard_userdashboardmodule` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-02-19 21:13:12.761391','1','1',1,'[{\"added\": {}}]',8,1),(2,'2018-02-19 21:13:15.754440','1','1',2,'[]',8,1),(3,'2018-02-19 21:13:56.800187','1','1',1,'[{\"added\": {}}]',18,1),(4,'2018-02-19 21:16:29.748000','1','1',1,'[{\"added\": {}}]',17,1),(5,'2018-02-19 21:16:40.502749','1','1',2,'[{\"changed\": {\"fields\": [\"desription\"]}}]',17,1),(6,'2018-02-19 21:16:53.974849','1','1',2,'[{\"changed\": {\"fields\": [\"genre\"]}}]',18,1),(7,'2018-02-19 21:17:23.444814','1','1',1,'[{\"added\": {}}]',19,1),(8,'2018-02-19 21:17:57.437017','1','1',2,'[]',19,1),(9,'2018-02-19 21:18:11.016552','1','1',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',19,1),(10,'2018-02-19 21:18:20.456428','2','2',1,'[{\"added\": {}}]',19,1),(11,'2018-02-19 21:18:32.608760','3','3',1,'[{\"added\": {}}]',19,1),(12,'2018-02-19 21:18:44.900649','4','4',1,'[{\"added\": {}}]',19,1),(13,'2018-02-19 21:19:01.967293','2','2',2,'[{\"changed\": {\"fields\": [\"title\", \"description\"]}}]',19,1),(14,'2018-02-19 21:19:05.285240','2','2',2,'[]',19,1),(15,'2018-02-19 21:19:16.167028','3','3',2,'[{\"changed\": {\"fields\": [\"title\", \"description\"]}}]',19,1),(16,'2018-02-19 21:19:26.730512','4','4',2,'[{\"changed\": {\"fields\": [\"title\", \"description\"]}}]',19,1),(17,'2018-02-19 21:19:27.008569','4','4',2,'[]',19,1),(18,'2018-02-19 21:19:39.503037','5','5',1,'[{\"added\": {}}]',19,1),(19,'2018-02-19 21:21:22.839019','1','1',1,'[{\"added\": {}}]',20,1),(20,'2018-02-19 21:21:25.763825','1','1',2,'[]',20,1),(21,'2018-02-19 21:21:40.660567','2','2',1,'[{\"added\": {}}]',20,1),(22,'2018-02-19 21:21:43.383098','2','2',2,'[]',20,1),(23,'2018-02-19 21:22:00.518989','3','3',1,'[{\"added\": {}}]',20,1),(24,'2018-02-19 21:22:10.902000','4','4',1,'[{\"added\": {}}]',20,1),(25,'2018-02-19 21:22:20.071772','5','5',1,'[{\"added\": {}}]',20,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'admin','logentry'),(13,'auth','group'),(12,'auth','permission'),(14,'auth','user'),(17,'common','genre'),(15,'contenttypes','contenttype'),(4,'customers','customer'),(5,'customers','customerotp'),(6,'customers','customerpassword'),(7,'customers','customerpasswordresetcode'),(3,'customers','customertoken'),(2,'dashboard','userdashboardmodule'),(1,'django_summernote','attachment'),(9,'jet','bookmark'),(10,'jet','pinnedapplication'),(18,'production_house','album'),(19,'production_house','audio'),(8,'production_house','company'),(20,'production_house','video'),(16,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-08 09:06:45.046045'),(2,'auth','0001_initial','2018-02-08 09:06:53.999428'),(3,'admin','0001_initial','2018-02-08 09:06:55.976740'),(4,'admin','0002_logentry_remove_auto_add','2018-02-08 09:06:56.036354'),(5,'contenttypes','0002_remove_content_type_name','2018-02-08 09:06:57.215313'),(6,'auth','0002_alter_permission_name_max_length','2018-02-08 09:06:57.887842'),(7,'auth','0003_alter_user_email_max_length','2018-02-08 09:06:58.738215'),(8,'auth','0004_alter_user_username_opts','2018-02-08 09:06:58.828987'),(9,'auth','0005_alter_user_last_login_null','2018-02-08 09:06:59.409502'),(10,'auth','0006_require_contenttypes_0002','2018-02-08 09:06:59.443756'),(11,'auth','0007_alter_validators_add_error_messages','2018-02-08 09:06:59.488624'),(12,'auth','0008_alter_user_username_max_length','2018-02-08 09:07:01.118266'),(13,'auth','0009_alter_user_last_name_max_length','2018-02-08 09:07:01.836306'),(14,'customers','0001_initial','2018-02-08 09:07:02.208134'),(15,'customers','0002_customerotp_customerpassword_customerpasswordresetcode_customertoken','2018-02-08 09:07:06.295836'),(16,'customers','0003_auto_20180207_2101','2018-02-08 09:07:07.625075'),(17,'customers','0004_auto_20180207_2101','2018-02-08 09:07:07.690060'),(18,'dashboard','0001_initial','2018-02-08 09:07:07.984666'),(19,'django_summernote','0001_initial','2018-02-08 09:07:08.284909'),(20,'django_summernote','0002_update-help_text','2018-02-08 09:07:08.330668'),(21,'jet','0001_initial','2018-02-08 09:07:09.145888'),(22,'jet','0002_delete_userdashboardmodule','2018-02-08 09:07:09.332831'),(23,'production_house','0001_initial','2018-02-08 09:07:09.659715'),(24,'production_house','0002_auto_20180207_2101','2018-02-08 09:07:09.714349'),(25,'sessions','0001_initial','2018-02-08 09:07:10.248576'),(26,'production_house','0003_auto_20180208_0907','2018-02-08 09:07:19.913418'),(27,'common','0001_initial','2018-02-08 10:38:21.314576'),(28,'production_house','0004_album_audio_video','2018-02-08 10:38:22.258848'),(29,'production_house','0005_auto_20180208_1044','2018-02-08 10:44:06.917147'),(30,'production_house','0006_auto_20180211_0041','2018-02-11 00:42:17.032988'),(31,'customers','0005_auto_20180211_0044','2018-02-12 11:11:34.792827'),(32,'customers','0006_customerpassword_is_deleted','2018-02-12 11:11:35.637151'),(33,'common','0002_auto_20180219_2116','2018-02-19 21:16:19.759940');
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
INSERT INTO `django_session` VALUES ('6pxgixcgmmm5fcx7i1v7ffnpr9uuizib','ODVjNTU5NGU5NDc2ZmU0YTQ0MjcxZWVmYjUyZDI2MmQ3NWU2NWQzNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImNlNGY2YmIyZWMzZmU3NzU2YTBhM2ZiYjMyYzk3MTNmYjIyZGE4MmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-02-22 12:49:07.245967');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_summernote_attachment`
--

DROP TABLE IF EXISTS `django_summernote_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_summernote_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  `uploaded` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_summernote_attachment`
--

LOCK TABLES `django_summernote_attachment` WRITE;
/*!40000 ALTER TABLE `django_summernote_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_summernote_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_bookmark`
--

DROP TABLE IF EXISTS `jet_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jet_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_bookmark`
--

LOCK TABLES `jet_bookmark` WRITE;
/*!40000 ALTER TABLE `jet_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_pinnedapplication`
--

DROP TABLE IF EXISTS `jet_pinnedapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jet_pinnedapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_pinnedapplication`
--

LOCK TABLES `jet_pinnedapplication` WRITE;
/*!40000 ALTER TABLE `jet_pinnedapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_pinnedapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_house_album`
--

DROP TABLE IF EXISTS `production_house_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_house_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `rating` varchar(30) DEFAULT NULL,
  `description` varchar(700) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_house_album_genre_id_8ff58f88_fk_common_genre_id` (`genre_id`),
  CONSTRAINT `production_house_album_genre_id_8ff58f88_fk_common_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `common_genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_house_album`
--

LOCK TABLES `production_house_album` WRITE;
/*!40000 ALTER TABLE `production_house_album` DISABLE KEYS */;
INSERT INTO `production_house_album` VALUES (1,'kuve pe album','',NULL,NULL,0,'2018-02-19 21:13:26.000000',1);
/*!40000 ALTER TABLE `production_house_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_house_audio`
--

DROP TABLE IF EXISTS `production_house_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_house_audio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `audio` varchar(50) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `rating` varchar(30) DEFAULT NULL,
  `description` varchar(700) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_house_audio_genre_id_57676b74_fk_common_genre_id` (`genre_id`),
  CONSTRAINT `production_house_audio_genre_id_57676b74_fk_common_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `common_genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_house_audio`
--

LOCK TABLES `production_house_audio` WRITE;
/*!40000 ALTER TABLE `production_house_audio` DISABLE KEYS */;
INSERT INTO `production_house_audio` VALUES (1,'kuve pe song 1',NULL,'',NULL,'kuve pe song 1',0,'2018-02-19 21:17:03.000000',1),(2,'kuve pe song 2',NULL,'',NULL,'kuve pe song 2',0,'2018-02-19 21:18:11.000000',NULL),(3,'kuve pe song 3',NULL,'',NULL,'kuve pe song 3',0,'2018-02-19 21:18:24.000000',NULL),(4,'kuve pe song 4',NULL,'',NULL,'kuve pe song 4',0,'2018-02-19 21:18:32.000000',1),(5,'kuve pe song 5',NULL,'',NULL,'kuve pe song 5',0,'2018-02-19 21:19:27.000000',1);
/*!40000 ALTER TABLE `production_house_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_house_company`
--

DROP TABLE IF EXISTS `production_house_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_house_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contact_name` varchar(20) DEFAULT NULL,
  `contact_mobile` varchar(15) DEFAULT NULL,
  `landline` varchar(18) DEFAULT NULL,
  `video_count` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_house_company`
--

LOCK TABLES `production_house_company` WRITE;
/*!40000 ALTER TABLE `production_house_company` DISABLE KEYS */;
INSERT INTO `production_house_company` VALUES (1,'Veena','','veena@veena.com','veena','121212121',NULL,10,0,'2018-02-19 21:12:29.000000');
/*!40000 ALTER TABLE `production_house_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_house_video`
--

DROP TABLE IF EXISTS `production_house_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_house_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `video` varchar(50) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `rating` varchar(30) DEFAULT NULL,
  `description` varchar(700) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_house_video_genre_id_e4648755_fk_common_genre_id` (`genre_id`),
  CONSTRAINT `production_house_video_genre_id_e4648755_fk_common_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `common_genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_house_video`
--

LOCK TABLES `production_house_video` WRITE;
/*!40000 ALTER TABLE `production_house_video` DISABLE KEYS */;
INSERT INTO `production_house_video` VALUES (1,'kuve pe song 1',NULL,'',NULL,'kuve pe song 1',0,'2018-02-19 21:21:08.000000',1),(2,'kuve pe song 2',NULL,'',NULL,'kuve pe song 2',0,'2018-02-19 21:21:26.000000',1),(3,'kuve pe song 3',NULL,'',NULL,'kuve pe song 3',0,'2018-02-19 21:21:43.000000',1),(4,'kuve pe song 4',NULL,'',NULL,'kuve pe song 5',0,'2018-02-19 21:22:00.000000',1),(5,'kuve pe song 5',NULL,'',NULL,'kuve pe song 5',0,'2018-02-19 21:22:11.000000',1);
/*!40000 ALTER TABLE `production_house_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-20  3:24:50
