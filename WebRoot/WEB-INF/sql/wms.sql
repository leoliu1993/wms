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
-- Table structure for table `break_detail`
--

DROP TABLE IF EXISTS `break_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `break_detail` (
  `bdId` int(11) NOT NULL AUTO_INCREMENT COMMENT '报损详单ID',
  `btId` varchar(16) DEFAULT NULL COMMENT '报损总单ID',
  `ridId` int(11) DEFAULT NULL COMMENT '退货入库详单ID',
  `commodityId` int(11) DEFAULT NULL COMMENT '商品ID',
  `returnedAmount` int(11) DEFAULT NULL COMMENT '退货数量',
  PRIMARY KEY (`bdId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='报损详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `break_detail`
--

LOCK TABLES `break_detail` WRITE;
/*!40000 ALTER TABLE `break_detail` DISABLE KEYS */;
INSERT INTO `break_detail` VALUES (1,'BSTH201505210001',7,8,1),(2,'BSTH201505220001',8,8,1);
/*!40000 ALTER TABLE `break_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `break_stockout_detail`
--

DROP TABLE IF EXISTS `break_stockout_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `break_stockout_detail` (
  `bodId` int(11) NOT NULL AUTO_INCREMENT COMMENT '报损出库详单ID',
  `botId` varchar(16) DEFAULT NULL COMMENT '报损出库总单ID',
  `bdId` int(11) DEFAULT NULL COMMENT '报损详单ID',
  PRIMARY KEY (`bodId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='报损出库详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `break_stockout_detail`
--

LOCK TABLES `break_stockout_detail` WRITE;
/*!40000 ALTER TABLE `break_stockout_detail` DISABLE KEYS */;
INSERT INTO `break_stockout_detail` VALUES (1,'CKBS201505220001',1),(2,'CKBS201505220002',2);
/*!40000 ALTER TABLE `break_stockout_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `break_stockout_total`
--

DROP TABLE IF EXISTS `break_stockout_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `break_stockout_total` (
  `botId` varchar(16) NOT NULL COMMENT '报损出库总单ID',
  `btId` varchar(16) DEFAULT NULL COMMENT '报损总单ID',
  `createDate` datetime DEFAULT NULL COMMENT '创表日期',
  `outDate` datetime DEFAULT NULL COMMENT '出库日期',
  `userId` int(11) DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`botId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报损出库总单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `break_stockout_total`
--

LOCK TABLES `break_stockout_total` WRITE;
/*!40000 ALTER TABLE `break_stockout_total` DISABLE KEYS */;
INSERT INTO `break_stockout_total` VALUES ('CKBS201505220001','BSTH201505210001','2015-05-22 20:57:48','2015-05-22 20:57:50',1,''),('CKBS201505220002','BSTH201505220001','2015-05-22 21:11:53','2015-05-22 21:11:55',1,'');
/*!40000 ALTER TABLE `break_stockout_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `break_total`
--

DROP TABLE IF EXISTS `break_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `break_total` (
  `btId` varchar(16) NOT NULL COMMENT '报损总单ID',
  `ritId` varchar(16) DEFAULT NULL COMMENT '退货入库总单ID',
  `createDate` datetime DEFAULT NULL COMMENT '创表日期',
  `returnedDate` datetime DEFAULT NULL COMMENT '报损日期',
  `stockState` int(11) DEFAULT '0' COMMENT '库存状态',
  `userId` int(11) DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`btId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报损总单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `break_total`
--

LOCK TABLES `break_total` WRITE;
/*!40000 ALTER TABLE `break_total` DISABLE KEYS */;
INSERT INTO `break_total` VALUES ('BSTH201505210001','RKTH201505200002','2015-05-21 22:47:39','2015-05-21 22:47:41',1,1,''),('BSTH201505220001','RKTH201505220001','2015-05-22 21:11:36','2015-05-22 21:11:39',1,1,'');
/*!40000 ALTER TABLE `break_total` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'刘刘刘',0,NULL,NULL,NULL,NULL),(2,'思思思',1,NULL,NULL,NULL,NULL),(4,'远远远',3,'刘思远','18600699333','北京市海淀区','');
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
INSERT INTO `commodity` VALUES (8,'MacBook','',3,7,9288,8288,7288,6288,5,NULL,'12 英寸 (对角线) LED 背光 Retina 显示屏',NULL),(9,'MacBook Air','',3,7,6288,5288,4288,3288,10,NULL,'11.6 英寸 (对角线) LED 背光宽显示屏',NULL),(10,'MacBook Pro','',3,7,14288,13288,12288,11288,10,NULL,'15.4 英寸 (对角线) LED 背光 Retina 显示屏',NULL),(11,'iMac','',2,7,7988,6988,5988,4988,10,NULL,'21.5 英寸 (对角线) LED 背光显示屏',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commoditycategory`
--

LOCK TABLES `commoditycategory` WRITE;
/*!40000 ALTER TABLE `commoditycategory` DISABLE KEYS */;
INSERT INTO `commoditycategory` VALUES (1,'电脑',0),(2,'台式电脑',1),(3,'笔记本电脑',1),(4,'一体式电脑',1),(5,'手机',0),(6,'智能手机',5),(7,'非智能机',5);
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
INSERT INTO `instock` VALUES ('RKJH201505180001','JHDD201505180001',8,'2015-05-18 14:39:20',120000,120000,1,1,''),('RKJH201505180002','JHDD201505180002',8,'2015-05-18 14:45:31',180000,180000,1,1,''),('RKJH201505180003','JHDD201505180003',8,'2015-05-18 14:46:57',60000,60000,1,1,''),('RKJH201505180004','JHDD201505180004',8,'2015-05-18 14:53:32',120000,120000,1,1,''),('RKJH201505180005','JHDD201505180005',9,'2015-05-18 14:55:08',60000,60000,1,1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='入库详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instockgoods`
--

LOCK TABLES `instockgoods` WRITE;
/*!40000 ALTER TABLE `instockgoods` DISABLE KEYS */;
INSERT INTO `instockgoods` VALUES (1,'RKJH201505180001',1,8,6000,20,6,120000,1,2),(2,'RKJH201505180002',2,9,6000,10,0,60000,1,2),(3,'RKJH201505180002',3,10,6000,10,0,60000,2,1),(4,'RKJH201505180002',4,11,6000,10,0,60000,1,1),(5,'RKJH201505180003',5,8,6000,5,0,30000,2,2),(6,'RKJH201505180003',6,8,6000,5,0,30000,1,1),(7,'RKJH201505180004',7,8,6000,20,3,120000,1,2),(8,'RKJH201505180005',8,8,6000,10,0,60000,2,1);
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
INSERT INTO `purchase` VALUES ('JHDD201505180001',8,'2015-05-18','2015-05-25',120000,120000,1,1,1,''),('JHDD201505180002',8,'2015-05-18','2015-05-25',180000,180000,1,1,1,''),('JHDD201505180003',8,'2015-05-18','2015-05-25',60000,60000,1,1,1,''),('JHDD201505180004',8,'2015-05-18','2015-05-25',120000,120000,1,1,1,''),('JHDD201505180005',9,'2015-05-18','2015-05-25',60000,60000,1,1,1,''),('JHDD201505190001',8,'2015-05-19','2015-05-26',100000,100000,1,0,1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='进购退货详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_returned_detail`
--

LOCK TABLES `purchase_returned_detail` WRITE;
/*!40000 ALTER TABLE `purchase_returned_detail` DISABLE KEYS */;
INSERT INTO `purchase_returned_detail` VALUES (1,'THJH201505180001',1,8,6000,3,18000),(2,'THJH201505180002',1,8,6000,3,18000),(3,'THJH201505180003',7,8,6000,3,18000);
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
INSERT INTO `purchase_returned_total` VALUES ('THJH201505180001','RKJH201505180001','2015-05-18 14:40:13',18000,1,1,''),('THJH201505180002','RKJH201505180001','2015-05-18 14:42:22',18000,1,1,''),('THJH201505180003','RKJH201505180004','2015-05-18 15:00:46',18000,1,1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='进货单商品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasegoods`
--

LOCK TABLES `purchasegoods` WRITE;
/*!40000 ALTER TABLE `purchasegoods` DISABLE KEYS */;
INSERT INTO `purchasegoods` VALUES (1,'JHDD201505180001',8,6000,20,120000,6),(2,'JHDD201505180002',9,6000,10,60000,0),(3,'JHDD201505180002',10,6000,10,60000,0),(4,'JHDD201505180002',11,6000,10,60000,0),(5,'JHDD201505180003',8,6000,5,30000,0),(6,'JHDD201505180003',8,6000,5,30000,0),(7,'JHDD201505180004',8,6000,20,120000,3),(8,'JHDD201505180005',8,6000,10,60000,0),(9,'JHDD201505190001',9,5000,10,50000,0),(10,'JHDD201505190001',9,5000,10,50000,0);
/*!40000 ALTER TABLE `purchasegoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_stockin_detail`
--

DROP TABLE IF EXISTS `return_stockin_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_stockin_detail` (
  `ridId` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货入库详单ID',
  `ritId` varchar(16) DEFAULT NULL COMMENT '退货入库总单ID',
  `srdId` int(11) DEFAULT NULL COMMENT '退货详单ID',
  `commodityId` int(11) DEFAULT NULL COMMENT '商品ID',
  `amount` int(11) DEFAULT '0' COMMENT '进货数量',
  `returnedAmount` int(11) DEFAULT NULL COMMENT '退货数量',
  `storageId` int(11) DEFAULT NULL COMMENT '仓库ID',
  `shelfId` int(11) DEFAULT NULL COMMENT '货架ID',
  PRIMARY KEY (`ridId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='退货入库详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_stockin_detail`
--

LOCK TABLES `return_stockin_detail` WRITE;
/*!40000 ALTER TABLE `return_stockin_detail` DISABLE KEYS */;
INSERT INTO `return_stockin_detail` VALUES (6,'RKTH201505200001',3,8,1,0,2,1),(7,'RKTH201505200002',4,8,2,1,2,2),(8,'RKTH201505220001',5,8,1,1,2,1);
/*!40000 ALTER TABLE `return_stockin_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_stockin_total`
--

DROP TABLE IF EXISTS `return_stockin_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_stockin_total` (
  `ritId` varchar(16) NOT NULL COMMENT '销售退货入库总单ID',
  `srtId` varchar(16) DEFAULT NULL COMMENT '销售退货总单ID',
  `createDate` datetime DEFAULT NULL COMMENT '创表日期',
  `receivedDate` datetime DEFAULT NULL COMMENT '收货日期',
  `userId` int(11) DEFAULT NULL COMMENT '操作员ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ritId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售退货入库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_stockin_total`
--

LOCK TABLES `return_stockin_total` WRITE;
/*!40000 ALTER TABLE `return_stockin_total` DISABLE KEYS */;
INSERT INTO `return_stockin_total` VALUES ('RKTH201505200001','THXS201505190004','2015-05-20 11:27:23','2015-05-20 11:27:30',1,''),('RKTH201505200002','THXS201505200001','2015-05-20 19:11:37','2015-05-20 19:11:39',1,''),('RKTH201505220001','THXS201505220001','2015-05-22 21:11:12','2015-05-22 21:11:14',1,'');
/*!40000 ALTER TABLE `return_stockin_total` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='进货退货出库详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_stockout_detail`
--

LOCK TABLES `return_stockout_detail` WRITE;
/*!40000 ALTER TABLE `return_stockout_detail` DISABLE KEYS */;
INSERT INTO `return_stockout_detail` VALUES (1,'CKTH201505180001',1),(2,'CKTH201505180002',2),(3,'CKTH201505180003',3);
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
INSERT INTO `return_stockout_total` VALUES ('CKTH201505180001','THJH201505180001','2015-05-18 14:40:42',1,NULL),('CKTH201505180002','THJH201505180002','2015-05-18 14:43:50',1,NULL),('CKTH201505180003','THJH201505180003','2015-05-18 15:02:08',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='销售单商品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_detail`
--

LOCK TABLES `sale_detail` WRITE;
/*!40000 ALTER TABLE `sale_detail` DISABLE KEYS */;
INSERT INTO `sale_detail` VALUES (1,'XSDD201505180001',8,9288,3,27864,3),(2,'XSDD201505180002',8,9288,3,27864,0),(3,'XSDD201505180003',8,9288,10,92880,1),(4,'XSDD201505180004',8,9288,8,74304,0),(5,'XSDD201505180005',8,8288,5,41440,0),(6,'XSDD201505180005',10,13288,3,39864,0),(7,'XSDD201505180006',9,6288,3,18864,1),(8,'XSDD201505180006',11,7988,3,23964,1),(9,'XSDD201505180007',9,6288,2,12576,0),(10,'XSDD201505180007',11,7988,2,15976,0),(11,'XSDD201505180008',9,6288,1,6288,0),(12,'XSDD201505180008',11,7988,1,7988,0),(13,'XSDD201505180009',8,9288,5,46440,0),(14,'XSDD201505180010',8,9288,3,27864,0),(15,'XSDD201505190001',8,8288,2,16576,0),(16,'XSDD201505190002',8,9288,2,18576,0),(17,'XSDD201505190003',8,9288,5,46440,0),(18,'XSDD201505190004',8,9288,3,27864,0),(23,'XSDD201505200001',8,9288,16,148608,0),(24,'XSDD201505200002',8,9288,1,9288,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='销售单_商品来源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_detail_source`
--

LOCK TABLES `sale_detail_source` WRITE;
/*!40000 ALTER TABLE `sale_detail_source` DISABLE KEYS */;
INSERT INTO `sale_detail_source` VALUES (1,'XSDD201505180001',1,1,3),(2,'XSDD201505180002',2,1,3),(3,'XSDD201505180003',3,1,8),(4,'XSDD201505180003',3,5,2),(5,'XSDD201505180004',4,5,3),(6,'XSDD201505180004',4,6,5),(7,'XSDD201505180005',5,7,5),(8,'XSDD201505180005',6,3,3),(9,'XSDD201505180006',7,2,3),(10,'XSDD201505180006',8,4,3),(11,'XSDD201505180007',9,2,2),(12,'XSDD201505180007',10,4,2),(13,'XSDD201505180008',11,2,1),(14,'XSDD201505180008',12,4,1),(15,'XSDD201505180009',13,7,5),(16,'XSDD201505180010',14,7,3),(17,'XSDD201505190001',15,7,2),(18,'XSDD201505190002',16,7,2),(19,'XSDD201505190003',17,7,5),(20,'XSDD201505190004',18,7,3),(28,'XSDD201505200001',23,7,5),(29,'XSDD201505200001',23,8,10),(30,'XSDD201505200001',23,12,1),(34,'XSDD201505200002',24,13,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='销售退货详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_return_detail`
--

LOCK TABLES `sale_return_detail` WRITE;
/*!40000 ALTER TABLE `sale_return_detail` DISABLE KEYS */;
INSERT INTO `sale_return_detail` VALUES (1,'THXS201505190003',7,6288,1,6288),(2,'THXS201505190003',8,7988,1,7988),(3,'THXS201505190004',1,9288,1,9288),(4,'THXS201505200001',1,9288,2,18576),(5,'THXS201505220001',3,9288,1,9288);
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
  `returnedPrice` double DEFAULT NULL,
  `stockState` int(11) DEFAULT NULL,
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
INSERT INTO `sale_return_total` VALUES ('THXS201505180001','XSDD201505180009','2015-05-18 18:38:52','2015-05-18 18:38:54',NULL,0,1,1,''),('THXS201505180002','XSDD201505180010','2015-05-18 18:44:34','2015-05-18 18:44:36',NULL,0,1,1,''),('THXS201505190001','XSDD201505190001','2015-05-19 09:33:25','2015-05-19 09:33:28',NULL,0,1,1,''),('THXS201505190002','XSDD201505190004','2015-05-19 13:28:34','2015-05-19 13:28:41',NULL,0,1,1,''),('THXS201505190003','XSDD201505180006','2015-05-19 14:57:56','2015-05-19 14:57:59',NULL,14276,0,1,''),('THXS201505190004','XSDD201505180001','2015-05-19 16:27:55','2015-05-19 16:27:58','2015-05-20 11:27:30',9288,1,1,''),('THXS201505200001','XSDD201505180001','2015-05-20 19:11:01','2015-05-20 19:11:03','2015-05-20 19:11:39',18576,1,1,''),('THXS201505220001','XSDD201505180003','2015-05-22 21:10:27','2015-05-22 21:10:29','2015-05-22 21:11:14',9288,1,1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='销售出库详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_stockout_detail`
--

LOCK TABLES `sale_stockout_detail` WRITE;
/*!40000 ALTER TABLE `sale_stockout_detail` DISABLE KEYS */;
INSERT INTO `sale_stockout_detail` VALUES (1,'CKXS201505180001',1),(2,'CKXS201505180002',2),(3,'CKXS201505180003',3),(4,'CKXS201505180004',4),(5,'CKXS201505180005',5),(6,'CKXS201505180005',6),(7,'CKXS201505180006',7),(8,'CKXS201505180006',8),(9,'CKXS201505180007',9),(10,'CKXS201505180007',10),(12,'CKXS201505180008',11),(13,'CKXS201505180008',12),(14,'CKXS201505190001',16),(15,'CKXS201505190002',17),(20,'CKXS201505200001',24),(21,'CKXS201505220001',23);
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
INSERT INTO `sale_stockout_total` VALUES ('CKXS201505180001','XSDD201505180001','2015-05-18 14:41:49','2015-05-18 14:41:51',1,''),('CKXS201505180002','XSDD201505180002','2015-05-18 14:43:23','2015-05-18 14:43:25',1,''),('CKXS201505180003','XSDD201505180003','2015-05-18 14:51:01','2015-05-18 14:51:03',1,''),('CKXS201505180004','XSDD201505180004','2015-05-18 14:52:37','2015-05-18 14:52:40',1,''),('CKXS201505180005','XSDD201505180005','2015-05-18 15:01:39','2015-05-18 15:01:43',1,''),('CKXS201505180006','XSDD201505180006','2015-05-18 15:17:22','2015-05-18 15:17:25',1,''),('CKXS201505180007','XSDD201505180007','2015-05-18 15:26:43','2015-05-18 15:26:46',1,''),('CKXS201505180008','XSDD201505180008','2015-05-18 16:05:39','2015-05-18 16:05:41',1,''),('CKXS201505190001','XSDD201505190002','2015-05-19 11:31:14','2015-05-19 11:31:16',1,''),('CKXS201505190002','XSDD201505190003','2015-05-19 13:21:22','2015-05-19 13:21:26',1,''),('CKXS201505200001','XSDD201505200002','2015-05-20 22:08:49','2015-05-20 22:08:51',1,''),('CKXS201505220001','XSDD201505200001','2015-05-22 21:03:24','2015-05-22 21:03:26',1,'');
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
INSERT INTO `sale_total` VALUES ('XSDD201505180001',1,'2015-05-18 14:41:07','2015-05-18 14:41:51',27864,27864,1,1,1,''),('XSDD201505180002',1,'2015-05-18 14:41:21','2015-05-18 14:43:25',27864,27864,1,1,1,''),('XSDD201505180003',1,'2015-05-18 14:49:26','2015-05-18 14:51:03',92880,92880,1,1,1,''),('XSDD201505180004',1,'2015-05-18 14:49:39','2015-05-18 14:52:40',74304,74304,1,1,1,''),('XSDD201505180005',2,'2015-05-18 14:59:30','2015-05-18 15:01:43',81304,81304,1,1,1,''),('XSDD201505180006',1,'2015-05-18 14:59:52','2015-05-18 15:17:25',42828,42828,1,1,1,''),('XSDD201505180007',1,'2015-05-18 15:25:43','2015-05-18 15:26:46',28552,28552,1,1,1,''),('XSDD201505180008',1,'2015-05-18 15:26:10','2015-05-18 16:05:41',14276,14276,1,1,1,''),('XSDD201505180009',1,'2015-05-18 18:18:44',NULL,46440,46440,1,2,1,''),('XSDD201505180010',1,'2015-05-18 18:44:00',NULL,27864,27864,1,2,1,''),('XSDD201505190001',2,'2015-05-19 09:29:41',NULL,16576,16576,1,2,1,''),('XSDD201505190002',1,'2015-05-19 11:30:33','2015-05-19 11:31:16',18576,18576,1,1,1,''),('XSDD201505190003',1,'2015-05-19 13:19:46','2015-05-19 13:21:26',46440,46440,1,1,1,''),('XSDD201505190004',1,'2015-05-19 13:21:00',NULL,27864,27864,1,2,1,''),('XSDD201505200001',1,'2015-05-20 18:43:33','2015-05-22 21:03:26',148608,148608,1,1,1,''),('XSDD201505200002',1,'2015-05-20 19:10:52','2015-05-20 22:08:51',9288,9288,1,1,1,'');
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
  `coordinate` varchar(6) DEFAULT NULL COMMENT '货架坐标',
  PRIMARY KEY (`shelfId`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='货架信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelf`
--

LOCK TABLES `shelf` WRITE;
/*!40000 ALTER TABLE `shelf` DISABLE KEYS */;
INSERT INTO `shelf` VALUES (1,'A01','1,1'),(2,'A02','1,2'),(3,'A03',NULL),(4,'A04',NULL),(5,'A05',NULL),(6,'A06',NULL),(7,'A07',NULL),(8,'A08',NULL),(9,'A09',NULL),(10,'A10',NULL),(11,'B01',NULL),(12,'B02',NULL),(13,'B03',NULL),(14,'B04',NULL),(15,'B05',NULL),(16,'B06',NULL),(17,'B07',NULL),(18,'B08',NULL),(19,'B09',NULL),(20,'B10',NULL),(21,'C01',NULL),(22,'C02',NULL),(23,'C03',NULL),(24,'C04',NULL),(25,'C05',NULL),(26,'C06',NULL),(27,'C07',NULL),(28,'C08',NULL),(29,'C09',NULL),(30,'C10',NULL),(31,'D01',NULL),(32,'D02',NULL),(33,'D03',NULL),(34,'D04',NULL),(35,'D05',NULL),(36,'D06',NULL),(37,'D07',NULL),(38,'D08',NULL),(39,'D09',NULL),(40,'D10',NULL),(41,'E01',NULL),(42,'E02',NULL),(43,'E03',NULL),(44,'E04',NULL),(45,'E05',NULL),(46,'E06',NULL),(47,'E07',NULL),(48,'E08',NULL),(49,'E09',NULL),(50,'E10',NULL),(51,'F01',NULL),(52,'F02',NULL),(53,'F03',NULL),(54,'F04',NULL),(55,'F05',NULL),(56,'F06',NULL),(57,'F07',NULL),(58,'F08',NULL),(59,'F09',NULL),(60,'F10',NULL),(61,'G01',NULL),(62,'G02',NULL),(63,'G03',NULL),(64,'G04',NULL),(65,'G05',NULL),(66,'G06',NULL),(67,'G07',NULL),(68,'G08',NULL),(69,'G09',NULL),(70,'G10',NULL),(71,'H01',NULL),(72,'H02',NULL),(73,'H03',NULL),(74,'H04',NULL),(75,'H05',NULL),(76,'H06',NULL),(77,'H07',NULL),(78,'H08',NULL),(79,'H09',NULL),(80,'H10',NULL),(81,'I01',NULL),(82,'I02',NULL),(83,'I03',NULL),(84,'I04',NULL),(85,'I05',NULL),(86,'I06',NULL),(87,'I07',NULL),(88,'I08',NULL),(89,'I09',NULL),(90,'I10',NULL),(91,'J01',NULL),(92,'J02',NULL),(93,'J03',NULL),(94,'J04',NULL),(95,'J05',NULL),(96,'J06',NULL),(97,'J07',NULL),(98,'J08',NULL),(99,'J09',NULL),(100,'J10',NULL);
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
  `commodityId` int(11) DEFAULT NULL COMMENT '商品ID',
  `visibleRemain` int(11) DEFAULT '0' COMMENT '可见剩余量',
  `realRemain` int(11) DEFAULT '0' COMMENT '实际剩余量',
  PRIMARY KEY (`shelfRemainId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='中间表_库存信息_剩余量';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelfremain`
--

LOCK TABLES `shelfremain` WRITE;
/*!40000 ALTER TABLE `shelfremain` DISABLE KEYS */;
INSERT INTO `shelfremain` VALUES (2,'RKJH201505180002',2,9,4,4),(3,'RKJH201505180002',3,10,7,7),(4,'RKJH201505180002',4,11,4,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='库存信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,8,1,45,45,0,0),(2,9,1,10,6,4,4),(3,10,2,10,3,7,7),(4,11,1,10,6,4,4),(5,8,2,19,18,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (8,'A公司','刘思远','82318888','海淀区',''),(9,'B公司','刘思远','18600699333','西城区',''),(10,'C公司','刘思远','18518899770','石景山区','C客户的公司');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='库存总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totalstock`
--

LOCK TABLES `totalstock` WRITE;
/*!40000 ALTER TABLE `totalstock` DISABLE KEYS */;
INSERT INTO `totalstock` VALUES (1,8,0,64,63,0,0),(2,9,20,10,6,4,4),(3,10,0,10,3,7,7),(4,11,0,10,6,4,4);
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
  `sex` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `disableDate` datetime DEFAULT NULL,
  `usertype` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin',20,1,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2015-05-26 14:54:17
