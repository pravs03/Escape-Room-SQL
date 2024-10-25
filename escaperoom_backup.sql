-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: escape_room
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `esc_room`
--

DROP TABLE IF EXISTS `esc_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esc_room` (
  `Room_ID` int NOT NULL,
  `Room_Name` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Difficulty` varchar(10) NOT NULL,
  `Theme` varchar(50) DEFAULT NULL,
  `Max_Players` int DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  PRIMARY KEY (`Room_ID`),
  CONSTRAINT `esc_room_chk_1` CHECK ((`Difficulty` in (_utf8mb4'Easy',_utf8mb4'Medium',_utf8mb4'Hard',_utf8mb4'Expert')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esc_room`
--

LOCK TABLES `esc_room` WRITE;
/*!40000 ALTER TABLE `esc_room` DISABLE KEYS */;
INSERT INTO `esc_room` VALUES (1,'The Detective Office','Solve a complex case in a private detective’s office.','MEDIUM','Mystery',4,60),(2,'The Bank Heist','Break into the vault and escape with the loot before the police arrive.','HARD','Crime',3,60),(3,'The Prison Break','Stage a daring escape from a high-security prison.','EASY','Action',2,45),(4,'The Secret Laboratory','Escape from a secret laboratory by solving scientific puzzles and avoiding the dangerous experiments within.','EXPERT','Science Fiction',5,60);
/*!40000 ALTER TABLE `esc_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `options_prices`
--

DROP TABLE IF EXISTS `options_prices`;
/*!50001 DROP VIEW IF EXISTS `options_prices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `options_prices` AS SELECT 
 1 AS `Room Name`,
 1 AS `Description`,
 1 AS `Difficulty`,
 1 AS `Theme`,
 1 AS `Max.Players`,
 1 AS `Duration (Mins)`,
 1 AS `Price (£)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `Player_ID` int NOT NULL,
  `First_Name` varchar(25) NOT NULL,
  `Last_Name` varchar(25) NOT NULL,
  `Email_Address` varchar(75) NOT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Player_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Pete','Miller','pete.miller@hotmail.co.uk','+44 7756 165803'),(2,'Samantha','Johnson','samantha.johnson@gmail.com','+44 7745 132467'),(3,'Robert','Smith','robert.smith@yahoo.com','+44 7759 145678'),(4,'Emily','Clark','emily.clark@outlook.com','+44 7762 154890'),(5,'Harrison','Bane','harrison.bane@gmail.com','+44 7784 165932'),(6,'Bartholemew','Hew','bartholemew.hew@gmail.com','+44 7723 145789'),(7,'John','Davis','john.davis@yahoo.com','+44 7732 154678'),(8,'Emily','Wilson','emily.wilson@outlook.com','+44 7745 134569'),(9,'Michael','Anderson','michael.anderson@hotmail.co.uk','+44 7754 126789'),(10,'Olivia','Johnson','olivia.johnson@gmail.com','+44 7761 145783'),(11,'David','Thomas','david.thomas@yahoo.com','+44 7729 157483'),(12,'Sophia','Moore','sophia.moore@outlook.com','+44 7736 149572'),(13,'Lowe','Cox','lowe.cox@hotmail.co.uk','+44 7748 136582'),(14,'Isabella','Thompson','isabella.thompson@gmail.com','+44 7753 145276'),(15,'Anchovy','Belling','anchovy.belling@yahoo.com','+44 7735 145679'),(16,'Liam','Wilson','liam.wilson@gmail.com','+44 7767 123456'),(17,'Ava','Thompson','ava.thompson@yahoo.com','+44 7744 987654'),(18,'Noah','Harris','noah.harris@hotmail.co.uk','+44 7799 246813'),(19,'Mia','Garcia','mia.garcia@gmail.com','+44 7788 135792'),(20,'John','Martinez','john.martinez@outlook.com','+44 7711 456789');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricing` (
  `Room_ID` int NOT NULL,
  `Price_PP` decimal(5,2) NOT NULL,
  PRIMARY KEY (`Room_ID`),
  CONSTRAINT `pricing_ibfk_1` FOREIGN KEY (`Room_ID`) REFERENCES `esc_room` (`Room_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricing`
--

LOCK TABLES `pricing` WRITE;
/*!40000 ALTER TABLE `pricing` DISABLE KEYS */;
INSERT INTO `pricing` VALUES (1,20.00),(2,25.00),(3,15.00),(4,25.00);
/*!40000 ALTER TABLE `pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puzzles`
--

DROP TABLE IF EXISTS `puzzles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puzzles` (
  `Puzzle_ID` int NOT NULL,
  `Room_ID` int DEFAULT NULL,
  `PuzzleName` varchar(50) NOT NULL,
  `Puzzle_Description` varchar(200) DEFAULT NULL,
  `Puzzle_Difficulty` varchar(10) NOT NULL,
  `Puzzle_Answer` varchar(200) NOT NULL,
  PRIMARY KEY (`Puzzle_ID`),
  KEY `Room_ID` (`Room_ID`),
  CONSTRAINT `puzzles_ibfk_1` FOREIGN KEY (`Room_ID`) REFERENCES `esc_room` (`Room_ID`),
  CONSTRAINT `puzzles_chk_1` CHECK ((`Puzzle_Difficulty` in (_utf8mb4'Easy',_utf8mb4'Medium',_utf8mb4'Hard',_utf8mb4'Very Hard')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puzzles`
--

LOCK TABLES `puzzles` WRITE;
/*!40000 ALTER TABLE `puzzles` DISABLE KEYS */;
INSERT INTO `puzzles` VALUES (1,1,'Murder Mystery','Investigate clues to solve the murder case of a prominent businessman.','MEDIUM','WHOISIT'),(2,1,'Hidden Safe','Find the hidden safe behind the painting and crack the combination.','EASY','BLOODART123'),(3,1,'Forgery Challenge','Analyse documents and find the forged signature to expose a fraud.','MEDIUM','SIGNATURE'),(4,1,'Cipher Puzzle','Decode a message encrypted with a substitution cipher to uncover hidden information.','HARD','SUBSTITUTION'),(5,2,'Security Camera Hack','Hack into the security camera system to disable surveillance temporarily.','HARD','CAMERA123'),(6,2,'Vault Puzzle','Solve a series of mechanical puzzles to unlock the vault door.','HARD','MECHANISM'),(7,2,'Alarm System Override','Override the alarm system by entering the correct override code.','HARD','OVERRIDE123'),(8,2,'Money Bag Allocation','Determine the correct allocation of money bags according to given clues.','MEDIUM','ALLOCATE'),(9,3,'Cell Block Puzzle','Find a way to unlock the cell doors by solving a series of interconnected puzzles.','MEDIUM','FREEDOMNOW'),(10,3,'Guard Key Theft','Steal the guard’s key to access restricted areas and find an escape route.','MEDIUM','KEYSTEAL'),(11,3,'Tunnel Digging','Use clues to determine the correct tunnel route and tools to dig an escape tunnel.','EASY','ESCAPETUNNEL'),(12,3,'Inmate Collaboration','Coordinate with other inmates to gather items and overcome prison obstacles.','EASY','TEAMWORK123'),(13,4,'Biohazard Containment','Contain a dangerous virus outbreak by solving puzzles to seal the lab.','VERY HARD','VIRUSCONTAIN'),(14,4,'Chemical Formulation','Mix chemicals to create an antidote to save a researcher from poisoning.','HARD','ANTIDOTE123'),(15,4,'Robotics Calibration','Calibrate a malfunctioning robot to assist in accessing a secured area.','HARD','ROBOTCALIB'),(16,4,'Genetic Sequencing','Sequence DNA samples to unlock access to restricted genetic research data.','VERY HARD','DNASEQUENCE');
/*!40000 ALTER TABLE `puzzles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `room_performance`
--

DROP TABLE IF EXISTS `room_performance`;
/*!50001 DROP VIEW IF EXISTS `room_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `room_performance` AS SELECT 
 1 AS `Room_ID`,
 1 AS `Room Name`,
 1 AS `Total Sessions`,
 1 AS `Successful Escape`,
 1 AS `ACT`,
 1 AS `Escape Rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `session_archive`
--

DROP TABLE IF EXISTS `session_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_archive` (
  `Session_ID` int NOT NULL,
  `ROOM_ID` int DEFAULT NULL,
  `Team_Name` varchar(25) DEFAULT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Result` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Session_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_archive`
--

LOCK TABLES `session_archive` WRITE;
/*!40000 ALTER TABLE `session_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_puzzles`
--

DROP TABLE IF EXISTS `session_puzzles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_puzzles` (
  `SessionPuzzle_ID` int NOT NULL,
  `Session_ID` int DEFAULT NULL,
  `Puzzle_ID` int DEFAULT NULL,
  `Completion_Time` int DEFAULT NULL,
  PRIMARY KEY (`SessionPuzzle_ID`),
  KEY `Session_ID` (`Session_ID`),
  KEY `Puzzle_ID` (`Puzzle_ID`),
  CONSTRAINT `session_puzzles_ibfk_1` FOREIGN KEY (`Session_ID`) REFERENCES `sessions` (`Session_ID`),
  CONSTRAINT `session_puzzles_ibfk_2` FOREIGN KEY (`Puzzle_ID`) REFERENCES `puzzles` (`Puzzle_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_puzzles`
--

LOCK TABLES `session_puzzles` WRITE;
/*!40000 ALTER TABLE `session_puzzles` DISABLE KEYS */;
INSERT INTO `session_puzzles` VALUES (1,1,1,18),(2,1,2,4),(3,1,3,17),(4,1,4,10),(5,2,5,15),(6,2,6,20),(7,2,7,15),(8,2,8,10),(9,3,9,13),(10,3,10,13),(11,3,11,9),(12,3,12,8),(13,4,13,25),(14,4,14,20),(15,4,15,10),(16,4,16,5),(17,5,1,16),(18,5,2,8),(19,5,3,15),(20,5,4,17),(21,6,5,18),(22,6,6,20),(23,6,7,16),(24,6,8,6),(25,7,9,15),(26,7,10,12),(27,7,11,10),(28,7,12,4),(29,8,13,17),(30,8,14,14),(31,8,15,10),(32,8,16,12),(33,9,1,18),(34,9,2,10),(35,9,3,20),(36,9,4,12),(37,10,13,16),(38,10,14,8),(39,10,15,10),(40,10,16,14);
/*!40000 ALTER TABLE `session_puzzles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `Session_ID` int NOT NULL,
  `Room_ID` int DEFAULT NULL,
  `Team_Name` varchar(25) NOT NULL,
  `Start_Time` datetime NOT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Result` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`Session_ID`),
  KEY `Room_ID` (`Room_ID`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`Room_ID`) REFERENCES `esc_room` (`Room_ID`),
  CONSTRAINT `sessions_chk_1` CHECK ((`RESULT` in (_utf8mb4'Success',_utf8mb4'Failed',_utf8mb4'Pending')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'The Sleuth Squad','2024-05-01 10:00:00','2024-05-01 10:49:00','Success'),(2,2,'The Heist Crew','2024-05-01 10:15:00','2024-05-01 11:15:00','Failed'),(3,3,'Jailbreak Junkies','2024-05-01 14:00:00','2024-05-01 14:43:00','Success'),(4,4,'Labyrinth Legends','2024-05-02 09:30:00','2024-05-02 10:30:00','Failed'),(5,1,'Mystery Mavericks','2024-05-02 11:00:00','2024-05-02 11:56:00','Success'),(6,2,'Vault Vixens','2024-05-02 11:30:00','2024-05-02 12:30:00','Failed'),(7,3,'Escape Enthusiasts','2024-05-03 10:00:00','2024-05-03 10:41:00','Success'),(8,4,'Puzzle Pioneers','2024-05-03 11:00:00','2024-05-03 11:53:00','Success'),(9,1,'Detective Dynamos','2024-05-04 13:00:00','2024-05-04 14:00:00','Failed'),(10,4,'Mastermind Medics','2024-05-04 14:30:00','2024-05-04 15:18:00','Success'),(11,1,'Filler 1','2023-01-01 10:30:00','2023-01-01 11:30:00','Success'),(12,2,'Filler 2','2023-01-02 10:30:00','2023-01-02 11:30:00','Failed'),(13,3,'Filler 3','2024-06-01 10:30:00','2024-06-01 11:15:00','Success'),(14,4,'Filler 4','2024-06-02 10:30:00','2024-06-02 11:30:00','Failed');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_members` (
  `TeamMember_ID` int NOT NULL,
  `Session_ID` int DEFAULT NULL,
  `Player_ID` int DEFAULT NULL,
  PRIMARY KEY (`TeamMember_ID`),
  KEY `Session_ID` (`Session_ID`),
  KEY `Player_ID` (`Player_ID`),
  CONSTRAINT `team_members_ibfk_1` FOREIGN KEY (`Session_ID`) REFERENCES `sessions` (`Session_ID`),
  CONSTRAINT `team_members_ibfk_2` FOREIGN KEY (`Player_ID`) REFERENCES `players` (`Player_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_members`
--

LOCK TABLES `team_members` WRITE;
/*!40000 ALTER TABLE `team_members` DISABLE KEYS */;
INSERT INTO `team_members` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,5),(6,2,6),(7,2,7),(8,3,8),(9,3,9),(10,4,10),(11,4,11),(12,4,12),(13,4,13),(14,5,14),(15,5,15),(16,5,1),(17,5,2),(18,6,3),(19,6,4),(20,6,9),(21,7,10),(22,7,11),(23,8,7),(24,8,8),(25,8,15),(26,8,16),(27,8,17),(28,9,8),(29,9,9),(30,9,17),(31,9,18),(32,10,1),(33,10,3),(34,10,9),(35,10,19),(36,10,20);
/*!40000 ALTER TABLE `team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'escape_room'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `archive_old_sessions` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `archive_old_sessions` ON SCHEDULE EVERY 1 DAY STARTS '2024-07-11 22:03:54' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	INSERT INTO session_archive (Session_ID, Room_ID, Team_Name, Start_Time, End_Time, Result)
    SELECT Session_ID, Room_ID, Team_Name, Start_Time, End_Time, Result FROM sessions
    WHERE Start_Time < DATE_SUB(NOW(), INTERVAL 90 DAY);
    
	DELETE FROM sessions 
    WHERE Start_Time < DATE_SUB(NOW(), INTERVAL 90 DAY);
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'escape_room'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_total_revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_total_revenue`(escaperoomID INT) RETURNS decimal(8,2)
    DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(8,2);

SELECT 
    SUM(P.Price_PP * (SELECT 
            COUNT(*)
        FROM
            team_members TM
        WHERE
            TM.Session_ID = S.Session_ID))
INTO total_revenue FROM
    sessions S
        INNER JOIN
    pricing P ON S.Room_ID = P.Room_ID
WHERE
    S.Room_ID = escaperoomID;

    RETURN total_revenue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `teams_session_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `teams_session_details`(IN teamName VARCHAR(25))
BEGIN
	SELECT
		S.Session_ID,
        S.Team_Name AS 'Team',
        S.Start_Time AS 'Start Time',
        S.End_Time AS 'End Time',
        S.Result AS 'Results',
        R.Room_Name AS'Escape Room',
        R.Description AS 'Description', 
        R.Difficulty AS 'Difficulty',
        R.Theme AS 'Theme'
	FROM 
		sessions S
	JOIN 
		esc_room R ON S.Room_ID = R.Room_ID
	WHERE 
		S.Team_Name = teamName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `options_prices`
--

/*!50001 DROP VIEW IF EXISTS `options_prices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `options_prices` AS select `E`.`Room_Name` AS `Room Name`,`E`.`Description` AS `Description`,`E`.`Difficulty` AS `Difficulty`,`E`.`Theme` AS `Theme`,`E`.`Max_Players` AS `Max.Players`,`E`.`Duration` AS `Duration (Mins)`,`P`.`Price_PP` AS `Price (£)` from (`esc_room` `E` join `pricing` `P` on((`E`.`Room_ID` = `P`.`Room_ID`))) order by `P`.`Price_PP` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `room_performance`
--

/*!50001 DROP VIEW IF EXISTS `room_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `room_performance` AS select `R`.`Room_ID` AS `Room_ID`,`R`.`Room_Name` AS `Room Name`,count(distinct `S`.`Session_ID`) AS `Total Sessions`,sum((case when (`S`.`Result` = 'Success') then 1 else 0 end)) AS `Successful Escape`,(select round(avg(`SP`.`Completion_Time`),2) from `session_puzzles` `SP` where `SP`.`Session_ID` in (select `sessions`.`Session_ID` from `sessions` where (`sessions`.`Room_ID` = `R`.`Room_ID`))) AS `ACT`,round(((sum((case when (`S`.`Result` = 'Success') then 1 else 0 end)) * 100) / count(`S`.`Session_ID`)),2) AS `Escape Rate` from (`esc_room` `R` left join `sessions` `S` on((`R`.`Room_ID` = `S`.`Room_ID`))) group by `R`.`Room_ID`,`R`.`Room_Name` */;
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

-- Dump completed on 2024-07-12  3:19:27
