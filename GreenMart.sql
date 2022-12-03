-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: GreenMart
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `TotalPrice` decimal(5,2) DEFAULT NULL,
  `OrderID` int NOT NULL,
  PRIMARY KEY (`CartID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (1,57.40,1),(2,831.20,2),(3,223.00,3),(4,96.40,4),(5,77.00,5),(6,11.50,6),(7,563.20,7),(8,355.00,8),(9,71.00,9),(10,96.70,10);
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartDetails`
--

DROP TABLE IF EXISTS `CartDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartDetails` (
  `CartDetailsID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`CartDetailsID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `cartdetails_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartDetails`
--

LOCK TABLES `CartDetails` WRITE;
/*!40000 ALTER TABLE `CartDetails` DISABLE KEYS */;
INSERT INTO `CartDetails` VALUES (1,1,4),(2,1,4),(3,5,4),(4,3,6),(5,2,1),(6,8,2),(7,4,1),(8,3,5),(9,2,6),(10,7,4);
/*!40000 ALTER TABLE `CartDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CName` varchar(50) NOT NULL,
  `DescripPhoto` varchar(250) DEFAULT NULL,
  `CatAdd` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CName` (`CName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Bakery','./Categories-Picture/bakery.jpg','Bakery.jsp'),(2,'Beverages','./Categories-Picture/beverages.jpg','Beverages.jsp'),(3,'Condiments and Sauces','./Categories-Picture/condiments-and-sauces.jpg','Condiments.jsp'),(4,'Daily','./Categories-Picture/daily.jpg','Daily.jsp'),(5,'Vegetables','./Categories-Picture/vegetables.jpg','Vegatables.jsp'),(6,'Dry Goods and Pasta','./Categories-Picture/dry-good-and-pasta.jpg','DryGoodsAndPasta.jsp'),(7,'Frozen','.Categories-Picture/frozen.jpg','Frozen.jsp'),(8,'Fruits','./Categories-Picture/fruit.jpg','Fruit.jsp'),(9,'Meat and Seafoods','./Categories-Picture/meat.jpg','Meat.jsp'),(10,'Snack','./Categories-Picture/snacks.jpg','Snack.jsp');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Classified_As`
--

DROP TABLE IF EXISTS `Classified_As`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Classified_As` (
  `ProductID` int NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`ProductID`,`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classified_As`
--

LOCK TABLES `Classified_As` WRITE;
/*!40000 ALTER TABLE `Classified_As` DISABLE KEYS */;
INSERT INTO `Classified_As` VALUES (1,1),(2,1),(3,6),(4,3),(5,3),(6,4),(7,4),(8,2),(9,10),(10,8);
/*!40000 ALTER TABLE `Classified_As` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detailed_By`
--

DROP TABLE IF EXISTS `Detailed_By`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detailed_By` (
  `CartID` int NOT NULL,
  `CartDetailsID` int NOT NULL,
  PRIMARY KEY (`CartID`,`CartDetailsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detailed_By`
--

LOCK TABLES `Detailed_By` WRITE;
/*!40000 ALTER TABLE `Detailed_By` DISABLE KEYS */;
INSERT INTO `Detailed_By` VALUES (1,1),(1,4),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `Detailed_By` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Is_Placed`
--

DROP TABLE IF EXISTS `Is_Placed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Is_Placed` (
  `OrderID` int NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Is_Placed`
--

LOCK TABLES `Is_Placed` WRITE;
/*!40000 ALTER TABLE `Is_Placed` DISABLE KEYS */;
INSERT INTO `Is_Placed` VALUES (1,2),(2,3),(3,1),(4,2),(5,5),(6,4),(7,10),(8,8),(9,9),(10,1);
/*!40000 ALTER TABLE `Is_Placed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Made_With`
--

DROP TABLE IF EXISTS `Made_With`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Made_With` (
  `OrderID` int NOT NULL,
  `CartID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`CartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Made_With`
--

LOCK TABLES `Made_With` WRITE;
/*!40000 ALTER TABLE `Made_With` DISABLE KEYS */;
INSERT INTO `Made_With` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `Made_With` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `CreatedDate` date DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,2,'Completed','2022-09-01'),(2,3,'Completed','2022-09-02'),(3,1,'Completed','2022-09-11'),(4,2,'Completed','2022-10-08'),(5,5,'Shipped','2022-10-10'),(6,4,'Shipped','2022-10-11'),(7,10,'Shipped','2022-10-15'),(8,8,'Processing','2022-10-30'),(9,9,'Processing','2022-10-30'),(10,1,'Processing','2022-11-01');
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `CategoryID` int NOT NULL,
  `PName` varchar(50) NOT NULL,
  `Quantity` int NOT NULL DEFAULT (1000),
  `Price` decimal(5,2) DEFAULT NULL,
  `Description` varchar(350) DEFAULT NULL,
  `Photo` varchar(250) DEFAULT NULL,
  `ItemPageAdd` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `PName` (`PName`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,1,'San Luis Sourdough Sourdough Bread',999,5.19,'./Products/San-Luis-Sourdough-Sourdough-Bread/San-Luis-Sourdough-Sourdough-Bread.txt','./Products/San-Luis-Sourdough-Sourdough-Bread/San-Luis-Sourdough-Sourdough-Bread.jpg','./Products/San-Luis-Sourdough-Sourdough-Bread/San-Luis-Sourdough-Sourdough-Bread.html'),(2,1,'Arnold Whole Grains 100% Whole Wheat Bread',999,5.19,'./Products/Arnold-Whole-Grains-100%-Whole-Wheat-Bread/Arnold-Whole-Grains-100%-Whole-Wheat-Bread.txt','./Products/Arnold-Whole-Grains-100%-Whole-Wheat-Bread/Arnold-Whole-Grains-100%-Whole-Wheat-Bread.txt.jpg','./Products/Arnold-Whole-Grains-100%-Whole-Wheat-Bread/Arnold-Whole-Grains-100%-Whole-Wheat-Bread.html'),(3,6,'Barilla Classic Blue Box Pasta Penne',1000,2.89,'./Products/Barilla-Classic-Blue-Box-Pasta-Penne/Barilla-Classic-Blue-Box-Pasta-Penne.txt','./Products/Barilla-Classic-Blue-Box-Pasta-Penne/Barilla-Classic-Blue-Box-Pasta-Penne.jpg','./Products/Barilla-Classic-Blue-Box-Pasta-Penne/Barilla-Classic-Blue-Box-Pasta-Penne.html'),(4,3,'Heinz Tomato Ketchup',1000,7.49,'./Products/Heinz-Tomato-Ketchup/Heinz-Tomato-Ketchup.txt','./Products/Heinz-Tomato-Ketchup/Heinz-Tomato-Ketchup.jpg','./Products/Heinz-Tomato-Ketchup/Heinz-Tomato-Ketchup.html'),(5,3,'Maille Dressings-Condiments',1000,3.49,'./Products/Maille-Dressings-Condiments/Maille-Dressings-Condiments.txt','./Products/SMaille-Dressings-Condiments/Maille-Dressings-Condiments.jpg','./Products/SMaille-Dressings-Condiments/Maille-Dressings-Condiments.html'),(6,4,'Lucerne Shredded Cheese',1000,5.19,'./Products/Lucerne-Shredded-Cheese/Lucerne-Shredded-Cheese.txt','./Products/Lucerne-Shredded-Cheese/Lucerne-Shredded-Cheese.jpg','./Products/Lucerne-Shredded-Cheese/Lucerne-Shredded-Cheese-Finely.html'),(7,4,'Lucerne Dairy farms Milk',1000,6.89,'./Products/Lucerne-Dairy-farms-Milk/Lucerne-Dairy-farms-Milk.txt','./Products/Lucerne-Dairy-farms-Milk/Lucerne-Dairy-farms-Milk.jpg','./Products/Lucerne-Dairy-farms-Milk/Lucerne-Dairy-farms-Milk.html'),(8,2,'Diet Coke Coke',1000,10.39,'./Products/Diet-Coke-Coke/Diet-Coke-Coke.txt','./Products/Diet-Coke-Coke/Diet-Coke-Coke.jpg','./Products/Diet-Coke-Coke/Diet-Coke-Coke.hml'),(9,10,'M&M Milk Chocolate Candy Sharing Size',1000,6.89,'./Products/M&M-Milk-Chocolate-Candy-Sharing-Size/M&M-Milk-Chocolate-Candy-Sharing-Size.txt','./Products/M&M-Milk-Chocolate-Candy-Sharing-Size/M&M-Milk-Chocolate-Candy-Sharing-Size.jpg','./Products/M&M-Milk-Chocolate-Candy-Sharing-Size/M&M-Milk-Chocolate-Candy-Sharing-Size.html'),(10,8,'Organic Strawberries',1000,5.19,'./Products/Organic-Strawberries/Organic-Strawberries.txt','./Products/Organic-Strawberries/Organic-Strawberries.jpg','./Products/Organic-Strawberries/Organic-Strawberries.html');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Phone` char(10) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `UserName` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Smith','Thomas','1234567890','smith225@gmail.com)','123 5ft Ave, Redwood city, CA 93452','Smith225','Smith&Pass'),(2,'Johnathan','Hero','4083245783','john.here@gmail.com)','3 Columbia Rd, Hayward city, CA 95341','john443','justAPass'),(3,'Franklin','Wong','6845862843','hellofrank@gmail.com)','5631 Rice, Houston, TX','FrankW32','helloWong'),(4,'James','Borg','2347589345','borg.jame.234@gmail.com)','450 Stone, Houston, TX','jametom','Smith&Pass'),(5,'Jennifer','Wallace','6374859264','angelicajeni@gmail.com)','980 Dallas, Houston, TX','JenyAngle','dream is a dream'),(6,'Alicia','Zelaya','4082341567','zelaica@gmail.com)','291 Berry, Bellaire, TX','Zelaica','Pass of Zel'),(7,'Ahmad','Jabbar','6052341563','jabbah@gmail.com)','731 Fondren, Houston, TX','jabbah','jab knows it'),(8,'Joyce','Wang','6036275849','joyroll@gmail.com)','638 Voss, Houston, AL','joyroll','rolljoyces'),(9,'Paul','Nguyen','4062837152','paulll@gmail.com)','975 Fire Oak, Humble, NJ','PaulN','pass the course'),(10,'Ramesh','Narayan','3214562374','smith225@gmail.com)','3321 Castle, Spring, NY','ramen','ramenesh');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-03  2:59:59
