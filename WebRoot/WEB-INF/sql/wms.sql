-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: wms
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `clientId` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `clientName` varchar(50) NOT NULL COMMENT '客户姓名',
  `level` int(11) NOT NULL DEFAULT '0',
  `contactPeople` varchar(30) DEFAULT NULL COMMENT '联系人',
  `contactTel` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'刘刘刘',0,NULL,NULL,NULL,NULL),(2,'思思思',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity`
--

DROP TABLE IF EXISTS `commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity` (
  `commodityId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `commodityName` varchar(50) NOT NULL COMMENT '商品姓名',
  `commodityType` varchar(20) DEFAULT NULL COMMENT '商品型号',
  `categoryId` int(11) DEFAULT NULL COMMENT '分类ID',
  `unitId` int(11) DEFAULT NULL COMMENT '计量单位ID',
  `salePrice` double DEFAULT '0' COMMENT '销售单价',
  `vip1Price` double DEFAULT '0' COMMENT '初级会员售价',
  `vip2Price` double DEFAULT '0' COMMENT '中级会员售价',
  `vip3Price` double DEFAULT '0' COMMENT '高级会员售价',
  `minimum` int(11) DEFAULT '0' COMMENT '最小库存量提醒',
  `state` int(11) DEFAULT '1',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `coordinate` varchar(45) DEFAULT NULL COMMENT '仓位坐标',
  PRIMARY KEY (`commodityId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
INSERT INTO `commodity` VALUES (8,'MacBook','',3,7,9288,8288,7288,6288,NULL,NULL,'12 英寸 (对角线) LED 背光 Retina 显示屏',NULL),(9,'MacBook Air','',3,7,6288,5288,4288,3288,NULL,NULL,'11.6 英寸 (对角线) LED 背光宽显示屏',NULL),(10,'MacBook Pro','',3,7,14288,13288,12288,11288,NULL,NULL,'15.4 英寸 (对角线) LED 背光 Retina 显示屏',NULL),(11,'iMac','',2,7,7988,6988,5988,4988,NULL,NULL,'21.5 英寸 (对角线) LED 背光显示屏',NULL);
/*!40000 ALTER TABLE `commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commoditycategory`
--

DROP TABLE IF EXISTS `commoditycategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commoditycategory` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `cname` varchar(50) NOT NULL COMMENT '商品分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `commodityCategoryId_UNIQUE` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commoditycategory`
--

LOCK TABLES `commoditycategory` WRITE;
/*!40000 ALTER TABLE `commoditycategory` DISABLE KEYS */;
INSERT INTO `commoditycategory` VALUES (1,'电脑',0),(2,'台式电脑',1),(3,'笔记本电脑',1);
/*!40000 ALTER TABLE `commoditycategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instock`
--

DROP TABLE IF EXISTS `instock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instock` (
  `inStockId` varchar(16) NOT NULL COMMENT '入库总单ID',
  `purchaseId` varchar(16) DEFAULT NULL COMMENT '进购总单ID',
  `supplierId` int(11) DEFAULT NULL COMMENT '供应商ID',
  `createDate` datetime NOT NULL COMMENT '入库时间',
  `payablePrice` double DEFAULT '0' COMMENT '应付金额',
  `realPrice` double DEFAULT '0' COMMENT '实付金额',
  `state` int(11) DEFAULT '0' COMMENT '是否付款\n0：未付款\n1：已付款',
  `userId` int(11) DEFAULT '0' COMMENT '操作员ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`inStockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库总单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instock`
--

LOCK TABLES `instock` WRITE;
/*!40000 ALTER TABLE `instock` DISABLE KEYS */;
INSERT INTO `instock` VALUES ('RKJH201505080001','JHDD201505080001',8,'2015-05-08 10:58:35',50000,50000,1,1,''),('RKJH201505080002','JHDD201505080002',8,'2015-05-08 11:07:23',240000,240000,1,1,''),('RKJH201505100001','JHDD201505090001',8,'2015-05-10 10:52:04',60000,60000,1,1,''),('RKJH201505100002','JHDD201505100001',8,'2015-05-10 10:58:51',140000,140000,1,1,'');
/*!40000 ALTER TABLE `instock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instockgoods`
--

DROP TABLE IF EXISTS `instockgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instockgoods` (
  `inStockgoodsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '详单ID',
  `inStockId` varchar(16) NOT NULL COMMENT '总单ID',
  `purchasegoodsId` int(11) DEFAULT NULL COMMENT '进购详单ID',
  `commodityId` int(11) NOT NULL COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '进购价',
  `amount` int(11) DEFAULT '0' COMMENT '购进数量',
  `returnedAmount` int(11) DEFAULT '0' COMMENT '退货数量',
  `totalPrice` double DEFAULT '0' COMMENT '总价',
  `storageId` int(11) NOT NULL COMMENT '仓库ID',
  `shelfId` int(11) NOT NULL COMMENT '货架ID',
  PRIMARY KEY (`inStockgoodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='入库详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instockgoods`
--

LOCK TABLES `instockgoods` WRITE;
/*!40000 ALTER TABLE `instockgoods` DISABLE KEYS */;
INSERT INTO `instockgoods` VALUES (32,'RKJH201505080001',36,8,5000,10,7,50000,1,2),(33,'RKJH201505080002',37,9,5000,10,1,50000,1,2),(34,'RKJH201505080002',38,10,10000,10,3,100000,1,2),(35,'RKJH201505080002',39,11,9000,10,1,90000,2,1),(36,'RKJH201505100001',40,8,6000,10,0,60000,1,2),(37,'RKJH201505100002',41,10,9000,10,0,90000,2,1),(38,'RKJH201505100002',42,9,5000,10,0,50000,2,2);
/*!40000 ALTER TABLE `instockgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `purchaseId` varchar(16) NOT NULL COMMENT '进货单ID',
  `supplierId` int(11) DEFAULT NULL COMMENT '供应商ID',
  `createDate` date NOT NULL COMMENT '表单创建日期',
  `receivedDate` date DEFAULT NULL COMMENT '收货日期',
  `payablePrice` double DEFAULT '0' COMMENT '应付金额',
  `realPrice` double DEFAULT '0' COMMENT '实付金额',
  `state` int(11) DEFAULT '0' COMMENT '进货单状态',
  `stockState` int(11) DEFAULT '0' COMMENT '库存状态\n0：订单未入库\n1：订单已入库',
  `userId` int(11) DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`purchaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='进货单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES ('JHDD201505080001',8,'2015-05-08','2015-05-15',50000,50000,1,1,1,''),('JHDD201505080002',8,'2015-05-08','2015-05-15',240000,240000,1,1,1,''),('JHDD201505090001',8,'2015-05-09','2015-05-16',60000,60000,1,1,1,''),('JHDD201505100001',8,'2015-05-10','2015-05-17',140000,140000,1,1,1,''),('JHDD201505140001',8,'2015-05-14','2015-05-21',100000,100000,1,0,1,'');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_returned_detail`
--

DROP TABLE IF EXISTS `purchase_returned_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_returned_detail` (
  `prdId` int(11) NOT NULL AUTO_INCREMENT COMMENT '详单ID',
  `prtId` varchar(16) NOT NULL COMMENT '总单ID',
  `inStockgoodsId` int(11) DEFAULT NULL COMMENT '入库详单ID',
  `commodityId` int(11) DEFAULT NULL COMMENT '商品ID',
  `returnedPrice` double DEFAULT '0' COMMENT '退款单价',
  `returnedAmount` int(11) DEFAULT NULL COMMENT '退货数量',
  `totalPrice` double DEFAULT '0' COMMENT '退款总金额',
  PRIMARY KEY (`prdId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='进购退货详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_returned_detail`
--

LOCK TABLES `purchase_returned_detail` WRITE;
/*!40000 ALTER TABLE `purchase_returned_detail` DISABLE KEYS */;
INSERT INTO `purchase_returned_detail` VALUES (1,'THJH201505100001',32,8,5000,5,25000),(2,'THJH201505100002',32,8,5000,1,5000),(3,'THJH201505100003',32,8,5000,1,5000),(5,'THJH201505110001',34,10,10000,1,10000),(7,'THJH201505110002',34,10,10000,1,10000),(8,'THJH201505110003',33,9,5000,1,5000),(9,'THJH201505110003',34,10,10000,1,10000),(10,'THJH201505110003',35,11,9000,1,9000);
/*!40000 ALTER TABLE `purchase_returned_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_returned_total`
--

DROP TABLE IF EXISTS `purchase_returned_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_returned_total` (
  `prtId` varchar(16) NOT NULL COMMENT '进货退货总单ID',
  `inStockId` varchar(16) DEFAULT NULL COMMENT '供应商ID',
  `createDate` datetime DEFAULT NULL COMMENT '创表日期',
  `returnedPrice` double DEFAULT NULL COMMENT '退款金额',
  `stockState` int(11) DEFAULT NULL COMMENT '库存状态',
  `userId` int(11) DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`prtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进购退货总单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_returned_total`
--

LOCK TABLES `purchase_returned_total` WRITE;
/*!40000 ALTER TABLE `purchase_returned_total` DISABLE KEYS */;
INSERT INTO `purchase_returned_total` VALUES ('THJH201505100001','RKJH201505080001','2015-05-10 11:59:57',25000,1,1,''),('THJH201505100002','RKJH201505080001','2015-05-10 23:32:11',5000,1,1,''),('THJH201505100003','RKJH201505080001','2015-05-10 23:43:44',5000,1,1,''),('THJH201505110001','RKJH201505080002','2015-05-11 00:21:14',10000,1,1,''),('THJH201505110002','RKJH201505080002','2015-05-11 00:28:11',10000,1,1,''),('THJH201505110003','RKJH201505080002','2015-05-11 22:37:35',24000,1,1,'');
/*!40000 ALTER TABLE `purchase_returned_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasegoods`
--

DROP TABLE IF EXISTS `purchasegoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchasegoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进货单商品信息ID',
  `purchaseId` varchar(16) NOT NULL COMMENT '进货单ID',
  `commodityId` int(11) NOT NULL COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '进货单价',
  `amount` int(11) DEFAULT '0' COMMENT '总量',
  `totalPrice` double DEFAULT '0' COMMENT '总价',
  `returnedAmount` int(11) DEFAULT '0' COMMENT '退货数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='进货单商品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasegoods`
--

LOCK TABLES `purchasegoods` WRITE;
/*!40000 ALTER TABLE `purchasegoods` DISABLE KEYS */;
INSERT INTO `purchasegoods` VALUES (36,'JHDD201505080001',8,5000,10,50000,7),(37,'JHDD201505080002',9,5000,10,50000,1),(38,'JHDD201505080002',10,10000,10,100000,3),(39,'JHDD201505080002',11,9000,10,90000,1),(40,'JHDD201505090001',8,6000,10,60000,0),(41,'JHDD201505100001',10,9000,10,90000,0),(42,'JHDD201505100001',9,5000,10,50000,0),(43,'JHDD201505140001',8,5000,20,100000,0);
/*!40000 ALTER TABLE `purchasegoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_stockout_detail`
--

DROP TABLE IF EXISTS `return_stockout_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_stockout_detail` (
  `rodId` int(11) NOT NULL AUTO_INCREMENT COMMENT '进货退货出库详单ID',
  `rotId` varchar(16) DEFAULT NULL COMMENT '进货退货出库总单ID',
  `prdId` int(11) DEFAULT NULL COMMENT '进货退货详单ID',
  PRIMARY KEY (`rodId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='进货退货出库详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_stockout_detail`
--

LOCK TABLES `return_stockout_detail` WRITE;
/*!40000 ALTER TABLE `return_stockout_detail` DISABLE KEYS */;
INSERT INTO `return_stockout_detail` VALUES (3,'CKTH201505110001',1),(4,'CKTH201505110002',2),(5,'CKTH201505110003',8),(6,'CKTH201505110003',9),(7,'CKTH201505110003',10),(8,'CKTH201505120001',7),(9,'CKTH201505150001',5),(12,'CKTH201505170001',3);
/*!40000 ALTER TABLE `return_stockout_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_stockout_total`
--

DROP TABLE IF EXISTS `return_stockout_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_stockout_total` (
  `rotId` varchar(16) NOT NULL COMMENT '退货出库总单ID',
  `prtId` varchar(16) DEFAULT NULL COMMENT '进货退货总单ID',
  `createDate` datetime DEFAULT NULL COMMENT '创表日期',
  `userId` int(11) DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`rotId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货出库总单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_stockout_total`
--

LOCK TABLES `return_stockout_total` WRITE;
/*!40000 ALTER TABLE `return_stockout_total` DISABLE KEYS */;
INSERT INTO `return_stockout_total` VALUES ('CKTH201505110001','THJH201505100001','2015-05-11 22:04:20',1,NULL),('CKTH201505110002','THJH201505100002','2015-05-11 22:36:46',1,NULL),('CKTH201505110003','THJH201505110003','2015-05-11 22:37:45',1,NULL),('CKTH201505120001','THJH201505110002','2015-05-12 17:58:12',1,NULL),('CKTH201505150001','THJH201505110001','2015-05-15 16:12:03',1,NULL),('CKTH201505170001','THJH201505100003','2015-05-17 16:28:33',1,NULL);
/*!40000 ALTER TABLE `return_stockout_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_detail`
--

DROP TABLE IF EXISTS `sale_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_detail` (
  `sdId` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售总单ID',
  `stId` varchar(16) NOT NULL COMMENT '销售详单ID',
  `commodityId` int(11) DEFAULT NULL COMMENT '商品ID',
  `price` double DEFAULT NULL COMMENT '单价',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `totalPrice` double DEFAULT NULL COMMENT '总价',
  `returnedAmount` int(11) DEFAULT NULL COMMENT '退货数量',
  PRIMARY KEY (`sdId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='销售单商品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_detail`
--

LOCK TABLES `sale_detail` WRITE;
/*!40000 ALTER TABLE `sale_detail` DISABLE KEYS */;
INSERT INTO `sale_detail` VALUES (3,'XSDD201505140001',8,9288,10,92880,0),(4,'XSDD201505140001',9,6288,2,12576,0),(5,'XSDD201505140002',9,6288,10,62880,0),(6,'XSDD201505140003',10,14288,5,71440,0),(7,'XSDD201505150001',11,7988,1,7988,0),(8,'XSDD201505150002',10,14288,4,57152,0),(13,'XSDD201505170001',10,13288,2,26576,0),(14,'XSDD201505170002',10,14288,1,14288,0),(15,'XSDD201505170003',11,7988,1,7988,0),(16,'XSDD201505170004',9,6288,5,31440,0),(17,'XSDD201505170005',9,5288,2,10576,0),(18,'XSDD201505170006',10,14288,5,71440,0),(19,'XSDD201505170007',8,8288,3,24864,0),(20,'XSDD201505170008',11,7988,7,55916,0);
/*!40000 ALTER TABLE `sale_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_detail_source`
--

DROP TABLE IF EXISTS `sale_detail_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_detail_source` (
  `sdsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stId` varchar(16) DEFAULT NULL COMMENT '销售总单ID',
  `sdId` int(11) DEFAULT NULL COMMENT '销售详单ID',
  `ssrId` int(11) DEFAULT NULL COMMENT '货架库存量\nstock_shelf_remain',
  `amount` int(11) DEFAULT NULL COMMENT '销售数量',
  PRIMARY KEY (`sdsId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='销售单_商品来源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_detail_source`
--

LOCK TABLES `sale_detail_source` WRITE;
/*!40000 ALTER TABLE `sale_detail_source` DISABLE KEYS */;
INSERT INTO `sale_detail_source` VALUES (1,'XSDD201505140001',3,13,3),(2,'XSDD201505140001',3,17,7),(3,'XSDD201505140001',4,14,2),(4,'XSDD201505140002',5,14,7),(5,'XSDD201505140002',5,19,3),(6,'XSDD201505140003',6,15,5),(7,'XSDD201505150001',7,16,1),(8,'XSDD201505150002',8,15,2),(9,'XSDD201505150002',8,18,2),(10,'XSDD201505170001',13,18,2),(11,'XSDD201505170002',14,18,1),(12,'XSDD201505170003',15,16,1),(13,'XSDD201505170004',16,14,0),(14,'XSDD201505170004',16,19,5),(15,'XSDD201505170005',17,14,0),(16,'XSDD201505170005',17,19,2),(17,'XSDD201505170006',18,18,5),(18,'XSDD201505170007',19,13,0),(19,'XSDD201505170007',19,17,3),(20,'XSDD201505170008',20,16,7);
/*!40000 ALTER TABLE `sale_detail_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_return_detail`
--

DROP TABLE IF EXISTS `sale_return_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_return_detail` (
  `srdId` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售退货详单ID',
  `srtId` varchar(16) DEFAULT NULL COMMENT '销售退货总单ID',
  `sdId` int(11) DEFAULT NULL COMMENT '销售详单ID',
  `price` double DEFAULT NULL COMMENT '退货单价',
  `returnedAmount` int(11) DEFAULT NULL COMMENT '退货数量',
  `totalPrice` double DEFAULT NULL COMMENT '退货总价',
  PRIMARY KEY (`srdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售退货详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_return_detail`
--

LOCK TABLES `sale_return_detail` WRITE;
/*!40000 ALTER TABLE `sale_return_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_return_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_return_total`
--

DROP TABLE IF EXISTS `sale_return_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_return_total` (
  `srtId` varchar(16) NOT NULL COMMENT '销售退货总单ID',
  `stId` varchar(16) DEFAULT NULL COMMENT '销售总单ID',
  `createDate` datetime DEFAULT NULL COMMENT '创表日期',
  `returnedDate` datetime DEFAULT NULL COMMENT '申请退货日期',
  `receivedDate` datetime DEFAULT NULL COMMENT '收到退货日期',
  `userId` int(11) DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`srtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售退货总单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_return_total`
--

LOCK TABLES `sale_return_total` WRITE;
/*!40000 ALTER TABLE `sale_return_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_return_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_stockout_detail`
--

DROP TABLE IF EXISTS `sale_stockout_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_stockout_detail` (
  `sodId` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售出库详单ID',
  `sotId` varchar(16) DEFAULT NULL COMMENT '销售出库总单ID',
  `sdId` int(11) DEFAULT NULL COMMENT '销售详单ID',
  PRIMARY KEY (`sodId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='销售出库详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_stockout_detail`
--

LOCK TABLES `sale_stockout_detail` WRITE;
/*!40000 ALTER TABLE `sale_stockout_detail` DISABLE KEYS */;
INSERT INTO `sale_stockout_detail` VALUES (2,'CKXS201505150001',6),(3,'CKXS201505150002',7),(4,'CKXS201505150003',8),(5,'CKXS201505170001',3),(6,'CKXS201505170001',4),(7,'CKXS201505170002',14),(8,'CKXS201505170003',13),(9,'CKXS201505170004',5),(10,'CKXS201505170005',15),(11,'CKXS201505170006',16),(12,'CKXS201505170007',17),(13,'CKXS201505170008',18),(14,'CKXS201505170009',19),(15,'CKXS201505170010',20);
/*!40000 ALTER TABLE `sale_stockout_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_stockout_total`
--

DROP TABLE IF EXISTS `sale_stockout_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_stockout_total` (
  `sotId` varchar(16) NOT NULL COMMENT '销售出库总单ID',
  `stId` varchar(16) DEFAULT NULL COMMENT '销售总单ID',
  `createDate` datetime DEFAULT NULL COMMENT '创表日期',
  `sendDate` datetime DEFAULT NULL COMMENT '发货日期',
  `userId` int(11) DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sotId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售出库总单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_stockout_total`
--

LOCK TABLES `sale_stockout_total` WRITE;
/*!40000 ALTER TABLE `sale_stockout_total` DISABLE KEYS */;
INSERT INTO `sale_stockout_total` VALUES ('CKXS201505150001','XSDD201505140003','2015-05-15 15:51:22','2015-05-15 15:51:25',1,''),('CKXS201505150002','XSDD201505150001','2015-05-15 16:00:14','2015-05-15 16:00:16',1,''),('CKXS201505150003','XSDD201505150002','2015-05-15 16:01:51','2015-05-15 16:01:52',1,''),('CKXS201505170001','XSDD201505140001','2015-05-17 16:10:15','2015-05-17 16:10:17',1,''),('CKXS201505170002','XSDD201505170002','2015-05-17 16:11:02','2015-05-17 16:11:04',1,''),('CKXS201505170003','XSDD201505170001','2015-05-17 16:12:12','2015-05-17 16:12:14',1,''),('CKXS201505170004','XSDD201505140002','2015-05-17 16:16:03','2015-05-17 16:16:04',1,''),('CKXS201505170005','XSDD201505170003','2015-05-17 16:16:27','2015-05-17 16:16:30',1,''),('CKXS201505170006','XSDD201505170004','2015-05-17 16:17:40','2015-05-17 16:17:42',1,''),('CKXS201505170007','XSDD201505170005','2015-05-17 16:17:51','2015-05-17 16:17:53',1,''),('CKXS201505170008','XSDD201505170006','2015-05-17 16:19:50','2015-05-17 16:19:53',1,''),('CKXS201505170009','XSDD201505170007','2015-05-17 16:20:31','2015-05-17 16:20:33',1,''),('CKXS201505170010','XSDD201505170008','2015-05-17 16:21:19','2015-05-17 16:21:22',1,'');
/*!40000 ALTER TABLE `sale_stockout_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_total`
--

DROP TABLE IF EXISTS `sale_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_total` (
  `stId` varchar(16) NOT NULL COMMENT '销售单ID',
  `clientId` int(11) DEFAULT NULL COMMENT '客户ID',
  `createDate` datetime NOT NULL COMMENT '创表日期',
  `sendDate` datetime DEFAULT NULL COMMENT '发货日期',
  `payablePrice` double DEFAULT '0' COMMENT '应付金额',
  `realPrice` double DEFAULT '0' COMMENT '实付金额',
  `payState` int(11) DEFAULT '1' COMMENT '订单状态',
  `stockState` int(11) DEFAULT '0' COMMENT '库存状态',
  `userId` int(11) DEFAULT NULL COMMENT '操作员',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`stId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售出库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_total`
--

LOCK TABLES `sale_total` WRITE;
/*!40000 ALTER TABLE `sale_total` DISABLE KEYS */;
INSERT INTO `sale_total` VALUES ('XSDD201505140001',1,'2015-05-14 00:00:00','2015-05-17 16:10:17',105456,105456,1,1,1,''),('XSDD201505140002',1,'2015-05-14 00:00:00','2015-05-17 16:16:04',62880,62880,1,1,1,''),('XSDD201505140003',1,'2015-05-14 22:42:53','2015-05-15 15:51:25',71440,71440,1,1,1,''),('XSDD201505150001',1,'2015-05-15 15:59:36','2015-05-15 16:00:16',7988,7988,1,1,1,''),('XSDD201505150002',1,'2015-05-15 16:00:00','2015-05-15 16:01:52',57152,57152,1,1,1,''),('XSDD201505170001',2,'2015-05-17 12:09:23','2015-05-17 16:12:14',26576,26576,1,1,1,''),('XSDD201505170002',1,'2015-05-17 12:16:51','2015-05-17 16:11:04',14288,14288,1,1,1,''),('XSDD201505170003',1,'2015-05-17 16:12:44','2015-05-17 16:16:30',7988,7988,1,1,1,''),('XSDD201505170004',1,'2015-05-17 16:13:01','2015-05-17 16:17:42',31440,31440,1,1,1,''),('XSDD201505170005',2,'2015-05-17 16:17:11','2015-05-17 16:17:53',10576,10576,1,1,1,''),('XSDD201505170006',1,'2015-05-17 16:19:27','2015-05-17 16:19:53',71440,71440,1,1,1,''),('XSDD201505170007',2,'2015-05-17 16:19:43','2015-05-17 16:20:33',24864,24864,1,1,1,''),('XSDD201505170008',1,'2015-05-17 16:20:27','2015-05-17 16:21:22',55916,55916,1,1,1,'');
/*!40000 ALTER TABLE `sale_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelf`
--

DROP TABLE IF EXISTS `shelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shelf` (
  `shelfId` int(11) NOT NULL AUTO_INCREMENT COMMENT '货架ID',
  `shelfName` varchar(45) NOT NULL COMMENT '货架名称',
  `coordinate` varchar(6) NOT NULL COMMENT '货架坐标',
  PRIMARY KEY (`shelfId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='货架信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelf`
--

LOCK TABLES `shelf` WRITE;
/*!40000 ALTER TABLE `shelf` DISABLE KEYS */;
INSERT INTO `shelf` VALUES (1,'A01','1,1'),(2,'A02','1,2');
/*!40000 ALTER TABLE `shelf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelfremain`
--

DROP TABLE IF EXISTS `shelfremain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shelfremain` (
  `shelfRemainId` int(11) NOT NULL AUTO_INCREMENT COMMENT '中间表ID',
  `orderId` varchar(16) DEFAULT NULL COMMENT '各类订单ID',
  `detailId` int(11) DEFAULT NULL COMMENT '各类订单详单ID',
  `visibleRemain` int(11) DEFAULT '0' COMMENT '可见剩余量',
  `realRemain` int(11) DEFAULT '0' COMMENT '实际剩余量',
  PRIMARY KEY (`shelfRemainId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='中间表_库存信息_剩余量';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelfremain`
--

LOCK TABLES `shelfremain` WRITE;
/*!40000 ALTER TABLE `shelfremain` DISABLE KEYS */;
/*!40000 ALTER TABLE `shelfremain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `stockId` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `commodityId` int(11) NOT NULL COMMENT '商品ID',
  `storageId` int(11) NOT NULL COMMENT '仓库ID',
  `inStock` int(11) DEFAULT '0' COMMENT '入库量',
  `outStock` int(11) DEFAULT '0' COMMENT '出库量',
  `visibleStock` int(11) DEFAULT '0' COMMENT '可见销售量',
  `stockAmount` int(11) DEFAULT '0' COMMENT '库存量',
  PRIMARY KEY (`stockId`,`storageId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='库存信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (17,8,1,20,30,0,-10),(18,9,1,10,12,0,-2),(19,10,1,10,10,0,0),(20,11,2,10,10,0,0),(21,10,2,10,10,0,0),(22,9,2,10,10,0,0);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage` (
  `storageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
  `storageName` varchar(45) NOT NULL COMMENT '仓库名称',
  `address` varchar(200) DEFAULT NULL COMMENT '仓库地址',
  PRIMARY KEY (`storageId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='仓库信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,'石景山区仓库','北京市石景山区'),(2,'海淀区仓库','北京市海淀区');
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `supplierName` varchar(50) CHARACTER SET gbk NOT NULL COMMENT '供应商姓名',
  `contactPeople` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '联系人',
  `contactTel` varchar(30) DEFAULT NULL,
  `address` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '联系地址',
  `remark` varchar(200) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`supplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (8,'刘思远','刘思远','82312745','海淀区',''),(9,'刘刘刘','刘思远','','','');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `totalstock`
--

DROP TABLE IF EXISTS `totalstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totalstock` (
  `totalStockId` int(11) NOT NULL AUTO_INCREMENT,
  `commodityId` int(11) NOT NULL,
  `purchase` int(11) DEFAULT '0' COMMENT '订购量',
  `inStock` int(11) DEFAULT '0' COMMENT '入库量',
  `outStock` int(11) DEFAULT '0' COMMENT '出库量',
  `visibleStock` int(11) DEFAULT '0' COMMENT '可见销售量',
  `stockAmount` int(11) DEFAULT '0' COMMENT '库存总量',
  PRIMARY KEY (`totalStockId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='库存总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totalstock`
--

LOCK TABLES `totalstock` WRITE;
/*!40000 ALTER TABLE `totalstock` DISABLE KEYS */;
INSERT INTO `totalstock` VALUES (15,8,20,20,20,0,0),(16,9,0,20,20,0,0),(17,10,0,20,20,0,0),(18,11,0,10,10,0,0);
/*!40000 ALTER TABLE `totalstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `unitId` int(11) NOT NULL AUTO_INCREMENT COMMENT '计量单位ID',
  `unitName` varchar(50) NOT NULL COMMENT '计量单位名称',
  PRIMARY KEY (`unitId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='计量单位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (7,'台'),(8,'本'),(9,'块'),(10,'个');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `username` varchar(50) CHARACTER SET gbk NOT NULL DEFAULT '',
  `age` int(10) DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `lastUpdateDate` date DEFAULT NULL,
  `disableDate` date DEFAULT NULL,
  `usertype` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin',NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2015-05-17 17:26:18
