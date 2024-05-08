-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hertz_music_store
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `song_id` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`song_id`,`userid`),
  KEY `cart_fk2_idx` (`userid`),
  CONSTRAINT `cart_fk1` FOREIGN KEY (`song_id`) REFERENCES `library` (`song_id`),
  CONSTRAINT `cart_fk2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1),(2,1),(5,1),(1,2),(4,2),(3,4);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `song_id` int NOT NULL AUTO_INCREMENT,
  `song_name` varchar(45) DEFAULT NULL,
  `artist_name` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,'Ayachana','Sajeewa Dissanayake',2),(2,'Detha dara','Nadagama',4),(3,'Hithawanthi','Dhyan hewage',2),(4,'Salli',' NEWS',2),(5,'Nuba ha','Dilu',3),(6,'Alone','Alan Walker & Ava Max',5),(7,'Dandelions','Ruth b',5),(8,'Bones','Imagine dragons',6),(9,'Night changes','One direction',5),(10,'stay','justin bieber',5);
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(100) DEFAULT NULL,
  `playlist_description` varchar(450) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `pl_fk_idx` (`userid`),
  CONSTRAINT `pl_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (3,'pop','all english pop songs',1),(5,'sinhala','sinhala songs',1),(6,'all songs','all ',1),(7,'my songs','english songs',2),(8,'sinhala songs','all sinhala',3),(9,'my playlist','all songs',4),(17,'my playlist','favourites',1);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_songs`
--

DROP TABLE IF EXISTS `playlist_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_songs` (
  `playlist_id` int NOT NULL,
  `song_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`,`song_id`),
  KEY `ps_fk2_idx` (`song_id`),
  CONSTRAINT `ps_fk1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`),
  CONSTRAINT `ps_fk2` FOREIGN KEY (`song_id`) REFERENCES `library` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_songs`
--

LOCK TABLES `playlist_songs` WRITE;
/*!40000 ALTER TABLE `playlist_songs` DISABLE KEYS */;
INSERT INTO `playlist_songs` VALUES (3,2),(5,2),(17,2),(3,5),(5,5),(6,5),(5,7),(6,7),(5,8),(6,8);
/*!40000 ALTER TABLE `playlist_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `purchase_alldetails`
--

DROP TABLE IF EXISTS `purchase_alldetails`;
/*!50001 DROP VIEW IF EXISTS `purchase_alldetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `purchase_alldetails` AS SELECT 
 1 AS `userid`,
 1 AS `song_id`,
 1 AS `song_name`,
 1 AS `artist_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `purchased_library`
--

DROP TABLE IF EXISTS `purchased_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchased_library` (
  `userid` int NOT NULL,
  `song_id` int NOT NULL,
  PRIMARY KEY (`userid`,`song_id`),
  KEY `pur_fk2_idx` (`song_id`),
  CONSTRAINT `pur_fk1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `pur_fk2` FOREIGN KEY (`song_id`) REFERENCES `library` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased_library`
--

LOCK TABLES `purchased_library` WRITE;
/*!40000 ALTER TABLE `purchased_library` DISABLE KEYS */;
INSERT INTO `purchased_library` VALUES (1,2),(2,3),(5,4),(1,5),(2,5),(1,7),(1,8);
/*!40000 ALTER TABLE `purchased_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `show_playlist_songs`
--

DROP TABLE IF EXISTS `show_playlist_songs`;
/*!50001 DROP VIEW IF EXISTS `show_playlist_songs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_playlist_songs` AS SELECT 
 1 AS `playlist_name`,
 1 AS `playlist_description`,
 1 AS `song_name`,
 1 AS `artist_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'maneth mindiya','maneth@gmail.com','07145845127','maneth123','maneth123'),(2,'gihan banuka','gihan12@gmail.com','07189456237','gihan002','gb2345'),(3,'isuru kulathunga','isuruk21@gmail.com','07714785236','isuru21','cddee22'),(4,'nethmini hiranya','nethminihiranya@gmail.com','07145623894','hiranya45','nethmini45'),(5,'ridmi pabasara','ridmipr02@gmail.com','07189471288','rpridmi147','rrrppp444');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `purchase_alldetails`
--

/*!50001 DROP VIEW IF EXISTS `purchase_alldetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `purchase_alldetails` (`userid`,`song_id`,`song_name`,`artist_name`) AS select `u`.`userid` AS `userid`,`l`.`song_id` AS `song_id`,`l`.`song_name` AS `song_name`,`l`.`artist_name` AS `artist_name` from ((`purchased_library` `pl` join `user` `u`) join `library` `l`) where ((`pl`.`userid` = `u`.`userid`) and (`pl`.`song_id` = `l`.`song_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_playlist_songs`
--

/*!50001 DROP VIEW IF EXISTS `show_playlist_songs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_playlist_songs` (`playlist_name`,`playlist_description`,`song_name`,`artist_name`) AS select `p`.`playlist_name` AS `playlist_name`,`p`.`playlist_description` AS `playlist_description`,`l`.`song_name` AS `song_name`,`l`.`artist_name` AS `artist_name` from ((`playlist_songs` `ps` join `playlist` `p`) join `library` `l`) where ((`ps`.`playlist_id` = `p`.`playlist_id`) and (`ps`.`song_id` = `l`.`song_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 14:35:17
