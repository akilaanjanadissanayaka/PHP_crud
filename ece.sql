-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2023 at 07:26 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ece`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_number` int(11) NOT NULL,
  `container_number` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `delivery_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_number`, `container_number`, `content`, `date`, `delivery_status`) VALUES
(1, 1, 'Cars', '2023-04-03', 0),
(2, 3, 'car collection', '2023-04-02', 0),
(3, 4, 'Some goods', '2023-04-03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `container`
--

CREATE TABLE `container` (
  `container_number` int(11) NOT NULL,
  `booking_status` tinyint(1) NOT NULL,
  `IMO_No` int(11) NOT NULL,
  `C_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `container`
--

INSERT INTO `container` (`container_number`, `booking_status`, `IMO_No`, `C_name`, `location`) VALUES
(1, 1, 7000001, '20’ Steel Dry Cargo Container', 'Colombo'),
(2, 1, 7000002, '40’ Steel Dry Cargo Container', 'Hambourg'),
(3, 0, 7000001, '40’ Steel Refrigerated Cargo Container', 'Antwerp'),
(4, 0, 7000002, '40’ Steel Refrigerated Cargo Container', 'Antwerp');

-- --------------------------------------------------------

--
-- Table structure for table `c_type`
--

CREATE TABLE `c_type` (
  `C_name` varchar(255) NOT NULL,
  `E_Length` float NOT NULL,
  `E_Width` float NOT NULL,
  `E_Height` float NOT NULL,
  `I_Length` float NOT NULL,
  `I_Width` float NOT NULL,
  `I_Height` float NOT NULL,
  `MGW` int(11) NOT NULL,
  `Tare` int(11) NOT NULL,
  `Net` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `c_type`
--

INSERT INTO `c_type` (`C_name`, `E_Length`, `E_Width`, `E_Height`, `I_Length`, `I_Width`, `I_Height`, `MGW`, `Tare`, `Net`) VALUES
('20’ Steel Dry Cargo Container', 6.058, 2.058, 2.058, 5.058, 2.058, 2.058, 30480, 2400, 28080),
('40’ Steel Dry Cargo Container', 6.058, 2.058, 2.058, 5.058, 2.058, 2.058, 30480, 2400, 28080),
('40’ Steel Refrigerated Cargo Container', 6.058, 2.058, 2.058, 5.058, 2.058, 2.058, 30480, 2400, 28080);

-- --------------------------------------------------------

--
-- Table structure for table `port`
--

CREATE TABLE `port` (
  `Port_Id` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Telephone` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `port`
--

INSERT INTO `port` (`Port_Id`, `Address`, `Telephone`, `Email`) VALUES
(1, 'Le Havre', '0372436777', 'port1@gmail.com'),
(2, 'Antwerp', '037243666', 'port2@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `vessel`
--

CREATE TABLE `vessel` (
  `IMO_No` int(11) NOT NULL,
  `Speed` int(11) NOT NULL,
  `Deadweight_Tonnage` int(11) NOT NULL,
  `Gross_Tonnage` int(11) NOT NULL,
  `Date_Built` date NOT NULL,
  `Breadth` float NOT NULL,
  `A_Veracruz` date NOT NULL,
  `A_Altamira` date NOT NULL,
  `A_Miami` date NOT NULL,
  `A_Charleston` date NOT NULL,
  `A_Antwerp` date NOT NULL,
  `A_LeHavre` date NOT NULL,
  `A_Houston` date NOT NULL,
  `D_Veracruz` date NOT NULL,
  `D_Altamira` date NOT NULL,
  `D_Miami` date NOT NULL,
  `D_Charleston` date NOT NULL,
  `D_Antwerp` date NOT NULL,
  `D_LeHavre` date NOT NULL,
  `D_Houston` date NOT NULL,
  `Type_No` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vessel`
--

INSERT INTO `vessel` (`IMO_No`, `Speed`, `Deadweight_Tonnage`, `Gross_Tonnage`, `Date_Built`, `Breadth`, `A_Veracruz`, `A_Altamira`, `A_Miami`, `A_Charleston`, `A_Antwerp`, `A_LeHavre`, `A_Houston`, `D_Veracruz`, `D_Altamira`, `D_Miami`, `D_Charleston`, `D_Antwerp`, `D_LeHavre`, `D_Houston`, `Type_No`) VALUES
(7000001, 23, 224999, 235579, '0000-00-00', 61.5, '2023-04-01', '2023-04-03', '2023-04-05', '2023-04-07', '2023-04-09', '2023-04-10', '2023-04-12', '2012-03-13', '2009-03-23', '2007-03-20', '2004-03-23', '2022-02-28', '2020-02-05', '2014-03-26', 'A'),
(7000002, 23, 224999, 235579, '0000-00-00', 61.5, '2023-04-04', '2023-04-07', '2023-04-09', '2023-04-12', '2023-04-14', '2023-04-17', '2023-04-18', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `vessel_container_carry`
--

CREATE TABLE `vessel_container_carry` (
  `container_number` int(11) NOT NULL,
  `IMO_No` int(11) NOT NULL,
  `from_` varchar(255) NOT NULL,
  `To_` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vessel_container_carry`
--

INSERT INTO `vessel_container_carry` (`container_number`, `IMO_No`, `from_`, `To_`) VALUES
(1, 7000001, 'Antwerp', 'Miami'),
(2, 7000001, 'Antwerp', 'Miami'),
(3, 7000002, 'Antwerp', 'Miami'),
(4, 7000001, 'Altamira', 'Veracruz');

-- --------------------------------------------------------

--
-- Table structure for table `v_type`
--

CREATE TABLE `v_type` (
  `Type_No` varchar(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Length_Overall` float NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `v_type`
--

INSERT INTO `v_type` (`Type_No`, `Quantity`, `Length_Overall`, `Capacity`) VALUES
('A', 8, 399.98, 23992),
('B', 20, 211.9, 2882),
('E', 5, 299.99, 6332),
('F', 20, 333.96, 12118),
('G', 11, 399.98, 20124),
('L', 30, 334.98, 9466),
('S', 10, 299.99, 6944),
('T', 20, 368.47, 13808);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_number`),
  ADD KEY `container_number` (`container_number`);

--
-- Indexes for table `container`
--
ALTER TABLE `container`
  ADD PRIMARY KEY (`container_number`),
  ADD KEY `IMO_No` (`IMO_No`),
  ADD KEY `C_name` (`C_name`);

--
-- Indexes for table `c_type`
--
ALTER TABLE `c_type`
  ADD PRIMARY KEY (`C_name`);

--
-- Indexes for table `port`
--
ALTER TABLE `port`
  ADD PRIMARY KEY (`Port_Id`);

--
-- Indexes for table `vessel`
--
ALTER TABLE `vessel`
  ADD PRIMARY KEY (`IMO_No`),
  ADD KEY `Type_No` (`Type_No`);

--
-- Indexes for table `vessel_container_carry`
--
ALTER TABLE `vessel_container_carry`
  ADD KEY `container` (`container_number`),
  ADD KEY `vessel` (`IMO_No`);

--
-- Indexes for table `v_type`
--
ALTER TABLE `v_type`
  ADD PRIMARY KEY (`Type_No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `container`
--
ALTER TABLE `container`
  MODIFY `container_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `port`
--
ALTER TABLE `port`
  MODIFY `Port_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`container_number`) REFERENCES `container` (`container_number`);

--
-- Constraints for table `container`
--
ALTER TABLE `container`
  ADD CONSTRAINT `container_ibfk_1` FOREIGN KEY (`IMO_No`) REFERENCES `vessel` (`IMO_No`),
  ADD CONSTRAINT `container_ibfk_2` FOREIGN KEY (`C_name`) REFERENCES `c_type` (`C_name`);

--
-- Constraints for table `vessel`
--
ALTER TABLE `vessel`
  ADD CONSTRAINT `V_Type` FOREIGN KEY (`Type_No`) REFERENCES `v_type` (`Type_No`);

--
-- Constraints for table `vessel_container_carry`
--
ALTER TABLE `vessel_container_carry`
  ADD CONSTRAINT `container` FOREIGN KEY (`container_number`) REFERENCES `container` (`container_number`),
  ADD CONSTRAINT `vessel` FOREIGN KEY (`IMO_No`) REFERENCES `vessel` (`IMO_No`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
