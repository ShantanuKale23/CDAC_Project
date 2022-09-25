-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `doctor_visits`
--

DROP TABLE IF EXISTS `doctor_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_visits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pat_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `visits` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctot_visits_doctor_id_idx` (`doctor_id`),
  KEY `doctor_visit_pat_id` (`pat_id`),
  CONSTRAINT `doctor_visit_pat_id` FOREIGN KEY (`pat_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doctot_visits_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_visits`
--

LOCK TABLES `doctor_visits` WRITE;
/*!40000 ALTER TABLE `doctor_visits` DISABLE KEYS */;
INSERT INTO `doctor_visits` VALUES (18,49,42,0),(19,50,42,0),(20,51,41,0),(21,52,41,0);
/*!40000 ALTER TABLE `doctor_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int DEFAULT NULL,
  `charges` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_emp_id_idx` (`emp_id`),
  CONSTRAINT `doctor_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (41,115,2500),(42,116,3000),(43,119,1500);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`user_id`),
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (114,147,'1998-09-02','2022-09-21',250000),(115,148,'1990-02-20','2022-09-23',100000),(116,149,'1992-05-18','2022-09-14',150000),(117,150,'1995-03-12','2022-09-08',100000),(118,151,'1996-04-15','2022-09-06',35000),(119,152,'1998-03-25','2022-09-24',100000);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (11,'Paclitaxel',14),(13,'Palifermin',12),(14,'Palonosetron hydrochloride',11),(15,'Daraprim',12.2),(20,'Bcomplex',5);
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines_assigned`
--

DROP TABLE IF EXISTS `medicines_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines_assigned` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pat_id` int DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `prescription` varchar(500) DEFAULT NULL,
  `medicine_qty` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicine_id_idx` (`medicine_id`),
  KEY `medicine_pat_id` (`pat_id`),
  CONSTRAINT `medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medicine_pat_id` FOREIGN KEY (`pat_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines_assigned`
--

LOCK TABLES `medicines_assigned` WRITE;
/*!40000 ALTER TABLE `medicines_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicines_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `ward_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `date_of_admission` date DEFAULT NULL,
  `blood_group` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `prescription` varchar(2000) DEFAULT NULL,
  `bed_alloted` int DEFAULT NULL,
  `payment_status` varchar(45) DEFAULT NULL,
  `patient_problem` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`user_id`),
  KEY `pat_ward_id_idx` (`ward_id`),
  KEY `pat_doctor_id_idx` (`doctor_id`),
  CONSTRAINT `pat_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pat_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pat_ward_id` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (49,154,38,42,'2022-09-23','O+','1995-11-22',NULL,2,'pending','coughing'),(50,155,38,42,'2022-09-08','A+','2002-03-14',NULL,3,'pending','high fever'),(51,156,38,41,'2022-09-18','AB+','1997-01-25',NULL,4,'pending','headache'),(52,157,38,41,'2022-09-25','O-','1991-02-17',NULL,5,'pending','migraine');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `cell_no` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `security_question` varchar(100) DEFAULT NULL,
  `security_answer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (147,'Shantanu','Kale','sk@gmail.com','1234','+918009001000','admin','my pet name','rocky'),(148,'sanket','more','sm@gmail.com','1234','+919000080000','doctor','my pet name','kitty'),(149,'prasad','jadhav','pj@gmail.com','1234','+918000090000','doctor','my pet name','tommy'),(150,'ramesh','patil','rp@gmail.com','1234','+918520741096','accountant','my pet name','dolly'),(151,'sakshi','patel','sp@gmail.com','1234','+917896541230','reception','my pet name','bob'),(152,'omprakash','sinha','op@gmail.com','1234','+919632587410','doctor','my pet name','tomy'),(154,'ramu','shinde','rs@gmail.com','1234','+912546897111','patient','my pet name','oggy'),(155,'shruti','jadhav','sj@gmail.com','1234','+918745693212','patient','my pet name','abc'),(156,'harshal','kalambkar','hk@gmail.com','1234','+919874789547','patient','my pet name','rony'),(157,'vinay','kumbhar','vk@gmail.com','1234','+917008000954','patient','my pet name','babu');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `charges` double DEFAULT NULL,
  `availability` double DEFAULT NULL,
  `max_capacity` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
INSERT INTO `wards` VALUES (19,'A',1200,24,40),(38,'B',500,36,40),(39,'C',870,45,45);
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-25 18:37:18
