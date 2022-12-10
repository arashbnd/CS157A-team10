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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (1,57.40,1),(2,831.20,2),(3,223.00,3),(4,96.40,4),(5,77.00,5),(6,11.50,6),(7,563.20,7),(8,355.00,8),(9,71.00,9),(10,96.70,10),(11,10.38,11),(12,5.19,12),(13,5.19,13),(14,5.19,14),(15,15.57,15),(16,14.38,16),(17,28.26,17),(18,27.66,18),(32,9.78,32),(33,6.89,33),(34,6.89,34),(35,2.89,35),(36,18.97,36);
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartDetails`
--

DROP TABLE IF EXISTS `CartDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartDetails` (
  `CartDetailsID` int NOT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `cartdetails_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartDetails`
--

LOCK TABLES `CartDetails` WRITE;
/*!40000 ALTER TABLE `CartDetails` DISABLE KEYS */;
INSERT INTO `CartDetails` VALUES (1,1,4),(2,1,4),(3,5,4),(4,3,6),(5,2,1),(6,8,2),(7,4,1),(8,3,5),(9,2,6),(10,7,4),(11,1,1),(12,2,1),(13,2,1),(14,2,1),(15,6,1),(16,1,2),(17,2,1),(18,4,1),(19,7,1),(20,3,1),(20,7,1),(21,9,1),(22,3,1),(23,9,2),(23,10,1);
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
INSERT INTO `Category` VALUES (1,'Bakery','./Categories-Picture/bakery.jpg','Bakery.jsp'),(2,'Beverages','./Categories-Picture/beverages.jpg','Beverages.jsp'),(3,'Condiments and Sauces','./Categories-Picture/condiments-and-sauces.jpg','Condiments.jsp'),(4,'Dairy','./Categories-Picture/daily.jpg','Dairy.jsp'),(5,'Vegetables','./Categories-Picture/vegetables.jpg','Vegatables.jsp'),(6,'Dry Goods and Pasta','./Categories-Picture/dry-good-and-pasta.jpg','DryGoodsAndPasta.jsp'),(7,'Frozen','.Categories-Picture/frozen.jpg','Frozen.jsp'),(8,'Fruits','./Categories-Picture/fruit.jpg','Fruit.jsp'),(9,'Meat and Seafoods','./Categories-Picture/meat.jpg','Meat.jsp'),(10,'Snack','./Categories-Picture/snacks.jpg','Snack.jsp');
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
INSERT INTO `Detailed_By` VALUES (1,1),(1,4),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,20),(31,19),(35,22),(36,23);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,2,'Completed','2022-09-01'),(2,3,'Completed','2022-09-02'),(3,1,'Completed','2022-09-11'),(4,2,'Completed','2022-10-08'),(5,5,'Shipped','2022-10-10'),(6,4,'Shipped','2022-10-11'),(7,10,'Shipped','2022-10-15'),(8,8,'Processing','2022-10-30'),(9,9,'Processing','2022-10-30'),(10,1,'Processing','2022-11-01'),(11,1,'Processing','2022-12-03'),(12,1,'Processing','2022-12-03'),(13,1,'Processing','2022-12-03'),(14,1,'Processing','2022-12-03'),(15,1,'Processing','2022-12-06'),(16,1,'Processing','2022-12-06'),(17,1,'Processing','2022-12-09'),(18,1,'Processing','2022-12-09'),(19,1,'Processing','2022-12-09'),(20,1,'Processing','2022-12-09'),(21,1,'Processing','2022-12-09'),(22,1,'Processing','2022-12-09'),(23,1,'Processing','2022-12-09'),(24,1,'Processing','2022-12-09'),(25,1,'Processing','2022-12-09'),(26,1,'Processing','2022-12-09'),(27,1,'Processing','2022-12-09'),(28,1,'Processing','2022-12-09'),(29,1,'Processing','2022-12-09'),(30,1,'Processing','2022-12-09'),(31,1,'Processing','2022-12-09'),(32,1,'Processing','2022-12-09'),(33,1,'Processing','2022-12-09'),(34,1,'Processing','2022-12-09'),(35,1,'Processing','2022-12-09'),(36,1,'Processing','2022-12-09');
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
  `Description` varchar(500) DEFAULT NULL,
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
INSERT INTO `Products` VALUES (1,1,'San Luis Sourdough Sourdough Bread',993,5.19,'Baked with simple ingredients, no preservatives, and being non-GMO Project Verified, sourdough breads deliver great tasting, authentic California sourdough.','./Products/San-Luis-Sourdough-Sourdough-Bread/San-Luis-Sourdough-Sourdough-Bread.jpg','./Products/San-Luis-Sourdough-Sourdough-Bread/San-Luis-Sourdough-Sourdough-Bread.html'),(2,1,'Arnold Whole Grains 100% Whole Wheat Bread',995,5.19,'Oroweat Whole Grains Bread recipes blend different grains, seeds, and/or nuts to deliver on both. Our 100% Whole Wheat Bread is bursting with flavor and nutrients in every freshly baked slice. Toast a slice and top with banana and a drizzle of honey for a quick and easy breakfast. Build a turkey and avocado club with fresh veggies for a restaurant-style sandwich at home.','./Products/Arnold-Whole-Grains-100%-Whole-Wheat-Bread/Arnold-Whole-Grains-100%-Whole-Wheat-Bread.txt.jpg','./Products/Arnold-Whole-Grains-100%-Whole-Wheat-Bread/Arnold-Whole-Grains-100%-Whole-Wheat-Bread.html'),(3,6,'Barilla Classic Blue Box Pasta Penne',997,2.89,'At Barilla, we are passionate about pasta. After all, we have been pasta makers since 1877. As an Italian family-owned food company, Barilla pasta is synonymous with high quality and \"al dente\" perfection every time. Our Penne is made from the finest durum wheat and is non-GMO verified, peanut-free and suitable for a vegan or vegetarian diet.','./Products/Barilla-Classic-Blue-Box-Pasta-Penne/Barilla-Classic-Blue-Box-Pasta-Penne.jpg','./Products/Barilla-Classic-Blue-Box-Pasta-Penne/Barilla-Classic-Blue-Box-Pasta-Penne.html'),(4,3,'Heinz Tomato Ketchup',996,7.49,'Heinz Tomato Ketchup is made only from sweet, juicy, red ripe tomatoes for the signature thick and rich taste of Americas Favorite Ketchup. It is gluten free and great for those keeping Kosher to fit your preferences. Reach for our ketchup at every cookout to top your favorite burgers, hot dogs and fries. Packed in 32-ounce ketchup bottles for easy sharing, this condiment is your go-to option for gatherings and everyday meals.','./Products/Heinz-Tomato-Ketchup/Heinz-Tomato-Ketchup.jpg','./Products/Heinz-Tomato-Ketchup/Heinz-Tomato-Ketchup.html'),(5,3,'Maille Dressings-Condiments',1000,3.49,'Bring a deliciously powerful punch to your menu items with Maille Old Style Mustard. The mustard is made with crisp, whole mustard seeds that are finely ground, giving it a creamy yet grainy texture that looks as good as it tastes. Maille Old Style Mustard is kosher certified, contains no artificial colors or flavors, and is gluten-free. It comes packaged in a convenient bulk jar.','./Products/SMaille-Dressings-Condiments/Maille-Dressings-Condiments.jpg','./Products/SMaille-Dressings-Condiments/Maille-Dressings-Condiments.html'),(6,4,'Lucerne Shredded Cheese',997,5.19,'Four Cheese Blend: A blend of medium cheddar, monterey jack, asadero and queso quesadilla. 2 cups. Easy open, resealable packaging. Since 1904. Product of USA.','./Products/Lucerne-Shredded-Cheese/Lucerne-Shredded-Cheese.jpg','./Products/Lucerne-Shredded-Cheese/Lucerne-Shredded-Cheese-Finely.html'),(7,4,'Lucerne Dairy farms Milk',998,6.89,'Grade A. Vitamin D. Pasteurized. Homogenized. From cows not treated with rbST (No significant difference has been shown between milk derived from rbST-treated and non-rbST-treated cows). SmartLabel. Scan for more food information.','./Products/Lucerne-Dairy-farms-Milk/Lucerne-Dairy-farms-Milk.jpg','./Products/Lucerne-Dairy-farms-Milk/Lucerne-Dairy-farms-Milk.html'),(8,2,'Diet Coke Coke',989,10.39,'Ingredients:\nCarbonated Water, Caramel Color, Aspartame, Phosphoric Acid, Potassium Benzoate (to Protect Taste), Natural Flavors, Citric Acid, Caffeine.\nDirections:\nStore product in a cool, dry place. Protect from freezing.','./Products/Diet-Coke-Coke/Diet-Coke-Coke.jpg','./Products/Diet-Coke-Coke/Diet-Coke-Coke.hml'),(9,10,'M&M Milk Chocolate Candy Sharing Size',988,6.89,'Ingredients\nMilk Chocolate (sugar, Chocolate, Skim Milk, Cocoa Butter, Lactose, Milkfat, Soy Lecithin, Salt, Artificial And Natural Flavors), Sugar, Cornstarch, Less Than 1% -corn Syrup, Dextrin, Coloring (includes Blue 1 Lake, Yellow 6, Red 40, Yellow 5, Blue 1, Yellow 6 Lake, Red 40 Lake, Yellow 5 Lake, Blue 2 Lake, Blue 2), Carnauba Wax, Gum Acacia.','./Products/M&M-Milk-Chocolate-Candy-Sharing-Size/M&M-Milk-Chocolate-Candy-Sharing-Size.jpg','./Products/M&M-Milk-Chocolate-Candy-Sharing-Size/M&M-Milk-Chocolate-Candy-Sharing-Size.html'),(10,8,'Organic Strawberries',995,5.19,'Ingredients: Strawberries, Raw\nProduct information or packaging displayed may not be current or complete. Always refer to the physical product for the most accurate information and warnings. For additional information, contact the retailer or manufacturer. *Actual weight may vary based on seasonality and other factors. Estimated price is approximate and provided only for reference.','./Products/Organic-Strawberries/Organic-Strawberries.jpg','./Products/Organic-Strawberries/Organic-Strawberries.html');
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

-- Dump completed on 2022-12-09 22:16:42
