-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 09, 2019 at 09:30 AM
-- Server version: 10.1.23-MariaDB-9+deb9u1
-- PHP Version: 7.0.33-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_minhhieu`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `AccountID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `LastModified` datetime DEFAULT NULL,
  `AccountTypeID` int(11) NOT NULL,
  `Valid` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`AccountID`, `Username`, `Password`, `FirstName`, `LastName`, `Email`, `Phone`, `DateCreated`, `LastModified`, `AccountTypeID`, `Valid`) VALUES
(3, 'eihinim', '1', 'Hieu', 'Nguyen', 'hieunguyenvn98@gmail.com', '123456789', '2019-04-30 21:41:09', '2019-04-30 21:41:09', 4, 1),
(4, 'quan', '1', 'Quan', 'Nguyen', 'quan@gmail.com', '987654321', '2019-04-30 23:27:54', '2019-04-30 23:27:54', 1, 1),
(6, 'dung', '1', 'Dung', 'Tran', 'dung@gmail.com', '10101010', '2019-05-03 14:44:10', '2019-05-03 14:44:10', 1, 1);

--
-- Triggers `Account`
--
DELIMITER $$
CREATE TRIGGER `auto_insert_date_account` BEFORE INSERT ON `Account` FOR EACH ROW begin
    set NEW.DateCreated = now();
    set NEW.LastModified = now();
	end
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`AccountID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD KEY `AT_fk` (`AccountTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `AT_fk` FOREIGN KEY (`AccountTypeID`) REFERENCES `AccountType` (`AccountTypeID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
