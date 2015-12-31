CREATE DATABASE  IF NOT EXISTS `toast` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `toast`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: toast
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS `guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestbook` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `contents` mediumtext NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='방명록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook`
--

LOCK TABLES `guestbook` WRITE;
/*!40000 ALTER TABLE `guestbook` DISABLE KEYS */;
INSERT INTO `guestbook` VALUES (1,'12','12','12','2015-12-30 13:24:54','2015-12-30 13:34:54'),(2,'222','222','222','2015-12-30 13:25:26','2015-12-30 13:27:20'),(3,'333','333','3333333\r\n333\r\n3','2015-12-30 13:27:19','2015-12-31 22:50:19'),(4,'test@test.com','4444','hello World~!','2015-12-31 19:31:30',NULL),(5,'test@test.com','12341234','HElsdlkfjslkfj','2015-12-31 19:33:25',NULL),(6,'test@test.com','qwerqwer','aaaaaa','2015-12-31 19:35:17',NULL),(7,'test@test.com','zzzzzzzzzzzzzzz','aaaaaazzzzzzzzzzzzzzzzzzzzzzzzz','2015-12-31 19:43:29',NULL),(8,'hello@nhn.ent','asdf','123123123\r\n새해 복 많이 주세요1111222','2015-12-31 20:30:03','2015-12-31 22:49:29'),(9,'test@test.com','123','12\r\n34\r\n56','2015-12-31 22:51:10',NULL);
/*!40000 ALTER TABLE `guestbook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-31 23:05:54
