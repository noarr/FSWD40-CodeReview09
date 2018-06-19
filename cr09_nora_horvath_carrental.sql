-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2018 at 09:19 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_nora_horvath_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `agentID` int(11) NOT NULL,
  `FK_reservationID` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `FK_pickupAgencyID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `FK_pickupAgencyID`) VALUES
(1, NULL),
(2, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driverID` int(11) NOT NULL,
  `firstName` varchar(55) DEFAULT NULL,
  `lastName` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driverID`, `firstName`, `lastName`, `email`, `address`) VALUES
(1, 'Mark', 'Smith', 'mark@smith.com', '12. Hakswly road. London N16'),
(2, 'Cobain', 'Smith', 'cobaink@smith.com', '12. Hakswly road. London N16'),
(3, 'Peter', 'hakh', 'kevin@smith.com', '13. Brendon road. Berlin N16'),
(4, 'Vicky', 'Taylor', 'vtaylor@sax.com', '1-5. Erder street Liverpool L16'),
(5, 'Semer', 'Ermith', 'smer@mail.com', '234. mendnli strasse WIEN 1121');

-- --------------------------------------------------------

--
-- Table structure for table `pickupagency`
--

CREATE TABLE `pickupagency` (
  `agencyID` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `car` varchar(55) DEFAULT NULL,
  `FK_reservationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pickupagency`
--

INSERT INTO `pickupagency` (`agencyID`, `name`, `address`, `phone`, `car`, `FK_reservationID`) VALUES
(0, 'The bestrent', '123. Easke Strasse Wien 1110', 645125468, 'Mercedes S102', NULL),
(1, 'Bestrent', '123. Erbum Rd. Bristol B1230', 645871235, 'Ford Fiesta', NULL),
(2, 'Rent4fun', '57. Main street London N12', 652311254, 'Rover n34', NULL),
(3, 'Rentout', '3. Kai street London N23', 645215468, 'Ford Mondeo ', NULL),
(4, 'REntrent', '34 Bistor street Kent 2312', 545687656, 'Lancia Delta ', NULL),
(5, 'fasrent', '4. Kerton road Leets 3212', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `repair`
--

CREATE TABLE `repair` (
  `repairID` int(11) NOT NULL,
  `FK_returnagencyID` int(11) DEFAULT NULL,
  `damage` varchar(55) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `repair`
--

INSERT INTO `repair` (`repairID`, `FK_returnagencyID`, `damage`, `phone`, `price`) VALUES
(0, NULL, 'broken window', 45678975, 120),
(1, NULL, 'broken wheels', 465465123, 1012),
(2, NULL, 'empty fuel tank', 454651354, 12),
(3, NULL, 'empty fuel ', 4, NULL),
(4, NULL, 'empty fuel ', 445654653, 45),
(5, NULL, 'empty fuel ', 456546546, 54);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservationID` int(11) NOT NULL,
  `FK_driverID` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservationID`, `FK_driverID`, `date`) VALUES
(0, NULL, '2010-10-12'),
(1, NULL, '2012-01-23'),
(2, NULL, '2010-12-21'),
(3, NULL, '2011-03-21'),
(4, NULL, '2010-01-01'),
(5, NULL, '2010-02-03');

-- --------------------------------------------------------

--
-- Table structure for table `returagency`
--

CREATE TABLE `returagency` (
  `returnagencyID` int(11) NOT NULL,
  `returndate` date DEFAULT NULL,
  `FK_customerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returagency`
--

INSERT INTO `returagency` (`returnagencyID`, `returndate`, `FK_customerID`) VALUES
(0, '2013-01-02', NULL),
(1, '2013-02-04', NULL),
(2, '2013-04-02', NULL),
(4, '2013-03-02', NULL),
(5, '2013-02-04', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agentID`),
  ADD KEY `FK_reservationID` (`FK_reservationID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `FK_pickupAgencyID` (`FK_pickupAgencyID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driverID`);

--
-- Indexes for table `pickupagency`
--
ALTER TABLE `pickupagency`
  ADD PRIMARY KEY (`agencyID`),
  ADD KEY `FK_reservationID` (`FK_reservationID`);

--
-- Indexes for table `repair`
--
ALTER TABLE `repair`
  ADD PRIMARY KEY (`repairID`),
  ADD KEY `FK_returnagencyID` (`FK_returnagencyID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationID`),
  ADD KEY `FK_driverID` (`FK_driverID`);

--
-- Indexes for table `returagency`
--
ALTER TABLE `returagency`
  ADD PRIMARY KEY (`returnagencyID`),
  ADD KEY `FK_customerID` (`FK_customerID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent`
--
ALTER TABLE `agent`
  ADD CONSTRAINT `agent_ibfk_1` FOREIGN KEY (`FK_reservationID`) REFERENCES `reservation` (`reservationID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`FK_pickupAgencyID`) REFERENCES `pickupagency` (`agencyID`);

--
-- Constraints for table `pickupagency`
--
ALTER TABLE `pickupagency`
  ADD CONSTRAINT `pickupagency_ibfk_1` FOREIGN KEY (`FK_reservationID`) REFERENCES `reservation` (`reservationID`);

--
-- Constraints for table `repair`
--
ALTER TABLE `repair`
  ADD CONSTRAINT `repair_ibfk_1` FOREIGN KEY (`FK_returnagencyID`) REFERENCES `returagency` (`returnagencyID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`FK_driverID`) REFERENCES `driver` (`driverID`);

--
-- Constraints for table `returagency`
--
ALTER TABLE `returagency`
  ADD CONSTRAINT `returagency_ibfk_1` FOREIGN KEY (`FK_customerID`) REFERENCES `customer` (`customerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
