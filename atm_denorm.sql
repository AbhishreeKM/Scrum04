-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2023 at 05:39 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atm`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `transaction_display` ()  NO SQL select * from transaction where transaction_date not BETWEEN 2019-10-31 and 2019-08-30 GROUP by transaction_id,transaction_type,user_id,transaction_status,transaction_date$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Account_number` int(10) NOT NULL,
  `Balance` int(50) NOT NULL,
  `Account_type` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Account_number`, `Balance`, `Account_type`, `user_id`) VALUES
(1000, 55000, 'savings', 100),
(1001, 10900, 'current', 101),
(1002, 19200, 'savings', 102),
(1003, 11200, 'current', 103),
(1004, 103200, 'savings', 104),
(1005, 66206, 'savings', 105),
(1006, 4000, 'savings', 106),
(1007, 47042, 'savings', 107),
(1008, 52200, 'current', 108),
(1009, 58200, 'savings', 109);

--
-- Triggers `account`
--
DELIMITER $$
CREATE TRIGGER `logs` AFTER UPDATE ON `account` FOR EACH ROW insert into logs values(null, new.user_id,new.balance,now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_pin` int(11) NOT NULL,
  `atm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_pin`, `atm_id`) VALUES
(500, 1122, 120),
(501, 2244, 121),
(502, 5566, 122),
(503, 7890, 123),
(504, 9810, 124),
(505, 1999, 125),
(506, 1887, 126),
(507, 4596, 127),
(508, 8988, 128),
(509, 9999, 129);

-- --------------------------------------------------------

--
-- Table structure for table `atm`
--

CREATE TABLE `atm` (
  `atm_id` int(11) NOT NULL,
  `atm_location` varchar(255) NOT NULL,
  `available_cash` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `atm`
--

INSERT INTO `atm` (`atm_id`, `atm_location`, `available_cash`) VALUES
(120, 'Hadadi Road', 85100),
(121, 'Kasturaba Extension', 150000),
(122, 'MCC B Block', 70000),
(123, 'Vinobha Nagar', 20000),
(124, 'P J Complex', 80000),
(125, 'P B Road', 80000),
(126, 'Kuvempu Nagar', 70000),
(127, 'Vidya Nagar', 100000),
(128, 'Anjaneya Temple Road', 100500),
(129, 'KTJ Nagar', 70000);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `Bank_name` varchar(255) NOT NULL,
  `Bank_id` int(11) NOT NULL,
  `Branch_Location` varchar(255) NOT NULL,
  `account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`Bank_name`, `Bank_id`, `Branch_Location`, `account`) VALUES
('Axis Bank', 1, 'Hadadi Road', 1000),
('Canara Bank', 2, 'Kasturaba Extension', 1001),
('Syndicate Bank', 3, 'MCC B Block', 1002),
('State Bank of India', 4, 'Vinobha Nagar', 1003),
('Bank of Baroda', 5, 'P J Complex', 1004),
('ICICI Bank', 6, 'P B Road', 1005),
('SBI bank', 7, 'Kuvempu Nagar', 1006),
('vijaya Bank', 8, 'Vidya Nagar', 1007);

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `card_no` int(11) NOT NULL,
  `card_pin` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`card_no`, `card_pin`, `balance`, `user_id`) VALUES
(123456, 3214, 66206, 105),
(123965, 9110, 55000, 109),
(145672, 1837, 55000, 100),
(312315, 4142, 11200, 103),
(423415, 1312, 19200, 102),
(456789, 1002, 4000, 106),
(512345, 1131, 10900, 101),
(765345, 4810, 52200, 108),
(914321, 8198, 103200, 104),
(987651, 1113, 47042, 107);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `balance`, `created_date`) VALUES
(1, 100, '60400', '2021-12-25 10:26:44'),
(2, 100, '60200', '2022-11-14 10:28:26'),
(3, 100, '60000', '2021-01-17 10:59:18'),
(4, 100, '59000', '2022-02-01 13:40:20'),
(5, 100, '58200', '2022-07-18 13:45:22'),
(6, 101, '700', '2021-08-19 13:47:01'),
(7, 101, '-100', '2020-09-25 15:48:23'),
(8, 101, '10000', '2022-04-19 11:50:02'),
(9, 101, '9900', '2021-02-11 10:23:11'),
(10, 101, '10400', '2022-11-10 17:12:20'),
(11, 100, '57700', '2022-10-22 18:20:26'),
(12, 101, '10500', '2021-06-08 19:43:30'),
(13, 100, '57600', '2022-10-11 15:52:59'),
(14, 100, '57400', '2020-01-11 12:49:45'),
(15, 101, '10600', '2022-06-09 18:50:34'),
(16, 100, '57300', '2020-12-19 19:51:43'),
(17, 101, '10700', '2022-11-19 19:12:54'),
(18, 100, '57200', '2021-10-26 19:40:52'),
(19, 100, '56200', '2021-04-30 11:05:36'),
(20, 101, '10800', '2021-12-03 06:43:14'),
(21, 100, '56100', '2020-09-16 09:34:19'),
(22, 100, '55100', '2021-11-08 17:37:49'),
(23, 101, '10900', '2022-09-22 19:15:20'),
(24, 100, '55000', '2022-10-03 15:16:22'),
(25, 105, '78200', '2023-01-12 18:58:00'),
(26, 105, '77200', '2023-01-12 19:00:42'),
(27, 105, '76200', '2023-01-14 10:32:27'),
(28, 105, '75200', '2023-01-14 10:37:58'),
(29, 105, '74700', '2023-01-14 10:39:22'),
(30, 105, '74200', '2023-01-14 10:40:09'),
(31, 105, '73950', '2023-01-15 12:16:01'),
(32, 105, '73700', '2023-01-15 12:16:06'),
(33, 105, '73450', '2023-01-15 12:17:38'),
(34, 105, '68450', '2023-01-15 12:18:34'),
(35, 105, '66206', '2023-01-15 12:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_date` date NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_status` varchar(255) NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_date`, `transaction_id`, `transaction_status`, `transaction_type`, `user_id`) VALUES
('2022-11-10', 1, 'Successful', 'savings', 108),
('2022-12-13', 2, 'Successful', 'Savings', 100),
('2021-03-19', 3, 'Successful', 'current', 101),
('2022-10-18', 4, 'Failed', 'savings', 102),
('2022-10-19', 5, 'Successful', 'current', 103),
('2021-11-18', 6, 'Failed', 'Savings', 104),
('2022-11-13', 7, 'Successful', 'savings\r\n', 105),
('2022-10-28', 8, 'Failed', 'current', 106),
('2022-12-19', 9, 'Successful', 'savings', 107);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_no` int(11) NOT NULL,
  `DOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `address`, `contact_no`, `DOB`) VALUES
(100, 'Ravi', 'Kumar', 'Bengaluru', 998456789, '1997-01-21'),
(101, 'Pramod', 'Gowda', 'Managaluru', 816345678, '1981-03-13'),
(102, 'John', 'Cena', 'Hubli', 742356819, '1981-02-21'),
(103, 'Mark', 'Johnon', 'Hassan', 923645789, '1991-04-04'),
(104, 'Alex ', 'Johnson', 'Dharwad', 886115575, '1996-05-18'),
(105, 'Vasishta', 'Gowda', 'Belagavi', 776255848, '1999-06-29'),
(106, 'Geetha', 'Bharathi', 'Bellary', 996118117, '1979-07-01'),
(107, 'Rita', 'Jackson', 'Bengaluru', 702260405, '1999-11-13'),
(108, 'Pavan', 'Kumar', 'Mumbai', 809260405, '1976-08-02'),
(109, 'Chirag', 'Patel', 'Chennai', 812345923, '1977-09-03'),
(110, 'Radha', 'Devi', 'Davangere', 987635421, '1995-05-15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_number`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `Balance` (`Balance`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `atm_id` (`atm_id`);

--
-- Indexes for table `atm`
--
ALTER TABLE `atm`
  ADD PRIMARY KEY (`atm_id`),
  ADD KEY `atm_id` (`atm_id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`Bank_id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_no`),
  ADD KEY `balance` (`balance`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `Account_number` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`atm_id`) REFERENCES `atm` (`atm_id`);

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`balance`) REFERENCES `account` (`Balance`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `card_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `account` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
