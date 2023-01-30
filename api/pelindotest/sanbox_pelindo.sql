-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 30, 2023 at 07:05 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `sanbox_pelindo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`userid`, `namalengkap`, `username`, `password`, `status`) VALUES
(0, '', '', '', ''),
(2, 'Rizal Hilman', 'rizalhilman', 'Welcome@2023', '0'),
(3, 'Freya', 'freya', 'Welcome@2023', '1'),
(4, 'Nabila Putri Syafrina Bukka', 'nabilasyafrina', 'Welcome@2023', '1'),
(6, 'Freya', 'freya', 'Welcome@2023', '1'),
(8, 'Adhika Putri', 'adhika', 'Welcome@2023', '0'),
(48, 'Adhika Putri', 'adhika', 'Welcome@2023', '0'),
(139, 'Adhika Putri', 'adhika', 'Welcome@2023', '0'),
(201, 'Robert', 'robert0342', 'Akask23n', '1'),
(452, 'Adhika Putri', 'adhika', 'Welcome@2023', '0'),
(458, 'Adhika Putri', 'adhika', 'Welcome@2023', '0'),
(488, 'Adhika Putri', 'adhika', 'Welcome@2023', '0'),
(231222, 'Adhika Putri', 'adhika', 'Welcome@2023', '0'),
(2312222, 'Adhika Putri', 'adhika', 'Welcome@2023', '0'),
(23122221, 'Adhika Putri', 'adhika', 'Welcome@2023', '0');

--
-- Indexes for dumped tables
--