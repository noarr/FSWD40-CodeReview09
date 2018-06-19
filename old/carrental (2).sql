-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2018 at 04:22 PM
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
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additionalcharge`
--

CREATE TABLE `additionalcharge` (
  `additionalPriceID` int(11) NOT NULL,
  `fkrepairPrice` float NOT NULL,
  `fuelPrice` float NOT NULL,
  `extraPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `additionalcharge`
--

INSERT INTO `additionalcharge` (`additionalPriceID`, `fkrepairPrice`, `fuelPrice`, `extraPrice`) VALUES
(1, 123, 23, 0),
(2, 23, 323, 3),
(3, 32, 33, 3),
(4, 234, 23, 0),
(5, 234, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `agentID` int(55) NOT NULL,
  `firstName` varchar(55) COLLATE utf8_bin NOT NULL,
  `lastName` varchar(55) COLLATE utf8_bin NOT NULL,
  `fkagencyID` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`agentID`, `firstName`, `lastName`, `fkagencyID`) VALUES
(1, 'bela', 'afas', 0),
(2, 'werw', 'wetwet', 1),
(3, 'qwgege', 'ewewe', 0),
(4, 'werwer', 'wdvwvvv', 2),
(5, 'ttsatasasr', 'agsdfgd', 3);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `carID` int(11) NOT NULL,
  `model` varchar(20) COLLATE utf8_bin NOT NULL,
  `price` float NOT NULL,
  `engine` int(11) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`carID`, `model`, `price`, `engine`, `seats`) VALUES
(0, 'ford', 121123, 1000, 2),
(1, 'mercedes', 23241, 1600, 5),
(2, 'ford', 2341230, 1000, 3),
(3, 'kia', 234112, 1200, 4),
(4, 'trabant', 123, 400, 5);

-- --------------------------------------------------------

--
-- Table structure for table `carstatus`
--

CREATE TABLE `carstatus` (
  `carStatusID` int(11) NOT NULL,
  `available` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `location` float DEFAULT NULL,
  `fkcarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `carstatus`
--

INSERT INTO `carstatus` (`carStatusID`, `available`, `location`, `fkcarID`) VALUES
(0, 'adfddf', 0, 4),
(1, 'yes', 0, 0),
(2, 'qwrqwr', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driverID` int(11) NOT NULL,
  `firstNameDriver` varchar(55) COLLATE utf8_bin NOT NULL,
  `lastNameDriver` varchar(55) COLLATE utf8_bin NOT NULL,
  `fkLicenceNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `driverdetails`
--

CREATE TABLE `driverdetails` (
  `licenceNo` int(11) NOT NULL,
  `addressDriver` varchar(55) COLLATE utf8_bin NOT NULL,
  `phoneDriver` int(11) NOT NULL,
  `emailDriver` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceID` int(11) NOT NULL,
  `fkReservationID` int(11) NOT NULL,
  `fkCarIDinvoice` int(11) NOT NULL,
  `fkrentalIDinvoice` int(11) NOT NULL,
  `fkTripIDinvoice` int(11) NOT NULL,
  `fkAgencyIDinvoice` int(11) NOT NULL,
  `fkAdditionalPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pickup`
--

CREATE TABLE `pickup` (
  `pickupID` int(11) NOT NULL,
  `pickupLocation` varchar(55) COLLATE utf8_bin NOT NULL,
  `pickupTime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `rentalagency`
--

CREATE TABLE `rentalagency` (
  `agencyID` int(20) NOT NULL,
  `address` varchar(122) COLLATE utf8_bin NOT NULL,
  `phone` int(25) NOT NULL,
  `fkcarID` int(25) NOT NULL,
  `fkcarStatus` varchar(55) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `repair`
--

CREATE TABLE `repair` (
  `repairID` int(55) NOT NULL,
  `fkcarStatusID` int(55) NOT NULL,
  `damage` text COLLATE utf8_bin NOT NULL,
  `repairPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `rentalID` int(55) NOT NULL,
  `fkDriverID` int(55) NOT NULL,
  `fkCarID` int(55) NOT NULL,
  `fkagencyID` int(55) NOT NULL,
  `fkPickupID` int(55) NOT NULL,
  `fkReturnID` int(55) NOT NULL,
  `price` float NOT NULL,
  `reservationDate` date NOT NULL,
  `fkAgentID` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `returnID` int(11) NOT NULL,
  `returnLocation` varchar(55) COLLATE utf8_bin NOT NULL,
  `returnTime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `tripID` int(11) NOT NULL,
  `fkPickupID` int(55) NOT NULL,
  `fkReturnID` int(55) NOT NULL,
  `distance` float NOT NULL,
  `tripPrice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additionalcharge`
--
ALTER TABLE `additionalcharge`
  ADD PRIMARY KEY (`additionalPriceID`),
  ADD KEY `fkrepairPrice` (`fkrepairPrice`),
  ADD KEY `fkrepairPrice_2` (`fkrepairPrice`);

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agentID`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carID`);

--
-- Indexes for table `carstatus`
--
ALTER TABLE `carstatus`
  ADD PRIMARY KEY (`carStatusID`),
  ADD KEY `fkcarID` (`fkcarID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driverID`),
  ADD KEY `fkLicenceNo` (`fkLicenceNo`);

--
-- Indexes for table `driverdetails`
--
ALTER TABLE `driverdetails`
  ADD PRIMARY KEY (`licenceNo`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceID`),
  ADD KEY `fkReservationID` (`fkReservationID`,`fkCarIDinvoice`,`fkrentalIDinvoice`,`fkTripIDinvoice`,`fkAgencyIDinvoice`,`fkAdditionalPrice`),
  ADD KEY `fkAdditionalPrice` (`fkAdditionalPrice`),
  ADD KEY `fkAgencyIDinvoice` (`fkAgencyIDinvoice`),
  ADD KEY `fkCarIDinvoice` (`fkCarIDinvoice`),
  ADD KEY `fkrentalIDinvoice` (`fkrentalIDinvoice`),
  ADD KEY `fkTripIDinvoice` (`fkTripIDinvoice`);

--
-- Indexes for table `pickup`
--
ALTER TABLE `pickup`
  ADD PRIMARY KEY (`pickupID`),
  ADD KEY `pickupLocation` (`pickupLocation`);

--
-- Indexes for table `rentalagency`
--
ALTER TABLE `rentalagency`
  ADD PRIMARY KEY (`agencyID`),
  ADD KEY `fkcarID` (`fkcarID`),
  ADD KEY `fkcarStatus` (`fkcarStatus`);

--
-- Indexes for table `repair`
--
ALTER TABLE `repair`
  ADD PRIMARY KEY (`repairID`),
  ADD KEY `fkcarStatusID` (`fkcarStatusID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`rentalID`),
  ADD KEY `fkDriverID` (`fkDriverID`),
  ADD KEY `fkAgentID` (`fkAgentID`),
  ADD KEY `fkReturnID` (`fkReturnID`),
  ADD KEY `fkPickupID` (`fkPickupID`),
  ADD KEY `fkagencyID` (`fkagencyID`),
  ADD KEY `fkCarID` (`fkCarID`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`returnID`),
  ADD KEY `returnLocation` (`returnLocation`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`tripID`),
  ADD UNIQUE KEY `fkReturnID` (`fkReturnID`),
  ADD KEY `fkPickupID` (`fkPickupID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additionalcharge`
--
ALTER TABLE `additionalcharge`
  MODIFY `additionalPriceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `agentID` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driverID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `driverdetails`
--
ALTER TABLE `driverdetails`
  MODIFY `licenceNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup`
--
ALTER TABLE `pickup`
  MODIFY `pickupID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rentalagency`
--
ALTER TABLE `rentalagency`
  MODIFY `agencyID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repair`
--
ALTER TABLE `repair`
  MODIFY `repairID` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `rentalID` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return`
--
ALTER TABLE `return`
  MODIFY `returnID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `tripID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carstatus`
--
ALTER TABLE `carstatus`
  ADD CONSTRAINT `carstatus_ibfk_1` FOREIGN KEY (`fkcarID`) REFERENCES `car` (`carID`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`fkLicenceNo`) REFERENCES `driverdetails` (`licenceNo`);

--
-- Constraints for table `driverdetails`
--
ALTER TABLE `driverdetails`
  ADD CONSTRAINT `driverdetails_ibfk_1` FOREIGN KEY (`licenceNo`) REFERENCES `driver` (`driverID`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fkAdditionalPrice`) REFERENCES `additionalcharge` (`additionalPriceID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fkAgencyIDinvoice`) REFERENCES `rentalagency` (`agencyID`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fkCarIDinvoice`) REFERENCES `car` (`carID`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`fkrentalIDinvoice`) REFERENCES `reservation` (`rentalID`),
  ADD CONSTRAINT `invoice_ibfk_5` FOREIGN KEY (`fkTripIDinvoice`) REFERENCES `trip` (`tripID`);

--
-- Constraints for table `rentalagency`
--
ALTER TABLE `rentalagency`
  ADD CONSTRAINT `rentalagency_ibfk_1` FOREIGN KEY (`agencyID`) REFERENCES `agent` (`agentID`),
  ADD CONSTRAINT `rentalagency_ibfk_2` FOREIGN KEY (`fkcarID`) REFERENCES `car` (`carID`);

--
-- Constraints for table `repair`
--
ALTER TABLE `repair`
  ADD CONSTRAINT `repair_ibfk_1` FOREIGN KEY (`fkcarStatusID`) REFERENCES `return` (`returnID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fkagencyID`) REFERENCES `rentalagency` (`agencyID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fkAgentID`) REFERENCES `agent` (`agentID`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fkCarID`) REFERENCES `car` (`carID`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`fkDriverID`) REFERENCES `driver` (`driverID`),
  ADD CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`fkPickupID`) REFERENCES `pickup` (`pickupID`),
  ADD CONSTRAINT `reservation_ibfk_6` FOREIGN KEY (`fkReturnID`) REFERENCES `return` (`returnID`);

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `return_ibfk_1` FOREIGN KEY (`returnID`) REFERENCES `reservation` (`fkReturnID`);

--
-- Constraints for table `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`fkPickupID`) REFERENCES `pickup` (`pickupID`),
  ADD CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`fkReturnID`) REFERENCES `return` (`returnID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
