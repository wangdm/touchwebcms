CREATE DATABASE  IF NOT EXISTS `touchwebcms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `touchwebcms`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: touchwebcms
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
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(45) NOT NULL,
  `agency_desc` tinytext,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

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
  `aid` int(11) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` int(11) DEFAULT '0',
  `description` tinytext,
  `detail` text,
  `logo` varchar(1024) DEFAULT NULL,
  `adimage` varchar(1024) DEFAULT NULL,
  `property` varchar(45) DEFAULT NULL,
  `totallesson` int(11) DEFAULT '50',
  `curlesson` int(11) DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `grade` int(11) NOT NULL DEFAULT '0',
  `grade_cnt` int(11) NOT NULL DEFAULT '0',
  `favorite_cnt` int(11) NOT NULL DEFAULT '0',
  `great_cnt` int(11) NOT NULL DEFAULT '0',
  `study_cnt` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  KEY `cat_id_idx` (`cat_id`),
  KEY `aid_idx` (`aid`),
  CONSTRAINT `aid` FOREIGN KEY (`aid`) REFERENCES `agency` (`agency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,3,NULL,20,'中国真美',0,'gdgdg公司的公告规定规范和推荐国内部分的吧',NULL,'asset/image/20151111153451.jpg','asset/image/20151111153451.jpg',NULL,20,3,'2015-11-12 17:56:51','2015-11-24 15:59:56','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-12 17:56:51',89,55,0,0,0,0),(2,3,NULL,5,'小学英语听说读写综合训练',0,NULL,NULL,'asset/image/course_5626_388x195.jpg','asset/image/course_5626_388x195.jpg',NULL,0,0,'2015-11-18 18:15:16','2015-11-18 18:15:16','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:15:16',0,0,0,0,0,0),(3,3,NULL,5,'小学数学思维训练',0,NULL,NULL,'asset/image/course_5629_388x195.jpg','asset/image/course_5629_388x195.jpg',NULL,0,0,'2015-11-18 18:15:20','2015-11-18 18:15:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:15:20',0,0,0,0,0,0),(4,3,NULL,5,'小学语文国学小课堂',0,NULL,NULL,'asset/image/course_5619_388x195.jpg','asset/image/course_5619_388x195.jpg',NULL,0,0,'2015-11-18 18:28:20','2015-11-18 18:28:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:28:20',0,0,0,0,0,0),(5,3,NULL,5,'小学语文趣味读与写',0,NULL,NULL,'asset/image/course_5623_388x195.jpg','asset/image/course_5623_388x195.jpg',NULL,0,0,'2015-11-18 18:32:20','2015-11-18 18:32:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:32:20',0,0,0,0,0,0),(6,3,NULL,5,'英语自然拼读法进阶',0,NULL,NULL,'asset/image/course_103382_388x195.jpg','asset/image/course_103382_388x195.jpg',NULL,0,0,'2015-11-18 18:36:20','2015-11-18 18:36:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:36:20',0,0,0,0,0,0),(7,3,NULL,6,'初一上学期语文集训课',0,NULL,NULL,'asset/image/course_8655_388x195.jpg','asset/image/course_8655_388x195.jpg',NULL,0,0,'2015-11-18 18:38:20','2015-11-18 18:38:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:38:20',0,0,0,0,0,0),(8,3,NULL,6,'初一英语7大词类巧记',0,NULL,NULL,'asset/image/course_5527_388x195.jpg','asset/image/course_5527_388x195.jpg',NULL,0,0,'2015-11-18 18:41:20','2015-11-18 18:41:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:41:20',0,0,0,0,0,0),(9,3,NULL,6,'初一英语时态巧学宝典',0,NULL,NULL,'asset/image/course_5532_388x195.jpg','asset/image/course_5532_388x195.jpg',NULL,0,0,'2015-11-18 18:43:20','2015-11-18 18:43:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:43:20',0,0,0,0,0,0),(10,3,NULL,6,'初一上学期英语集训课',0,NULL,NULL,'asset/image/course_8656_388x195.jpg','asset/image/course_8656_388x195.jpg',NULL,0,0,'2015-11-18 18:46:20','2015-11-18 18:46:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:46:20',0,0,0,0,0,0),(11,3,NULL,6,'初一上学期数学集训课',0,NULL,NULL,'asset/image/course_8658_388x195.jpg','asset/image/course_8658_388x195.jpg',NULL,0,0,'2015-11-18 18:47:20','2015-11-18 18:47:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:47:20',0,0,0,0,0,0),(12,3,NULL,7,'高一语文读文与写作同步课（上）',0,NULL,NULL,'asset/image/course_5133_388x195.jpg','asset/image/course_5133_388x195.jpg',NULL,0,0,'2015-11-18 18:50:20','2015-11-18 18:50:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:50:20',0,0,0,0,0,0),(13,3,NULL,7,'高一数学必修1同步课',0,NULL,NULL,'asset/image/course_5124_388x195.jpg','asset/image/course_5124_388x195.jpg',NULL,0,0,'2015-11-18 18:52:20','2015-11-18 18:52:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:52:20',0,0,0,0,0,0),(14,3,NULL,7,'高一英语阅读技巧之感恩记忆篇',0,NULL,NULL,'asset/image/course_8573_388x195.jpg','asset/image/course_8573_388x195.jpg',NULL,0,0,'2015-11-18 18:55:20','2015-11-18 18:55:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:55:20',0,0,0,0,0,0),(15,3,NULL,7,'高一英语阅读技巧之姿势的力量篇',0,NULL,NULL,'asset/image/course_8575_388x195.jpg','asset/image/course_8575_388x195.jpg',NULL,0,0,'2015-11-18 18:56:20','2015-11-18 18:56:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 18:56:20',0,0,0,0,0,0),(16,3,NULL,8,'中国的姓名文化',0,NULL,NULL,'asset/image/course_5075_388x195.jpg','asset/image/course_5075_388x195.jpg',NULL,0,0,'2015-11-18 19:00:20','2015-11-18 19:00:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:00:20',0,0,0,0,0,0),(17,3,NULL,9,'哲学与我们的时代',0,NULL,NULL,'asset/image/course_5072_388x195.jpg','asset/image/course_5072_388x195.jpg',NULL,0,0,'2015-11-18 19:01:20','2015-11-18 19:01:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:01:20',0,0,0,0,0,0),(18,3,NULL,9,'中国古代史—隋唐五代',0,NULL,NULL,'asset/image/course_5080_388x195.jpg','asset/image/course_5080_388x195.jpg',NULL,0,0,'2015-11-18 19:04:20','2015-11-18 19:04:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:04:20',0,0,0,0,0,0),(19,3,NULL,9,'康德哲学专题研究',0,NULL,NULL,'asset/image/course_5021_388x195.jpg','asset/image/course_5021_388x195.jpg',NULL,0,0,'2015-11-18 19:05:20','2015-11-18 19:05:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:05:20',0,0,0,0,0,0),(20,3,NULL,14,'剑桥BEC高级商务英语精讲课程',0,NULL,NULL,'asset/image/course_8355_388x195.jpg','asset/image/course_8355_388x195.jpg',NULL,0,0,'2015-11-18 19:09:20','2015-11-18 19:09:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:09:20',0,0,0,0,0,0),(21,3,NULL,14,'托福口语：中国学生常见问题及应对策略',0,NULL,NULL,'asset/image/course_103639_388x195.jpg','asset/image/course_103639_388x195.jpg',NULL,0,0,'2015-11-18 19:10:20','2015-11-18 19:10:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:10:20',0,0,0,0,0,0),(22,3,NULL,14,'攻破雅思听力单选题',0,NULL,NULL,'asset/image/course_103645_388x195.jpg','asset/image/course_103645_388x195.jpg',NULL,0,0,'2015-11-18 19:11:20','2015-11-18 19:11:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:11:20',0,0,0,0,0,0),(23,3,NULL,14,'GRE阅读：手把手教你如何阅读及分析文章',0,NULL,NULL,'asset/image/course_103632_388x195.jpg','asset/image/course_103632_388x195.jpg',NULL,0,0,'2015-11-18 19:12:20','2015-11-18 19:12:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:12:20',0,0,0,0,0,0),(24,3,NULL,15,'网络工程师CCNA认证',0,NULL,NULL,'asset/image/course_103600_388x195.jpg','asset/image/course_103600_388x195.jpg',NULL,0,0,'2015-11-18 19:13:20','2015-11-18 19:13:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:13:20',0,0,0,0,0,0),(25,3,NULL,15,'OCJP认证之Java高级工程师',0,NULL,NULL,'asset/image/course_103564_388x195.png','asset/image/course_103564_388x195.png',NULL,0,0,'2015-11-18 19:15:20','2015-11-18 19:15:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:15:20',0,0,0,0,0,0),(26,3,NULL,15,'Android企业项目实战开发工程师',0,NULL,NULL,'asset/image/course_103621_388x195.jpg','asset/image/course_103621_388x195.jpg',NULL,0,0,'2015-11-18 19:16:20','2015-11-18 19:16:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:16:20',0,0,0,0,0,0),(27,3,NULL,15,'Apple Watch之UI控件开发',0,NULL,NULL,'asset/image/course_103582_388x195.jpg','asset/image/course_103582_388x195.jpg',NULL,0,0,'2015-11-18 19:17:20','2015-11-18 19:17:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:17:20',0,0,0,0,0,0),(28,3,NULL,16,'银行从业个人理财11小时高效课程',0,NULL,NULL,'asset/image/course_8031_388x195.jpg','asset/image/course_8031_388x195.jpg',NULL,0,0,'2015-11-18 19:21:20','2015-11-18 19:21:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:21:20',0,0,0,0,0,0),(29,3,NULL,16,'证券交易精品辅导课程',0,NULL,NULL,'asset/image/course_7999_388x195.jpg','asset/image/course_7999_388x195.jpg',NULL,0,0,'2015-11-18 19:22:20','2015-11-18 19:22:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:22:20',0,0,0,0,0,0),(30,3,NULL,16,'证券发行与承销经典习题课程',0,NULL,NULL,'asset/image/course_8015_388x195.jpg','asset/image/course_8015_388x195.jpg',NULL,0,0,'2015-11-18 19:24:20','2015-11-18 19:24:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:24:20',0,0,0,0,0,0),(31,3,NULL,16,'炒股看盘思路分析2015.11.02',0,NULL,NULL,'asset/image/course_105754_388x195.jpg','asset/image/course_105754_388x195.jpg',NULL,0,0,'2015-11-18 19:25:20','2015-11-18 19:25:20','2015-11-24 15:43:17','2015-11-24 15:43:17','2015-11-18 19:25:20',0,0,0,0,0,0);
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
  `prop_nav` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`prop_group_id`),
  KEY `cat_id_idx` (`cat_id`),
  CONSTRAINT `cat_id` FOREIGN KEY (`cat_id`) REFERENCES `coursecategory` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursepropertygroup`
--

LOCK TABLES `coursepropertygroup` WRITE;
/*!40000 ALTER TABLE `coursepropertygroup` DISABLE KEYS */;
INSERT INTO `coursepropertygroup` VALUES (1,'年级',5,1),(2,'难度',5,0),(3,'科目',5,0),(4,'年级',6,0),(5,'难度',6,0),(6,'科目',6,1),(7,'年级',7,0),(8,'难度',7,0),(9,'科目',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursepropertyitem`
--

LOCK TABLES `coursepropertyitem` WRITE;
/*!40000 ALTER TABLE `coursepropertyitem` DISABLE KEYS */;
INSERT INTO `coursepropertyitem` VALUES (1,'一年级',1),(2,'二年级',1),(3,'三年级',1),(4,'四年级',1),(5,'五年级',1),(6,'六年级',1),(7,'简单',2),(8,'中等',2),(9,'困难',2),(10,'语文',3),(11,'数学',3),(12,'英语',3),(13,'初一',4),(14,'初二',4),(15,'初三',4),(16,'简单',5),(17,'中等',5),(18,'困难',5),(19,'语文',6),(20,'数学',6),(21,'英语',6),(22,'物理',6),(23,'化学',6),(24,'生物',6),(25,'历史',6),(26,'政治',6),(27,'地理',6),(28,'高一',7),(29,'高二',7),(30,'高三',7),(31,'简单',8),(32,'中等',8),(33,'困难',8),(34,'语文',9),(35,'数学',9),(36,'英语',9),(37,'物理',9),(38,'化学',9),(39,'生物',9),(40,'历史',9),(41,'政治',9),(42,'地理',9);
/*!40000 ALTER TABLE `coursepropertyitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotspot`
--

DROP TABLE IF EXISTS `hotspot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotspot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(45) NOT NULL,
  `image` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `dead_time` datetime DEFAULT NULL,
  `idx` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotspot`
--

LOCK TABLES `hotspot` WRITE;
/*!40000 ALTER TABLE `hotspot` DISABLE KEYS */;
INSERT INTO `hotspot` VALUES (1,1,'Hotspot 1','asset/image/hot201511091142279680.jpg','http://192.168.2.251:8080/touchwebcms/course.jsp?courseId=1',1,0,'2015-11-23 11:42:32','2015-11-30 11:42:32',3),(2,0,'Hotspot 2','asset/image/hot201511120937461181.jpg','http://192.168.2.251:8080/touchwebcms/course.jsp?courseId=2',1,0,'2015-11-23 13:55:49','2015-11-30 13:55:49',2),(3,0,'Hotspot 3','asset/image/hot201511180946402570.jpg','http://192.168.2.251:8080/touchwebcms/course.jsp?courseId=3',1,0,'2015-11-23 14:06:31','2015-11-30 14:06:31',3),(4,0,'Hotspot 4','asset/image/hot201511191631169985.jpg','http://192.168.2.251:8080/touchwebcms/course.jsp?courseId=4',1,0,'2015-11-23 14:06:31','2015-11-30 14:06:31',4),(5,0,'Hotspot 5','asset/image/hot201511231326356403.jpg','http://192.168.2.251:8080/touchwebcms/course.jsp?courseId=5',1,0,'2015-11-23 14:06:31','2015-11-30 14:06:31',5),(6,2,'Text Hotspot 01',NULL,'http://192.168.2.251:8080/touchwebcms/course.jsp?courseId=6',0,0,'2015-11-24 10:06:31','2015-11-30 10:06:31',5);
/*!40000 ALTER TABLE `hotspot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `description` tinytext,
  `status` int(11) NOT NULL DEFAULT '0',
  `free` tinyint(1) NOT NULL DEFAULT '0',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `video_id_idx` (`video_id`),
  KEY `course_id_idx` (`course_id`),
  CONSTRAINT `video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,1,2,'中国真美',NULL,1,0,'2015-11-24 18:39:59'),(2,1,3,'酷派大神1',NULL,1,0,'2015-11-24 18:39:59'),(3,1,4,'酷派大神2',NULL,1,0,'2015-11-24 18:39:59'),(4,1,NULL,'酷派大神3',NULL,0,0,'2015-11-24 18:53:35');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
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
INSERT INTO `navmenu` VALUES (1,'普教课程','http://192.168.2.251:8080/touchwebcms/?parentId=1',1),(2,'高校课程','http://192.168.2.251:8080/touchwebcms/?parentId=2',2),(3,'职业教育','http://192.168.2.251:8080/touchwebcms/?parentId=3',3),(4,'兴趣爱好','http://192.168.2.251:8080/touchwebcms/?parentId=4',4),(5,'全部课程','http://192.168.2.251:8080/touchwebcms/course.jsp',5),(6,'讲师/机构','http://192.168.2.251:8080/touchwebcms/lecturer.jsp',6);
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
  `course_id` int(11) DEFAULT NULL,
  `lesson_id` int(11) DEFAULT NULL,
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
  KEY `lesson_id_idx` (`lesson_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (2,1,NULL,'中国真美','00:03:31','asset/jwplayer/Beautiful_China.mp4',NULL,'2015-11-12 17:56:51','2015-11-12 17:56:51',0,0,0),(3,1,NULL,'酷派大神1','00:02:15','asset/jwplayer/Coolshow_01.mp4',NULL,'2015-11-19 10:28:11','2015-11-19 10:28:11',0,0,0),(4,1,NULL,'酷派大神2','00:01:15','asset/jwplayer/Coolshow_02.mp4',NULL,'2015-11-19 10:30:11','2015-11-19 10:30:11',0,0,0);
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

-- Dump completed on 2015-11-25 11:14:02
