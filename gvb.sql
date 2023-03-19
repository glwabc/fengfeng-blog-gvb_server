-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: gvb_db
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advert_models`
--

DROP TABLE IF EXISTS `advert_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advert_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `href` longtext COLLATE utf8mb4_unicode_ci,
  `images` longtext COLLATE utf8mb4_unicode_ci,
  `is_show` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advert_models`
--

LOCK TABLES `advert_models` WRITE;
/*!40000 ALTER TABLE `advert_models` DISABLE KEYS */;
INSERT INTO `advert_models` VALUES (1,'2023-03-05 14:30:22.167','2023-03-05 14:30:22.167','gvb前端基础课程','https://www.bilibili.com/video/BV1Fj411u7yk','https://i0.hdslb.com/bfs/archive/e630cb48407a68d6bed62d63f7a5726da8a6f14f.jpg',1),(2,'2023-03-05 14:55:11.274','2023-03-05 14:55:11.274','gvb后端课程','https://www.bilibili.com/video/BV1f24y1G72C','https://i2.hdslb.com/bfs/archive/155640bb282dd6b7bd3659bf7c856d2511d1b263.png',0);
/*!40000 ALTER TABLE `advert_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_models`
--

DROP TABLE IF EXISTS `banner_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `path` longtext COLLATE utf8mb4_unicode_ci,
  `hash` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(38) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_type` bigint(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_models`
--

LOCK TABLES `banner_models` WRITE;
/*!40000 ALTER TABLE `banner_models` DISABLE KEYS */;
INSERT INTO `banner_models` VALUES (5,'2023-02-20 20:16:57.772','2023-02-20 20:16:57.772','/uploads/file/33.jpg','8ac9d7dff88c2e2ebd893922a8e3b0f0','33.jpg',1),(7,'2023-02-20 20:16:57.782','2023-02-20 20:16:57.782','/uploads/file/38.jpg','fe2d77826fa9327431000afa23fdfb1d','38.jpg',1),(10,'2023-03-04 20:59:46.682','2023-03-04 20:59:46.682','/uploads/file/215953KgCPr.jpg','548bb4a8dc5448b83ad91861fb7751a2','215953KgCPr.jpg',1),(11,'2023-03-04 21:02:24.585','2023-03-04 21:02:24.585','/uploads/file/223532sJUKw.jpg','eb033a81e349cd1c429a0798dc03a536','223532sJUKw.jpg',1),(12,'2023-03-04 21:02:24.590','2023-03-04 21:02:24.590','/uploads/file/235628ZxKUe.jpg','1faa43ac634d5775ecb854494ae865ef','235628ZxKUe.jpg',1),(13,'2023-03-04 21:03:46.304','2023-03-04 21:03:46.304','/uploads/file/000824Cv7Q4.jpg','503b0b6c27a8d8a15a01b985b6fbcc80','000824Cv7Q4.jpg',1),(14,'2023-03-04 21:03:46.305','2023-03-04 21:03:46.305','/uploads/file/235920pM89Q.jpg','0ee752afc518af5485b25ac8d94b3bc2','235920pM89Q.jpg',1),(15,'2023-03-04 21:03:46.306','2023-03-04 21:03:46.306','/uploads/file/101414HyxwO.jpg','f7273326887647ef36375f75f7a40dbf','101414HyxwO.jpg',1),(16,'2023-03-04 21:10:20.398','2023-03-04 21:10:20.398','/uploads/file/105747KJAJa.jpg','0605ddd57640f0e78e20909ee7eaa054','105747KJAJa.jpg',1),(17,'2023-03-04 21:10:20.404','2023-03-04 21:10:20.404','/uploads/file/165914XyhES.jpg','f8d735f05c9531d44984eaf22d129795','165914XyhES.jpg',1),(18,'2023-03-05 13:21:15.938','2023-03-05 13:21:15.938','/uploads/file/35.jpg','c4c6e658b20dfd13d1e070bff53f7b34','35.jpg',1);
/*!40000 ALTER TABLE `banner_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_models`
--

DROP TABLE IF EXISTS `chat_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `nick_name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msg_type` tinyint(4) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_models`
--

LOCK TABLES `chat_models` WRITE;
/*!40000 ALTER TABLE `chat_models` DISABLE KEYS */;
INSERT INTO `chat_models` VALUES (1,'2023-02-25 23:54:08.710','2023-02-25 23:54:08.710','大气的加林查','uploads/chat_avatar/大.png','消息类型错误','127.0.0.1','内网',6,1),(2,'2023-02-25 23:54:35.757','2023-02-25 23:54:35.757','大气的加林查','uploads/chat_avatar/大.png','大气的加林查 进入聊天室','127.0.0.1','内网',1,1),(3,'2023-02-25 23:54:47.557','2023-02-25 23:54:47.557','大气的加林查','uploads/chat_avatar/大.png','你好啊','127.0.0.1','内网',2,1),(4,'2023-02-25 23:54:48.381','2023-02-25 23:54:48.381','大气的加林查','uploads/chat_avatar/大.png','你好啊','127.0.0.1','内网',2,1),(5,'2023-02-25 23:54:53.501','2023-02-25 23:54:53.501','忧郁的古利特','uploads/chat_avatar/忧.png','好','127.0.0.1','内网',2,1),(6,'2023-02-25 23:56:08.742','2023-02-25 23:56:08.742','内马尔掐指一算','uploads/chat_avatar/内.png','消息类型错误','127.0.0.1','内网',6,0),(7,'2023-02-26 10:39:28.340','2023-02-26 10:39:28.340','鸣人完成了大四喜','uploads/chat_avatar/鸣.png','好1123','127.0.0.1','内网',2,1),(8,'2023-02-26 10:43:06.935','2023-02-26 10:43:06.935','约翰·查尔斯求而不得','uploads/chat_avatar/约.png','消息类型错误','127.0.0.1','内网',6,0),(9,'2023-02-26 10:43:12.555','2023-02-26 10:43:12.555','约翰·查尔斯求而不得','uploads/chat_avatar/约.png','你好啊','127.0.0.1','内网',2,1),(10,'2023-02-26 10:43:24.995','2023-02-26 10:43:24.995','专注的鲁尼','uploads/chat_avatar/专.png','专注的鲁尼 进入聊天室','127.0.0.1','内网',1,1),(11,'2023-02-26 10:43:34.831','2023-02-26 10:43:34.831','','','专注的鲁尼 离开聊天室','127.0.0.1','内网',1,1),(12,'2023-02-26 10:46:56.725','2023-02-26 10:46:56.725','矮小的哈维','uploads/chat_avatar/矮.png','矮小的哈维 进入聊天室','127.0.0.1','内网',1,1),(13,'2023-02-26 10:46:57.796','2023-02-26 10:46:57.796','矮小的哈维','uploads/chat_avatar/矮.png','矮小的哈维 进入聊天室','127.0.0.1','内网',1,1),(14,'2023-02-26 10:47:16.948','2023-02-26 10:47:16.948','大意的巴蒂斯图塔','uploads/chat_avatar/大.png','大意的巴蒂斯图塔 进入聊天室','127.0.0.1','内网',1,1);
/*!40000 ALTER TABLE `chat_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_models`
--

DROP TABLE IF EXISTS `comment_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `parent_comment_id` bigint(20) unsigned DEFAULT NULL,
  `content` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digg_count` tinyint(4) DEFAULT '0',
  `comment_count` tinyint(4) DEFAULT '0',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `article_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_models_user` (`user_id`),
  KEY `fk_comment_models_sub_comments` (`parent_comment_id`),
  CONSTRAINT `fk_comment_models_sub_comments` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment_models` (`id`),
  CONSTRAINT `fk_comment_models_user` FOREIGN KEY (`user_id`) REFERENCES `user_models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_models`
--

LOCK TABLES `comment_models` WRITE;
/*!40000 ALTER TABLE `comment_models` DISABLE KEYS */;
INSERT INTO `comment_models` VALUES (5,'2023-03-14 19:45:57.489','2023-03-14 19:46:30.787',NULL,'你好',0,1,1,'D9cVwYYBMeB77WN1XkY7'),(6,'2023-03-14 19:46:30.788','2023-03-14 19:46:30.788',5,'你好的子评论',0,0,1,'D9cVwYYBMeB77WN1XkY7');
/*!40000 ALTER TABLE `comment_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fade_back_models`
--

DROP TABLE IF EXISTS `fade_back_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fade_back_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_content` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_apply` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fade_back_models`
--

LOCK TABLES `fade_back_models` WRITE;
/*!40000 ALTER TABLE `fade_back_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `fade_back_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_stash_models`
--

DROP TABLE IF EXISTS `log_stash_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_stash_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) DEFAULT NULL,
  `content` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_stash_models`
--

LOCK TABLES `log_stash_models` WRITE;
/*!40000 ALTER TABLE `log_stash_models` DISABLE KEYS */;
INSERT INTO `log_stash_models` VALUES (1,'2023-02-26 14:56:10.158','192.168.100.158','内网',4,'枫枫 你好啊',0),(2,'2023-02-26 15:01:23.335','127.0.0.1','内网',3,'用户名密码错误 admin 12341',0),(3,'2023-02-26 15:01:38.410','127.0.0.1','内网',2,'登录成功',1),(4,'2023-02-26 15:22:27.518','127.0.0.1','内网',2,'登录成功',1),(5,'2023-02-26 15:40:05.517','127.0.0.1','内网',2,'登录成功',1),(6,'2023-02-26 15:40:22.608','127.0.0.1','内网',2,'登录成功',1),(7,'2023-03-03 22:36:24.370','127.0.0.1','内网地址',2,'登录成功',1),(8,'2023-03-04 00:09:37.415','127.0.0.1','内网地址',3,'123 用户名不存在',0),(9,'2023-03-04 00:10:01.406','127.0.0.1','内网地址',2,'登录成功',1),(10,'2023-03-04 00:12:38.679','127.0.0.1','内网地址',3,'123 用户名不存在',0),(11,'2023-03-04 00:14:55.688','127.0.0.1','内网地址',3,'12 用户名不存在',0),(12,'2023-03-04 00:18:18.662','127.0.0.1','内网地址',3,'123 用户名不存在',0),(13,'2023-03-04 00:19:00.669','127.0.0.1','内网地址',3,'12 用户名不存在',0),(14,'2023-03-04 00:19:06.885','127.0.0.1','内网地址',2,'登录成功',1),(15,'2023-03-04 00:19:10.149','127.0.0.1','内网地址',2,'登录成功',1),(16,'2023-03-04 09:55:18.622','127.0.0.1','内网地址',2,'登录成功',1),(17,'2023-03-04 09:58:59.495','127.0.0.1','内网地址',2,'登录成功',1),(18,'2023-03-04 10:03:59.679','127.0.0.1','内网地址',2,'登录成功',1),(19,'2023-03-04 10:04:48.852','127.0.0.1','内网地址',2,'登录成功',1),(20,'2023-03-04 10:05:49.992','127.0.0.1','内网地址',2,'登录成功',1),(21,'2023-03-04 10:06:33.094','127.0.0.1','内网地址',2,'登录成功',1),(22,'2023-03-04 10:09:37.843','127.0.0.1','内网地址',2,'登录成功',1),(23,'2023-03-04 10:14:02.614','127.0.0.1','内网地址',2,'登录成功',1),(24,'2023-03-04 10:15:03.073','127.0.0.1','内网地址',2,'登录成功',1),(25,'2023-03-04 10:28:22.962','127.0.0.1','内网地址',2,'登录成功',1),(26,'2023-03-04 10:41:39.792','127.0.0.1','内网地址',2,'登录成功',1),(27,'2023-03-04 10:51:57.496','127.0.0.1','内网地址',2,'登录成功',1),(28,'2023-03-04 12:53:43.182','127.0.0.1','内网地址',2,'登录成功',1),(29,'2023-03-04 15:29:05.511','127.0.0.1','内网地址',2,'登录成功',1),(30,'2023-03-04 15:40:12.620','127.0.0.1','内网地址',2,'登录成功',1),(31,'2023-03-04 17:56:52.396','127.0.0.1','内网地址',2,'登录成功',1),(32,'2023-03-04 19:41:23.255','127.0.0.1','内网地址',2,'登录成功',1),(33,'2023-03-04 20:30:25.831','127.0.0.1','内网地址',2,'登录成功',1),(34,'2023-03-04 21:56:53.763','127.0.0.1','内网地址',2,'登录成功',1),(35,'2023-03-05 13:19:28.398','127.0.0.1','内网地址',2,'登录成功',1),(37,'2023-03-05 17:58:01.440','127.0.0.1','内网地址',2,'登录成功',1),(38,'2023-03-06 19:03:53.755','127.0.0.1','内网地址',2,'登录成功',1),(39,'2023-03-07 19:48:17.871','127.0.0.1','内网地址',2,'登录成功',1),(40,'2023-03-08 19:05:50.301','127.0.0.1','内网地址',2,'登录成功',1),(41,'2023-03-09 23:23:03.859','127.0.0.1','内网地址',2,'登录成功',1),(42,'2023-03-10 19:23:57.375','127.0.0.1','内网地址',2,'登录成功',1),(43,'2023-03-10 22:24:47.960','127.0.0.1','内网地址',2,'登录成功',1),(44,'2023-03-10 22:44:08.479','127.0.0.1','内网地址',2,'登录成功',1),(45,'2023-03-10 22:47:51.168','127.0.0.1','内网地址',2,'登录成功',1),(46,'2023-03-10 22:49:42.214','127.0.0.1','内网地址',2,'登录成功',1),(47,'2023-03-10 22:52:32.239','127.0.0.1','内网地址',2,'登录成功',1),(48,'2023-03-11 00:43:03.186','127.0.0.1','内网地址',2,'登录成功',2),(49,'2023-03-11 11:04:44.301','127.0.0.1','内网地址',2,'登录成功',1),(50,'2023-03-11 18:24:24.180','127.0.0.1','内网地址',3,'fengfeng 用户名不存在',2),(51,'2023-03-11 18:24:29.156','127.0.0.1','内网地址',2,'登录成功',1),(52,'2023-03-11 18:27:30.884','127.0.0.1','内网地址',2,'登录成功',1),(53,'2023-03-11 23:16:51.976','127.0.0.1','内网地址',2,'登录成功',1),(54,'2023-03-12 11:24:09.270','127.0.0.1','内网地址',2,'登录成功',1),(55,'2023-03-14 19:44:00.825','127.0.0.1','内网地址',2,'登录成功',1),(56,'2023-03-15 20:09:30.946','127.0.0.1','内网地址',2,'登录成功',1),(57,'2023-03-15 20:23:26.685','127.0.0.1','内网地址',2,'登录成功',1),(58,'2023-03-16 19:50:03.566','127.0.0.1','内网地址',2,'登录成功',1),(59,'2023-03-17 19:56:00.265','127.0.0.1','内网地址',2,'登录成功',1),(60,'2023-03-18 00:56:23.714','127.0.0.1','内网地址',2,'登录成功',1),(61,'2023-03-18 12:06:04.181','127.0.0.1','内网地址',2,'登录成功',1),(62,'2023-03-18 12:06:18.387','127.0.0.1','内网地址',2,'登录成功',1),(63,'2023-03-18 13:03:50.426','127.0.0.1','内网地址',2,'登录成功',1),(64,'2023-03-18 13:09:14.080','127.0.0.1','内网地址',2,'登录成功',1),(65,'2023-03-18 13:16:10.361','127.0.0.1','内网地址',2,'登录成功',1),(66,'2023-03-18 19:11:40.196','127.0.0.1','内网地址',2,'登录成功',1),(67,'2023-03-18 19:18:13.903','127.0.0.1','内网地址',2,'登录成功',14),(68,'2023-03-18 19:26:29.984','127.0.0.1','内网地址',2,'登录成功',15);
/*!40000 ALTER TABLE `log_stash_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_data_models`
--

DROP TABLE IF EXISTS `login_data_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_data_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nick_name` varchar(42) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_login_data_models_user_model` (`user_id`),
  CONSTRAINT `fk_login_data_models_user_model` FOREIGN KEY (`user_id`) REFERENCES `user_models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_data_models`
--

LOCK TABLES `login_data_models` WRITE;
/*!40000 ALTER TABLE `login_data_models` DISABLE KEYS */;
INSERT INTO `login_data_models` VALUES (1,'2023-02-26 15:40:05.519','2023-02-26 15:40:05.519',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImV4cCI6MTY3NzQwNDQwNS41MTY3NTE4LCJpc3MiOiIxMjM0In0.DAUZVjkh9S1PlGUhX8c-LfVicpD_26yPWRSoZgm9Jms','','内网',3),(2,'2023-02-26 15:40:22.610','2023-02-26 15:40:22.610',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImV4cCI6MTY3NzQwNDQyMi42MDc5MTgsImlzcyI6IjEyMzQifQ.Ov6cfijzbmAav8jqWnjJfHTpAIDpXV2aFRqrTWn8ZIU','','内网',3),(3,'2023-03-03 22:36:24.381','2023-03-03 22:36:24.381',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImV4cCI6MTY3Nzg2MTM4NC4zNjkwMjgsImlzcyI6IjEyMzQifQ.9eQ63MY94kKfMdT7_mybzSX4QuGje3FKdkYOvELpUkc','','内网地址',3),(4,'2023-03-04 00:10:01.408','2023-03-04 00:10:01.408',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImV4cCI6MTY3Nzg2NzAwMS40MDUwMzEsImlzcyI6IjEyMzQifQ.EcfIsEdDMrdQMem_osB___uIC5Q9FESj4Cr91laBjG4','','内网地址',3),(5,'2023-03-04 00:19:06.887','2023-03-04 00:19:06.887',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImV4cCI6MTY3Nzg2NzU0Ni44ODUyNzU4LCJpc3MiOiIxMjM0In0.Tl2MNHty3KfVbH_z5l5p8JVSJfLcz-MvvpOylRv76WU','','内网地址',3),(6,'2023-03-04 00:19:10.151','2023-03-04 00:19:10.151',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImV4cCI6MTY3Nzg2NzU1MC4xNDc5ODksImlzcyI6IjEyMzQifQ.3AmaBAK9nBpTDcPEQ19R7wG04p2gsc0llx_iVBE51cM','','内网地址',3),(7,'2023-03-04 09:55:18.625','2023-03-04 09:55:18.625',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImV4cCI6MTY3NzkwMjExOC42MjEzNiwiaXNzIjoiMTIzNCJ9.NxOazVAJv3P4SK3GggiIfWDZL3vf2D20IAQmRgcQhbk','','内网地址',3),(8,'2023-03-04 09:58:59.499','2023-03-04 09:58:59.499',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwMjMzOS40OTQ3MjUyLCJpc3MiOiIxMjM0In0.zshwnAD60xFDiS6hZXNrsKhtOsxaFJEaiJQOcoRPbps','','内网地址',3),(9,'2023-03-04 10:03:59.681','2023-03-04 10:03:59.681',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwMjYzOS42Nzg2NTA5LCJpc3MiOiIxMjM0In0.PXkQjBWxS1FpDfGm1QZZQRnOgxNdvReaWU_XfY9WjRk','','内网地址',3),(10,'2023-03-04 10:04:48.854','2023-03-04 10:04:48.854',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwMjY4OC44NTExMzUsImlzcyI6IjEyMzQifQ.2X7vcIzaNWbfCVh8z-NvqNoZiAlfYNGOFVPGVEC_THo','','内网地址',3),(11,'2023-03-04 10:05:49.993','2023-03-04 10:05:49.993',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwMjc0OS45OTE3MDY4LCJpc3MiOiIxMjM0In0.RqYSftFIArTWz_grTTeVqYNSx_qhI6VNABRZ8iv9sok','','内网地址',3),(12,'2023-03-04 10:06:33.095','2023-03-04 10:06:33.095',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwMjc5My4wOTMyLCJpc3MiOiIxMjM0In0.iI5bbzbrfsvK-Yq4dagytfWmJLieRLk0ZfOZXEqw4MA','','内网地址',3),(13,'2023-03-04 10:09:37.845','2023-03-04 10:09:37.845',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwMjk3Ny44NDMxOCwiaXNzIjoiMTIzNCJ9.hXc_NwgYkqzot5Zbx7JSge34tHYMzlNNaolhgGsaB5M','','内网地址',3),(14,'2023-03-04 10:14:02.616','2023-03-04 10:14:02.616',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwMzI0Mi42MTM2Mzg5LCJpc3MiOiIxMjM0In0.LFHZcN12tT9Xvlw7eCEzln4ty-SSLReNp8dmNwOp_Lk','','内网地址',3),(15,'2023-03-04 10:15:03.075','2023-03-04 10:15:03.075',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwMzMwMy4wNzMwMzEsImlzcyI6IjEyMzQifQ.8Y6vZVXUgLyGHeC5SqneH9NM4-Xnuz9p-bQtV30palc','','内网地址',3),(16,'2023-03-04 10:28:22.964','2023-03-04 10:28:22.964',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwNDEwMi45NjIxODQsImlzcyI6IjEyMzQifQ.2pLhmhm-UXQozT5Cidf7Taq5smEygfZdox5XKrBp4i0','','内网地址',3),(17,'2023-03-04 10:41:39.794','2023-03-04 10:41:39.794',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwNDg5OS43OTE2NjQxLCJpc3MiOiIxMjM0In0.N0V4O3IoG_g1IL4ZKY-eK9DxwXvMHT-aOaQxJJv6wOo','','内网地址',3),(18,'2023-03-04 10:51:57.497','2023-03-04 10:51:57.497',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkwNTUxNy40OTQ4MTQ5LCJpc3MiOiIxMjM0In0.0Loid0wtqzIKZHoWRaHyZQ97A2ilNhys9cMEMW3OU-s','','内网地址',3),(19,'2023-03-04 12:53:43.185','2023-03-04 12:53:43.185',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkxMjgyMy4xODIzMiwiaXNzIjoiMTIzNCJ9.1pJSC1Vb_J97uGmEFiu0YkY8rPBWdg0JmYOmVEoR1lU','','内网地址',3),(20,'2023-03-04 15:29:05.517','2023-03-04 15:29:05.517',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkyMjE0NS41MTAxMDksImlzcyI6IjEyMzQifQ.a-MI7PuUK0EsJTLe9kdYFb520tWPodZdB4nbflTTLrc','','内网地址',3),(21,'2023-03-04 15:40:12.652','2023-03-04 15:40:12.652',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkyMjgxMi42MTg5MzgyLCJpc3MiOiIxMjM0In0.3z_qFll7a1n9WlYRD4I1EA0nNgcodBAFrWtQSx-INSY','','内网地址',3),(22,'2023-03-04 17:56:52.401','2023-03-04 17:56:52.401',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3NzkzMTAxMi4zOTYwMDgsImlzcyI6IjEyMzQifQ.A5tL7GR4JbX3HRkV_5XDFJti8zFftFnujQO6PHEpNJg','','内网地址',3),(23,'2023-03-04 19:41:23.258','2023-03-04 19:41:23.258',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODAwMjA4My4yNTQ5NjUsImlzcyI6IjEyMzQifQ.4EGObgT8sT4bJjaIrUwE1S5CV-2nRgetqR7V_EqVh4U','','内网地址',3),(24,'2023-03-04 20:30:25.834','2023-03-04 20:30:25.834',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODAwNTAyNS44MzA1NTIsImlzcyI6IjEyMzQifQ.QqyfDx0YEkvXWhGUInx0A1yPxTo16afirWaDA4j3SvE','','内网地址',3),(25,'2023-03-04 21:56:53.767','2023-03-04 21:56:53.767',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODAxMDIxMy43NjE5MzYsImlzcyI6IjEyMzQifQ.mrSpQIGi3Uucmim1xdw8xxJo0rLWysQZZQz9yXWoGg8','','内网地址',3),(26,'2023-03-05 13:19:28.403','2023-03-05 13:19:28.403',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODA2NTU2OC4zOTc3MzEsImlzcyI6IjEyMzQifQ.xBp86Hn_GMMlVrNiXQgcMtZU2ymDBEGi193NUVXUaRs','','内网地址',3),(27,'2023-03-05 16:31:42.179','2023-03-05 16:31:42.179',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODA3NzEwMi4xNzM4MjUsImlzcyI6IjEyMzQifQ.vlfMtVGbCiKUjkj-UHTu8swidJyRFgwPTuBSU2HkG7w','','内网地址',3),(28,'2023-03-05 17:58:01.444','2023-03-05 17:58:01.444',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODA4MjI4MS40Mzk2MjUsImlzcyI6IjEyMzQifQ.0SGyVeK3hEeDVWz6tTcmCesC1IjFjwm7HZw1Lqnpi4k','','内网地址',3),(29,'2023-03-06 19:03:53.762','2023-03-06 19:03:53.762',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODE3MjYzMy43NTQ3ODcsImlzcyI6IjEyMzQifQ.IRzLji4hBHmzLIt1nvM0xRbqYJ1FQPHCC8HEcZchWg8','','内网地址',3),(30,'2023-03-07 19:48:17.874','2023-03-07 19:48:17.874',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODI2MTY5Ny44NzEwMywiaXNzIjoiMTIzNCJ9.RmBXkPNBM6DyhRRoT4VQjlw3KV52wHIo22ACHSS_YN4','','内网地址',3),(31,'2023-03-08 19:05:50.304','2023-03-08 19:05:50.304',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODM0NTU1MC4zMDAzNDksImlzcyI6IjEyMzQifQ.nNooPgThQ52L3DttNocE8C4ctS1rFyoWX4vjvqCCXFk','','内网地址',3),(32,'2023-03-09 23:23:03.866','2023-03-09 23:23:03.866',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODQ0NzM4My44NTgzMzIsImlzcyI6IjEyMzQifQ.ZM8rh5oO1W7AVar4bHHpAHewvXtl9Cp3DcyGmzypvvI','','内网地址',3),(33,'2023-03-10 19:23:57.378','2023-03-10 19:23:57.378',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODUxOTQzNy4zNzUwMzYsImlzcyI6IjEyMzQifQ.K8UvDCdy_QwxDG3aRYFC53wF3umJwPrFaBNGUPFDTPg','','内网地址',3),(34,'2023-03-10 22:24:47.963','2023-03-10 22:24:47.963',1,'127.0.0.1','admin1','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbjEiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJhdmF0YXIiOiIvdXBsb2Fkcy9hdmF0YXIvZGVmYXVsdC5wbmciLCJleHAiOjE2Nzg1MzAyODcuOTU5NzIzLCJpc3MiOiIxMjM0In0.sbZ0ChrBrn1RoLJYr6BAJv6YAgQCVU9JBG6rJP8kSZE','','内网地址',3),(35,'2023-03-10 22:44:08.483','2023-03-10 22:44:08.483',1,'127.0.0.1','admin1','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbjEiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJhdmF0YXIiOiIvdXBsb2Fkcy9hdmF0YXIvZGVmYXVsdC5wbmciLCJleHAiOjE2Nzg1MzE0NDguNDc5MDE0LCJpc3MiOiIxMjM0In0.G4t3HFrxoxNU9UE_5huhhVBrLRt5iwWpvJyyn8VWjx4','','内网地址',3),(36,'2023-03-10 22:47:51.172','2023-03-10 22:47:51.172',1,'127.0.0.1','admin1','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbjEiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJhdmF0YXIiOiIvdXBsb2Fkcy9hdmF0YXIvZGVmYXVsdC5wbmciLCJleHAiOjE2Nzg1MzE2NzEuMTY3OTk5LCJpc3MiOiIxMjM0In0.ea3ouLGIFgpY-uJRM3Q5Ng05l7bvQy_N6ShbOjq4iIE','','内网地址',3),(37,'2023-03-10 22:49:42.217','2023-03-10 22:49:42.217',1,'127.0.0.1','admin1','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbjEiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJhdmF0YXIiOiIvdXBsb2Fkcy9hdmF0YXIvZGVmYXVsdC5wbmciLCJleHAiOjE2Nzg1MzE3ODIuMjE0Mjc4LCJpc3MiOiIxMjM0In0.hOKkwacraz9GQLTHUTzrkvUHaukclBHOgHnTr9VML4w','','内网地址',3),(38,'2023-03-10 22:52:32.243','2023-03-10 22:52:32.243',1,'127.0.0.1','admin1','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbjEiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJhdmF0YXIiOiIvdXBsb2Fkcy9hdmF0YXIvZGVmYXVsdC5wbmciLCJleHAiOjE2Nzg1MzE5NTIuMjM5MTk0MiwiaXNzIjoiMTIzNCJ9.y7KkE855HJCJhsyCEawtfdCRrXwy6YgXi8lqNzKJIM8','','内网地址',3),(39,'2023-03-11 00:43:03.192','2023-03-11 00:43:03.192',2,'127.0.0.1','zhangsan','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJ6aGFuZ3NhbiIsInJvbGUiOjEsInVzZXJfaWQiOjIsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODUzODU4My4xODYyNywiaXNzIjoiMTIzNCJ9.MSOfae6hbF8jHYcRWSqQ_7iKzxEOUW86-W-OEmtIeAs','','内网地址',3),(40,'2023-03-11 11:04:44.307','2023-03-11 11:04:44.307',1,'127.0.0.1','admin1','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbjEiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJhdmF0YXIiOiIvdXBsb2Fkcy9hdmF0YXIvZGVmYXVsdC5wbmciLCJleHAiOjE2Nzg1NzU4ODQuMzAwMzg2LCJpc3MiOiIxMjM0In0.z1PGRx5kK5X5l4zZXHbGXBrgLBOkA-MbB00gq04U5bE','','内网地址',3),(41,'2023-03-11 18:24:29.160','2023-03-11 18:24:29.160',1,'127.0.0.1','admin1','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbjEiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJhdmF0YXIiOiIvdXBsb2Fkcy9hdmF0YXIvZGVmYXVsdC5wbmciLCJleHAiOjE2Nzg2MDIyNjkuMTU1NDYxLCJpc3MiOiIxMjM0In0.8-q9g_iOaJHC5LZtIZAfOIe1JiQ8hwl85-w0wNyKdtU','','内网地址',3),(42,'2023-03-11 18:27:30.887','2023-03-11 18:27:30.887',1,'127.0.0.1','admin1','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbjEiLCJyb2xlIjoxLCJ1c2VyX2lkIjoxLCJhdmF0YXIiOiIvdXBsb2Fkcy9hdmF0YXIvZGVmYXVsdC5wbmciLCJleHAiOjE2Nzg2MDI0NTAuODgyOTc5MiwiaXNzIjoiMTIzNCJ9.5CCOUG_0FeDUMVjI5roqeHUwmhXGs06E0MU2mE-Ba_w','','内网地址',3),(43,'2023-03-11 23:16:51.980','2023-03-11 23:16:51.980',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODYxOTgxMS45NzYzNjYsImlzcyI6IjEyMzQifQ.9wcFZ3I9WGPBnhwWU8cg5DuI_iZGWVEkT07vytt_s90','','内网地址',3),(44,'2023-03-12 11:24:09.273','2023-03-12 11:24:09.273',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODY2MzQ0OS4yNjk4OCwiaXNzIjoiMTIzNCJ9.7e7d_DR5g463aqHpUfdUM6nhE67nyPFoshNAjU5mGv4','','内网地址',3),(45,'2023-03-14 19:44:00.827','2023-03-14 19:44:00.827',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODg2NjI0MC44MjUzNzYsImlzcyI6IjEyMzQifQ.JFjqYNQu8s1Bdd38-HEHUzCTix-bX19mLLDWgGMCvg0','','内网地址',3),(46,'2023-03-15 20:09:30.952','2023-03-15 20:09:30.952',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODk1NDE3MC45NDUyMywiaXNzIjoiMTIzNCJ9.azoFoxVCCiveScscK2d6YGrX1jV2gz7yrVN1SvPVtm8','','内网地址',3),(47,'2023-03-15 20:23:26.689','2023-03-15 20:23:26.689',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3ODk1NTAwNi42ODQ4OTYsImlzcyI6IjEyMzQifQ.w_CkhXo01AldXSOtn8GBB-P70HRPNGcU3qXhEhh2KzU','','内网地址',3),(48,'2023-03-16 19:50:03.571','2023-03-16 19:50:03.571',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3OTAzOTQwMy41NjUwNDgsImlzcyI6IjEyMzQifQ.74DYE62wr2YD_bcf6VnTujQn1CfpSaYC2PdmgzJt7oM','','内网地址',3),(49,'2023-03-17 19:56:00.277','2023-03-17 19:56:00.277',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3OTEyNjE2MC4yNjQ0NTcsImlzcyI6IjEyMzQifQ.EaGN6I0wpe-xR-ZENYGnGPelcFJV1qRlg1mTIs8SsjI','','内网地址',3),(50,'2023-03-18 00:56:23.717','2023-03-18 00:56:23.717',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3OTE0NDE4My43MTMxNjMsImlzcyI6IjEyMzQifQ.xSIOSlf2cmv6F7r3Y7xL-1mSmz9cErafEagJLv3EW5o','','内网地址',3),(51,'2023-03-18 12:06:04.184','2023-03-18 12:06:04.184',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3OTE4NDM2NC4xODA2Nzg4LCJpc3MiOiIxMjM0In0.qceO2VM0CNtm1KTZKgP47VSnX0ICFMrRYSKfE7IJwls','','内网地址',3),(52,'2023-03-18 12:06:18.389','2023-03-18 12:06:18.389',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3OTE4NDM3OC4zODY2NTQsImlzcyI6IjEyMzQifQ.0rfEUsgJs2n-eDAMLEdf9M7chmtOXTG9olQC1X_HGCM','','内网地址',3),(53,'2023-03-18 13:03:50.429','2023-03-18 13:03:50.429',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3OTE4NzgzMC40MjU2NzQsImlzcyI6IjEyMzQifQ.ASH5lPcCiPTtVRgkP9AX47pPmYG3qADTSSECp_5dqEg','','内网地址',3),(54,'2023-03-18 13:09:14.082','2023-03-18 13:09:14.082',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3OTE4ODE1NC4wNzk5MDQsImlzcyI6IjEyMzQifQ.RgW5mJf8SK6fMo-Lg8VHfL2TfyyJBXpiePH7eg46zE8','','内网地址',3),(55,'2023-03-18 13:16:10.363','2023-03-18 13:16:10.363',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3OTE4ODU3MC4zNjEwNzksImlzcyI6IjEyMzQifQ.oIdPvx-fqP0C6lOmEysCvLjOrciKpmqAnmEg1CUd698','','内网地址',3),(56,'2023-03-18 19:11:40.200','2023-03-18 19:11:40.200',1,'127.0.0.1','admin','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiJhZG1pbiIsInJvbGUiOjEsInVzZXJfaWQiOjEsImF2YXRhciI6Ii91cGxvYWRzL2F2YXRhci9kZWZhdWx0LnBuZyIsImV4cCI6MTY3OTIwOTkwMC4xOTUyNDg4LCJpc3MiOiIxMjM0In0.LbzWDeYdPb0Tl9g7XLuBOO5gk3Ac6iCroYaBoiGJpnM','','内网地址',3),(57,'2023-03-18 19:18:13.905','2023-03-18 19:18:13.905',14,'127.0.0.1','普通用户123','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiLmma7pgJrnlKjmiLcxMjMiLCJyb2xlIjoyLCJ1c2VyX2lkIjoxNCwiYXZhdGFyIjoiL3VwbG9hZHMvYXZhdGFyL2RlZmF1bHQucG5nIiwiZXhwIjoxNjc5MjEwMjkzLjkwMjE1MDksImlzcyI6IjEyMzQifQ.XJv_S8UZSZSvE35varom8trpfkCXm0Uqs3G8llIm0_o','','内网地址',3),(58,'2023-03-18 19:26:29.986','2023-03-18 19:26:29.986',15,'127.0.0.1','游客','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaWNrX25hbWUiOiLmuLjlrqIiLCJyb2xlIjozLCJ1c2VyX2lkIjoxNSwiYXZhdGFyIjoiL3VwbG9hZHMvYXZhdGFyL2RlZmF1bHQucG5nIiwiZXhwIjoxNjc5MjEwNzg5Ljk4MzY5ODgsImlzcyI6IjEyMzQifQ.KNtM8Do8tDaz956X23uEpR0Z-yOYGtckl6fXAWAOHLc','','内网地址',3);
/*!40000 ALTER TABLE `login_data_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_banner_models`
--

DROP TABLE IF EXISTS `menu_banner_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_banner_models` (
  `menu_id` bigint(20) unsigned DEFAULT NULL,
  `banner_id` bigint(20) unsigned DEFAULT NULL,
  `sort` smallint(6) DEFAULT NULL,
  KEY `fk_menu_banner_models_menu_model` (`menu_id`),
  KEY `fk_menu_banner_models_banner_model` (`banner_id`),
  CONSTRAINT `fk_menu_banner_models_banner_model` FOREIGN KEY (`banner_id`) REFERENCES `banner_models` (`id`),
  CONSTRAINT `fk_menu_banner_models_menu_model` FOREIGN KEY (`menu_id`) REFERENCES `menu_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_banner_models`
--

LOCK TABLES `menu_banner_models` WRITE;
/*!40000 ALTER TABLE `menu_banner_models` DISABLE KEYS */;
INSERT INTO `menu_banner_models` VALUES (2,10,0),(2,13,1),(2,16,2),(1,5,0),(1,7,1),(1,10,2),(1,11,3);
/*!40000 ALTER TABLE `menu_banner_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_models`
--

DROP TABLE IF EXISTS `menu_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slogan` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abstract` longtext COLLATE utf8mb4_unicode_ci,
  `abstract_time` bigint(20) DEFAULT NULL,
  `banner_time` bigint(20) DEFAULT NULL,
  `sort` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_models`
--

LOCK TABLES `menu_models` WRITE;
/*!40000 ALTER TABLE `menu_models` DISABLE KEYS */;
INSERT INTO `menu_models` VALUES (1,'2023-03-05 16:33:13.472','2023-03-05 17:58:40.702','首页','/','首页','枫枫知道七代博客\n主打轻量化',7,7,4),(2,'2023-03-05 17:44:54.251','2023-03-05 17:44:54.251','新闻','/news','新闻','关注国家大事\n新闻',7,7,2);
/*!40000 ALTER TABLE `menu_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_models`
--

DROP TABLE IF EXISTS `message_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `send_user_id` bigint(20) unsigned NOT NULL,
  `send_user_nick_name` varchar(42) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_user_avatar` longtext COLLATE utf8mb4_unicode_ci,
  `rev_user_id` bigint(20) unsigned NOT NULL,
  `rev_user_nick_name` varchar(42) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rev_user_avatar` longtext COLLATE utf8mb4_unicode_ci,
  `is_read` tinyint(1) DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`send_user_id`,`rev_user_id`),
  KEY `fk_message_models_send_user_model` (`send_user_id`),
  KEY `fk_message_models_rev_user_model` (`rev_user_id`),
  CONSTRAINT `fk_message_models_rev_user_model` FOREIGN KEY (`rev_user_id`) REFERENCES `user_models` (`id`),
  CONSTRAINT `fk_message_models_send_user_model` FOREIGN KEY (`send_user_id`) REFERENCES `user_models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_models`
--

LOCK TABLES `message_models` WRITE;
/*!40000 ALTER TABLE `message_models` DISABLE KEYS */;
INSERT INTO `message_models` VALUES (1,'2023-03-06 00:11:22.786','2023-03-06 00:11:22.786',2,'zhangsan','/uploads/avatar/default.png',1,'admin','/uploads/avatar/default.png',0,'你好'),(2,'2023-03-11 09:03:59.871','2023-03-11 09:03:59.871',1,'admin1','/uploads/avatar/default.png',2,'zhangsan','/uploads/avatar/default.png',0,'吃饭了么'),(3,'2023-03-11 09:04:27.002','2023-03-11 09:04:27.002',3,'王五123','/uploads/avatar/default.png',2,'zhangsan','/uploads/avatar/default.png',0,'吃饭了么'),(4,'2023-03-11 09:12:50.655','2023-03-11 09:12:50.655',2,'zhangsan','/uploads/avatar/default.png',3,'王五123','/uploads/avatar/default.png',0,'i am fine'),(5,'2023-03-11 11:04:10.528','2023-03-11 11:04:10.528',2,'zhangsan','/uploads/avatar/default.png',1,'admin1','/uploads/avatar/default.png',0,'我吃啦'),(6,'2023-03-11 11:05:02.439','2023-03-11 11:05:02.439',1,'admin1','/uploads/avatar/default.png',2,'zhangsan','/uploads/avatar/default.png',0,'好的吧'),(7,'2023-03-11 11:05:41.019','2023-03-11 11:05:41.019',2,'zhangsan','/uploads/avatar/default.png',1,'admin1','/uploads/avatar/default.png',0,'吃饭了么'),(8,'2023-03-11 11:05:45.379','2023-03-11 11:05:45.379',2,'zhangsan','/uploads/avatar/default.png',1,'admin1','/uploads/avatar/default.png',0,'我吃了'),(9,'2023-03-11 11:05:52.097','2023-03-11 11:05:52.097',2,'zhangsan','/uploads/avatar/default.png',1,'admin1','/uploads/avatar/default.png',0,'挺好的呀'),(10,'2023-03-11 11:06:01.259','2023-03-11 11:06:01.259',1,'admin1','/uploads/avatar/default.png',2,'zhangsan','/uploads/avatar/default.png',0,'哈哈哈'),(11,'2023-03-11 11:06:05.330','2023-03-11 11:06:05.330',1,'admin1','/uploads/avatar/default.png',2,'zhangsan','/uploads/avatar/default.png',0,'是吗');
/*!40000 ALTER TABLE `message_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_models`
--

DROP TABLE IF EXISTS `tag_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `title` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_models`
--

LOCK TABLES `tag_models` WRITE;
/*!40000 ALTER TABLE `tag_models` DISABLE KEYS */;
INSERT INTO `tag_models` VALUES (1,'2023-02-22 23:17:53.000','2022-02-22 23:18:03.000','python'),(2,'2023-02-22 23:17:54.000','2023-02-22 23:18:02.000','后端'),(3,'2023-02-22 21:17:55.000','2023-02-22 23:18:07.000','node'),(4,'2023-02-22 23:50:06.000','2023-02-22 23:50:05.000','教程'),(5,'2023-03-06 00:18:03.847','2023-03-06 00:18:03.847','golang');
/*!40000 ALTER TABLE `tag_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_collect_models`
--

DROP TABLE IF EXISTS `user_collect_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_collect_models` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_collect_models_user_model` FOREIGN KEY (`user_id`) REFERENCES `user_models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collect_models`
--

LOCK TABLES `user_collect_models` WRITE;
/*!40000 ALTER TABLE `user_collect_models` DISABLE KEYS */;
INSERT INTO `user_collect_models` VALUES (1,'2iBpzIYBenTVo4BRkquV','2023-03-11 23:19:05.292');
/*!40000 ALTER TABLE `user_collect_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_models`
--

DROP TABLE IF EXISTS `user_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_models` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `nick_name` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` tinyint(4) DEFAULT '1',
  `sign_status` bigint(20) DEFAULT NULL,
  `integral` bigint(20) DEFAULT '0',
  `sign` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_models`
--

LOCK TABLES `user_models` WRITE;
/*!40000 ALTER TABLE `user_models` DISABLE KEYS */;
INSERT INTO `user_models` VALUES (1,'2023-02-19 17:23:04.543','2023-03-11 18:40:59.214','admin','admin','$2a$04$xEeRgDCAcS7MGPXp3zS63.g1eUgVPr0uXcxV4PyZAM5D/2Ysq.wjG','/uploads/avatar/default.png','2663456523@qq.com','','内网地址','','127.0.0.1',1,3,0,'这是我的花火','http://www.fengfengzhidao.com'),(2,'2023-02-26 18:16:38.074','2023-03-11 00:42:54.833','zhangsan','zhangsan','$2a$04$3FTYsOTq36y4OzVyLRbKEO1s6i.L9R11SURxxcR/xGH/0YYfK3Umu','/uploads/avatar/default.png','zhangsan@qq.com','','内网地址','','127.0.0.1',1,3,0,NULL,NULL),(3,'2023-03-04 13:05:19.054','2023-03-04 14:22:56.279','王五123','wangwu','$2a$04$Rt.biYISStgkuHtn42EKyOJRumUOQwLEnqontib6ugZ9KyfHpKu3W','/uploads/avatar/default.png','','','内网地址','','127.0.0.1',3,3,0,NULL,NULL),(11,'2023-03-04 13:39:58.756','2023-03-04 14:23:15.294','李四123','lisi','$2a$04$.F4EYkh8gv70HpjWhpUrr.NTnmA170uxDdU6DVnooBbvuCiVEJyVK','/uploads/avatar/default.png','','','内网地址','','127.0.0.1',2,3,0,NULL,NULL),(12,'2023-03-04 15:36:07.936','2023-03-04 15:36:07.936','spinning','娃儿妈祖','$2a$04$lcF7nfZgr7SAF6HWJGSaFOLqy1zWEeE9.grO2gaw91/0lV4Jwxsdi','/uploads/avatar/default.png','','','内网地址','','127.0.0.1',2,3,0,NULL,NULL),(13,'2023-03-11 20:40:13.543','2023-03-11 20:40:13.543','枫枫','E98D5D2EED06C2313CDD331E8BFA2421','$2a$04$trDUxDSZuHVjj7bhZ5E3FuDxXDeHxtqnIivAYlz10H1mn4EXSC7SW','http://thirdqq.qlogo.cn/g?b=oidb&k=qXHABHcx9ibtrXCTTBk4CcA&kti=ZAx2rgAAAAA&s=640&t=1646751231','','','内网地址','E98D5D2EED06C2313CDD331E8BFA2421','127.0.0.1',2,1,0,'',''),(14,'2023-03-18 19:17:52.529','2023-03-18 19:17:52.529','普通用户123','ptyh123','$2a$04$yhnsuBMJQWipkgFq0chXGOjxLZduUlektf5HEG.3kaJ2tpa0KdGfe','/uploads/avatar/default.png','','','内网地址','','127.0.0.1',2,3,0,'',''),(15,'2023-03-18 19:26:16.471','2023-03-18 19:26:16.471','游客','yk','$2a$04$FyLtJo1xA/7DjRIwARpycuXbjs4DNqxbNii/NdmOzIFGcc0L9ltKe','/uploads/avatar/default.png','','','内网地址','','127.0.0.1',3,3,0,'',''),(16,'2023-03-18 19:32:05.640','2023-03-18 19:32:05.640','测试','cs123','$2a$04$dXLJohjDEzT7Q/YAJOE2XeMklvxFEs24l1qGjizmZ2Xiz7MTDxRS6','/uploads/avatar/default.png','','','内网地址','','127.0.0.1',2,3,0,'','');
/*!40000 ALTER TABLE `user_models` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-19 10:08:57
