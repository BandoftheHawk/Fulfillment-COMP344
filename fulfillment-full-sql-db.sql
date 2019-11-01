CREATE DATABASE  IF NOT EXISTS `comp344ass2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `comp344ass2`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: mq.ck5iokhw5uys.ap-southeast-2.rds.amazonaws.com    Database: comp344ass2
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `AccessGroup`
--

DROP TABLE IF EXISTS `AccessGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessGroup` (
  `AG_id` int(11) NOT NULL AUTO_INCREMENT,
  `AG_name` varchar(45) DEFAULT NULL,
  `AG_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AG_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessGroup`
--

LOCK TABLES `AccessGroup` WRITE;
/*!40000 ALTER TABLE `AccessGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccessGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccessGroupCommands`
--

DROP TABLE IF EXISTS `AccessGroupCommands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessGroupCommands` (
  `AGC_id` int(11) NOT NULL AUTO_INCREMENT,
  `AGC_AG_id` int(11) NOT NULL,
  `AGC_Cmd_id` int(11) NOT NULL,
  `AGC_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AGC_id`),
  KEY `fk_AG_id_idx` (`AGC_AG_id`),
  KEY `fk_Cmd_id_idx` (`AGC_Cmd_id`),
  CONSTRAINT `fk_AGC_AG_id` FOREIGN KEY (`AGC_AG_id`) REFERENCES `AccessGroup` (`AG_id`),
  CONSTRAINT `fk_AGC_Cmd_id` FOREIGN KEY (`AGC_Cmd_id`) REFERENCES `Commands` (`Cmd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessGroupCommands`
--

LOCK TABLES `AccessGroupCommands` WRITE;
/*!40000 ALTER TABLE `AccessGroupCommands` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccessGroupCommands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccessUserGroup`
--

DROP TABLE IF EXISTS `AccessUserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessUserGroup` (
  `AUG_id` int(11) NOT NULL AUTO_INCREMENT,
  `AUG_Shopper_id` int(11) NOT NULL,
  `AUG_AG_id` int(11) NOT NULL,
  PRIMARY KEY (`AUG_id`),
  KEY `fk_AG_id_idx` (`AUG_AG_id`),
  KEY `fk_Shopper_id_idx` (`AUG_Shopper_id`),
  CONSTRAINT `fk__AUG_AG_id` FOREIGN KEY (`AUG_AG_id`) REFERENCES `AccessGroup` (`AG_id`),
  CONSTRAINT `fk__AUG_Shopper_id` FOREIGN KEY (`AUG_Shopper_id`) REFERENCES `Shopper` (`shopper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maps a user to an access control group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessUserGroup`
--

LOCK TABLES `AccessUserGroup` WRITE;
/*!40000 ALTER TABLE `AccessUserGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccessUserGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attribute`
--

DROP TABLE IF EXISTS `Attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `Product_prod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Attribute_Product1_idx` (`Product_prod_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`Product_prod_id`) REFERENCES `Product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product attribute name and type information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attribute`
--

LOCK TABLES `Attribute` WRITE;
/*!40000 ALTER TABLE `Attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AttributeValue`
--

DROP TABLE IF EXISTS `AttributeValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AttributeValue` (
  `AttrVal_id` int(11) NOT NULL AUTO_INCREMENT,
  `AttrVal_Value` varchar(45) NOT NULL,
  `AttrVal_Attr_id` int(11) NOT NULL,
  `AttrVal_Prod_id` int(11) NOT NULL,
  `AttrVal_Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`AttrVal_id`),
  UNIQUE KEY `id_UNIQUE` (`AttrVal_id`),
  KEY `fk_AttributeValue_Attribute_idx` (`AttrVal_Attr_id`),
  KEY `fk_Prod_id_idx` (`AttrVal_Prod_id`),
  CONSTRAINT `fk_Attr_Id` FOREIGN KEY (`AttrVal_Attr_id`) REFERENCES `Attribute` (`id`),
  CONSTRAINT `fk_Prod_id` FOREIGN KEY (`AttrVal_Prod_id`) REFERENCES `Product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product attribute value information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AttributeValue`
--

LOCK TABLES `AttributeValue` WRITE;
/*!40000 ALTER TABLE `AttributeValue` DISABLE KEYS */;
/*!40000 ALTER TABLE `AttributeValue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(40) NOT NULL,
  `cat_desc` varchar(128) DEFAULT NULL,
  `cat_img_url` varchar(128) DEFAULT NULL,
  `cat_disp_cmd` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_name_UNIQUE` (`cat_name`),
  KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product category information for store catalogue.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CgPrRel`
--

DROP TABLE IF EXISTS `CgPrRel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CgPrRel` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CgPr_cat_id` int(11) NOT NULL,
  `CgPr_prod_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `pk_child_prod_idx` (`CgPr_prod_id`),
  KEY `pk_parent_cat_idx` (`CgPr_cat_id`),
  CONSTRAINT `pk_child_prod` FOREIGN KEY (`CgPr_prod_id`) REFERENCES `Product` (`prod_id`),
  CONSTRAINT `pk_parent_cat` FOREIGN KEY (`CgPr_cat_id`) REFERENCES `Category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CgPrRel`
--

LOCK TABLES `CgPrRel` WRITE;
/*!40000 ALTER TABLE `CgPrRel` DISABLE KEYS */;
/*!40000 ALTER TABLE `CgPrRel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CgryRel`
--

DROP TABLE IF EXISTS `CgryRel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CgryRel` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cgryrel_id_parent` int(11) NOT NULL,
  `cgryrel_id_child` int(11) NOT NULL,
  `cgryrel_sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `pk_child_cat_idx` (`cgryrel_id_child`),
  KEY `pk_parent_cat_idx` (`cgryrel_id_parent`),
  CONSTRAINT `fk_child_cat` FOREIGN KEY (`cgryrel_id_child`) REFERENCES `Category` (`cat_id`),
  CONSTRAINT `fk_parent_cat` FOREIGN KEY (`cgryrel_id_parent`) REFERENCES `Category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CgryRel`
--

LOCK TABLES `CgryRel` WRITE;
/*!40000 ALTER TABLE `CgryRel` DISABLE KEYS */;
/*!40000 ALTER TABLE `CgryRel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commands`
--

DROP TABLE IF EXISTS `Commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commands` (
  `Cmd_id` int(11) NOT NULL AUTO_INCREMENT,
  `Cmd_name` varchar(45) DEFAULT NULL,
  `Cmd_URL` varchar(255) NOT NULL,
  PRIMARY KEY (`Cmd_id`),
  UNIQUE KEY `Cmd_id_UNIQUE` (`Cmd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commands`
--

LOCK TABLES `Commands` WRITE;
/*!40000 ALTER TABLE `Commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `Commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeveliveryCompany`
--

DROP TABLE IF EXISTS `DeveliveryCompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeveliveryCompany` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeveliveryCompany`
--

LOCK TABLES `DeveliveryCompany` WRITE;
/*!40000 ALTER TABLE `DeveliveryCompany` DISABLE KEYS */;
INSERT INTO `DeveliveryCompany` VALUES (1,'Delivery Company 1'),(2,'Delivery Company 2'),(3,'Delivery Company 3');
/*!40000 ALTER TABLE `DeveliveryCompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Log_Shopper_id` int(11) DEFAULT NULL,
  `Log_Cmd_id` int(11) DEFAULT NULL,
  `Log_Cat_id` int(11) DEFAULT NULL,
  `Log_Prod_id` int(11) DEFAULT NULL,
  `Log_TimeStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Log_Cat_id_idx` (`Log_Cat_id`),
  KEY `fk_Log_Cmd_id_idx` (`Log_Cmd_id`),
  KEY `fk_Log_Prod_id_idx` (`Log_Prod_id`),
  KEY `fk_Shopper_id_idx` (`Log_Shopper_id`),
  CONSTRAINT `fk_Log_Cat_id` FOREIGN KEY (`Log_Cat_id`) REFERENCES `Category` (`cat_id`),
  CONSTRAINT `fk_Log_Cmd_id` FOREIGN KEY (`Log_Cmd_id`) REFERENCES `Commands` (`Cmd_id`),
  CONSTRAINT `fk_Log_Prod_id` FOREIGN KEY (`Log_Prod_id`) REFERENCES `Product` (`prod_id`),
  CONSTRAINT `fk_Log_Shopper_id` FOREIGN KEY (`Log_Shopper_id`) REFERENCES `Shopper` (`shopper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `Order_id` int(11) NOT NULL AUTO_INCREMENT,
  `Order_Shopper` int(11) NOT NULL,
  `Order_Shaddr` int(11) NOT NULL,
  `Order_TimeStamp` timestamp NULL DEFAULT NULL,
  `Order_PayMethod` char(1) DEFAULT NULL,
  `Order_Payment_PAN` varchar(20) DEFAULT NULL,
  `Order_PaymentAuthorized` tinyint(1) DEFAULT NULL,
  `Order_Picked` tinyint(1) DEFAULT NULL,
  `Order_Shipped` tinyint(1) DEFAULT NULL,
  `Order_ShipDate` date DEFAULT NULL,
  `Order_Paid` tinyint(1) DEFAULT NULL,
  `Order_PayDate` date DEFAULT NULL,
  `Order_ShippingAmount` decimal(10,2) DEFAULT NULL,
  `Order_TaxAmount` decimal(10,2) DEFAULT NULL,
  `Order_ProductAmount` decimal(10,2) DEFAULT NULL,
  `Order_Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Order_id`),
  KEY `fk_Order_Shaddr_idx` (`Order_Shaddr`),
  KEY `fk_Shopper_idx` (`Order_Shopper`),
  CONSTRAINT `fk_Order_Shaddr` FOREIGN KEY (`Order_Shaddr`) REFERENCES `Shaddr` (`shaddr_id`),
  CONSTRAINT `fk_Shopper` FOREIGN KEY (`Order_Shopper`) REFERENCES `Shopper` (`shopper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,1,1,NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,213.00),(2,2,3,NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,85.84),(3,3,2,NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,45.00),(4,4,4,NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,85.00),(5,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,22.00),(6,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,22.00);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderProduct`
--

DROP TABLE IF EXISTS `OrderProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderProduct` (
  `OP_id` int(11) NOT NULL AUTO_INCREMENT,
  `OP_Order_id` int(11) NOT NULL,
  `OP_prod_id` int(11) NOT NULL,
  `OP_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`OP_id`),
  KEY `fk_OrderProduct_Order1_idx` (`OP_Order_id`),
  KEY `fk_Order_has_Product_Product1_idx` (`OP_prod_id`),
  CONSTRAINT `fk_OP_Product` FOREIGN KEY (`OP_prod_id`) REFERENCES `Product` (`prod_id`),
  CONSTRAINT `fk_OrderProduct_Order1` FOREIGN KEY (`OP_Order_id`) REFERENCES `Order` (`Order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderProduct`
--

LOCK TABLES `OrderProduct` WRITE;
/*!40000 ALTER TABLE `OrderProduct` DISABLE KEYS */;
INSERT INTO `OrderProduct` VALUES (1,1,1,1),(2,1,2,3),(3,1,3,89),(4,2,2,4),(5,2,3,5),(6,3,1,10),(7,3,3,5),(8,3,2,2),(9,4,3,2),(10,5,1,2),(11,5,3,10),(12,5,1,1);
/*!40000 ALTER TABLE `OrderProduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderProductAttributeValues`
--

DROP TABLE IF EXISTS `OrderProductAttributeValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderProductAttributeValues` (
  `OPAttr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OPAttr_op_id` int(11) NOT NULL,
  `OPAttr_Attr_id` int(11) NOT NULL,
  `OPAttr_AttrVal_id` int(11) NOT NULL,
  PRIMARY KEY (`OPAttr_id`,`OPAttr_op_id`),
  KEY `fk_Order_has_Product_has_AttributeValue_AttributeValue1_idx` (`OPAttr_AttrVal_id`),
  KEY `fk_Order_has_Product_has_AttributeValue_Order_has_Product1_idx` (`OPAttr_op_id`),
  CONSTRAINT `fk_OrderProductAttributeValues_Attribute1` FOREIGN KEY (`OPAttr_op_id`) REFERENCES `Attribute` (`id`),
  CONSTRAINT `fk_Order_has_Product_has_AttributeValue_AttributeValue1` FOREIGN KEY (`OPAttr_AttrVal_id`) REFERENCES `AttributeValue` (`AttrVal_id`),
  CONSTRAINT `fk_Order_has_Product_has_AttributeValue_Order_has_Product1` FOREIGN KEY (`OPAttr_op_id`) REFERENCES `OrderProduct` (`OP_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderProductAttributeValues`
--

LOCK TABLES `OrderProductAttributeValues` WRITE;
/*!40000 ALTER TABLE `OrderProductAttributeValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderProductAttributeValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProdPrices`
--

DROP TABLE IF EXISTS `ProdPrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProdPrices` (
  `PrPr_id` int(11) NOT NULL AUTO_INCREMENT,
  `PrPr_Prod_id` int(11) NOT NULL,
  `PrPr_ShopGrp` int(11) NOT NULL,
  `PrPr_Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`PrPr_id`),
  KEY `fk_ProdPrices_Product1_idx` (`PrPr_Prod_id`),
  KEY `fk_Prod_ShGrp` (`PrPr_Prod_id`,`PrPr_ShopGrp`),
  CONSTRAINT `fk_ProdPrices_Product1` FOREIGN KEY (`PrPr_Prod_id`) REFERENCES `Product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProdPrices`
--

LOCK TABLES `ProdPrices` WRITE;
/*!40000 ALTER TABLE `ProdPrices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProdPrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(40) NOT NULL,
  `prod_desc` varchar(128) DEFAULT NULL,
  `prod_img_url` varchar(128) DEFAULT NULL,
  `prod_long_desc` varchar(256) DEFAULT NULL,
  `prod_sku` char(16) DEFAULT NULL,
  `prod_disp_cmd` varchar(128) DEFAULT NULL,
  `prod_weight` decimal(6,2) DEFAULT NULL,
  `prod_l` int(11) DEFAULT NULL,
  `prod_w` int(11) DEFAULT NULL,
  `prod_h` int(11) DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `prod_name` (`prod_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Key product information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Vitamin B','B vitamins are a class of water-soluble vitamins that play important roles in cell metabolism. Though these vitamins share simil',NULL,NULL,'9999',NULL,NULL,NULL,NULL,NULL),(2,'Vitamin C++','C++ vitamins are a class of water-soluble vitamins that play important roles in cell metabolism.',NULL,NULL,'33333',NULL,NULL,NULL,NULL,NULL),(3,'Vitamin C','C vitamins are a class of water-soluble vitamins that play important roles in cell metabolism. Though these vitamins share simil',NULL,NULL,'1111',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rating`
--

DROP TABLE IF EXISTS `Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rating` (
  `id` int(11) NOT NULL,
  `Rating_Shopper_id` int(11) DEFAULT NULL,
  `Rating_Product_id` int(11) DEFAULT NULL,
  `Rating_Value` int(11) DEFAULT NULL,
  `Rating_Review` mediumblob,
  PRIMARY KEY (`id`),
  KEY `fk_Rvw_Product_id_idx` (`Rating_Product_id`),
  KEY `fk_Rvw_Shopper_id_idx` (`Rating_Shopper_id`),
  CONSTRAINT `fk_Rvw_Product_id` FOREIGN KEY (`Rating_Product_id`) REFERENCES `Product` (`prod_id`),
  CONSTRAINT `fk_Rvw_Shopper_id` FOREIGN KEY (`Rating_Shopper_id`) REFERENCES `Shopper` (`shopper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rating`
--

LOCK TABLES `Rating` WRITE;
/*!40000 ALTER TABLE `Rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Session` (
  `id` char(32) NOT NULL,
  `Shopper_id` int(11) DEFAULT NULL,
  `data` mediumblob,
  `time` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sess_shopper_id` (`Shopper_id`),
  KEY `idx_t` (`time`),
  CONSTRAINT `fk_sess_shopper_id` FOREIGN KEY (`Shopper_id`) REFERENCES `Shopper` (`shopper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session`
--

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shaddr`
--

DROP TABLE IF EXISTS `Shaddr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shaddr` (
  `shaddr_id` int(11) NOT NULL AUTO_INCREMENT,
  `shopper_id` int(11) NOT NULL,
  `sh_title` char(8) DEFAULT NULL,
  `sh_firstname` varchar(20) DEFAULT NULL,
  `sh_familyname` varchar(30) DEFAULT NULL,
  `sh_street1` varchar(64) DEFAULT NULL,
  `sh_street2` varchar(64) DEFAULT NULL,
  `sh_city` varchar(32) DEFAULT NULL,
  `sh_state` varchar(8) DEFAULT NULL,
  `sh_postcode` varchar(10) DEFAULT NULL,
  `sh_country` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`shaddr_id`),
  KEY `shopper_id` (`shopper_id`),
  CONSTRAINT `fk_shopper_id` FOREIGN KEY (`shopper_id`) REFERENCES `Shopper` (`shopper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='A shopper can have multiple shipping or other addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shaddr`
--

LOCK TABLES `Shaddr` WRITE;
/*!40000 ALTER TABLE `Shaddr` DISABLE KEYS */;
INSERT INTO `Shaddr` VALUES (1,1,'Mr','Tom','TomTom','Nile Cl',NULL,'Sydney','NSW','2122','Australia'),(2,2,'Mrs','Alisa','Marandi','Taranto',NULL,'Sydney','NSW','2233','Australia'),(3,3,'Dr','Bordi','Webster','Military Rd',NULL,'Sydney','NSW','1055','Australia'),(4,4,'Mr','Jason','Chan','West Park',NULL,'Sydney','NSW','3344','Australia');
/*!40000 ALTER TABLE `Shaddr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipment`
--

DROP TABLE IF EXISTS `Shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Shopper_id` int(11) NOT NULL,
  `Shaddr_id` int(11) NOT NULL,
  `Delivery_Company_id` int(11) NOT NULL,
  `picked_up_at` datetime DEFAULT NULL,
  `expected_delivery_date` datetime DEFAULT NULL,
  `shopper_notified` tinyint(4) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Shipment_DeveliveryCompany1_idx` (`Delivery_Company_id`),
  CONSTRAINT `fk_Shipment_DeveliveryCompany1` FOREIGN KEY (`Delivery_Company_id`) REFERENCES `DeveliveryCompany` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipment`
--

LOCK TABLES `Shipment` WRITE;
/*!40000 ALTER TABLE `Shipment` DISABLE KEYS */;
INSERT INTO `Shipment` VALUES (1,1,1,1,'2019-10-31 07:13:08','2019-10-31 07:13:08',1,'shipped'),(2,2,2,2,'2019-10-31 07:13:08','2019-10-31 07:13:08',1,'shipped'),(3,3,3,3,'2019-10-31 07:13:09','2019-10-31 07:13:09',1,'not_shipped'),(4,3,3,3,'2019-10-31 07:13:09','2019-10-31 07:13:09',1,'not_shipped'),(5,2,2,2,'2019-10-31 07:13:09','2019-10-31 07:13:09',1,'not_shipped'),(6,3,3,1,'2019-10-31 07:13:09','2019-10-31 07:13:09',1,'not_shipped');
/*!40000 ALTER TABLE `Shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShipmentItems`
--

DROP TABLE IF EXISTS `ShipmentItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShipmentItems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Shipment_id` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL,
  `Order_Product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ShipmentItems_Shipment1_idx` (`Shipment_id`),
  CONSTRAINT `fk_ShipmentItems_Shipment1` FOREIGN KEY (`Shipment_id`) REFERENCES `Shipment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShipmentItems`
--

LOCK TABLES `ShipmentItems` WRITE;
/*!40000 ALTER TABLE `ShipmentItems` DISABLE KEYS */;
INSERT INTO `ShipmentItems` VALUES (1,1,1,1),(2,1,1,2),(3,1,1,3),(4,2,2,4),(5,2,2,5),(6,3,3,6),(7,3,3,7),(8,3,3,8),(9,4,4,9),(10,5,5,10),(11,5,5,11),(12,6,6,12);
/*!40000 ALTER TABLE `ShipmentItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shopper`
--

DROP TABLE IF EXISTS `Shopper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shopper` (
  `shopper_id` int(11) NOT NULL AUTO_INCREMENT,
  `sh_username` varchar(30) NOT NULL,
  `sh_password` char(60) NOT NULL,
  `sh_email` varchar(64) NOT NULL,
  `sh_phone` varchar(45) DEFAULT NULL,
  `sh_type` char(1) DEFAULT 'S',
  `sh_shopgrp` int(11) DEFAULT NULL,
  `sh_field1` varchar(128) DEFAULT NULL,
  `sh_field2` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`shopper_id`),
  KEY `fk_Shopper_ShopperGroup1_idx` (`sh_shopgrp`),
  KEY `sh_username` (`sh_username`),
  CONSTRAINT `fk_Shopper_ShopperGroup1` FOREIGN KEY (`sh_shopgrp`) REFERENCES `ShopperGroup` (`ShopGrp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Information about a registered shopper and or user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shopper`
--

LOCK TABLES `Shopper` WRITE;
/*!40000 ALTER TABLE `Shopper` DISABLE KEYS */;
INSERT INTO `Shopper` VALUES (1,'Tom','TomTom','tom@gmail.com','0390521552','S',NULL,NULL,NULL),(2,'Pedro','Marandi','pedro.marandi@gmail.com','0390534883','S',NULL,NULL,NULL),(3,'Cordi','Webster','cordi.webster@yahoo.com','0390558130','S',NULL,NULL,NULL),(4,'Jason','Chan','jason.chan@live.com','0390986521','S',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Shopper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShopperGroup`
--

DROP TABLE IF EXISTS `ShopperGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShopperGroup` (
  `ShopGrp_id` int(11) NOT NULL,
  `ShopGrp_Name` varchar(45) NOT NULL,
  `ShopGrp_Description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ShopGrp_id`),
  CONSTRAINT `fk_ShopperGroup_Shopper1` FOREIGN KEY (`ShopGrp_id`) REFERENCES `Shopper` (`sh_shopgrp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShopperGroup`
--

LOCK TABLES `ShopperGroup` WRITE;
/*!40000 ALTER TABLE `ShopperGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShopperGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specials`
--

DROP TABLE IF EXISTS `Specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specials` (
  `id` int(11) NOT NULL,
  `Special_Product_id` int(11) NOT NULL,
  `Special_ProdAttrVal` int(11) DEFAULT NULL,
  `Special_ProdPrices_id` int(11) DEFAULT NULL,
  `Special_Start_Date` date NOT NULL,
  `Special_End_Date` date NOT NULL,
  `Special_Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Specials_ProdAttrVal_id_idx` (`Special_ProdAttrVal`),
  KEY `fk_Specials_Prod_id_idx` (`Special_Product_id`),
  CONSTRAINT `fk_Specials_ProdAttrVal_id` FOREIGN KEY (`Special_ProdAttrVal`) REFERENCES `AttributeValue` (`AttrVal_id`),
  CONSTRAINT `fk_Specials_Prod_id` FOREIGN KEY (`Special_Product_id`) REFERENCES `Product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specials`
--

LOCK TABLES `Specials` WRITE;
/*!40000 ALTER TABLE `Specials` DISABLE KEYS */;
/*!40000 ALTER TABLE `Specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stock`
--

DROP TABLE IF EXISTS `Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stock` (
  `id` int(11) NOT NULL,
  `Stock_Prod_id` int(11) DEFAULT NULL,
  `Stock_Prod_AttrValue_id` int(11) DEFAULT NULL,
  `Stock_Qty` int(11) DEFAULT NULL,
  `Stock_SKU` varchar(60) DEFAULT NULL,
  `Stock_Location` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Stock_ProdAttrValue_id_idx` (`Stock_Prod_AttrValue_id`),
  KEY `fk_Stock_Prod_id_idx` (`Stock_Prod_id`),
  CONSTRAINT `fk_Stock_ProdAttrValue_id` FOREIGN KEY (`Stock_Prod_AttrValue_id`) REFERENCES `AttributeValue` (`AttrVal_Prod_id`),
  CONSTRAINT `fk_Stock_Prod_id` FOREIGN KEY (`Stock_Prod_id`) REFERENCES `Product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stock`
--

LOCK TABLES `Stock` WRITE;
/*!40000 ALTER TABLE `Stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-01 19:47:33
