-- DataBaseLevel3FirstExercise.clients definition

CREATE TABLE `clients` (
  `ClientId` int NOT NULL AUTO_INCREMENT,
  `Surname` text NOT NULL,
  `Name` text NOT NULL,
  `ZipCode` int NOT NULL,
  `Place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shippingAddress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TelephoneNumber` int NOT NULL,
  `SuplierID` int NOT NULL,
  PRIMARY KEY (`ClientId`),
  UNIQUE KEY `clients_unique` (`TelephoneNumber`),
  UNIQUE KEY `clients_unique_1` (`ClientId`),
  KEY `clients_suplierinfo_FK` (`SuplierID`),
  CONSTRAINT `clients_suplierinfo_FK` FOREIGN KEY (`SuplierID`) REFERENCES `suplierinfo` (`SuplierId`),
  CONSTRAINT `clients_check` CHECK ((`ZipCode` < 100000)),
  CONSTRAINT `clients_check_1` CHECK ((`TelephoneNumber` < 1000000000))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- DataBaseLevel3FirstExercise.details definition

CREATE TABLE `details` (
  `DetailId` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date NOT NULL,
  `OrderTime` time NOT NULL,
  `Notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`DetailId`),
  UNIQUE KEY `details_unique` (`DetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- DataBaseLevel3FirstExercise.orders definition

CREATE TABLE `orders` (
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `ClientId` int NOT NULL,
  `DetailID` int NOT NULL,
  PRIMARY KEY (`OrderId`),
  UNIQUE KEY `orders_unique` (`productId`,`ClientId`,`DetailID`),
  KEY `orders_clients_FK` (`ClientId`),
  KEY `orders_details_FK` (`DetailID`),
  CONSTRAINT `orders_clients_FK` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`ClientId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_details_FK` FOREIGN KEY (`DetailID`) REFERENCES `details` (`DetailId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_products_FK` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- DataBaseLevel3FirstExercise.products definition

CREATE TABLE `products` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productStock` int unsigned NOT NULL DEFAULT '0',
  `productPrice` float NOT NULL,
  `SuplierId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `products_unique` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table containing all data related to products';



-- DataBaseLevel3FirstExercise.suplierinfo definition

CREATE TABLE `suplierinfo` (
  `SuplierId` int NOT NULL,
  `SupDesc` text,
  PRIMARY KEY (`SuplierId`),
  UNIQUE KEY `suplierinfo_unique` (`SuplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;