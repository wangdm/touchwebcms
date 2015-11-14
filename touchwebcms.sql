CREATE DATABASE  IF NOT EXISTS `touchwebcms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `touchwebcms`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: touchwebcms
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `userid` int(11) NOT NULL,
  `pushuri` varchar(1024) DEFAULT NULL,
  `pulluri` varchar(1024) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (8,'vdsvsdav',3,'vsdvsda','sddsfvsadfd',0,'2015-10-22 14:33:43'),(9,'fffffff',3,'ddddddddd','eeeeeeeeeee',0,'2015-10-22 16:52:07'),(10,'fsdf',3,'fsfew','fefw',0,'2015-10-22 16:56:43'),(11,'gdsgsd',3,'fsdfesf','fffffffffff',0,'2015-10-22 16:58:43'),(12,'fsdfds',3,'fsdf','fsdfdsf',0,'2015-10-22 17:01:02');
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` int(11) DEFAULT '0',
  `description` text,
  `logo` varchar(1024) DEFAULT NULL,
  `adimage` varchar(1024) DEFAULT NULL,
  `property` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `favorite_cnt` int(11) NOT NULL DEFAULT '0',
  `great_cnt` int(11) NOT NULL DEFAULT '0',
  `study_cnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  KEY `cat_id_idx` (`cat_id`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,3,20,'中国真美',0,'','asset/image/20151111153451.jpg','asset/image/20151111153451.jpg',NULL,'2015-11-12 17:56:51','2015-11-12 17:56:51','2015-11-12 17:56:51',0,0,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursecategory`
--

DROP TABLE IF EXISTS `coursecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursecategory` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursecategory`
--

LOCK TABLES `coursecategory` WRITE;
/*!40000 ALTER TABLE `coursecategory` DISABLE KEYS */;
INSERT INTO `coursecategory` VALUES (1,'普教课程',0),(2,'高校课程',0),(3,'职业教育',0),(4,'兴趣爱好',0),(5,'小学',1),(6,'初中',1),(7,'高中',1),(8,'文学艺术',2),(9,'哲学历史',2),(10,'经管法学',2),(11,'基础科学',2),(12,'工程技术',2),(13,'农林医药',2),(14,'外语',3),(15,'IT',3),(16,'金融投资',3),(17,'财务会计',3),(18,'投资理财',4),(19,'生活百科',4),(20,'文化艺术',4),(21,'购物时尚',4),(22,'美食养生',4),(23,'运动户外',4);
/*!40000 ALTER TABLE `coursecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursepropertygroup`
--

DROP TABLE IF EXISTS `coursepropertygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursepropertygroup` (
  `prop_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `prop_group_name` varchar(45) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prop_group_id`),
  KEY `cat_id_idx` (`cat_id`),
  CONSTRAINT `cat_id` FOREIGN KEY (`cat_id`) REFERENCES `coursecategory` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursepropertygroup`
--

LOCK TABLES `coursepropertygroup` WRITE;
/*!40000 ALTER TABLE `coursepropertygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursepropertygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursepropertyitem`
--

DROP TABLE IF EXISTS `coursepropertyitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursepropertyitem` (
  `prop_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `prop_item_name` varchar(45) NOT NULL,
  `prop_group_id` int(11) NOT NULL,
  PRIMARY KEY (`prop_item_id`),
  KEY `prop_group_id_idx` (`prop_group_id`),
  CONSTRAINT `prop_group_id` FOREIGN KEY (`prop_group_id`) REFERENCES `coursepropertygroup` (`prop_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursepropertyitem`
--

LOCK TABLES `coursepropertyitem` WRITE;
/*!40000 ALTER TABLE `coursepropertyitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursepropertyitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navmenu`
--

DROP TABLE IF EXISTS `navmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navmenu` (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(45) NOT NULL,
  `nav_url` varchar(254) NOT NULL,
  `nav_index` int(11) DEFAULT '1000',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navmenu`
--

LOCK TABLES `navmenu` WRITE;
/*!40000 ALTER TABLE `navmenu` DISABLE KEYS */;
INSERT INTO `navmenu` VALUES (1,'普教课程','http://localhost:8080/touchwebcms/?parentId=1',1),(2,'高校课程','http://localhost:8080/touchwebcms/?parentId=2',2),(3,'职业教育','http://localhost:8080/touchwebcms/?parentId=3',3),(4,'兴趣爱好','http://localhost:8080/touchwebcms/?parentId=4',4),(5,'全部课程','http://localhost:8080/touchwebcms/course.jsp',5),(6,'讲师/机构','http://localhost:8080/touchwebcms/lecturer.jsp',6);
/*!40000 ALTER TABLE `navmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'user',0),(2,'admin',0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `access_time` datetime DEFAULT NULL,
  `access_ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'wangdm','phight',2,'Phight Wang','358487288@qq.com','13077895475',NULL,NULL,NULL),(15,'phight','123456',1,'Phight','710971389@qq.com','13077295879',NULL,NULL,NULL),(16,'','',NULL,'','','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `duration` time DEFAULT NULL,
  `video_uri` varchar(1024) DEFAULT NULL,
  `description` tinytext,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `favorite_cnt` int(11) NOT NULL DEFAULT '0',
  `great_cnt` int(11) NOT NULL DEFAULT '0',
  `play_cnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `course_id_idx` (`course_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (2,1,'中国真美','00:02:11','asset/jwplayer/Beautiful_China.mp4',NULL,'2015-11-12 17:56:51','2015-11-12 17:56:51',0,0,0);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-14 18:32:02
