-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone_project
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `rep_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'aarav','Sharma','Delhi','North',28,1),(2,'Priya','iyer','Bengaluru','South',34,2),(3,'RAHUL','VERMA','Kolkata','East',41,3),(4,'Sneha','Das','Mumbai','West',23,4),(5,'  Vikram','Singh ','Jaipur','North',37,1),(6,'Ananya','Reddy','Chennai','South',52,2),(7,'karthik ','nair','Patna','East',30,3),(8,'Divya','Gupta','Pune','West',26,4),(9,'Rohit','Khan','Lucknow','North',45,1),(10,'MEERA','  Patil','Hyderabad','South',33,2),(11,'Imran','Joshi','Bhubaneswar','East',29,3),(12,'Pooja','Menon','Ahmedabad','West',39,4),(13,'suresh','BOSE','Delhi','North',48,1),(14,'Lakshmi','Kapoor','Bengaluru','South',24,2),(15,'Aditya ','Rao','Kolkata','East',31,3),(16,'Nisha','Mishra','Mumbai','West',36,4),(17,'Farhan','Shah','Jaipur','North',27,1),(18,'Swati','Banerjee','Chennai','South',43,2),(19,'Gaurav','Yadav','Patna','East',35,3),(20,'  Isha','Pillai','Pune','West',22,4),(21,'Manoj','Desai','Lucknow','North',40,1),(22,'Tanvi','Thakur','Hyderabad','South',32,2),(23,'Harsh','Chopra','Bhubaneswar','East',38,3),(24,'Reena','Kulkarni','Ahmedabad','West',25,4);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `order_month` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1001,10,'Bluetooth Speaker',2,NULL,'pending','2026-09'),(1002,16,'Smart Watch',1,4500,'pending','2026-09'),(1003,14,'Air Fryer',2,10400,'disputed','2026-09'),(1004,19,'Cotton Kurta',2,2800,'pending','2026-09'),(1005,22,'Table Lamp',1,1100,'completed','2026-09'),(1006,5,'Smart Watch',3,13500,'completed','2026-09'),(1007,22,'Bedsheet Set',1,1900,'completed','2026-09'),(1008,4,'Wireless Earbuds',2,6400,'completed','2026-09'),(1009,3,'Bedsheet Set',1,1900,'completed','2026-09'),(1010,19,'Wireless Earbuds',1,NULL,'pending','2026-09'),(1011,20,'Air Fryer',3,15600,'disputed','2026-09'),(1012,4,'Running Shoes',1,3600,'completed','2026-09'),(1013,23,'Smart Watch',2,9000,'disputed','2026-09'),(1014,15,'Smart Watch',1,4500,'completed','2026-09'),(1015,14,'Smart Watch',2,9000,'completed','2026-09'),(1016,12,'Denim Jacket',3,7500,'completed','2026-09'),(1017,5,'Wireless Earbuds',1,3200,'completed','2026-09'),(1018,21,'Bedsheet Set',2,3800,'completed','2026-09'),(1019,5,'Running Shoes',2,7200,'completed','2026-09'),(1020,22,'Wireless Earbuds',2,6400,'completed','2026-09'),(1021,21,'Air Fryer',2,10400,'completed','2026-09'),(1022,5,'Air Fryer',2,10400,'completed','2026-09'),(1023,21,'Running Shoes',1,3600,'completed','2026-09'),(1024,2,'Cotton Kurta',1,1400,'completed','2026-09'),(1025,8,'Table Lamp',1,1100,'completed','2026-09'),(1026,5,'Cotton Kurta',1,1400,'completed','2026-09'),(1027,1,'Smart Watch',1,4500,'completed','2026-10'),(1028,18,'Wireless Earbuds',1,3200,'completed','2026-10'),(1029,15,'Denim Jacket',2,5000,'completed','2026-10'),(1030,14,'Denim Jacket',2,5000,'completed','2026-10'),(1031,20,'Denim Jacket',2,5000,'disputed','2026-10'),(1032,7,'Table Lamp',2,2200,'completed','2026-10'),(1033,18,'Denim Jacket',1,2500,'pending','2026-10'),(1034,8,'Running Shoes',2,7200,'completed','2026-10'),(1035,5,'Bluetooth Speaker',1,2800,'pending','2026-10'),(1036,22,'Denim Jacket',2,5000,'pending','2026-10'),(1037,3,'Bedsheet Set',2,3800,'pending','2026-10'),(1038,3,'Cotton Kurta',2,2800,'completed','2026-10'),(1039,3,'Table Lamp',2,2200,'completed','2026-10'),(1040,1,'Smart Watch',3,13500,'completed','2026-10'),(1041,8,'Bluetooth Speaker',1,2800,'completed','2026-10'),(1042,14,'Table Lamp',1,1100,'pending','2026-10'),(1043,9,'Bluetooth Speaker',1,2800,'completed','2026-10'),(1044,10,'Running Shoes',1,3600,'pending','2026-10'),(1045,16,'Cotton Kurta',3,4200,'completed','2026-10'),(1046,5,'Bedsheet Set',1,1900,'completed','2026-10'),(1047,20,'Wireless Earbuds',3,9600,'disputed','2026-10'),(1048,2,'Table Lamp',1,1100,'completed','2026-10'),(1049,1,'Smart Watch',2,9000,'completed','2026-10'),(1050,12,'Running Shoes',1,3600,'completed','2026-10'),(1051,4,'Cotton Kurta',2,2800,'completed','2026-10'),(1052,15,'Smart Watch',3,13500,'pending','2026-10'),(1053,22,'Air Fryer',1,5200,'completed','2026-10'),(1054,21,'Wireless Earbuds',3,9600,'completed','2026-10'),(1055,18,'Smart Watch',1,4500,'completed','2026-10'),(1056,12,'Wireless Earbuds',1,3200,'disputed','2026-10'),(1057,4,'Bluetooth Speaker',1,2800,'pending','2026-11'),(1058,13,'Bedsheet Set',1,1900,'pending','2026-11'),(1059,2,'Bluetooth Speaker',2,5600,'completed','2026-11'),(1060,13,'Wireless Earbuds',3,9600,'disputed','2026-11'),(1061,16,'Air Fryer',3,15600,'completed','2026-11'),(1062,20,'Wireless Earbuds',2,6400,'completed','2026-11'),(1063,10,'Air Fryer',1,5200,'pending','2026-11'),(1064,20,'Bluetooth Speaker',1,NULL,'pending','2026-11'),(1065,22,'Air Fryer',3,15600,'completed','2026-11'),(1066,13,'Wireless Earbuds',1,3200,'completed','2026-11'),(1067,2,'Air Fryer',1,5200,'completed','2026-11'),(1068,23,'Air Fryer',1,5200,'pending','2026-11'),(1069,15,'Air Fryer',3,15600,'completed','2026-11'),(1070,10,'Table Lamp',2,2200,'completed','2026-11'),(1071,22,'Air Fryer',1,5200,'pending','2026-11'),(1072,20,'Bedsheet Set',1,1900,'completed','2026-11'),(1073,23,'Smart Watch',1,4500,'completed','2026-11'),(1074,16,'Running Shoes',2,7200,'completed','2026-11'),(1075,4,'Running Shoes',1,3600,'pending','2026-11'),(1076,19,'Cotton Kurta',2,2800,'completed','2026-11'),(1077,3,'Air Fryer',3,15600,'completed','2026-11'),(1078,3,'Cotton Kurta',1,1400,'pending','2026-11'),(1079,4,'Cotton Kurta',1,1400,'completed','2026-11'),(1080,23,'Bluetooth Speaker',1,2800,'completed','2026-11'),(1081,5,'Wireless Earbuds',2,6400,'completed','2026-11'),(1082,7,'Running Shoes',3,10800,'disputed','2026-11'),(1083,14,'Air Fryer',2,10400,'completed','2026-11'),(1084,14,'Running Shoes',1,3600,'completed','2026-11'),(1085,1,'Wireless Earbuds',1,3200,'completed','2026-11'),(1086,21,'Running Shoes',2,7200,'completed','2026-11'),(1087,21,'Smart Watch',1,4500,'completed','2026-11'),(1088,4,'Wireless Earbuds',1,3200,'completed','2026-11'),(1089,10,'Table Lamp',1,1100,'completed','2026-11'),(1090,7,'Wireless Earbuds',3,9600,'completed','2026-11');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `item` varchar(50) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `unit_price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('Smart Watch','Electronics',4500),('Bluetooth Speaker','Electronics',2800),('Wireless Earbuds','Electronics',3200),('Running Shoes','Apparel',3600),('Denim Jacket','Apparel',2500),('Cotton Kurta','Apparel',1400),('Air Fryer','Home',5200),('Table Lamp','Home',1100),('Bedsheet Set','Home',1900);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reps`
--

DROP TABLE IF EXISTS `reps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reps` (
  `rep_id` int DEFAULT NULL,
  `rep_name` varchar(50) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `monthly_target` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reps`
--

LOCK TABLES `reps` WRITE;
/*!40000 ALTER TABLE `reps` DISABLE KEYS */;
INSERT INTO `reps` VALUES (1,'Arjun Mehta','North',40000),(2,'Kavya Nair','South',20000),(3,'Sanjay Roy','East',12000),(4,'Neha Kulkarni','West',20000);
/*!40000 ALTER TABLE `reps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-20  0:28:40
