-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Lun 18 Mars 2019 à 11:11
-- Version du serveur :  5.5.42
-- Version de PHP :  5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `resto`
--

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

CREATE TABLE `booking` (
  `Id` int(11) NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingTime` time NOT NULL,
  `NumberOfSeats` tinyint(4) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `CreationTimestamp` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `booking`
--

INSERT INTO `booking` (`Id`, `BookingDate`, `BookingTime`, `NumberOfSeats`, `User_Id`, `CreationTimestamp`) VALUES
(27, '2019-01-04', '12:00:00', 4, 21, '2019-03-15 17:05:43'),
(28, '2020-03-05', '20:00:00', 1, 22, '2019-03-18 10:59:51');

-- --------------------------------------------------------

--
-- Structure de la table `meal`
--

CREATE TABLE `meal` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Photo` varchar(30) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `QuantityInStock` tinyint(4) NOT NULL,
  `BuyPrice` double NOT NULL,
  `SalePrice` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `meal`
--

INSERT INTO `meal` (`Id`, `Name`, `Photo`, `Description`, `QuantityInStock`, `BuyPrice`, `SalePrice`) VALUES
(1, 'Cheeseburger', 'cheeseburger.png', 'Recette Original\r\nFromage affiné, viande bovine de qualité et légumes frais le top du top ! Idéal avant une après-midi de PHP', 120, 0.7, 3.8),
(5, 'hotdog', 'hotdog.png', 'Pour le repas parfait rapide et efficace pour les meilleurs compétiteurs en Ajax ! ;)', 45, 0.5, 3),
(11, 'Jus d''orange', 'juice.png', 'Jus d''orange pressé à la demande !\r\nIdéal pour faire le plein de vitamine C et devenir un Dev Invensible ', 1, 0.15, 4.5),
(12, 'Muffin', 'muffin.png', 'Un de nos best. Toujours en quantité limité. Réserver en cas de gros Bug !!', 5, 1.2, 5.1),
(13, 'Popcorn', 'popcorn.png', 'A savourer sans modération !', 0, 1.3, 5.8),
(14, 'Sandwich', 'sandwich.png', 'Sandwich fait à la demande pour garder toute sa fraicheur!', 0, 0, 0),
(15, 'PopCorn ', 'popcorn.png', 'A consommer sans modération source d''énergie rapide et efficace !', 22, 1.3, 5.2),
(16, 'Club Sandwich', 'sandwich.png', 'Sandwich fait à la demande pour garder toute sa fraicheur', 20, 0.9, 4.8);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `TotalAmount` double DEFAULT NULL,
  `TaxRate` float DEFAULT NULL,
  `TaxAmount` double DEFAULT NULL,
  `CreationTimestamp` datetime DEFAULT NULL,
  `CompleteTimestamp` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `order`
--

INSERT INTO `order` (`Id`, `User_Id`, `TotalAmount`, `TaxRate`, `TaxAmount`, `CreationTimestamp`, `CompleteTimestamp`) VALUES
(7, 21, 21.2, 20, 4.24, '2019-03-15 17:05:26', '2019-03-15 17:05:26'),
(8, 21, 21.2, 20, 4.24, '2019-03-15 17:09:18', '2019-03-15 17:09:18'),
(9, 22, 99.7, 20, 19.94, '2019-03-18 10:59:27', '2019-03-18 10:59:27');

-- --------------------------------------------------------

--
-- Structure de la table `orderline`
--

CREATE TABLE `orderline` (
  `Id` int(11) NOT NULL,
  `QuantityOrdered` int(4) NOT NULL,
  `Meal_Id` int(11) NOT NULL,
  `Order_Id` int(11) NOT NULL,
  `PriceEach` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `orderline`
--

INSERT INTO `orderline` (`Id`, `QuantityOrdered`, `Meal_Id`, `Order_Id`, `PriceEach`) VALUES
(16, 5, 1, 7, 3),
(17, 1, 5, 7, 6.2),
(18, 5, 1, 8, 3),
(19, 1, 5, 8, 6.2),
(20, 11, 11, 9, 4.5),
(21, 5, 1, 9, 3.8),
(22, 7, 5, 9, 3),
(23, 2, 12, 9, 5.1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `BirthDate` date NOT NULL,
  `Address` varchar(250) NOT NULL,
  `City` varchar(40) NOT NULL,
  `ZipCode` char(5) NOT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `Phone` char(10) NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  `LastLoginTimestamp` datetime DEFAULT NULL,
  `Admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`Id`, `FirstName`, `LastName`, `Email`, `Password`, `BirthDate`, `Address`, `City`, `ZipCode`, `Country`, `Phone`, `CreationTimestamp`, `LastLoginTimestamp`, `Admin`) VALUES
(21, 'yayou', 'yayou', 'yayou@gmail.com', '$2y$11$5f0416cbdf4f87581281cOdOR8dUmS50xU0RSAv6sCwjvW3aSRVtG', '1940-01-01', '', '', '', '', '', '2019-03-15 17:04:36', '2019-03-15 17:04:59', 1),
(22, 'yazz', 'yazz', 'yazz@gmail.com', '$2y$11$f6bfe56691ca6310a8fcfulIw3AFhrayvjV/MJZH0pDLfpEdk.aqK', '1940-01-01', '', '', '', '', '', '2019-03-18 10:58:55', '2019-03-18 10:59:15', NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- Index pour la table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- Index pour la table `orderline`
--
ALTER TABLE `orderline`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UniciteMealOrder` (`Meal_Id`,`Order_Id`),
  ADD KEY `Meal_Id` (`Meal_Id`),
  ADD KEY `Order_Id` (`Order_Id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `booking`
--
ALTER TABLE `booking`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `meal`
--
ALTER TABLE `meal`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `orderline`
--
ALTER TABLE `orderline`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `orderline`
--
ALTER TABLE `orderline`
  ADD CONSTRAINT `OrderLine_ibfk_1` FOREIGN KEY (`Meal_Id`) REFERENCES `meal` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderLine_ibfk_2` FOREIGN KEY (`Order_Id`) REFERENCES `order` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
