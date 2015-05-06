-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: localhost    Database: wms
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
  `contactPeople` varchar(30) DEFAULT NULL COMMENT '联系人',
  `contactTel` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
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
INSERT INTO `instock` VALUES ('CKJH201505060001',8,'2015-05-06 10:35:47',100000,100000,1,1,''),('CKJH201505060002',9,'2015-05-06 10:36:24',150000,150000,1,1,''),('CKJH201505060003',9,'2015-05-06 10:37:03',50000,50000,1,1,''),('CKJH201505060004',8,'2015-05-06 16:25:00',200000,200000,1,1,'');
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
  `commodityId` int(11) NOT NULL COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '进购价',
  `amount` int(11) DEFAULT '0' COMMENT '购进数量',
  `returnedAmount` int(11) DEFAULT '0' COMMENT '退货数量',
  `totalPrice` double DEFAULT '0' COMMENT '总价',
  `storageId` int(11) NOT NULL COMMENT '仓库ID',
  `shelfId` int(11) NOT NULL COMMENT '货架ID',
  PRIMARY KEY (`inStockgoodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='入库详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instockgoods`
--

LOCK TABLES `instockgoods` WRITE;
/*!40000 ALTER TABLE `instockgoods` DISABLE KEYS */;
INSERT INTO `instockgoods` VALUES (15,'CKJH201505060001',8,5000,10,0,50000,1,0),(16,'CKJH201505060001',9,5000,10,0,50000,2,0),(17,'CKJH201505060002',10,10000,10,0,100000,1,0),(18,'CKJH201505060002',9,5000,10,0,50000,2,0),(19,'CKJH201505060003',9,5000,10,0,50000,1,0),(20,'CKJH201505060004',10,10000,20,0,200000,1,2);
/*!40000 ALTER TABLE `instockgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instockremain`
--

DROP TABLE IF EXISTS `instockremain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instockremain` (
  `inStockRemainId` int(11) NOT NULL AUTO_INCREMENT COMMENT '中间表ID',
  `inStockgoodsId` int(11) NOT NULL COMMENT '入库详单ID',
  `remain` int(11) DEFAULT '0' COMMENT '剩余量',
  PRIMARY KEY (`inStockRemainId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='中间表_入库信息_剩余量';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instockremain`
--

LOCK TABLES `instockremain` WRITE;
/*!40000 ALTER TABLE `instockremain` DISABLE KEYS */;
INSERT INTO `instockremain` VALUES (1,20,20);
/*!40000 ALTER TABLE `instockremain` ENABLE KEYS */;
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
INSERT INTO `purchase` VALUES ('JHDD201505060001',8,'2015-05-06','2015-05-13',100000,100000,1,1,1,''),('JHDD201505060002',9,'2015-05-06','2015-05-13',150000,150000,1,1,1,''),('JHDD201505060003',9,'2015-05-06','2015-05-13',50000,50000,1,1,1,''),('JHDD201505060004',8,'2015-05-06','2015-05-13',200000,200000,1,1,1,''),('JHDD201505060005',8,'2015-05-06','2015-05-13',50000,50000,1,0,1,'');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='进货单商品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasegoods`
--

LOCK TABLES `purchasegoods` WRITE;
/*!40000 ALTER TABLE `purchasegoods` DISABLE KEYS */;
INSERT INTO `purchasegoods` VALUES (21,'JHDD201505060001',8,5000,10,50000,0),(22,'JHDD201505060001',9,5000,10,50000,0),(23,'JHDD201505060002',10,10000,10,100000,0),(24,'JHDD201505060002',9,5000,10,50000,0),(25,'JHDD201505060003',9,5000,10,50000,0),(26,'JHDD201505060004',10,10000,20,200000,0),(27,'JHDD201505060005',8,5000,10,50000,0);
/*!40000 ALTER TABLE `purchasegoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `saleId` varchar(14) NOT NULL COMMENT '销售单ID',
  `clientId` int(11) DEFAULT NULL COMMENT '客户ID',
  `createDate` date NOT NULL COMMENT '创表日期',
  `payablePrice` double DEFAULT NULL COMMENT '应付金额',
  `realPrice` double DEFAULT NULL COMMENT '实付金额',
  `state` varchar(2) DEFAULT NULL COMMENT '订单状态',
  `userId` int(11) DEFAULT NULL COMMENT '操作员',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`saleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售出库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salegoods`
--

DROP TABLE IF EXISTS `salegoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salegoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售商品单ID',
  `saleId` varchar(14) NOT NULL COMMENT '销售单ID',
  `commodityId` int(11) DEFAULT NULL COMMENT '商品ID',
  `price` double DEFAULT NULL COMMENT '单价',
  `amount` int(11) DEFAULT NULL COMMENT '总量',
  `totalPrice` double DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售单商品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salegoods`
--

LOCK TABLES `salegoods` WRITE;
/*!40000 ALTER TABLE `salegoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `salegoods` ENABLE KEYS */;
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
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `stockId` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `commodityId` int(11) NOT NULL COMMENT '商品ID',
  `storageId` int(11) NOT NULL COMMENT '仓库ID',
  `shelfId` int(11) NOT NULL COMMENT '货架ID',
  `inStock` int(11) DEFAULT '0' COMMENT '入库量',
  `outStock` int(11) DEFAULT '0' COMMENT '出库量',
  `visibleStock` int(11) DEFAULT '0' COMMENT '可见销售量',
  `stockAmount` int(11) DEFAULT '0' COMMENT '库存量',
  PRIMARY KEY (`stockId`,`storageId`,`shelfId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='库存信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (6,8,1,0,10,0,10,10),(7,9,2,0,20,0,20,20),(8,10,1,0,30,0,30,30),(9,9,1,0,10,0,10,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='库存总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totalstock`
--

LOCK TABLES `totalstock` WRITE;
/*!40000 ALTER TABLE `totalstock` DISABLE KEYS */;
INSERT INTO `totalstock` VALUES (6,8,10,10,0,10,10),(7,9,0,30,0,30,30),(8,10,0,30,0,30,30);
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

-- Dump completed on 2015-05-06 21:09:52
