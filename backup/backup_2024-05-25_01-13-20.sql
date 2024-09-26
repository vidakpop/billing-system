-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: byte
-- ------------------------------------------------------
-- Server version	8.0.36-2ubuntu3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `nas`
--

DROP TABLE IF EXISTS `nas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nasname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shortname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'other',
  `ports` int DEFAULT NULL,
  `secret` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'secret',
  `server` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `community` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'RADIUS Client',
  `routers` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `nasname` (`nasname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nas`
--

LOCK TABLES `nas` WRITE;
/*!40000 ALTER TABLE `nas` DISABLE KEYS */;
/*!40000 ALTER TABLE `nas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nasreload`
--

DROP TABLE IF EXISTS `nasreload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nasreload` (
  `nasipaddress` varchar(15) NOT NULL,
  `reloadtime` datetime NOT NULL,
  PRIMARY KEY (`nasipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nasreload`
--

LOCK TABLES `nasreload` WRITE;
/*!40000 ALTER TABLE `nasreload` DISABLE KEYS */;
/*!40000 ALTER TABLE `nasreload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radacct`
--

DROP TABLE IF EXISTS `radacct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radacct` (
  `radacctid` bigint NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `realm` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `nasipaddress` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `nasportid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nasporttype` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctupdatetime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctinterval` int DEFAULT NULL,
  `acctsessiontime` int unsigned DEFAULT NULL,
  `acctauthentic` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `connectinfo_start` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `connectinfo_stop` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `acctinputoctets` bigint DEFAULT NULL,
  `acctoutputoctets` bigint DEFAULT NULL,
  `calledstationid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `callingstationid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `servicetype` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `framedprotocol` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `framedipaddress` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `framedipv6address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `framedipv6prefix` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `framedinterfaceid` varchar(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `delegatedipv6prefix` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `class` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`radacctid`),
  UNIQUE KEY `acctuniqueid` (`acctuniqueid`),
  KEY `username` (`username`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `framedipv6address` (`framedipv6address`),
  KEY `framedipv6prefix` (`framedipv6prefix`),
  KEY `framedinterfaceid` (`framedinterfaceid`),
  KEY `delegatedipv6prefix` (`delegatedipv6prefix`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctsessiontime` (`acctsessiontime`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctinterval` (`acctinterval`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `nasipaddress` (`nasipaddress`),
  KEY `class` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radacct`
--

LOCK TABLES `radacct` WRITE;
/*!40000 ALTER TABLE `radacct` DISABLE KEYS */;
/*!40000 ALTER TABLE `radacct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radcheck`
--

DROP TABLE IF EXISTS `radcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radcheck` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `op` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '==',
  `value` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radcheck`
--

LOCK TABLES `radcheck` WRITE;
/*!40000 ALTER TABLE `radcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `radcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupcheck`
--

DROP TABLE IF EXISTS `radgroupcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radgroupcheck` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `op` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '==',
  `value` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupcheck`
--

LOCK TABLES `radgroupcheck` WRITE;
/*!40000 ALTER TABLE `radgroupcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `radgroupcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupreply`
--

DROP TABLE IF EXISTS `radgroupreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radgroupreply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `op` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '=',
  `value` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `plan_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupreply`
--

LOCK TABLES `radgroupreply` WRITE;
/*!40000 ALTER TABLE `radgroupreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `radgroupreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radpostauth`
--

DROP TABLE IF EXISTS `radpostauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radpostauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `pass` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `reply` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `authdate` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `class` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `class` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radpostauth`
--

LOCK TABLES `radpostauth` WRITE;
/*!40000 ALTER TABLE `radpostauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `radpostauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radreply`
--

DROP TABLE IF EXISTS `radreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radreply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `op` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '=',
  `value` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radreply`
--

LOCK TABLES `radreply` WRITE;
/*!40000 ALTER TABLE `radreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `radreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radusergroup`
--

DROP TABLE IF EXISTS `radusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radusergroup` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `groupname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radusergroup`
--

LOCK TABLES `radusergroup` WRITE;
/*!40000 ALTER TABLE `radusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `radusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_languages`
--

DROP TABLE IF EXISTS `tb_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_languages` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_languages`
--

LOCK TABLES `tb_languages` WRITE;
/*!40000 ALTER TABLE `tb_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_appconfig`
--

DROP TABLE IF EXISTS `tbl_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_appconfig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_appconfig`
--

LOCK TABLES `tbl_appconfig` WRITE;
/*!40000 ALTER TABLE `tbl_appconfig` DISABLE KEYS */;
INSERT INTO `tbl_appconfig` VALUES (1,'CompanyName','ByteRadius'),(2,'currency_code','Kes.'),(3,'language','english'),(4,'show-logo','1'),(5,'nstyle','blue'),(6,'timezone','Asia/Jakarta'),(7,'dec_point',','),(8,'thousands_sep','.'),(9,'rtl','0'),(10,'address',''),(11,'phone',''),(12,'date_format','d M Y'),(13,'note','Thank you...'),(14,'api_key','60|wMNX8WcxrIuRAal5LseGW8ixwGlMljl4nIrMQpN5'),(15,'CompanyFooter','wifi mtaani'),(16,'printer_cols','37'),(17,'theme','default'),(18,'payment_usings',''),(19,'disable_voucher','no'),(20,'voucher_format','numbers'),(21,'disable_registration','no'),(22,'voucher_redirect',''),(23,'radius_enable','1'),(24,'radius_client',''),(25,'extend_expired','1'),(26,'extend_days',''),(27,'extend_confirmation',''),(28,'enable_balance','yes'),(29,'allow_balance_transfer','yes'),(30,'minimum_transfer',''),(31,'telegram_bot','7082555418:AAHSQ2AAMYzX1VekBHjH1eldpC7dWkvBuKU'),(32,'telegram_target_id','7082555418'),(33,'sms_url','https://api.netguru.co.ke/bytewave.php?message=[text]&phone=[number]&senderid=Lineserve&api=60|wMNX8WcxrIuRAal5LseGW8ixwGlMljl4nIrMQpN5'),(34,'wa_url',''),(35,'smtp_host',''),(36,'smtp_port',''),(37,'smtp_user',''),(38,'smtp_pass',''),(39,'smtp_ssltls',''),(40,'mail_from',''),(41,'mail_reply_to',''),(42,'user_notification_expired','none'),(43,'user_notification_payment','none'),(44,'user_notification_reminder','none'),(45,'tawkto',''),(46,'http_proxy',''),(47,'http_proxyauth',''),(48,'allow_phone_otp','no'),(49,'phone_otp_type','sms'),(50,'extend_expiry','no'),(51,'enable_tax','no'),(52,'tax_rate','0.5'),(53,'custom_tax_rate',''),(54,'hide_mrc','no'),(55,'hide_tms','no'),(56,'hide_aui','no'),(57,'hide_al','no'),(58,'hide_uet','no'),(59,'hide_vs','no'),(60,'hide_pg','no'),(61,'country_code_phone','254'),(62,'radius_plan','Radius Plan'),(63,'hotspot_plan','Hotspot Plan'),(64,'pppoe_plan','PPPOE Plan'),(65,'payment_gateway','mpesa'),(66,'maintenance_mode','0'),(67,'maintenance_mode_logout','0'),(68,'maintenance_date',''),(69,'sms_provider','bytewave'),(70,'sender_id','Lineserve');
/*!40000 ALTER TABLE `tbl_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bandwidth`
--

DROP TABLE IF EXISTS `tbl_bandwidth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bandwidth` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_bw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rate_down` int unsigned NOT NULL,
  `rate_down_unit` enum('Kbps','Mbps') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rate_up` int unsigned NOT NULL,
  `rate_up_unit` enum('Kbps','Mbps') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `burst` varchar(128) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bandwidth`
--

LOCK TABLES `tbl_bandwidth` WRITE;
/*!40000 ALTER TABLE `tbl_bandwidth` DISABLE KEYS */;
INSERT INTO `tbl_bandwidth` VALUES (1,'10M_10M',10,'Mbps',10,'Mbps',''),(2,'3M_3M',3,'Mbps',3,'Mbps',''),(3,'2M_2M',2,'Mbps',2,'Mbps','');
/*!40000 ALTER TABLE `tbl_bandwidth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customers`
--

DROP TABLE IF EXISTS `tbl_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pppoe_password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'For PPPOE Login',
  `fullname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phonenumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `coordinates` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Latitude and Longitude coordinates',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'For Money Deposit',
  `service_type` enum('Hotspot','PPPoE','Others') COLLATE utf8mb4_general_ci DEFAULT 'Others' COMMENT 'For selecting user type',
  `account_type` enum('Business','Personal') COLLATE utf8mb4_general_ci DEFAULT 'Personal' COMMENT 'For selecting account type',
  `auto_renewal` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Auto renewall using balance',
  `status` enum('Active','Banned','Disabled','Inactive','Limited','Suspended') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Active',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customers`
--

LOCK TABLES `tbl_customers` WRITE;
/*!40000 ALTER TABLE `tbl_customers` DISABLE KEYS */;
INSERT INTO `tbl_customers` VALUES (1,'admin','12345','','admin','',NULL,NULL,NULL,NULL,'','','',0.00,'Others','Personal',1,'Active',0,'2024-05-23 06:29:11',NULL),(2,'254753907737','jimnah','','254753907737','',NULL,NULL,NULL,NULL,'','','',0.00,'Others','Personal',1,'Active',0,'2024-05-23 06:29:11',NULL),(5,'254713502332','hosea','','Brian Ramui Kahura','Olkalou','','','','','254713502332','','51.54462696721446,-0.10561638477584846',0.00,'Hotspot','Personal',1,'Active',0,'2024-05-23 06:29:11',NULL),(7,'254718167262','2202','','shabran kweyu','100-carwash,Nairobi',NULL,NULL,NULL,NULL,'254718167262','shabran02@gmail.com','',0.00,'Others','Personal',1,'Active',0,'2024-05-24 17:02:12','2024-05-25 00:02:30');
/*!40000 ALTER TABLE `tbl_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customers_fields`
--

DROP TABLE IF EXISTS `tbl_customers_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_customers_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `field_value` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `tbl_customers_fields_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customers_fields`
--

LOCK TABLES `tbl_customers_fields` WRITE;
/*!40000 ALTER TABLE `tbl_customers_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_customers_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_logs`
--

DROP TABLE IF EXISTS `tbl_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userid` int NOT NULL,
  `ip` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_logs`
--

LOCK TABLES `tbl_logs` WRITE;
/*!40000 ALTER TABLE `tbl_logs` DISABLE KEYS */;
INSERT INTO `tbl_logs` VALUES (1,'2024-05-23 12:38:42','SuperAdmin','admin Login Successful',1,'154.159.252.213'),(2,'2024-05-23 12:43:40','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(3,'2024-05-23 12:46:31','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(4,'2024-05-23 13:40:21','SuperAdmin','admin Login Successful',1,'41.81.58.72'),(5,'2024-05-23 23:16:07','SuperAdmin','admin Login Successful',1,'41.72.199.210'),(6,'2024-05-23 23:16:34','SuperAdmin','Admin Login Successful',1,'154.159.252.213'),(7,'2024-05-23 23:22:10','SuperAdmin','Admin Failed Login',0,'105.21.41.234'),(8,'2024-05-23 23:22:26','SuperAdmin','Admin Failed Login',0,'105.21.41.234'),(9,'2024-05-23 23:22:43','SuperAdmin','admin Login Successful',1,'105.21.41.234'),(10,'2024-05-24 02:09:37','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(11,'2024-05-24 02:31:40','SuperAdmin','admin Login Successful',1,'154.159.252.213'),(12,'2024-05-24 02:37:22','SuperAdmin','admin Login Successful',1,'154.159.252.213'),(13,'2024-05-24 02:41:21','SuperAdmin','admin Login Successful',1,'154.159.252.213'),(14,'2024-05-24 03:37:45','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(15,'2024-05-24 03:46:08','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(16,'2024-05-24 03:47:52','User','admin Failed Login',0,'154.159.252.213'),(17,'2024-05-24 07:23:33','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(18,'2024-05-24 07:24:13','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(19,'2024-05-24 07:57:38','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(20,'2024-05-24 07:58:42','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(21,'2024-05-24 08:21:27','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(22,'2024-05-24 08:32:19','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(23,'2024-05-24 08:32:36','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(24,'2024-05-24 08:32:48','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(25,'2024-05-24 08:38:44','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(26,'2024-05-24 08:39:04','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(27,'2024-05-24 08:39:16','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(28,'2024-05-24 08:41:27','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(29,'2024-05-24 08:41:37','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(30,'2024-05-24 08:44:02','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(31,'2024-05-24 08:47:39','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(32,'2024-05-24 08:49:09','SuperAdmin','[admin]: $username User Updated Successfully',1,'154.159.252.213'),(33,'2024-05-24 08:55:59','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(34,'2024-05-24 08:56:14','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(35,'2024-05-24 08:56:22','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(36,'2024-05-24 08:57:47','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(37,'2024-05-24 08:59:53','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(38,'2024-05-24 09:02:21','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(39,'2024-05-24 09:02:30','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(40,'2024-05-24 09:06:47','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(41,'2024-05-24 18:18:04','SuperAdmin','[admin]: Settings Saved Successfully',1,'105.160.115.197'),(42,'2024-05-24 20:56:15','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(43,'2024-05-24 21:09:57','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(44,'2024-05-24 21:10:07','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(45,'2024-05-24 21:13:34','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(46,'2024-05-24 21:13:44','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(47,'2024-05-24 21:16:06','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(48,'2024-05-24 21:17:09','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(49,'2024-05-24 21:19:22','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(50,'2024-05-24 21:25:26','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(51,'2024-05-24 21:29:21','SuperAdmin','[admin]: Settings Saved Successfully',1,'105.160.61.19'),(52,'2024-05-24 21:34:28','SuperAdmin','[admin]: Settings Saved Successfully',1,'154.159.252.213'),(53,'2024-05-25 00:02:30','User','254718167262 Login Successful',7,'41.90.65.175'),(54,'2024-05-25 00:05:07','SuperAdmin','admin Login Successful',1,'41.90.65.175');
/*!40000 ALTER TABLE `tbl_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_message`
--

DROP TABLE IF EXISTS `tbl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `to_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1245675 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_message`
--

LOCK TABLES `tbl_message` WRITE;
/*!40000 ALTER TABLE `tbl_message` DISABLE KEYS */;
INSERT INTO `tbl_message` VALUES (1245674,'464767657456','56786754315','vbgfxvc','cxvcxzc','0','2024-05-23 19:13:38');
/*!40000 ALTER TABLE `tbl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment_gateway`
--

DROP TABLE IF EXISTS `tbl_payment_gateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_payment_gateway` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gateway` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'xendit | midtrans',
  `gateway_trx_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `plan_id` int NOT NULL,
  `plan_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `routers_id` int NOT NULL,
  `routers` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pg_url_payment` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `payment_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `payment_channel` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `pg_request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `pg_paid_response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `expired_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `paid_date` datetime DEFAULT NULL,
  `trx_invoice` varchar(25) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'from tbl_transactions',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 unpaid 2 paid 3 failed 4 canceled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_gateway`
--

LOCK TABLES `tbl_payment_gateway` WRITE;
/*!40000 ALTER TABLE `tbl_payment_gateway` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_payment_gateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_plans`
--

DROP TABLE IF EXISTS `tbl_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_plan` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_bw` int NOT NULL,
  `price` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('Hotspot','PPPOE','Balance') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `typebp` enum('Unlimited','Limited') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `limit_type` enum('Time_Limit','Data_Limit','Both_Limit') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time_limit` int unsigned DEFAULT NULL,
  `time_unit` enum('Mins','Hrs') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_limit` int unsigned DEFAULT NULL,
  `data_unit` enum('MB','GB') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `validity` int NOT NULL,
  `validity_unit` enum('Mins','Hrs','Days','Months','Period') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shared_users` int DEFAULT NULL,
  `routers` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_radius` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 is radius',
  `pool` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pool_expired` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `list_expired` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'address list',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 disabled',
  `allow_purchase` enum('yes','no') COLLATE utf8mb4_general_ci DEFAULT 'yes' COMMENT 'allow to show package in buy package page',
  `prepaid` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'yes' COMMENT 'is prepaid',
  `plan_type` enum('Business','Personal') COLLATE utf8mb4_general_ci DEFAULT 'Personal' COMMENT 'For switching plan according to user type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_plans`
--

LOCK TABLES `tbl_plans` WRITE;
/*!40000 ALTER TABLE `tbl_plans` DISABLE KEYS */;
INSERT INTO `tbl_plans` VALUES (1,'SURF 20BOB',1,'10000','Hotspot','Unlimited','Time_Limit',0,'Hrs',0,'MB',30,'Days',NULL,'MAIN ROUTER',0,NULL,'','',1,'yes','yes','Personal'),(2,'SURF DAILY',2,'10000','Hotspot','Unlimited','Time_Limit',0,'Hrs',0,'MB',30,'Days',NULL,'MAIN ROUTER',0,NULL,'','',1,'yes','yes','Personal'),(3,'SURF WEEKLY',2,'10000','Hotspot','Unlimited','Time_Limit',0,'Hrs',0,'MB',30,'Days',NULL,'MAIN ROUTER',0,NULL,'','',1,'yes','yes','Personal'),(4,'SURF 2 WEEKS',2,'10000','Hotspot','Unlimited','Time_Limit',0,'Hrs',0,'MB',30,'Days',NULL,'MAIN ROUTER',0,NULL,'','',1,'yes','yes','Personal'),(5,'SURF MONTHLY',2,'10000','Hotspot','Unlimited','Time_Limit',0,'Hrs',0,'MB',30,'Days',NULL,'MAIN ROUTER',0,NULL,'','',1,'yes','yes','Personal'),(6,'SURF 10BOB',2,'10000','Hotspot','Unlimited','Time_Limit',0,'Hrs',0,'MB',30,'Days',NULL,'MAIN ROUTER',0,NULL,'','',1,'yes','yes','Personal'),(7,'SURF3mbps',1,'10000','Hotspot','Unlimited','Time_Limit',0,'Hrs',0,'MB',30,'Days',NULL,'MAIN ROUTER',0,NULL,'','',1,'yes','yes','Personal'),(8,'Free Data',2,'10000','Hotspot','Unlimited','Time_Limit',0,'Hrs',0,'MB',30,'Days',NULL,'MAIN ROUTER',0,NULL,'','',1,'yes','yes','Personal'),(9,'10 Mins_Unlimited',3,'10000','Hotspot','Unlimited','Time_Limit',0,'Hrs',0,'MB',30,'Days',NULL,'MAIN ROUTER',0,NULL,'','',1,'yes','yes','Personal');
/*!40000 ALTER TABLE `tbl_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pool`
--

DROP TABLE IF EXISTS `tbl_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pool` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pool_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `range_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `routers` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pool`
--

LOCK TABLES `tbl_pool` WRITE;
/*!40000 ALTER TABLE `tbl_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_routers`
--

DROP TABLE IF EXISTS `tbl_routers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_routers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 disabled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_routers`
--

LOCK TABLES `tbl_routers` WRITE;
/*!40000 ALTER TABLE `tbl_routers` DISABLE KEYS */;
INSERT INTO `tbl_routers` VALUES (1,'MAIN ROUTER','192.168.42.10','byteapi','12345678','main router',1);
/*!40000 ALTER TABLE `tbl_routers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transactions`
--

DROP TABLE IF EXISTS `tbl_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `plan_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `recharged_on` date NOT NULL,
  `recharged_time` time NOT NULL DEFAULT '00:00:00',
  `expiration` date NOT NULL,
  `time` time NOT NULL,
  `method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `routers` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('Hotspot','PPPOE','Balance') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(256) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'for note',
  `admin_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transactions`
--

LOCK TABLES `tbl_transactions` WRITE;
/*!40000 ALTER TABLE `tbl_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_recharges`
--

DROP TABLE IF EXISTS `tbl_user_recharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_recharges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `plan_id` int NOT NULL,
  `namebp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `recharged_on` date NOT NULL,
  `recharged_time` time NOT NULL DEFAULT '00:00:00',
  `expiration` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `routers` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_recharges`
--

LOCK TABLES `tbl_user_recharges` WRITE;
/*!40000 ALTER TABLE `tbl_user_recharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_recharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `root` int NOT NULL DEFAULT '0' COMMENT 'for sub account',
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `fullname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(32) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `email` varchar(128) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `city` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'kota',
  `subdistrict` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'kecamatan',
  `ward` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'kelurahan',
  `user_type` enum('SuperAdmin','Admin','Report','Agent','Sales') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Active',
  `last_login` datetime DEFAULT NULL,
  `creationdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (1,0,'admin','Administrator','d033e22ae348aeb5660fc2140aec35850c4da997','254713502332','','','','','SuperAdmin','Active','2024-05-25 00:05:07','2014-06-23 01:43:07');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_voucher`
--

DROP TABLE IF EXISTS `tbl_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_voucher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('Hotspot','PPPOE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `routers` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_plan` int NOT NULL,
  `code` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `generated_by` int NOT NULL DEFAULT '0' COMMENT 'id admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_voucher`
--

LOCK TABLES `tbl_voucher` WRITE;
/*!40000 ALTER TABLE `tbl_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-24 18:13:21
