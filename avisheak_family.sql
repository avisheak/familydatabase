-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2018 at 03:31 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `avisheak_family`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_group`
--

CREATE TABLE `blood_group` (
  `Blood_Group_ID` varchar(20) NOT NULL,
  `Group` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_group`
--

INSERT INTO `blood_group` (`Blood_Group_ID`, `Group`) VALUES
('1', 'A+'),
('2', 'A-'),
('3', 'B+'),
('4', 'B-'),
('5', 'AB+'),
('6', 'AB-'),
('7', 'O+'),
('8', 'O-');

-- --------------------------------------------------------

--
-- Table structure for table `cost`
--

CREATE TABLE `cost` (
  `Cost_ID` varchar(20) NOT NULL,
  `Expense` varchar(20) DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cost`
--

INSERT INTO `cost` (`Cost_ID`, `Expense`, `Cost`) VALUES
('brothercost', 'pocket money', '12000.00'),
('fathercost', 'rent', '12000.00'),
('mothercost', 'household', '20000.00'),
('sistercost', 'educationalexpenses', '6000.00');

-- --------------------------------------------------------

--
-- Table structure for table `family`
--

CREATE TABLE `family` (
  `Family_ID` varchar(20) NOT NULL,
  `Family` varchar(20) DEFAULT NULL,
  `Total_Cost` decimal(10,2) DEFAULT NULL,
  `Total_Income` decimal(10,2) DEFAULT NULL,
  `Number_of_Members` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `family`
--

INSERT INTO `family` (`Family_ID`, `Family`, `Total_Cost`, `Total_Income`, `Number_of_Members`) VALUES
('myfamily', 'Das_Family', '50000.00', '55000.00', '4');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `Income_ID` varchar(20) NOT NULL,
  `Job_Name` varchar(20) DEFAULT NULL,
  `Income` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`Income_ID`, `Job_Name`, `Income`) VALUES
('brotherincome', 'tuition', '15000.00'),
('fatherincome', 'govt. job', '40000.00'),
('noincome', 'nojob', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `Member_ID` varchar(20) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Family_ID` varchar(20) DEFAULT NULL,
  `Age` decimal(3,0) DEFAULT NULL,
  `Blood_Group_ID` varchar(20) DEFAULT NULL,
  `Income_ID` varchar(20) DEFAULT NULL,
  `Cost_ID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Member_ID`, `Name`, `Family_ID`, `Age`, `Blood_Group_ID`, `Income_ID`, `Cost_ID`) VALUES
('brother', 'Avisheak Das', 'myfamily', '22', '3', 'brotherincome', 'brothercost'),
('father', 'Samir Kanti Das', 'myfamily', '53', '3', 'fatherincome', 'fathercost'),
('mother', 'Lucky Das', 'myfamily', '45', '7', 'noincome', 'mothercost'),
('sister', 'Bishaka Das', 'myfamily', '15', '3', 'noincome', 'sistercost');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_group`
--
ALTER TABLE `blood_group`
  ADD PRIMARY KEY (`Blood_Group_ID`);

--
-- Indexes for table `cost`
--
ALTER TABLE `cost`
  ADD PRIMARY KEY (`Cost_ID`);

--
-- Indexes for table `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`Family_ID`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`Income_ID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`Member_ID`),
  ADD KEY `Family_ID` (`Family_ID`),
  ADD KEY `Blood_Group_ID` (`Blood_Group_ID`),
  ADD KEY `Income_ID` (`Income_ID`),
  ADD KEY `Cost_ID` (`Cost_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Family_ID`) REFERENCES `family` (`Family_ID`),
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`Blood_Group_ID`) REFERENCES `blood_group` (`Blood_Group_ID`),
  ADD CONSTRAINT `member_ibfk_3` FOREIGN KEY (`Income_ID`) REFERENCES `income` (`Income_ID`),
  ADD CONSTRAINT `member_ibfk_4` FOREIGN KEY (`Cost_ID`) REFERENCES `cost` (`Cost_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
