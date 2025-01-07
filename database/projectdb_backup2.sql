CREATE DATABASE  IF NOT EXISTS `efarming` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `efarming`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: efarming
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `ubid` int NOT NULL,
  `amt` float NOT NULL,
  `mid` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`bno`),
  UNIQUE KEY `bno_UNIQUE` (`bno`),
  KEY `ubid_idx` (`ubid`),
  KEY `mid_idx` (`mid`),
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `payment_mode` (`mid`),
  CONSTRAINT `ubid` FOREIGN KEY (`ubid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid_UNIQUE` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'pune'),(2,'mumbai'),(3,'nagpur'),(4,'solapur'),(5,'thane'),(6,'nanded'),(7,'sangli'),(8,'akola'),(9,'chandrapur'),(10,'ichalkaranji'),(11,'bhusaval'),(12,'panvel'),(13,'satara'),(14,'yavatmal'),(15,'achalpur'),(16,'udgir'),(17,'parli'),(18,'chiplun'),(19,'pimpri chinchwad'),(20,'dhule'),(21,'ahmednagar'),(22,'miraj'),(23,'nasik'),(24,'aurangabad'),(25,'amravati'),(26,'kolhapur'),(27,'jalgaon'),(28,'latur'),(29,'parbhani'),(30,'jalna'),(31,'navi mumbai'),(32,'ulhasanagar'),(33,'beed'),(34,'kamptee'),(35,'barshi'),(36,'osmanabad'),(37,'wardha'),(38,'hinganghat'),(39,'karad'),(40,'Ratnagiri');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmerproducttype`
--

DROP TABLE IF EXISTS `farmerproducttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmerproducttype` (
  `fptid` int NOT NULL AUTO_INCREMENT,
  `ufpid` int NOT NULL,
  `ptfpid` int NOT NULL,
  `qty` int NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`fptid`),
  UNIQUE KEY `fptid_UNIQUE` (`fptid`),
  KEY `ufpid_idx` (`ufpid`),
  KEY `ptfpid_idx` (`ptfpid`),
  CONSTRAINT `ptfpid` FOREIGN KEY (`ptfpid`) REFERENCES `producttype` (`ptid`),
  CONSTRAINT `ufpid` FOREIGN KEY (`ufpid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmerproducttype`
--

LOCK TABLES `farmerproducttype` WRITE;
/*!40000 ALTER TABLE `farmerproducttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmerproducttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `uoid` int NOT NULL,
  `odate` date NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `oid_UNIQUE` (`oid`),
  KEY `uoid_idx` (`uoid`),
  CONSTRAINT `uoid` FOREIGN KEY (`uoid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `odid` int NOT NULL AUTO_INCREMENT,
  `uodid` int NOT NULL,
  `fptoiod` int NOT NULL,
  `oid` int NOT NULL,
  PRIMARY KEY (`odid`),
  UNIQUE KEY `d_UNIQUE` (`odid`),
  KEY `uodid_idx` (`uodid`),
  KEY `fptoid_idx` (`fptoiod`),
  KEY `oid_idx` (`oid`),
  CONSTRAINT `fptoid` FOREIGN KEY (`fptoiod`) REFERENCES `farmerproducttype` (`fptid`),
  CONSTRAINT `oid` FOREIGN KEY (`oid`) REFERENCES `order` (`oid`),
  CONSTRAINT `uodid` FOREIGN KEY (`uodid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_mode`
--

DROP TABLE IF EXISTS `payment_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_mode` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `mname` varchar(15) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_mode`
--

LOCK TABLES `payment_mode` WRITE;
/*!40000 ALTER TABLE `payment_mode` DISABLE KEYS */;
INSERT INTO `payment_mode` VALUES (1,'credit'),(2,'debit'),(3,'netbanking'),(4,'wallets'),(5,'upi'),(6,'cash');
/*!40000 ALTER TABLE `payment_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(15) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pid_UNIQUE` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'rice'),(2,'wheat'),(3,'jawar'),(4,'Bajra'),(5,'Ragi'),(6,'pulses'),(7,'cereals'),(8,'spices');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttype`
--

DROP TABLE IF EXISTS `producttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producttype` (
  `ptid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `ptname` varchar(15) NOT NULL,
  PRIMARY KEY (`ptid`),
  UNIQUE KEY `pid_UNIQUE` (`ptid`),
  KEY `pid_idx` (`pid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttype`
--

LOCK TABLES `producttype` WRITE;
/*!40000 ALTER TABLE `producttype` DISABLE KEYS */;
INSERT INTO `producttype` VALUES (1,1,'basmati'),(2,1,'jasmine'),(3,1,'indrayani'),(4,1,'ambemohar'),(5,1,'kolam'),(6,1,'mogra'),(7,2,'sihore'),(8,2,'lokwan'),(9,2,'purna'),(10,2,'malavaraj'),(11,2,'punjabi'),(12,2,'khapli'),(13,2,'bhalia'),(14,3,'hybrid'),(15,3,'maldani'),(16,3,'pandhari'),(17,3,'kali'),(18,3,'gulabi'),(19,4,'sorghum'),(20,4,'pearl'),(21,5,'wild'),(22,5,'cultivated'),(23,6,'masoor dal'),(24,6,' chana dal'),(25,6,'tur dal'),(26,6,'moong dal'),(27,6,'urad dal'),(28,7,'masoor'),(29,7,'mataki'),(30,7,'moog'),(31,7,'toor'),(32,7,'urad'),(33,7,'chana'),(34,7,'rajma'),(35,7,'chole'),(36,7,'soyabin'),(37,7,'peas'),(38,8,'turmeric'),(39,8,'cumin'),(40,8,'mustard');
/*!40000 ALTER TABLE `producttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `rname` varchar(10) NOT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rid_UNIQUE` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'farmer'),(3,'customer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `rid` int NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `cid` int NOT NULL,
  `contact` varchar(10) NOT NULL,
  `adhaar` varchar(12) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `uname_UNIQUE` (`uname`),
  UNIQUE KEY `pwd_UNIQUE` (`pwd`),
  UNIQUE KEY `adhaar_UNIQUE` (`adhaar`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `rid_idx` (`rid`),
  KEY `cid_idx` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `city` (`cid`),
  CONSTRAINT `rid` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Alia123','Aia@123','Alia','Singh',1,'ak123@gmail.com','Deccan',1,'9876543245','435678905434'),(2,'Chetan123','Chetan@123','Chetan','Sharma',3,'chetan12@gmail.com','Katraj',1,'8976545678','987654321345'),(3,'Farhan123','Farhan@123','farhan','Verma',2,'farhan45@gmail.com','Pimpri',1,'9876542345','435678654334');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-02 17:35:40
