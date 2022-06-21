-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: reisbureau
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `bestemming`
--

DROP TABLE IF EXISTS `bestemming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bestemming` (
  `bestemmingscode` int(11) NOT NULL AUTO_INCREMENT,
  `plaats` varchar(45) NOT NULL,
  `land` varchar(45) NOT NULL,
  `werelddeel` varchar(45) NOT NULL,
  PRIMARY KEY (`bestemmingscode`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestemming`
--

LOCK TABLES `bestemming` WRITE;
/*!40000 ALTER TABLE `bestemming` DISABLE KEYS */;
INSERT INTO `bestemming` VALUES (1,'Amsterdam	','Nederland','Europa'),(2,'Miami	','Verenigde Staten','Noord Amerika'),(3,'Melbourne','Australië','Australië'),(4,'Lima','Peru','Afrika'),(5,'Kathmandu	','Nepal','Azië');
/*!40000 ALTER TABLE `bestemming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boeking`
--

DROP TABLE IF EXISTS `boeking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boeking` (
  `boekingnummer` int(11) NOT NULL AUTO_INCREMENT,
  `klantnummer` int(11) NOT NULL,
  `reisnummer` int(11) NOT NULL,
  `boekdatum` date NOT NULL,
  `aantal_volwassenen` int(11) NOT NULL,
  `aantal_kinderen` int(11) NOT NULL,
  `betaald_bedrag` double NOT NULL,
  PRIMARY KEY (`boekingnummer`),
  KEY `fk_boeking_reis1_idx` (`reisnummer`),
  KEY `fk_boeking_klant1_idx` (`klantnummer`),
  CONSTRAINT `fk_boeking_klant1` FOREIGN KEY (`klantnummer`) REFERENCES `klant` (`klantnummer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_boeking_reis1` FOREIGN KEY (`reisnummer`) REFERENCES `reis` (`reisnummer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boeking`
--

LOCK TABLES `boeking` WRITE;
/*!40000 ALTER TABLE `boeking` DISABLE KEYS */;
INSERT INTO `boeking` VALUES (1,1,4,'2020-01-01',2,3,0),(2,1,7,'2020-01-05',1,0,100),(3,2,4,'2020-02-02',2,4,50),(4,3,1,'2020-03-07',2,1,0),(5,4,1,'2020-04-01',1,1,80),(6,4,4,'2020-04-01',1,0,0),(7,4,8,'2020-04-07',2,1,40),(8,5,3,'2020-06-20',1,2,0);
/*!40000 ALTER TABLE `boeking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klant`
--

DROP TABLE IF EXISTS `klant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klant` (
  `klantnummer` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(45) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `postcode` varchar(6) NOT NULL,
  `plaats` varchar(45) NOT NULL,
  `telefoonnummer` varchar(10) NOT NULL,
  PRIMARY KEY (`klantnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klant`
--

LOCK TABLES `klant` WRITE;
/*!40000 ALTER TABLE `klant` DISABLE KEYS */;
INSERT INTO `klant` VALUES (1,'Mark','Patatstraat 11','1000AA','Almere','0628392176'),(2,'Justin','Heldenlaan 8	','9338BR','Bommel','0682341854'),(3,'Henk	','Waterplein 11','8134TO','Rotterdam','0692648211'),(4,'Bob	','Haarlemmerdijk 287	','5921WP','Spijkersebroek','0694824569'),(5,'Flip','Flink 84','9445FF','Sterk','0622738846'),(6,'Arend','Vogelstraat 1','5147LD','Mus','0659382256');
/*!40000 ALTER TABLE `klant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reis`
--

DROP TABLE IF EXISTS `reis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reis` (
  `reisnummer` int(11) NOT NULL AUTO_INCREMENT,
  `bestemmingscode` int(11) NOT NULL,
  `vertrekdatum` date NOT NULL,
  `aantal_dagen` int(11) NOT NULL,
  `prijs_per_persoon` double NOT NULL,
  PRIMARY KEY (`reisnummer`),
  KEY `fk_reis_bestemming_idx` (`bestemmingscode`),
  CONSTRAINT `fk_reis_bestemming` FOREIGN KEY (`bestemmingscode`) REFERENCES `bestemming` (`bestemmingscode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reis`
--

LOCK TABLES `reis` WRITE;
/*!40000 ALTER TABLE `reis` DISABLE KEYS */;
INSERT INTO `reis` VALUES (1,1,'2020-12-01',8,150),(2,3,'2020-11-10',5,800),(3,3,'2021-04-10',10,1300),(4,2,'2021-02-01',3,500),(5,4,'2021-03-01',21,3000),(6,5,'2020-12-21',1,400),(7,5,'2021-04-01',7,1050),(8,5,'2021-06-12',2,630);
/*!40000 ALTER TABLE `reis` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-24 11:40:28
