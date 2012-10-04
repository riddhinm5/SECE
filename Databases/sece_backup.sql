-- MySQL dump 10.13  Distrib 5.5.19, for Win64 (x86)
--
-- Host: localhost    Database: secedb
-- ------------------------------------------------------
-- Server version	5.5.19

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
-- Table structure for table `a`
--

DROP TABLE IF EXISTS `a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a` (
  `ar` varchar(10) NOT NULL,
  `ba` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`ba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a`
--

LOCK TABLES `a` WRITE;
/*!40000 ALTER TABLE `a` DISABLE KEYS */;
/*!40000 ALTER TABLE `a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indoormap`
--

DROP TABLE IF EXISTS `indoormap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indoormap` (
  `UserId` int(11) DEFAULT NULL,
  `imgpath` varchar(250) NOT NULL DEFAULT '',
  `pixelX1` int(5) DEFAULT NULL,
  `pixelY1` int(5) DEFAULT NULL,
  `pixelX2` int(5) DEFAULT NULL,
  `pixelY2` int(5) DEFAULT NULL,
  `lat1` decimal(15,12) DEFAULT NULL,
  `lng1` decimal(15,12) DEFAULT NULL,
  `lat2` decimal(15,12) DEFAULT NULL,
  `lng2` decimal(15,12) DEFAULT NULL,
  `pixDist` decimal(15,10) DEFAULT NULL,
  `actDist` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`imgpath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indoormap`
--

LOCK TABLES `indoormap` WRITE;
/*!40000 ALTER TABLE `indoormap` DISABLE KEYS */;
INSERT INTO `indoormap` VALUES (11,'./uploads/floorplan.jpg',484,80,743,469,40.800527664388,-73.968778089902,40.800647458047,-73.968472318074,409.6730403627,0.0289804991);
/*!40000 ALTER TABLE `indoormap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indoormaps`
--

DROP TABLE IF EXISTS `indoormaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indoormaps` (
  `UserId` int(11) NOT NULL,
  `imgpath` varchar(250) DEFAULT NULL,
  `pixelX1` int(5) DEFAULT NULL,
  `pixelY1` int(5) DEFAULT NULL,
  `pixelX2` int(5) DEFAULT NULL,
  `pixelY2` int(5) DEFAULT NULL,
  `lat1` decimal(15,12) DEFAULT NULL,
  `lng1` decimal(15,12) DEFAULT NULL,
  `lat2` decimal(15,12) DEFAULT NULL,
  `lng2` decimal(15,12) DEFAULT NULL,
  `pixDist` decimal(15,10) DEFAULT NULL,
  `actDist` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  CONSTRAINT `indoormaps_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indoormaps`
--

LOCK TABLES `indoormaps` WRITE;
/*!40000 ALTER TABLE `indoormaps` DISABLE KEYS */;
INSERT INTO `indoormaps` VALUES (11,'./uploads/floorplan.jpg',516,80,778,469,40.809621215626,-73.961196854689,40.809653697612,-73.960475340464,412.9915253368,0.0608312469);
/*!40000 ALTER TABLE `indoormaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pixref`
--

DROP TABLE IF EXISTS `pixref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pixref` (
  `smartID` varchar(10) NOT NULL,
  `pixvalX` int(3) DEFAULT NULL,
  `pixvalY` int(3) DEFAULT NULL,
  PRIMARY KEY (`smartID`),
  CONSTRAINT `pixref_ibfk_1` FOREIGN KEY (`smartID`) REFERENCES `smartobj` (`smartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pixref`
--

LOCK TABLES `pixref` WRITE;
/*!40000 ALTER TABLE `pixref` DISABLE KEYS */;
INSERT INTO `pixref` VALUES ('7',522,427),('9',615,409);
/*!40000 ALTER TABLE `pixref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polygon`
--

DROP TABLE IF EXISTS `polygon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polygon` (
  `poly` polygon DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polygon`
--

LOCK TABLES `polygon` WRITE;
/*!40000 ALTER TABLE `polygon` DISABLE KEYS */;
/*!40000 ALTER TABLE `polygon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `UserId` int(11) DEFAULT NULL,
  `roomname` varchar(50) NOT NULL,
  `roomboundlatlng` varchar(500) DEFAULT NULL,
  `roomboundpix` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`roomname`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (11,'livingroom','40.809623245996335,-73.96119743568852;40.80962324617446,-73.96119743590049;40.80962324564013,-73.96119743638434;40.80962324543597,-73.96119743617169;','208,275;215,397;421,396;419,269;');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smartobj`
--

DROP TABLE IF EXISTS `smartobj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smartobj` (
  `userID` int(11) DEFAULT NULL,
  `smartID` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `lat` decimal(15,12) DEFAULT NULL,
  `lng` decimal(15,12) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `altitude` decimal(5,2) DEFAULT NULL,
  `imgpath` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`smartID`),
  KEY `userID` (`userID`),
  CONSTRAINT `smartobj_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartobj`
--

LOCK TABLES `smartobj` WRITE;
/*!40000 ALTER TABLE `smartobj` DISABLE KEYS */;
INSERT INTO `smartobj` VALUES (11,'6','lamp',40.795134695305,-73.970705866814,'',0.00,NULL),(11,'7','tv',40.800527664279,-73.968778090096,'living room',0.00,NULL),(11,'8','locks55',40.801242361838,-73.965491652489,'',0.00,''),(11,'9','radio',40.800527664543,-73.968778089738,'bed room',0.00,'');
/*!40000 ALTER TABLE `smartobj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smartobject`
--

DROP TABLE IF EXISTS `smartobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smartobject` (
  `userid` varchar(45) DEFAULT NULL,
  `smartid` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `lat` decimal(10,0) DEFAULT NULL,
  `lng` decimal(10,0) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`smartid`),
  KEY `fk_so` (`userid`),
  CONSTRAINT `fk_so` FOREIGN KEY (`userid`) REFERENCES `usersece` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartobject`
--

LOCK TABLES `smartobject` WRITE;
/*!40000 ALTER TABLE `smartobject` DISABLE KEYS */;
INSERT INTO `smartobject` VALUES ('1','1','door_lock',41,-74,'264 W 116th street, New York');
/*!40000 ALTER TABLE `smartobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Userid` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'riddhi mehta','rnm2119@columbia.edu','Carpediem5');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersece`
--

DROP TABLE IF EXISTS `usersece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersece` (
  `USERID` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USERID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersece`
--

LOCK TABLES `usersece` WRITE;
/*!40000 ALTER TABLE `usersece` DISABLE KEYS */;
INSERT INTO `usersece` VALUES ('1','riddhi','hello','r@m.com');
/*!40000 ALTER TABLE `usersece` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-04 11:31:55
