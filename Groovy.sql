-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Groovy_dev
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boisson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `prix` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38A43FB8D1D7DD7` (`type_id`),
  CONSTRAINT `FK38A43FB8D1D7DD7` FOREIGN KEY (`type_id`) REFERENCES `type_boisson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boisson`
--

LOCK TABLES `boisson` WRITE;
/*!40000 ALTER TABLE `boisson` DISABLE KEYS */;
INSERT INTO `boisson` VALUES (1,2,'Coca Cola',3,2),(2,0,'Jus d\'orange',2,2),(3,0,'Pinot noir',8,1),(4,0,'Mojito',6,3);
/*!40000 ALTER TABLE `boisson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `dat` datetime NOT NULL,
  `prix` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `etat` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (4,3,'2012-06-16 00:00:00',34,1,0),(5,1,'2012-06-16 18:57:52',37,1,0),(6,4,'2012-06-16 19:43:14',87,1,1),(7,2,'2012-06-17 23:12:53',66,1,1),(8,0,'2012-06-17 23:18:44',50,1,1),(9,3,'2012-06-18 10:25:15',81,1,0);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande_plat`
--

DROP TABLE IF EXISTS `commande_plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande_plat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK27BEB5D4D5B5072B` (`commande_id`),
  CONSTRAINT `FK27BEB5D4D5B5072B` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_plat`
--

LOCK TABLES `commande_plat` WRITE;
/*!40000 ALTER TABLE `commande_plat` DISABLE KEYS */;
INSERT INTO `commande_plat` VALUES (22,0,4,5,1,1),(23,0,4,2,1,1),(24,0,4,1,1,1),(25,0,4,2,2,2),(26,0,5,5,1,1),(27,0,5,2,1,1),(28,0,5,1,1,1),(29,0,5,1,1,2),(30,0,5,2,2,2),(31,0,6,4,4,1),(32,0,6,5,1,1),(33,0,6,2,1,1),(34,0,6,3,1,1),(35,0,6,1,2,1),(36,0,6,1,1,2),(37,0,6,2,2,2),(38,0,7,4,1,1),(39,0,7,5,2,1),(40,0,7,2,1,1),(41,0,7,1,1,1),(42,0,7,1,2,2),(43,0,7,3,2,2),(44,0,8,2,3,1),(45,0,8,1,1,1),(46,0,8,4,2,2),(47,0,9,4,4,1),(48,0,9,5,1,1),(49,0,9,2,1,1),(50,0,9,3,2,1),(51,0,9,1,1,1),(52,0,9,1,1,2);
/*!40000 ALTER TABLE `commande_plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,2,'Menus servit uniquement le soir','Menus du Soir',14),(2,0,'Menu spécial','Menu spécial',16);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat`
--

DROP TABLE IF EXISTS `plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `typeplatid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat`
--

LOCK TABLES `plat` WRITE;
/*!40000 ALTER TABLE `plat` DISABLE KEYS */;
INSERT INTO `plat` VALUES (1,4,'Salade avec du soja, du choux et des crevettes','Salade Chinoise',14,1),(2,0,'Soupes maison avec des petits vermicelles','Soupe aux vermicelles',8,1),(3,0,'Poulet au curry','Poulet au curry',12,2),(4,1,'Fondant au chocolat servit sur son lit de crème anglaise','Fondant au chocolat',6,3),(5,0,'Gratin d\'aubergines maisons','Gratin d\'aubergines',8,2);
/*!40000 ALTER TABLE `plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat_menus`
--

DROP TABLE IF EXISTS `plat_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat_menus` (
  `menu_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  PRIMARY KEY (`plat_id`,`menu_id`),
  KEY `FK69F125E4110A6BE4` (`menu_id`),
  KEY `FK69F125E4BAF8D9E4` (`plat_id`),
  CONSTRAINT `FK69F125E4110A6BE4` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `FK69F125E4BAF8D9E4` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat_menus`
--

LOCK TABLES `plat_menus` WRITE;
/*!40000 ALTER TABLE `plat_menus` DISABLE KEYS */;
INSERT INTO `plat_menus` VALUES (1,1),(1,4);
/*!40000 ALTER TABLE `plat_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  `dat` datetime NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `nombre_personnes` int(11) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA2D543CC82C50ED4` (`table_id`),
  CONSTRAINT `FKA2D543CC82C50ED4` FOREIGN KEY (`table_id`) REFERENCES `tabl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,'','2012-06-17 22:05:00','THOUVENOT',5,2),(2,0,'','2012-06-17 23:15:00','PERIN',5,2),(3,0,'','2012-06-18 23:16:00','TEST',5,2),(4,0,'','2012-06-18 23:16:00','tt',4,1),(5,0,'','2012-06-18 10:14:00','THOUVENOT',5,2),(6,0,'','2012-06-18 12:15:00','gtt',5,2);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authority` (`authority`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,0,'ROLE_DIRECTOR'),(2,0,'ROLE_COOKER'),(3,0,'ROLE_SERVER'),(4,0,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabl`
--

DROP TABLE IF EXISTS `tabl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `nb_places` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabl`
--

LOCK TABLES `tabl` WRITE;
/*!40000 ALTER TABLE `tabl` DISABLE KEYS */;
INSERT INTO `tabl` VALUES (1,1,4),(2,0,6),(3,0,2),(4,0,4),(5,0,4);
/*!40000 ALTER TABLE `tabl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_boisson`
--

DROP TABLE IF EXISTS `type_boisson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_boisson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_boisson`
--

LOCK TABLES `type_boisson` WRITE;
/*!40000 ALTER TABLE `type_boisson` DISABLE KEYS */;
INSERT INTO `type_boisson` VALUES (1,3,'Vin'),(2,1,'Soft'),(3,0,'Cocktail');
/*!40000 ALTER TABLE `type_boisson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_plat`
--

DROP TABLE IF EXISTS `type_plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_plat`
--

LOCK TABLES `type_plat` WRITE;
/*!40000 ALTER TABLE `type_plat` DISABLE KEYS */;
INSERT INTO `type_plat` VALUES (1,0,'Entrée'),(2,0,'Plat'),(3,0,'Dessert');
/*!40000 ALTER TABLE `type_plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_plat_plat`
--

DROP TABLE IF EXISTS `type_plat_plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_plat_plat` (
  `type_plat_plat_id` int(11) DEFAULT NULL,
  `plat_id` int(11) DEFAULT NULL,
  KEY `FK5F2EA77A8EA8D713` (`type_plat_plat_id`),
  KEY `FK5F2EA77ABAF8D9E4` (`plat_id`),
  CONSTRAINT `FK5F2EA77A8EA8D713` FOREIGN KEY (`type_plat_plat_id`) REFERENCES `type_plat` (`id`),
  CONSTRAINT `FK5F2EA77ABAF8D9E4` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_plat_plat`
--

LOCK TABLES `type_plat_plat` WRITE;
/*!40000 ALTER TABLE `type_plat_plat` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_plat_plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,6,'\0','\0','','948fe603f61dc036b5c596dc09fe3ce3f3d30dc90f024c85f3c82db2ccab679d','\0','client'),(2,0,'\0','\0','','8199166184f1d1939fb4c52da364209a63ae2d0a181dfc6ecb12800b7b1fc4b4','\0','serveur'),(4,0,'\0','\0','','1cbf490a712b85da86e54e22a2129320d5f5b5e877801a43885ae79764f17bb1','\0','directeur'),(5,0,'\0','\0','','f59ac0828b9a32293b348e398a0efd342b1e4377a687f3a9055ee2871dff35e4','\0','chef');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK143BF46A9D1363CC` (`role_id`),
  KEY `FK143BF46A423E27AC` (`user_id`),
  CONSTRAINT `FK143BF46A423E27AC` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK143BF46A9D1363CC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,4),(2,5),(3,2),(4,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-18 17:37:44
