-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2023 at 07:53 AM
-- Server version: 10.5.20-MariaDB-cll-lve-log
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crearlfw_travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(300) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `profile_image` varchar(300) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `email`, `password`, `phone`, `address`, `profile_image`, `token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Directeur', 'admin', 'nkirinoussair1@gmail.com', '$2y$10$TH06pFHR/IvIR68esvc5m.5IEN7bOnWwTPUSUVN4eqfARRnEDllOm', '0671848568', 'MENARA LIEUDIT EL AZZOUZIA APT A1, BAB TARGA', 'passport_files/VThoC8v18k9sfkiMwgc6M1oDnawgLLj9uFYHWdpZ.png', '123456', 'ADMIN', '2023-07-14 15:42:04', '2023-11-13 15:02:13'),
(8, 'Mohamed Didani', 'Didani', NULL, '$2y$10$UbkZC3tsQVy8hx6OZzfvD.NuQ8g33/RZgvGswftjsxcZfqr7/.lCe', NULL, NULL, 'passport_files/IevKXggz7bpiTNHNrfUbnajLfF0IrKRymBvrpKLB.jpg', NULL, 'COMMERCIAL AGENT', '2023-10-19 14:50:18', '2023-10-26 16:41:11'),
(9, 'Samir Ait Lachgar', 'Samir', NULL, '$2y$10$w128JK2GoLJPYSLZWS7azOikVOnO8mT.W47/WeESJgFHMzLjmZF5.', NULL, NULL, 'passport_files/gYHXl0nalkN9VxaHZ2DtFACEVhEFtFWq61EHXsv1.jpg', NULL, 'MANAGER', '2023-10-19 14:54:54', '2023-10-26 16:42:28'),
(11, 'Mehdi Azelmad', 'Mehdi', NULL, '$2y$10$WgYyvyikIRMJ8nWp6hS0pedpI2ZjFcqKYrCLH9xF4XhSrtmAZn1j2', NULL, NULL, 'passport_files/vB6SEo77WGN2HzTIWQPSbnRxoVFZiFSC8y3L2qRV.jpg', NULL, 'COMMERCIAL AGENT', '2023-10-26 16:05:21', '2023-10-26 16:41:40'),
(12, 'Noussair Nkiri', 'Noussair', NULL, '$2y$10$aSI9i7HhtVf.yU5j7QKF0.gkmYlb9gKimNM7V3ACVEYYlGHxVAIlq', NULL, NULL, NULL, NULL, 'COMMERCIAL AGENT', '2023-10-26 16:29:23', '2023-10-26 16:41:58'),
(13, 'Zouhair Nkiri', 'Zouhair', NULL, '$2y$10$Py/imLoO7kUhpatUTB.txe5We.ryMzcXpx4eU9YXW1xP81MsXMrwu', NULL, NULL, NULL, NULL, 'MANAGER', '2023-10-26 16:43:04', '2023-10-26 16:43:04'),
(16, 'Hammad', 'med123', NULL, '$2y$10$2pmIvEGN8f7V6G0BTC1CdOnyKkl0rv7FuK5q72DUi.8NnoHO.OqNS', NULL, NULL, NULL, NULL, 'MANAGER', '2023-11-13 18:18:51', '2023-11-13 18:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `air_company`
--

CREATE TABLE `air_company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `added_by` varchar(255) NOT NULL,
  `added_role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `air_company`
--

INSERT INTO `air_company` (`id`, `name`, `abbreviation`, `added_by`, `added_role`, `created_at`, `updated_at`) VALUES
(1, 'Pakistan International Airline', 'PIA', '1', NULL, '2023-10-06 07:13:15', '2023-10-06 07:13:15'),
(2, 'Royal Air Maroc', 'AT', '1', NULL, '2023-10-10 04:24:40', '2023-10-10 04:24:40'),
(3, 'Turkish Airlines', 'TK', '1', NULL, '2023-10-10 04:24:51', '2023-10-10 04:24:51'),
(4, 'AIR SAUDIA', 'SV', '1', NULL, '2023-10-10 04:25:07', '2023-10-10 04:25:07'),
(5, 'kwit air ling', 'KW', '9', NULL, '2023-10-23 19:54:49', '2023-10-23 19:54:49'),
(6, 'GOLF', 'GOLF', '1', NULL, '2023-10-24 22:06:56', '2023-10-24 22:06:56'),
(7, 'AIR CAIRO', 'SM', '1', NULL, '2023-10-24 22:07:43', '2023-10-24 22:07:43'),
(8, 'RAMADAN TK', 'RM TK', '1', NULL, '2023-10-26 23:09:50', '2023-10-26 23:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carrier`
--

INSERT INTO `carrier` (`id`, `company_name`, `driver_name`, `phone`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(2, 'EXP', 'SPRT', '0660487263', '2023-11-09 21:10:56', '2023-11-09 21:10:56', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `collaborator`
--

CREATE TABLE `collaborator` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collaborator`
--

INSERT INTO `collaborator` (`id`, `name`, `location`, `phone`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(3, 'لبنى القارفي', 'MARRAKECH', '0706638774', '2023-10-23 13:16:30', '2023-10-23 13:16:30', '8', NULL),
(4, 'عبد الهادي لفو', 'MARRAKECH', '0668954241', '2023-10-23 13:20:10', '2023-10-23 13:20:10', '8', NULL),
(5, 'الفقيه', 'MARRAKECH', '0666660814', '2023-10-23 13:20:57', '2023-10-23 13:20:57', '8', NULL),
(6, 'مراكش', 'MARRAKECH', '0666660813', '2023-10-23 13:21:24', '2023-10-23 13:21:24', '8', NULL),
(7, 'الدار البيضاء', 'CASABLANCA', '0666895050', '2023-10-23 13:22:14', '2023-10-23 13:23:14', '8', NULL),
(8, 'سمير', 'MARRAKECH', '0661098938', '2023-10-23 13:22:56', '2023-10-23 13:22:56', '8', NULL),
(9, 'المهدي أزلماض', 'MARRAKECH', '0673854168', '2023-10-23 13:23:52', '2023-10-23 13:23:52', '8', NULL),
(10, 'محمد الديداني', 'MARRAKECH', '0609496011', '2023-10-23 13:24:13', '2023-10-23 13:24:13', '8', NULL),
(11, 'زهير نقيري', 'MARRAKECH', '0666660814', '2023-10-23 13:24:34', '2023-10-23 13:24:34', '8', NULL),
(12, 'المدكوري', 'MARRAKECH', '0619096790', '2023-10-23 13:29:02', '2023-10-23 13:29:02', '8', NULL),
(13, 'التاقيلي', 'حد البرادية', '0678140354', '2023-10-23 13:31:09', '2023-10-23 13:31:09', '8', NULL),
(14, 'الفقيه بن صالح', 'FQIH BEN SALAH', '0610867854', '2023-10-23 13:33:00', '2023-10-23 13:33:00', '8', NULL),
(15, 'الفطوكي', 'MARRAKECH', '0661439702', '2023-10-23 13:34:38', '2023-10-23 13:34:38', '8', NULL),
(16, 'حميد زعراوة', 'MARRAKECH', '0665133749', '2023-10-23 13:35:16', '2023-10-23 13:35:16', '8', NULL),
(17, 'البوزيدي', 'MARRAKECH', '0662448643', '2023-10-23 13:36:21', '2023-10-23 13:36:21', '8', NULL),
(18, 'حادة الحوزي', 'MARRAKECH', '0678310953', '2023-10-23 13:37:16', '2023-10-23 13:37:16', '8', NULL),
(19, 'رقية العدراوي', 'MARRAKECH', '0666660813', '2023-10-23 13:38:32', '2023-10-27 20:17:56', '8', NULL),
(20, 'نصير', 'MARRAKECH', '0671848568', '2023-11-09 19:58:14', '2023-11-09 19:58:14', '8', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `passport` varchar(255) DEFAULT NULL,
  `passport_issue_date` varchar(255) DEFAULT NULL,
  `passport_file` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gaurdian_name` varchar(255) DEFAULT NULL,
  `gaurdian_phone` varchar(255) DEFAULT NULL,
  `gaurdian_relation` varchar(255) DEFAULT NULL,
  `collaborator` int(11) DEFAULT NULL,
  `linked_with` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `sex`, `gender`, `phone`, `dob`, `id_card`, `passport`, `passport_issue_date`, `passport_file`, `nationality`, `city`, `email`, `gaurdian_name`, `gaurdian_phone`, `gaurdian_relation`, `collaborator`, `linked_with`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(6, 'AMGHAR', 'ZAHRA', 'Faminine', 'Adult', '0666660813', '1962-01-01', 'EE188090', 'WI9089156', '2025-01-28', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 5, 7, '2023-10-23 13:53:28', '2023-10-23 14:05:31', '8', NULL),
(7, 'LASSIANE', 'BRAHIM', 'Masculine', 'Adult', '0666660813', '1959-01-01', 'E573550', 'OC4384029', '2025-01-28', NULL, 'MAROCAIN', 'MARRAKECH', NULL, NULL, NULL, NULL, 5, 6, '2023-10-23 13:59:12', '2023-10-23 13:59:12', '8', NULL),
(8, 'KHALID', 'BGUERIA', 'Masculine', 'Adult', '0661439702', '1971-09-18', 'Y178011', 'MK9396207', '2027-11-21', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 15, 9, '2023-10-23 14:22:10', '2023-10-23 14:43:01', '8', NULL),
(9, 'NADIA', 'HAIDA', 'Faminine', 'Adult', '0661439702', '1984-01-01', 'Y373960', 'SM5686827', '2027-11-21', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 15, 8, '2023-10-23 14:40:19', '2023-10-23 14:41:21', '8', NULL),
(10, 'ABDELKADER', 'AZAMI', 'Masculine', 'Adult', '0666660813', '1953-12-01', 'K102986', 'VA5816308', '2024-12-12', 'passport_files/QePYu6MCdZu4orartTCyTh1niawgAy57sjz75Yon.png', 'MAROCAIN', 'MOHAMMADIA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 11, '2023-10-23 14:50:18', '2023-11-03 20:39:00', '8', NULL),
(11, 'KHADDOUJ', 'FILAH', 'Faminine', 'Adult', '0666660813', '1962-02-25', 'BE302387', 'QG7432719', '2024-12-13', NULL, 'MAROCAIN', 'MOHAMMADIA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 10, '2023-10-23 14:52:45', '2023-11-03 20:24:17', '8', NULL),
(12, 'AICHA', 'OUICHOUANI', 'Faminine', 'Adult', '0661439702', '1963-01-01', 'I111109', 'QN2463239', '2027-05-11', NULL, 'MAROCAIN', 'CASABLANCA', 'contact@ci-voyages.com', NULL, NULL, NULL, 15, 13, '2023-10-23 14:55:48', '2023-10-23 14:59:54', '8', NULL),
(13, 'MOUNIM', 'HAIDA', 'Masculine', 'Adult', '0661439702', '1980-01-01', 'Y200172', 'ID3084389', '2028-01-13', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 15, 12, '2023-10-23 14:58:38', '2023-10-23 14:58:38', '8', NULL),
(14, 'SAADIA', 'KOUTA', 'Faminine', 'Adult', '0666660813', '1953-01-01', 'E723154', 'DU2492984', '2027-11-30', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 5, NULL, '2023-10-23 15:01:53', '2023-10-23 15:01:53', '8', NULL),
(15, 'MALIKA', 'BENRAISS', 'Faminine', 'Adult', '0706638774', '1960-01-29', 'E133886', 'MC8967245', '2025-01-28', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, NULL, '2023-10-23 15:03:50', '2023-10-23 15:03:50', '8', NULL),
(16, 'AHMED', 'JDIA', 'Masculine', 'Adult', '0666660813', '1953-01-01', 'A81396', 'PO6593679', '2028-01-16', NULL, 'MAROCAIN', 'MOHAMMADIA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-23 15:19:43', '2023-10-23 15:19:43', '8', NULL),
(17, 'BOUCHRA', 'KOUATLY', 'Faminine', 'Adult', '0666660813', '1963-10-23', 'BE625415', 'TD8969830', '2028-01-16', NULL, 'MAROCAIN', 'MOHAMMADIA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 16, '2023-10-23 15:24:50', '2023-10-23 15:24:50', '8', NULL),
(18, 'NOUREDDINE', 'BOUIKHSAINE', 'Masculine', 'Adult', '0668954241', '1958-12-30', 'A188675', 'HZ8710254', '2028-08-11', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, 54, '2023-10-23 15:28:28', '2023-10-27 14:13:04', '8', NULL),
(19, 'SAIDA', 'KHARBACH', 'Faminine', 'Adult', '0668954241', '1975-01-01', 'E544748', 'LO0374264', '2028-08-11', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, 18, '2023-10-23 15:30:58', '2023-10-23 15:30:58', '8', NULL),
(20, 'MOHAMED', 'AIT MIMOUN', 'Masculine', 'Adult', '0668954241', '1961-01-01', 'E240074', 'AG6417103', '2028-09-20', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 27, '2023-10-23 15:41:22', '2023-11-17 20:35:40', '8', NULL),
(27, 'MINA', 'ECHAROUATI', 'Faminine', 'Adult', '0634419501', '1965-01-01', 'EE197248', 'CG0658124', '2028-09-06', NULL, 'MAROCAIN', 'AIT IMOUR - MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 20, '2023-10-25 21:23:32', '2023-11-17 20:37:29', '8', NULL),
(28, 'EL MAHJOUB', 'ECHROUATI', 'Masculine', 'Adult', '0634419501', '1971-01-01', 'E392288', 'HT6505303', '2028-09-06', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 20, '2023-10-25 21:31:03', '2023-11-17 20:34:30', '8', NULL),
(29, 'HASAN', 'LAFROUGUI', 'Masculine', 'Adult', '0668146375', '1950-01-01', 'E240168', 'BO0572836', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-26 20:12:20', '2023-11-17 21:28:32', '8', NULL),
(30, 'HASSAN', 'LAHMIMSI', 'Masculine', 'Adult', '0641637982', '1955-01-01', 'E241868', 'E241868', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-26 20:14:39', '2023-11-03 20:35:59', '8', NULL),
(31, 'HALIMA', 'LAHMIMSI', 'Faminine', 'Adult', '0641637982', '1963-11-07', 'E185738', 'E185738', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 30, '2023-10-26 20:16:24', '2023-11-03 20:31:23', '8', NULL),
(32, 'JAMILA', 'MAHZOUL', 'Masculine', 'Adult', '0641637982', '1967-01-01', 'E505295', 'E505295', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 31, '2023-10-26 20:18:33', '2023-11-03 20:36:56', '8', NULL),
(33, 'FATIMA', 'LAGNAOUI', 'Faminine', 'Adult', '0641637982', '1965-01-01', 'E468674', 'E468674', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 32, '2023-10-26 20:20:02', '2023-11-03 20:30:50', '8', NULL),
(34, 'MOHAMED', 'ABDELMOULI', 'Masculine', 'Adult', '0641637982', '1969-09-18', 'E385651', 'E385651', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-26 20:22:46', '2023-11-03 20:43:38', '8', NULL),
(35, 'RABIAA', 'MOSSAID', 'Faminine', 'Adult', '0641637982', '1969-01-01', 'I235805', 'I235805', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 34, '2023-10-26 20:26:23', '2023-11-03 20:48:49', '8', NULL),
(36, 'MARIAM', 'EL MAATLA', 'Faminine', 'Adult', '0666660813', '1995-12-27', 'EE589914', 'CV7416137', '2028-10-02', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-26 20:36:42', '2023-11-03 20:40:36', '8', NULL),
(37, 'SAADIA', 'LABIAD', 'Faminine', 'Adult', '0666660813', '1969-12-05', 'N164446', 'CP0523848', '2028-08-31', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 10, NULL, '2023-10-26 20:38:52', '2023-11-03 20:50:51', '8', NULL),
(38, 'SOUFIANE', 'BELKASI', 'Masculine', 'Adult', '0666660813', '1987-01-26', 'M426645', 'DR8645640', '2024-12-18', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 10, 37, '2023-10-26 20:40:48', '2023-11-03 20:51:24', '8', NULL),
(39, 'ZAHRA', 'FARHATE', 'Faminine', 'Adult', '0666660813', '1959-01-18', 'M56825', 'SI0518697', '2028-09-21', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 10, 38, '2023-10-26 20:43:17', '2023-11-03 20:38:36', '8', NULL),
(40, 'YASSINE', 'CHAHLAF', 'Masculine', 'Adult', '0666660813', '1998-03-03', 'EE869255', 'AI4941090', '2028-04-14', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 10, 38, '2023-10-26 20:44:48', '2023-11-03 20:51:55', '8', NULL),
(41, 'LARBI', 'BOUMHI', 'Masculine', 'Adult', '0666660813', '1958-08-23', 'E108709', 'EB3828701', '2028-10-12', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, NULL, '2023-10-26 20:46:38', '2023-11-03 20:39:46', '8', NULL),
(42, 'REGRAGUIA', 'LAYDI', 'Masculine', 'Adult', '0666660813', '1965-01-01', 'EE237532', 'YP9413126', '2025-02-13', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-26 20:48:14', '2023-11-03 20:50:12', '8', NULL),
(43, 'LOUBNA', 'KARIFI', 'Faminine', 'Adult', '0706638774', '1992-02-03', 'EE469420', 'TK1068241', '2028-01-28', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, NULL, '2023-10-26 20:50:43', '2023-11-03 20:37:40', '8', NULL),
(44, 'HAFIDA', 'BITTY', 'Faminine', 'Adult', '0706638774', '1968-01-01', 'E333031', 'E333031', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, 43, '2023-10-26 20:52:08', '2023-11-03 20:33:37', '8', NULL),
(45, 'AHMED', 'KARIFI', 'Masculine', 'Adult', '0634442637', '1963-04-20', 'E170789', 'AF3896247', '2028-09-17', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, 44, '2023-10-27 13:33:30', '2023-11-03 20:29:26', '8', NULL),
(46, 'FATNA', 'EL MADKOURI', 'Faminine', 'Adult', '0621646939', '1959-01-01', 'E745173', 'CL8649656', '2028-09-14', 'passport_files/ShorSgZvSnQpu3CmSmLYMk560UeB2MANiV9dMrZ6.jpg', 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 5, NULL, '2023-10-27 13:41:40', '2023-11-03 20:32:57', '8', NULL),
(47, 'ABDELJABBAR', 'JDIOUI', 'Masculine', 'Adult', '0653842323', '1954-11-15', 'E23219', 'SB1581852', '2025-01-29', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-27 13:48:45', '2023-11-03 20:28:42', '8', NULL),
(48, 'MALIKA', 'ER-RGUITA', 'Faminine', 'Adult', '0641637982', '1940-01-01', 'E149645', 'MI0863236', '2028-09-06', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 10, 30, '2023-10-27 13:51:57', '2023-11-03 20:41:56', '8', NULL),
(49, 'ABDELAZIZ', 'FEKHARI', 'Masculine', 'Adult', '06-42-17-56-23', '1993-04-01', 'EE521461', 'QX2840619', '2025-02-24', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 10, NULL, '2023-10-27 13:54:12', '2023-11-03 20:27:36', '8', NULL),
(50, 'MOHAMMAD', 'BENNAJI', 'Masculine', 'Adult', '0665133749', '1960-01-01', 'E249781', 'TM0964682', '2028-02-21', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 16, NULL, '2023-10-27 13:57:26', '2023-11-03 20:46:17', '8', NULL),
(51, 'YAMNA', 'BENADDI', 'Faminine', 'Adult', '0666660813', '1958-01-01', 'E150667', 'BK8097980', '2026-06-21', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 17, NULL, '2023-10-27 13:59:03', '2023-11-03 20:53:00', '8', NULL),
(52, 'FATIMA', 'SKOURA', 'Faminine', 'Adult', '0666660813', '1974-02-01', 'E654221', 'E654221', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 12, NULL, '2023-10-27 14:03:25', '2023-10-27 14:03:25', '8', NULL),
(53, 'MY ABDERRAHMAN', 'TAGHZAOUI', 'Masculine', 'Adult', '0737670420', '1942-01-01', 'E246836', 'E246836', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, 54, '2023-10-27 14:05:33', '2023-10-27 19:53:05', '8', NULL),
(54, 'AICHA', 'AKHBACH', 'Faminine', 'Adult', '0737670420', '1947-01-01', 'E670629', 'E670629', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, NULL, '2023-10-27 14:07:33', '2023-10-27 14:07:33', '8', NULL),
(55, 'AICHA', 'OUQADDOU', 'Faminine', 'Adult', '0668954241', '1956-01-01', 'EE506079', 'EE506079', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, NULL, '2023-10-27 14:20:12', '2023-10-27 14:20:12', '8', NULL),
(56, 'RACHID', 'KHOUF ALLAH', 'Masculine', 'Adult', '0668964926', '1972-12-25', 'E451041', 'E451041', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, NULL, '2023-10-27 14:22:32', '2023-10-27 14:22:32', '8', NULL),
(57, 'MOHAMED', 'GUERRACH', 'Masculine', 'Adult', '0668954241', '1959-01-01', 'E129745', 'E129745', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, 56, '2023-10-27 14:24:12', '2023-10-27 14:24:12', '8', NULL),
(58, 'ESSADIA', 'BELLAGHZAL', 'Faminine', 'Adult', '0668954241', '1956-01-01', 'E663389', 'E663389', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, 57, '2023-10-27 14:26:14', '2023-10-27 14:26:14', '8', NULL),
(59, 'AHMED', 'ENNADIFI', 'Masculine', 'Adult', '0668954241', '1951-01-01', 'E187833', 'E187833', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, 57, '2023-10-27 14:27:34', '2023-10-27 14:27:34', '8', NULL),
(60, 'ABDELKARIM', 'RAJI', 'Masculine', 'Adult', '0666660813', '1966-01-01', 'E370905', NULL, NULL, NULL, 'MAROCAIN', 'MARRAKECH', NULL, NULL, NULL, NULL, 6, NULL, '2023-10-27 14:29:43', '2023-11-06 20:13:20', '8', NULL),
(61, 'MINA', 'EL ALAOUI', 'Faminine', 'Adult', '0706638774', '1969-03-22', 'E520635', 'E520635', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, NULL, '2023-10-27 14:40:22', '2023-10-27 14:40:22', '8', NULL),
(62, 'FADMA', 'ELOUARZAZI', 'Faminine', 'Adult', '0666660813', '1954-01-01', 'E262154', 'E262154', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 12, NULL, '2023-10-27 14:42:44', '2023-10-27 14:42:44', '8', NULL),
(63, 'EL MEHDI', 'TITAOU', 'Masculine', 'Adult', '0666660813', '2002-07-19', 'EE926325', 'EE926325', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 12, NULL, '2023-10-27 14:46:06', '2023-10-27 14:46:06', '8', NULL),
(64, 'OMAR', 'ERRAHMOUNI', 'Masculine', 'Adult', '06-10-26-16-95', '1949-01-01', 'E291689', 'E291689', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-27 14:48:38', '2023-10-27 14:48:38', '8', NULL),
(65, 'HNIA', 'AIT ABBOU', 'Faminine', 'Adult', '06-10-26-16-95', '1958-01-01', 'E649990', 'E649990', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 64, '2023-10-27 14:51:07', '2023-10-27 14:51:07', '8', NULL),
(66, 'MUSTAPHA', 'ES-SAADAOUI', 'Masculine', 'Adult', '06-03-13-06-56', '1958-01-01', 'E380176', 'E380176', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-27 14:55:52', '2023-10-27 14:55:52', '8', NULL),
(67, 'NAIMA', 'EL KHAOUA', 'Faminine', 'Adult', '06-03-75-64-05', '1966-01-01', 'E748427', 'E748427', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 66, '2023-10-27 14:57:23', '2023-10-27 14:57:23', '8', NULL),
(68, 'BAHIJA', 'EZZAHERY', 'Faminine', 'Adult', '06-03-75-64-05', '1968-01-01', 'EE309783', 'EE309783', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 67, '2023-10-27 14:58:50', '2023-10-27 14:58:50', '8', NULL),
(69, 'MILOUD', 'LAGMASS', 'Masculine', 'Adult', '06-73-59-08-27', '1957-01-01', 'E406661', 'E406661', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-27 15:01:14', '2023-10-27 15:01:14', '8', NULL),
(70, 'NAIMA', 'AHBACH', 'Faminine', 'Adult', '0666660813', '1960-06-16', 'E377383', 'E377383', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 12, 63, '2023-10-27 15:03:02', '2023-10-27 15:03:02', '8', NULL),
(71, 'ZAHIRA', 'BOUALAM', 'Faminine', 'Adult', '0666660813', '1972-01-01', 'EE190006', 'EE190006', NULL, NULL, 'MAROCAIN', 'MARRAKECH', NULL, NULL, NULL, NULL, 12, NULL, '2023-10-27 15:04:33', '2023-10-27 15:04:33', '8', NULL),
(72, 'HAFIDA', 'ELOUAZGOUNI', 'Faminine', 'Adult', '0666660813', '1952-01-01', 'E17046', 'E17046', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-27 15:14:11', '2023-10-27 15:14:11', '8', NULL),
(73, 'FATIMA', 'DIHATI', 'Faminine', 'Adult', '0666660813', '1961-01-01', 'E179504', 'E179504', '2028-01-01', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 74, '2023-10-27 15:16:40', '2023-10-27 15:19:52', '8', NULL),
(74, 'HASSAN', 'OISMI', 'Masculine', 'Adult', '0666660813', '1961-01-01', 'E208584', 'E208584', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 73, '2023-10-27 15:17:55', '2023-10-27 15:17:55', '8', NULL),
(75, 'HAFSA', 'OISMI', 'Faminine', 'Adult', '0666660813', '1994-02-10', 'EE573667', 'EE573667', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 74, '2023-10-27 15:19:05', '2023-10-27 15:19:05', '8', NULL),
(76, 'ABDELGHANI', 'EL BOUZIDI', 'Masculine', 'Adult', '06-62-44-86-43', '1982-01-01', 'EE24775', NULL, NULL, NULL, 'MAROCAIN', 'MARRAKECH', NULL, NULL, NULL, NULL, 6, NULL, '2023-10-27 15:21:34', '2023-11-06 17:43:14', '8', NULL),
(77, 'FATIMA', 'BOUDEDENE', 'Faminine', 'Adult', '06-62-44-86-43', '1985-03-15', 'EE333127', 'EE333127', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 76, '2023-10-27 15:23:07', '2023-10-27 15:23:07', '8', NULL),
(78, 'ABDELLAH', 'AZOUGHAR', 'Masculine', 'Adult', '0706638774', '1964-01-30', 'U73816', 'U73816', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, NULL, '2023-10-27 15:25:04', '2023-10-27 15:25:04', '8', NULL),
(79, 'AICHA', 'HIMMI', 'Faminine', 'Adult', '0706638774', '1967-05-13', 'U82468', 'U82468', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, 78, '2023-10-27 15:27:03', '2023-10-27 15:27:03', '8', NULL),
(80, 'MOHAMED', 'EL KORCHI', 'Masculine', 'Adult', '0678299895', '1952-01-01', 'E142620', 'E142620', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, NULL, '2023-10-27 15:28:29', '2023-10-27 15:28:29', '8', NULL),
(81, 'ESSAADIA', 'EL KORCHI', 'Faminine', 'Adult', '0678299895', '1977-01-01', 'E770341', 'E770341', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, 80, '2023-10-27 15:29:55', '2023-10-27 15:29:55', '8', NULL),
(82, 'HASSAN', 'LABROUJ', 'Masculine', 'Adult', '0678299895', '1968-01-01', 'E352972', 'E352972', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, 81, '2023-10-27 15:31:15', '2023-10-27 15:31:15', '8', NULL),
(83, 'SAADIA', 'FAIZ', 'Faminine', 'Adult', '0666660813', '1950-01-01', 'QA36119', 'QA36119', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 19, NULL, '2023-10-27 20:19:13', '2023-10-27 20:19:13', '8', NULL),
(84, 'ABDALLAH', 'SIMALI', 'Masculine', 'Adult', '0666660813', '1951-06-07', 'E169510', NULL, NULL, 'passport_files/tXZBHT8wUYzQlUNaE2kS1Hy7OCYFFWHFKbjDsS1Q.png', 'MAR', 'MARRAKECH', NULL, NULL, NULL, NULL, 6, 72, '2023-10-27 20:22:29', '2023-11-16 16:52:12', '8', NULL),
(85, 'KACEM', 'LEMZOUDY', 'Masculine', 'Adult', '0666660813', '1954-01-01', 'BK31717', 'BK31717', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-27 20:25:00', '2023-10-27 20:25:00', '8', NULL),
(86, 'RKIA', 'ADRAOUI', 'Faminine', 'Adult', '06-66-01-14-90', '1963-07-07', 'E355649', 'E355649', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 19, 83, '2023-10-27 20:27:55', '2023-10-27 20:27:55', '8', NULL),
(87, 'SAADIA', 'ADRAOUI', 'Faminine', 'Adult', '06-66-01-14-90', '1971-01-01', 'E492360', 'E492360', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 19, 86, '2023-10-27 20:29:33', '2023-10-27 20:29:33', '8', NULL),
(88, 'RAHMA', 'ADRAOUI', 'Faminine', 'Adult', '06-66-01-14-90', '1959-01-01', 'QA25434', 'QA25434', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 19, 86, '2023-10-27 20:31:15', '2023-10-27 20:31:15', '8', NULL),
(89, 'TAIKA', 'HERAK', 'Faminine', 'Adult', '0666660813', '1959-03-30', 'BE599194', 'BE599195', '2024-01-01', NULL, 'MAROCAIN', 'CASABLANCA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-27 20:34:30', '2023-11-03 21:04:20', '8', NULL),
(90, 'MINA', 'HARRAK', 'Faminine', 'Adult', '0666660813', '1959-08-18', 'BE22945', 'RS0298252', '2027-01-28', NULL, 'MAROCAIN', 'CASABLANCA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 89, '2023-10-27 20:43:37', '2023-10-27 20:43:37', '8', NULL),
(91, 'AICHA', 'ELKADIRI', 'Faminine', 'Adult', '0666660813', '1958-01-01', 'MC63767', 'MC63767', '2027-08-12', NULL, 'MAROCAIN', 'CASABLANCA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 90, '2023-10-27 20:49:34', '2023-10-27 20:49:34', '8', NULL),
(92, 'ABDELAZIZ', 'EN NASIRY', 'Masculine', 'Adult', '0666660813', '1954-01-01', 'I198392', 'XN8345875', '2025-02-04', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 13, NULL, '2023-10-27 20:56:23', '2023-10-27 20:56:23', '8', NULL),
(93, 'ZOHRA', 'DNIBI', 'Faminine', 'Adult', '0666660813', '1958-03-02', 'IB101051', 'IB2576282', '2024-10-30', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 13, 92, '2023-10-27 20:58:31', '2023-10-27 20:58:31', '8', NULL),
(94, 'HASNA', 'EL ASSAL', 'Faminine', 'Adult', '0706638774', '1989-07-15', 'EE420586', 'EE420586', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, NULL, '2023-10-27 21:02:09', '2023-10-27 21:02:09', '8', NULL),
(95, 'SAIDA', 'KENNIOUI', 'Faminine', 'Adult', '0706638774', '1957-01-01', 'E525478', 'E525478', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, 94, '2023-10-27 21:03:20', '2023-10-27 21:03:20', '8', NULL),
(96, 'JILLALI', 'EL ASSAL', 'Masculine', 'Adult', '0706638774', '1958-01-01', 'E110976', 'E110976', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 3, 94, '2023-10-27 21:04:40', '2023-10-27 21:04:40', '8', NULL),
(97, 'AICHA', 'ADRAOUI', 'Faminine', 'Adult', '0666660813', '1960-06-06', 'QA38570', 'QA38570', NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 19, 86, '2023-10-27 21:06:53', '2023-10-27 21:06:53', '8', NULL),
(98, 'ZAHRA', 'DAADOUAY', 'Faminine', 'Adult', '0666660813', '1949-01-01', 'E175784', 'GY9652684', '2027-02-24', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-10-27 21:55:45', '2023-10-27 21:55:45', '8', NULL),
(100, 'ABDELHADI', 'LAFFOU', 'Masculine', 'Adult', '0668954241', '1972-12-22', 'E492036', 'UO6453173', '2027-02-17', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, NULL, NULL, '2023-11-03 20:58:45', '2023-11-03 21:10:50', '8', NULL),
(106, 'YOUNES', 'KOUATLY', 'Masculine', 'Adult', '0666660813', '1969-04-03', 'T96885', 'WF0731315', '2028-09-22', NULL, 'MAROCAIN', 'CASABLANCA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-11-07 14:09:25', '2023-11-07 14:09:25', '8', NULL),
(107, 'RACHIDA', 'SENSEN', 'Faminine', 'Adult', '0666660813', '1961-04-02', 'T50392', 'UR3968538', '2028-09-11', NULL, 'MAROCAIN', 'CASABLANCA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-11-07 14:17:52', '2023-11-07 14:17:52', '8', NULL),
(108, 'HANANE', 'AIT RABIA', 'Faminine', 'Adult', '0666660813', '1975-07-24', 'T149362', 'GU4507671', '2027-10-12', NULL, 'MAROCAIN', 'CASABLANCA', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-11-07 14:20:15', '2023-11-07 14:20:15', '8', NULL),
(109, 'MALIKA', 'SMIRASS', 'Faminine', 'Adult', '0666660813', '1964-04-15', 'Q77013', 'DR5437096', '2027-10-13', NULL, 'MAROCAIN', 'KHOURIBGA', 'contact@ci-voyages.com', NULL, NULL, NULL, NULL, NULL, '2023-11-09 19:57:18', '2023-11-09 19:57:18', '8', NULL),
(110, 'EL HASSAN', 'OUAAZIZ', 'Masculine', 'Adult', '0666415905', '1979-01-02', 'PB47304', 'WE2869805', '2025-02-03', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 10, NULL, '2023-11-10 16:19:39', '2023-11-10 16:19:39', '8', NULL),
(111, 'KHADIJA', 'TOUATI', 'Faminine', 'Adult', '0666415905', '1947-03-02', 'PB192325', 'PR8292605', '2025-02-03', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 10, 110, '2023-11-10 16:41:19', '2023-11-10 16:41:19', '8', NULL),
(112, 'KHADIJA', 'EL MOUDDEN', 'Faminine', 'Adult', '0668954241', '1979-03-08', 'AB512710', 'SE3284540', '2028-10-19', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 4, 100, '2023-11-10 16:47:31', '2023-11-10 16:47:31', '8', NULL),
(113, 'ABDELHAY', 'LAMTAAI', 'Masculine', 'Adult', '0670554441', '1948-01-01', 'B678608', 'B678608', NULL, NULL, 'MAROCAIN', 'ATTAOUIYA', 'contact@ci-voyages.com', NULL, NULL, NULL, NULL, NULL, '2023-11-10 18:47:02', '2023-11-10 18:47:02', '8', NULL),
(115, 'LARBI', 'HALLOUM', 'Faminine', 'Adult', '06-70-55-44-41', '1949-01-01', 'Y 130300', NULL, NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, NULL, 113, '2023-11-17 20:22:47', '2023-11-17 20:22:47', '8', NULL),
(116, 'EL HASSAN', 'SOUFI', 'Masculine', 'Adult', '06-70-55-44-41', '1950-01-01', 'Y70556', NULL, NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, NULL, 113, '2023-11-17 20:27:19', '2023-11-17 20:29:31', '8', NULL),
(117, 'NAIMA', 'BOUTALEB', 'Faminine', 'Adult', '06-70-55-44-41', '1961-01-01', 'Y 329850', NULL, NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, NULL, 116, '2023-11-17 20:28:59', '2023-11-17 20:28:59', '8', NULL),
(118, 'AICHA', 'TIOULILINE', 'Faminine', 'Adult', '0666660813', '1949-06-19', 'E 30564', NULL, NULL, NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-11-17 20:31:38', '2023-11-17 20:31:56', '8', NULL),
(119, 'ABDELOUAHED', 'MOUNIS', 'Masculine', 'Adult', '0667843515', '1952-01-01', 'E 152864', 'JH8240494', '2027-03-08', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-11-17 20:45:43', '2023-11-17 20:45:43', '8', NULL),
(120, 'LATIFA', 'EZZADI', 'Faminine', 'Adult', '0667843515', '1958-01-01', 'E 646409', 'CW2431697', '2028-03-20', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, 119, '2023-11-17 20:47:48', '2023-11-17 20:47:48', '8', NULL),
(121, 'KHADIJA', 'SEBBAR', 'Faminine', 'Adult', '06-62-35-32-77', '1963-04-24', 'E 220468', 'UL8740710', '2028-08-11', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 6, NULL, '2023-11-17 20:50:36', '2023-11-17 20:50:36', '8', NULL),
(122, 'MOHAMED', 'ZAHOUT', 'Masculine', 'Adult', '06-15-63-57-93', '1949-01-01', 'E 725897', 'GS7210654', '2028-10-10', NULL, 'MAROCAIN', 'MARRAKECH', 'contact@ci-voyages.com', NULL, NULL, NULL, 5, NULL, '2023-11-17 21:27:27', '2023-11-17 21:27:27', '8', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `extra_service`
--

CREATE TABLE `extra_service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extra_service`
--

INSERT INTO `extra_service` (`id`, `name`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(8, 'LOGISTIQUE', '2023-10-24 22:11:24', '2023-10-24 22:11:24', '1', NULL),
(9, 'ANIMATION', '2023-10-24 22:12:21', '2023-10-24 22:12:21', '1', NULL),
(10, 'HAJ ZIARA', '2023-10-25 17:33:37', '2023-10-25 17:33:37', '1', NULL),
(11, 'réservation hôtel', '2023-10-25 17:56:44', '2023-10-25 17:56:44', '1', NULL),
(12, 'REDUCTION', '2023-10-27 00:34:26', '2023-10-27 00:34:26', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `extra_service_for_reservation`
--

CREATE TABLE `extra_service_for_reservation` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `extra_service_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `trip_type` varchar(255) DEFAULT NULL,
  `service_price` decimal(10,2) DEFAULT 0.00,
  `extra_service_buying_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra_service_price`
--

CREATE TABLE `extra_service_price` (
  `id` int(11) NOT NULL,
  `extra_service_id` int(11) DEFAULT NULL,
  `adult_buying_one` decimal(10,2) NOT NULL DEFAULT 0.00,
  `adult_selling_one` decimal(10,2) NOT NULL DEFAULT 0.00,
  `adult_buying_round` decimal(10,2) NOT NULL DEFAULT 0.00,
  `adult_selling_round` decimal(10,2) NOT NULL DEFAULT 0.00,
  `child_buying_one` decimal(10,2) NOT NULL DEFAULT 0.00,
  `child_selling_one` decimal(10,2) NOT NULL DEFAULT 0.00,
  `child_buying_round` decimal(10,2) NOT NULL DEFAULT 0.00,
  `child_selling_round` decimal(10,2) NOT NULL DEFAULT 0.00,
  `infant_buying_one` decimal(10,2) NOT NULL DEFAULT 0.00,
  `infant_selling_one` decimal(10,2) NOT NULL DEFAULT 0.00,
  `infant_buying_round` decimal(10,2) NOT NULL DEFAULT 0.00,
  `infant_selling_round` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extra_service_price`
--

INSERT INTO `extra_service_price` (`id`, `extra_service_id`, `adult_buying_one`, `adult_selling_one`, `adult_buying_round`, `adult_selling_round`, `child_buying_one`, `child_selling_one`, `child_buying_round`, `child_selling_round`, `infant_buying_one`, `infant_selling_one`, `infant_buying_round`, `infant_selling_round`, `created_at`, `updated_at`) VALUES
(7, 8, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, '2023-10-24 22:11:24', '2023-10-24 22:11:24'),
(8, 9, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, '2023-10-24 22:12:21', '2023-10-24 22:12:21'),
(9, 10, 60000.00, 80000.00, 60000.00, 80000.00, 60000.00, 75000.00, 60000.00, 75000.00, 20000.00, 35000.00, 20000.00, 35000.00, '2023-10-25 17:33:37', '2023-10-25 17:33:37'),
(10, 11, 300.00, 500.00, 300.00, 500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-25 17:56:44', '2023-10-25 17:56:44'),
(11, 12, -500.00, -500.00, -500.00, -500.00, -500.00, -500.00, -500.00, -500.00, 0.00, 0.00, 0.00, 0.00, '2023-10-27 00:34:26', '2023-10-27 00:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `flight_reservation`
--

CREATE TABLE `flight_reservation` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `flight_id` int(11) DEFAULT NULL,
  `from_airport` varchar(255) DEFAULT NULL,
  `to_airport` varchar(255) DEFAULT NULL,
  `trip_type` varchar(255) DEFAULT NULL,
  `flight_type` varchar(255) DEFAULT NULL,
  `air_company_id` int(11) DEFAULT NULL,
  `departure_time` varchar(255) DEFAULT NULL,
  `return_time` varchar(255) DEFAULT NULL,
  `service_price` decimal(10,2) DEFAULT 0.00,
  `selling_price` decimal(10,2) DEFAULT 0.00,
  `purchased_price` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight_reservation`
--

INSERT INTO `flight_reservation` (`id`, `reservation_id`, `flight_id`, `from_airport`, `to_airport`, `trip_type`, `flight_type`, `air_company_id`, `departure_time`, `return_time`, `service_price`, `selling_price`, `purchased_price`, `created_at`, `updated_at`) VALUES
(6, 42, 5, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 15000.00, 15000.00, 13000.00, '2023-11-14 01:54:09', '2023-11-14 01:54:09'),
(7, 43, 5, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 15000.00, 15000.00, 13000.00, '2023-11-14 01:55:00', '2023-11-14 01:55:00'),
(8, 44, 5, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 15000.00, 15000.00, 13000.00, '2023-11-14 01:55:33', '2023-11-14 01:55:33'),
(9, 45, 5, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 15000.00, 15000.00, 13000.00, '2023-11-14 01:56:22', '2023-11-15 15:44:37'),
(10, 46, 5, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 15000.00, 15000.00, 13000.00, '2023-11-14 01:56:58', '2023-11-14 01:56:58'),
(11, 47, 4, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 9000.00, 9000.00, 8000.00, '2023-11-14 01:57:43', '2023-11-15 15:44:37'),
(12, 48, 4, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 9000.00, 9000.00, 8000.00, '2023-11-14 01:58:54', '2023-11-14 01:58:54'),
(13, 49, 4, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 9000.00, 9000.00, 8000.00, '2023-11-14 01:59:30', '2023-11-14 01:59:30'),
(14, 50, 4, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 9000.00, 9000.00, 8000.00, '2023-11-14 02:00:24', '2023-11-14 02:00:24'),
(16, 52, 4, NULL, NULL, NULL, NULL, NULL, '2024-01-01', '2024-02-01', 9000.00, 9000.00, 8000.00, '2023-11-14 02:01:47', '2023-11-14 02:01:47');

-- --------------------------------------------------------

--
-- Table structure for table `grouping`
--

CREATE TABLE `grouping` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `going_date` varchar(255) DEFAULT NULL,
  `coming_date` varchar(255) DEFAULT NULL,
  `group_by` varchar(255) DEFAULT NULL,
  `group_by_role` varchar(255) DEFAULT NULL,
  `added_by` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grouping`
--

INSERT INTO `grouping` (`id`, `group_name`, `going_date`, `coming_date`, `group_by`, `group_by_role`, `added_by`, `created_at`, `updated_at`) VALUES
(16, 'Group c', '2023-11-01', '2025-01-04', 'Directeur', 'Admin', '1', '2023-11-18 15:58:03', '2023-11-18 16:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `grouping_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`id`, `grouping_id`, `reservation_id`, `created_at`, `updated_at`) VALUES
(101, 16, 42, '2023-11-18 16:41:05', '2023-11-18 16:41:05'),
(102, 16, 43, '2023-11-18 16:41:05', '2023-11-18 16:41:05'),
(103, 16, 44, '2023-11-18 16:41:05', '2023-11-18 16:41:05'),
(104, 16, 52, '2023-11-18 16:41:05', '2023-11-18 16:41:05'),
(105, 16, 55, '2023-11-18 16:41:05', '2023-11-18 16:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `group_ticketing`
--

CREATE TABLE `group_ticketing` (
  `id` int(11) NOT NULL,
  `grouping_id` int(11) DEFAULT NULL,
  `ticketing_type` varchar(255) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT 0.00,
  `buying_price` decimal(10,2) DEFAULT 0.00,
  `service_price` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `individual_ticketing`
--

CREATE TABLE `individual_ticketing` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `ticketing_type` varchar(255) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT 0.00,
  `buying_price` decimal(10,2) DEFAULT 0.00,
  `service_price` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lodging_reservation`
--

CREATE TABLE `lodging_reservation` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `lodging_in_madina` int(11) DEFAULT NULL,
  `room_type_in_madina` varchar(255) DEFAULT NULL,
  `from_date_madina` varchar(255) DEFAULT NULL,
  `to_date_madina` varchar(255) DEFAULT NULL,
  `lodging_in_makkah` int(11) DEFAULT NULL,
  `room_type_in_makkah` varchar(255) DEFAULT NULL,
  `from_date_makkah` varchar(255) DEFAULT NULL,
  `to_date_makkah` varchar(255) DEFAULT NULL,
  `lodging_length_stay_madina` varchar(255) DEFAULT NULL,
  `lodging_length_stay_makkah` varchar(255) DEFAULT NULL,
  `madina_price` decimal(10,2) DEFAULT 0.00,
  `makkah_price` decimal(10,2) DEFAULT 0.00,
  `makkah_buying_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `madina_buying_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lodging_reservation`
--

INSERT INTO `lodging_reservation` (`id`, `reservation_id`, `destination`, `lodging_in_madina`, `room_type_in_madina`, `from_date_madina`, `to_date_madina`, `lodging_in_makkah`, `room_type_in_makkah`, `from_date_makkah`, `to_date_makkah`, `lodging_length_stay_madina`, `lodging_length_stay_makkah`, `madina_price`, `makkah_price`, `makkah_buying_price`, `madina_buying_price`, `created_at`, `updated_at`) VALUES
(4, 55, 'Al Madina', 6, 'room_for_two', '2023-11-16', '2023-11-18', 5, 'room_for_two', '2023-11-17', '2023-11-24', '2', '7', 4000.00, 12000.00, 9500.00, 2200.00, '2023-11-15 11:32:51', '2023-11-15 11:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `lodging_service`
--

CREATE TABLE `lodging_service` (
  `id` int(11) NOT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `hotel_type` varchar(255) DEFAULT NULL,
  `available_from` varchar(255) DEFAULT NULL,
  `available_to` varchar(255) DEFAULT NULL,
  `rooms_for_two` varchar(255) DEFAULT NULL,
  `rooms_for_three` varchar(255) DEFAULT NULL,
  `rooms_for_four` varchar(255) DEFAULT NULL,
  `rooms_for_five` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lodging_service`
--

INSERT INTO `lodging_service` (`id`, `hotel_name`, `city`, `hotel_type`, `available_from`, `available_to`, `rooms_for_two`, `rooms_for_three`, `rooms_for_four`, `rooms_for_five`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(5, 'SALSABIL RAZA', 'Makkah', 'Economic', '2024-03-02', '2024-04-12', '9', '29', '10', '45', '2023-10-10 04:56:21', '2023-10-24 20:37:16', '1', NULL),
(6, 'MANAZIL LASWAF', 'Madina', 'Economic', '2024-03-06', '2024-03-30', '4', '10', '12', '10', '2023-10-10 04:59:57', '2023-10-24 19:51:41', '1', NULL),
(7, 'MARKAZIA / ECO', 'Madina', 'Economic', '2023-10-31', '2024-12-31', '20', '20', '20', '20', '2023-10-24 20:47:41', '2023-10-24 20:47:41', '1', NULL),
(8, 'BORJ DIAFA - MASSFALA 900 m', 'Makkah', 'Economic', '2023-10-31', '2024-12-31', '20', '20', '20', '20', '2023-10-24 21:11:28', '2023-10-24 21:11:28', '1', NULL),
(9, 'OLAYAN- GOLD /  450 m', 'Makkah', 'Normal', '2023-10-31', '2024-12-31', '20', '20', '20', '20', '2023-10-24 21:17:47', '2023-10-24 21:17:47', '1', NULL),
(10, 'MADNA / NORM / MARKAZIA ****', 'Madina', 'Normal', '2023-10-31', '2024-12-31', '20', '20', '20', '20', '2023-10-24 21:31:15', '2023-10-24 21:31:15', '1', NULL),
(11, '5***** MADINA', 'Madina', 'VIP', '2023-10-31', '2024-12-31', '20', '20', '20', '20', '2023-10-24 21:36:30', '2023-10-24 21:36:30', '1', NULL),
(12, 'ABRAJ/ MAKA', 'Makkah', 'VIP', '2023-10-31', '2024-12-31', '20', '20', '20', '20', '2023-10-24 21:40:17', '2023-10-24 21:40:17', '1', NULL),
(13, 'HOT TEST', 'Madina', 'Economic', '2023-10-26', '2024-12-31', '1', '1', '1', '1', '2023-10-27 00:54:53', '2023-10-27 00:54:53', '1', NULL),
(14, 'HOT TEST', 'Makkah', 'Economic', '2023-10-26', '2024-12-31', '1', '1', '1', '1', '2023-10-27 00:57:15', '2023-10-27 00:57:38', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lodging_service_price_for_individual`
--

CREATE TABLE `lodging_service_price_for_individual` (
  `id` int(11) NOT NULL,
  `lodging_service_id` int(11) DEFAULT NULL,
  `room_two_buying_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_selling_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_buying_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_selling_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_buying_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_selling_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_buying_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_selling_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_buying_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_selling_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_buying_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_selling_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_buying_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_selling_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_buying_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_selling_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_buying_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_selling_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_buying_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_selling_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_buying_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_selling_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_buying_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_selling_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lodging_service_price_for_individual`
--

INSERT INTO `lodging_service_price_for_individual` (`id`, `lodging_service_id`, `room_two_buying_adult`, `room_two_selling_adult`, `room_two_buying_child`, `room_two_selling_child`, `room_two_buying_infant`, `room_two_selling_infant`, `room_three_buying_adult`, `room_three_selling_adult`, `room_three_buying_child`, `room_three_selling_child`, `room_three_buying_infant`, `room_three_selling_infant`, `room_four_buying_adult`, `room_four_selling_adult`, `room_four_buying_child`, `room_four_selling_child`, `room_four_buying_infant`, `room_four_selling_infant`, `room_five_buying_adult`, `room_five_selling_adult`, `room_five_buying_child`, `room_five_selling_child`, `room_five_buying_infant`, `room_five_selling_infant`, `created_at`, `updated_at`) VALUES
(7, 6, 2200.00, 4000.00, 2200.00, 4000.00, 0.00, 0.00, 1500.00, 3500.00, 1500.00, 3500.00, 0.00, 0.00, 1200.00, 3000.00, 1200.00, 3000.00, 0.00, 0.00, 1000.00, 2500.00, 1000.00, 2500.00, 0.00, 0.00, '2023-10-24 19:51:41', '2023-10-24 19:51:41'),
(8, 5, 9500.00, 12000.00, 9500.00, 12000.00, 0.00, 0.00, 6500.00, 8000.00, 6500.00, 8000.00, 0.00, 0.00, 5000.00, 7000.00, 5000.00, 7000.00, 0.00, 0.00, 4000.00, 6000.00, 4000.00, 6000.00, 0.00, 0.00, '2023-10-24 20:37:16', '2023-10-24 20:37:16'),
(9, 7, 1500.00, 3000.00, 1500.00, 3000.00, 0.00, 0.00, 1000.00, 2500.00, 1000.00, 2500.00, 0.00, 0.00, 800.00, 2000.00, 800.00, 2000.00, 0.00, 0.00, 600.00, 1500.00, 600.00, 1500.00, 0.00, 0.00, '2023-10-24 20:47:41', '2023-10-24 20:47:41'),
(10, 8, 1700.00, 2500.00, 1700.00, 2500.00, 0.00, 0.00, 1200.00, 2000.00, 1200.00, 2000.00, 0.00, 0.00, 900.00, 1800.00, 900.00, 1800.00, 0.00, 0.00, 700.00, 1500.00, 700.00, 1500.00, 0.00, 0.00, '2023-10-24 21:11:28', '2023-10-24 21:11:28'),
(11, 9, 2500.00, 4000.00, 2500.00, 4000.00, 0.00, 0.00, 1500.00, 3000.00, 1500.00, 3000.00, 0.00, 0.00, 1300.00, 2500.00, 1300.00, 2500.00, 0.00, 0.00, 1000.00, 2000.00, 1000.00, 2000.00, 0.00, 0.00, '2023-10-24 21:17:47', '2023-10-24 21:17:47'),
(12, 10, 2800.00, 4000.00, 2800.00, 4000.00, 0.00, 0.00, 2500.00, 3500.00, 2500.00, 3500.00, 0.00, 0.00, 2000.00, 3000.00, 2000.00, 3000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-24 21:31:15', '2023-10-24 21:31:15'),
(13, 11, 4500.00, 6000.00, 4500.00, 6000.00, 0.00, 0.00, 3500.00, 5000.00, 3500.00, 5000.00, 0.00, 0.00, 3000.00, 4500.00, 3000.00, 4500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-24 21:36:30', '2023-10-24 21:36:30'),
(14, 12, 11000.00, 13500.00, 11000.00, 13500.00, 0.00, 0.00, 9000.00, 11500.00, 9000.00, 11500.00, 0.00, 0.00, 7500.00, 10000.00, 7500.00, 10000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-24 21:40:17', '2023-10-24 21:40:17'),
(15, 13, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, '2023-10-27 00:54:53', '2023-10-27 00:54:53'),
(17, 14, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 10001000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, '2023-10-27 00:57:38', '2023-10-27 00:57:38');

-- --------------------------------------------------------

--
-- Table structure for table `lodging_service_price_for_package`
--

CREATE TABLE `lodging_service_price_for_package` (
  `id` int(11) NOT NULL,
  `lodging_service_id` int(11) DEFAULT NULL,
  `room_two_buying_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_selling_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_buying_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_selling_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_buying_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_two_selling_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_buying_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_selling_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_buying_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_selling_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_buying_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_three_selling_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_buying_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_selling_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_buying_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_selling_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_buying_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_four_selling_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_buying_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_selling_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_buying_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_selling_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_buying_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `room_five_selling_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lodging_service_price_for_package`
--

INSERT INTO `lodging_service_price_for_package` (`id`, `lodging_service_id`, `room_two_buying_adult`, `room_two_selling_adult`, `room_two_buying_child`, `room_two_selling_child`, `room_two_buying_infant`, `room_two_selling_infant`, `room_three_buying_adult`, `room_three_selling_adult`, `room_three_buying_child`, `room_three_selling_child`, `room_three_buying_infant`, `room_three_selling_infant`, `room_four_buying_adult`, `room_four_selling_adult`, `room_four_buying_child`, `room_four_selling_child`, `room_four_buying_infant`, `room_four_selling_infant`, `room_five_buying_adult`, `room_five_selling_adult`, `room_five_buying_child`, `room_five_selling_child`, `room_five_buying_infant`, `room_five_selling_infant`, `created_at`, `updated_at`) VALUES
(5, 6, 2200.00, 3500.00, 2200.00, 3500.00, 0.00, 0.00, 1500.00, 3000.00, 1500.00, 3000.00, 0.00, 0.00, 1200.00, 2500.00, 1200.00, 2500.00, 0.00, 0.00, 1000.00, 2000.00, 1000.00, 2000.00, 0.00, 0.00, '2023-10-24 19:51:41', '2023-10-24 19:51:41'),
(6, 5, 9500.00, 11000.00, 9500.00, 11000.00, 0.00, 0.00, 6500.00, 7500.00, 6500.00, 7500.00, 0.00, 0.00, 5000.00, 6000.00, 5000.00, 6000.00, 0.00, 0.00, 4000.00, 5000.00, 4000.00, 5000.00, 0.00, 0.00, '2023-10-24 20:37:16', '2023-10-24 20:37:16'),
(7, 7, 1500.00, 2500.00, 1500.00, 2500.00, 0.00, 0.00, 1000.00, 2000.00, 1000.00, 2000.00, 0.00, 0.00, 800.00, 1500.00, 800.00, 1500.00, 0.00, 0.00, 600.00, 1200.00, 600.00, 1200.00, 0.00, 0.00, '2023-10-24 20:47:41', '2023-10-24 20:47:41'),
(8, 8, 1700.00, 2000.00, 1700.00, 2000.00, 0.00, 0.00, 1200.00, 1800.00, 1200.00, 1800.00, 0.00, 0.00, 900.00, 1300.00, 900.00, 1300.00, 0.00, 0.00, 700.00, 1200.00, 700.00, 1200.00, 0.00, 0.00, '2023-10-24 21:11:28', '2023-10-24 21:11:28'),
(9, 9, 2500.00, 3500.00, 2500.00, 3500.00, 0.00, 0.00, 1500.00, 2500.00, 1500.00, 2500.00, 0.00, 0.00, 1300.00, 2300.00, 1300.00, 2300.00, 0.00, 0.00, 1000.00, 2000.00, 1000.00, 2000.00, 0.00, 0.00, '2023-10-24 21:17:47', '2023-10-24 21:17:47'),
(10, 10, 2800.00, 3500.00, 2800.00, 3500.00, 0.00, 0.00, 2500.00, 3300.00, 2500.00, 3300.00, 0.00, 0.00, 2000.00, 2800.00, 2000.00, 2800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-24 21:31:16', '2023-10-24 21:31:16'),
(11, 11, 4500.00, 5500.00, 4500.00, 5500.00, 0.00, 0.00, 3500.00, 4500.00, 3500.00, 4500.00, 0.00, 0.00, 3000.00, 4000.00, 3000.00, 4000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-24 21:36:30', '2023-10-24 21:36:30'),
(12, 12, 11000.00, 13000.00, 11000.00, 13000.00, 0.00, 0.00, 9000.00, 11000.00, 9000.00, 11000.00, 0.00, 0.00, 7500.00, 9500.00, 7500.00, 9500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-24 21:40:17', '2023-10-24 21:40:17'),
(13, 13, 1000.00, 1500.00, 1000.00, 1000.00, 1000.00, 1000.00, 1500.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, '2023-10-27 00:54:53', '2023-10-27 00:54:53'),
(15, 14, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, 1000.00, '2023-10-27 00:57:38', '2023-10-27 00:57:38');

-- --------------------------------------------------------

--
-- Table structure for table `package_reservation`
--

CREATE TABLE `package_reservation` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `package_type` varchar(255) DEFAULT NULL,
  `package_service_id` int(11) DEFAULT NULL,
  `from_date` varchar(255) DEFAULT NULL,
  `to_date` varchar(255) DEFAULT NULL,
  `length_of_stay` varchar(255) DEFAULT NULL,
  `service_price` decimal(10,2) DEFAULT 0.00,
  `service_buying_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_service`
--

CREATE TABLE `package_service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `available_from` varchar(255) DEFAULT NULL,
  `available_to` varchar(255) DEFAULT NULL,
  `visa` int(11) DEFAULT NULL,
  `lodging_in_makkah` int(11) DEFAULT NULL,
  `room_type_makkah` varchar(255) DEFAULT NULL,
  `lodging_in_madina` int(11) DEFAULT NULL,
  `room_type_madina` varchar(255) DEFAULT NULL,
  `ticket` int(11) DEFAULT NULL,
  `transport` int(11) DEFAULT NULL,
  `extra_service_id` int(11) DEFAULT NULL,
  `extra_service_type` varchar(255) DEFAULT NULL,
  `price_for_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `price_for_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `price_for_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `buying_price_for_adult` decimal(10,2) NOT NULL DEFAULT 0.00,
  `buying_price_for_child` decimal(10,2) NOT NULL DEFAULT 0.00,
  `buying_price_for_infant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_service`
--

INSERT INTO `package_service` (`id`, `name`, `available_from`, `available_to`, `visa`, `lodging_in_makkah`, `room_type_makkah`, `lodging_in_madina`, `room_type_madina`, `ticket`, `transport`, `extra_service_id`, `extra_service_type`, `price_for_adult`, `price_for_child`, `price_for_infant`, `buying_price_for_adult`, `buying_price_for_child`, `buying_price_for_infant`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(5, 'ECO/4', '2023-12-24', '2023-12-24', 10, 8, 'room_for_four', 7, 'room_for_four', 4, 13, 8, 'round way', 15700.00, 15500.00, 4000.00, 12500.00, 12500.00, 3800.00, '2023-10-24 18:16:28', '2023-10-24 22:16:28', '1', NULL),
(6, 'ECO/3', '2023-10-27', '2023-10-29', 10, 8, 'room_for_three', 7, 'room_for_three', 4, 13, 8, 'round way', 16700.00, 16500.00, 4000.00, 13000.00, 13000.00, 3800.00, '2023-10-24 22:17:37', '2023-10-24 22:17:37', '1', NULL),
(7, 'ECO/2', '2023-10-28', '2023-10-29', 10, 8, 'room_for_two', 7, 'room_for_two', 4, 13, 8, 'round way', 17400.00, 17200.00, 4000.00, 14000.00, 14000.00, 3800.00, '2023-10-24 22:18:22', '2023-10-24 22:18:22', '1', NULL),
(8, 'ECO/5', '2023-10-20', '2023-10-29', 10, 8, 'room_for_five', 7, 'room_for_five', 4, 13, 8, 'round way', 15300.00, 15100.00, 4000.00, 12100.00, 12100.00, 3800.00, '2023-10-24 22:19:20', '2023-10-24 22:19:20', '1', NULL),
(9, 'RM/ECO5', '2023-10-31', '2024-10-31', 11, 5, 'room_for_five', 6, 'room_for_five', 5, 13, NULL, NULL, 21650.00, 21450.00, 2550.00, 19800.00, 19800.00, 2800.00, '2023-11-17 20:21:42', '2023-11-18 01:21:42', '1', NULL),
(10, 'RM/ECO4', '2023-10-31', '2024-12-31', 10, 5, 'room_for_four', 6, 'room_for_four', 5, 13, NULL, NULL, 26400.00, 26200.00, 3500.00, 21000.00, 21000.00, 2800.00, '2023-11-17 19:52:30', '2023-11-18 00:52:30', '1', NULL),
(11, 'RM/ECO3', '2023-10-31', '2024-12-31', 10, 5, 'room_for_three', 6, 'room_for_three', 5, 13, NULL, NULL, 28400.00, 28200.00, 3500.00, 22800.00, 22800.00, 2800.00, '2023-10-26 23:47:53', '2023-10-26 23:47:53', '1', NULL),
(12, 'RM/ECO2', '2023-10-31', '2024-12-31', 10, 5, 'room_for_two', 6, 'room_for_two', 5, 13, NULL, NULL, 32400.00, 32200.00, 3500.00, 26500.00, 26500.00, 2800.00, '2023-10-26 23:49:16', '2023-10-26 23:49:16', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail_for_reservation`
--

CREATE TABLE `payment_detail_for_reservation` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `advance_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rest_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_detail_for_reservation`
--

INSERT INTO `payment_detail_for_reservation` (`id`, `reservation_id`, `payment_method`, `total_amount`, `advance_amount`, `rest_amount`, `created_at`, `updated_at`) VALUES
(41, 42, 'Cash', 15000.00, 0.00, 15000.00, '2023-11-14 01:54:09', '2023-11-14 01:54:09'),
(42, 43, 'Cash', 15000.00, 0.00, 15000.00, '2023-11-14 01:55:00', '2023-11-14 01:55:00'),
(43, 44, 'Cash', 15000.00, 0.00, 15000.00, '2023-11-14 01:55:33', '2023-11-14 01:55:33'),
(44, 45, 'Cash', 15000.00, 0.00, 15000.00, '2023-11-14 01:56:22', '2023-11-15 15:44:37'),
(45, 46, 'Cash', 15000.00, 0.00, 15000.00, '2023-11-14 01:56:58', '2023-11-14 01:56:58'),
(46, 47, 'Cash', 9000.00, 0.00, 9000.00, '2023-11-14 01:57:43', '2023-11-15 15:44:37'),
(47, 48, 'Cash', 9000.00, 0.00, 9000.00, '2023-11-14 01:58:54', '2023-11-14 01:58:54'),
(48, 49, 'Cash', 9000.00, 0.00, 9000.00, '2023-11-14 01:59:30', '2023-11-14 01:59:30'),
(49, 50, 'Cash', 9000.00, 0.00, 9000.00, '2023-11-14 02:00:24', '2023-11-14 02:00:24'),
(50, 52, 'Cash', 9000.00, 0.00, 9000.00, '2023-11-14 02:01:47', '2023-11-14 02:01:47'),
(53, 55, 'Cash', 16000.00, 14.00, 15986.00, '2023-11-15 11:32:51', '2023-11-15 11:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `reservation_no` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `reservation_status` varchar(255) DEFAULT NULL,
  `going_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `reservation_no`, `customer_id`, `service_type`, `reservation_status`, `going_date`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(42, '131123205409', 6, 'flight', '0', '2024-01-01', '2023-11-14 01:54:09', '2023-11-14 01:54:09', '1', NULL),
(43, '131123205500', 7, 'flight', '0', '2024-01-01', '2023-11-14 01:55:00', '2023-11-14 01:55:00', '1', NULL),
(44, '131123205533', 8, 'flight', '0', '2024-01-01', '2023-11-14 01:55:33', '2023-11-14 01:55:33', '1', NULL),
(45, '131123205622', 15, 'flight', '0', '2024-01-01', '2023-11-14 01:56:22', '2023-11-14 01:56:22', '1', NULL),
(46, '131123205658', 18, 'flight', '0', '2024-01-01', '2023-11-14 01:56:58', '2023-11-14 01:56:58', '1', NULL),
(47, '131123205743', 51, 'flight', '0', '2024-01-01', '2023-11-14 01:57:43', '2023-11-14 01:57:43', '1', NULL),
(48, '131123205854', 57, 'flight', '0', '2024-01-01', '2023-11-14 01:58:54', '2023-11-14 01:58:54', '1', NULL),
(49, '131123205930', 91, 'flight', '0', '2024-01-01', '2023-11-14 01:59:30', '2023-11-14 01:59:30', '1', NULL),
(50, '131123210024', 53, 'flight', '0', '2024-01-01', '2023-11-14 02:00:24', '2023-11-14 02:00:24', '1', NULL),
(52, '131123210147', 93, 'flight', '0', '2024-01-01', '2023-11-14 02:01:47', '2023-11-14 02:01:47', '1', NULL),
(55, '151123063251', 6, 'lodging', '1', '2023-11-17', '2023-11-15 11:32:51', '2023-11-15 11:32:51', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_service`
--

CREATE TABLE `ticket_service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `flight_type` varchar(255) DEFAULT NULL,
  `air_company` int(11) DEFAULT NULL,
  `from_airport` varchar(255) DEFAULT NULL,
  `to_airport` varchar(255) DEFAULT NULL,
  `number_of_seats` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_service`
--

INSERT INTO `ticket_service` (`id`, `name`, `type`, `flight_type`, `air_company`, `from_airport`, `to_airport`, `number_of_seats`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(4, 'GOLF OMRA MLD', 'Round Way', 'InDirect', 6, 'CASABLANCA AIRPORT (CMN)', 'JEDDAH AIRPORT (JED)', '35', '2023-10-24 22:10:28', '2023-10-24 22:10:28', '1', NULL),
(5, 'RAMADAN TKT INDIR', 'Round Way', 'InDirect', 8, 'CASABLANCA AIRPORT (CMN)', 'JEDDAH AIRPORT (JED)', '500', '2023-10-26 23:12:33', '2023-11-18 00:51:46', '1', NULL),
(6, 'RAMADAN TKT DIR', 'Round Way', 'Direct', 2, 'MARRAKECH AIRPORT (RAK)', 'JEDDAH AIRPORT (JED)', '100', '2023-11-17 23:49:09', '2023-11-17 23:49:09', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_service_price`
--

CREATE TABLE `ticket_service_price` (
  `id` int(11) NOT NULL,
  `ticket_service_id` int(11) DEFAULT NULL,
  `package_adult_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_adult_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_child_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_child_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_infant_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_infant_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_adult_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_adult_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_child_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_child_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_infant_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_infant_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_service_price`
--

INSERT INTO `ticket_service_price` (`id`, `ticket_service_id`, `package_adult_buying`, `package_adult_selling`, `package_child_buying`, `package_child_selling`, `package_infant_buying`, `package_infant_selling`, `individual_adult_buying`, `individual_adult_selling`, `individual_child_buying`, `individual_child_selling`, `individual_infant_buying`, `individual_infant_selling`, `created_at`, `updated_at`) VALUES
(4, 4, 8000.00, 9000.00, 8000.00, 9000.00, 1000.00, 1000.00, 8000.00, 9000.00, 8000.00, 9000.00, 1000.00, 1000.00, '2023-10-24 22:10:28', '2023-10-24 22:10:28'),
(7, 6, 14500.00, 16000.00, 14500.00, 16000.00, 1000.00, 1000.00, 14500.00, 16000.00, 14500.00, 16000.00, 1000.00, 1000.00, '2023-11-17 23:49:09', '2023-11-17 23:49:09'),
(9, 5, 13000.00, 13000.00, 13000.00, 13000.00, 1000.00, 1500.00, 13000.00, 13000.00, 13000.00, 13000.00, 1000.00, 1500.00, '2023-11-18 00:51:46', '2023-11-18 00:51:46');

-- --------------------------------------------------------

--
-- Table structure for table `transport_reservation`
--

CREATE TABLE `transport_reservation` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `transport_service_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `trip_type` varchar(255) DEFAULT NULL,
  `service_price` decimal(10,2) DEFAULT 0.00,
  `service_buying_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_service`
--

CREATE TABLE `transport_service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transport_service`
--

INSERT INTO `transport_service` (`id`, `name`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(13, 'TRS/ GROUPE', '2023-10-24 21:52:43', '2023-10-24 21:52:43', '1', NULL),
(14, 'TRS/VIP/ GMS/TGV+GMS', '2023-10-24 22:03:31', '2023-10-24 22:03:31', '1', NULL),
(15, 'free', '2023-10-25 18:03:50', '2023-10-25 18:03:50', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transport_service_price`
--

CREATE TABLE `transport_service_price` (
  `id` int(11) NOT NULL,
  `transport_service_id` int(11) DEFAULT NULL,
  `package_adult_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_adult_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_child_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_child_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_infant_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `package_infant_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_adult_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_adult_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_child_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_child_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_infant_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `individual_infant_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transport_service_price`
--

INSERT INTO `transport_service_price` (`id`, `transport_service_id`, `package_adult_buying`, `package_adult_selling`, `package_child_buying`, `package_child_selling`, `package_infant_buying`, `package_infant_selling`, `individual_adult_buying`, `individual_adult_selling`, `individual_child_buying`, `individual_child_selling`, `individual_infant_buying`, `individual_infant_selling`, `created_at`, `updated_at`) VALUES
(6, 13, 400.00, 600.00, 400.00, 400.00, 0.00, 0.00, 400.00, 600.00, 400.00, 400.00, 0.00, 0.00, '2023-10-24 21:52:43', '2023-10-24 21:52:43'),
(7, 14, 10000.00, 11000.00, 10000.00, 11000.00, 0.00, 0.00, 10000.00, 11000.00, 10000.00, 11000.00, 0.00, 0.00, '2023-10-24 22:03:31', '2023-10-24 22:03:31'),
(8, 15, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-25 18:03:50', '2023-10-25 18:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(300) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `phone`, `address`, `profile_image`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'samir', 'samir', NULL, '$2y$10$wBGYQCdYTHN/EFxk2Zk.7.c4VMjK85gDfVtA/aXakwlDtnbYr7OMG', NULL, NULL, 'passport_files/0Hy8QhHim6dTl5EqPup9lvbH0KtdyOrIduNgp2Vf.jpg', 'MANAGER', 1, '2023-10-19 14:40:57', '2023-10-19 14:40:57'),
(2, 'didani', 'didani', NULL, '$2y$10$cVu6p9D76I0M6RLxFNVnl.KptC1e8SGaqWiDEttxzov3Ug9maMWgq', NULL, NULL, 'passport_files/RLMf3mn8P1it4vzsCVfFhZ0zJdWiLPfbwswBiIhy.jpg', 'COMMERCIAL AGENT', 1, '2023-10-19 14:47:50', '2023-10-19 14:47:50'),
(3, 'didani', 'didani', NULL, '$2y$10$2I6rRZsbn2p5xHyovqiXL.NxZff/ahsipNZB9Qp9fI6K9mtlWUMR.', NULL, NULL, 'passport_files/wRDmvuFhsYH8Kzxlu3U0mc7OquIdPLfmr8rPlXiG.jpg', 'COMMERCIAL AGENT', 1, '2023-10-19 14:48:33', '2023-10-19 14:48:33'),
(4, 'MAHDI', 'mahdi', NULL, '$2y$10$krNkInY6Pbl6NKRgj6o52OKe3gYcsUj7oIKx6OCBcX8pb.SscuCbm', NULL, NULL, 'passport_files/HxquIwR7lDrobENgGTAJg8ZOoPzB7Gro6GiNw0nW.jpg', 'COMMERCIAL AGENT', 1, '2023-10-26 15:53:10', '2023-10-26 15:53:10'),
(5, 'MAHDI', 'mahdi', NULL, '$2y$10$g8Gga2RIPhbTWaO7H3TcMORasT/DQaa5pHHscjf9gGlKcTGCdSlCS', NULL, NULL, 'passport_files/GJqnsqCvEToNKu4bwBKmnN48e3K2xf4zc6RjeWO1.jpg', 'COMMERCIAL AGENT', 1, '2023-10-26 15:56:59', '2023-10-26 15:56:59'),
(6, 'Mohamed ElHattabi', 'Simo', NULL, '$2y$10$ySJV4DtnjdqVnKJzDNhvseWGnRBlvycPZ.6MINGgdDJaXFT/g5sMa', NULL, NULL, 'passport_files/wZ2EPQf34hM6SQ2KxrQDs9QADGoUle3Hi9Tr5vcc.png', 'MANAGER', 1, '2023-10-26 17:53:11', '2023-10-26 17:53:11');

-- --------------------------------------------------------

--
-- Table structure for table `visa_price_for_individual`
--

CREATE TABLE `visa_price_for_individual` (
  `id` int(11) NOT NULL,
  `visa_service_id` int(11) NOT NULL,
  `adult_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `adult_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `child_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `child_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `infant_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `infant_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visa_price_for_individual`
--

INSERT INTO `visa_price_for_individual` (`id`, `visa_service_id`, `adult_buying`, `adult_selling`, `child_buying`, `child_selling`, `infant_buying`, `infant_selling`, `created_at`, `updated_at`) VALUES
(9, 11, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-11-18 01:22:47', '2023-11-18 01:22:47'),
(10, 10, 1500.00, 2500.00, 1500.00, 2500.00, 1500.00, 2000.00, '2023-11-18 01:27:01', '2023-11-18 01:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `visa_price_for_package`
--

CREATE TABLE `visa_price_for_package` (
  `id` int(11) NOT NULL,
  `visa_service_id` int(11) NOT NULL,
  `adult_buying` int(11) NOT NULL DEFAULT 0,
  `adult_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `child_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `child_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `infant_buying` decimal(10,2) NOT NULL DEFAULT 0.00,
  `infant_selling` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visa_price_for_package`
--

INSERT INTO `visa_price_for_package` (`id`, `visa_service_id`, `adult_buying`, `adult_selling`, `child_buying`, `child_selling`, `infant_buying`, `infant_selling`, `created_at`, `updated_at`) VALUES
(10, 11, 1000, 5050.00, 1000.00, 5050.00, 1000.00, 5050.00, '2023-11-18 01:22:47', '2023-11-18 01:22:47'),
(11, 10, 1800, 6000.00, 1800.00, 3000.00, 1800.00, 3000.00, '2023-11-18 01:27:01', '2023-11-18 01:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `visa_reservation`
--

CREATE TABLE `visa_reservation` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `visa_type` varchar(255) DEFAULT NULL,
  `from_date` varchar(255) DEFAULT NULL,
  `to_date` varchar(255) DEFAULT NULL,
  `length_of_stay` varchar(255) DEFAULT NULL,
  `service_price` decimal(10,2) DEFAULT 0.00,
  `service_buying_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visa_service`
--

CREATE TABLE `visa_service` (
  `id` int(11) NOT NULL,
  `visa_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` varchar(255) DEFAULT NULL,
  `added_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visa_service`
--

INSERT INTO `visa_service` (`id`, `visa_name`, `created_at`, `updated_at`, `added_by`, `added_role`) VALUES
(10, 'VISA OMRA', '2023-10-24 19:25:42', '2023-11-18 01:27:01', '1', NULL),
(11, 'VISA RAMADN', '2023-11-18 01:18:10', '2023-11-18 01:22:47', '1', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `air_company`
--
ALTER TABLE `air_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collaborator`
--
ALTER TABLE `collaborator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `linked_with` (`linked_with`),
  ADD KEY `collaborator` (`collaborator`);

--
-- Indexes for table `extra_service`
--
ALTER TABLE `extra_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_service_for_reservation`
--
ALTER TABLE `extra_service_for_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_service_for_reservation_ibfk_1` (`reservation_id`),
  ADD KEY `extra_service_id` (`extra_service_id`);

--
-- Indexes for table `extra_service_price`
--
ALTER TABLE `extra_service_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_service_price_ibfk_1` (`extra_service_id`);

--
-- Indexes for table `flight_reservation`
--
ALTER TABLE `flight_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `flight_reservation_ibfk_1` (`reservation_id`),
  ADD KEY `air_company_id` (`air_company_id`);

--
-- Indexes for table `grouping`
--
ALTER TABLE `grouping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_members_ibfk_2` (`grouping_id`),
  ADD KEY `group_members_ibfk_1` (`reservation_id`);

--
-- Indexes for table `group_ticketing`
--
ALTER TABLE `group_ticketing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grouping_id` (`grouping_id`);

--
-- Indexes for table `individual_ticketing`
--
ALTER TABLE `individual_ticketing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `lodging_reservation`
--
ALTER TABLE `lodging_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lodging_reservation_ibfk_1` (`reservation_id`),
  ADD KEY `lodging_in_madina` (`lodging_in_madina`),
  ADD KEY `lodging_in_makkah` (`lodging_in_makkah`);

--
-- Indexes for table `lodging_service`
--
ALTER TABLE `lodging_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lodging_service_price_for_individual`
--
ALTER TABLE `lodging_service_price_for_individual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lodging_service_price_for_individual_ibfk_1` (`lodging_service_id`);

--
-- Indexes for table `lodging_service_price_for_package`
--
ALTER TABLE `lodging_service_price_for_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lodging_service_price_for_package_ibfk_1` (`lodging_service_id`);

--
-- Indexes for table `package_reservation`
--
ALTER TABLE `package_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_service_id`),
  ADD KEY `package_reservation_ibfk_1` (`reservation_id`);

--
-- Indexes for table `package_service`
--
ALTER TABLE `package_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_service_id` (`extra_service_id`),
  ADD KEY `lodging_in_madina` (`lodging_in_madina`),
  ADD KEY `lodging_in_makkah` (`lodging_in_makkah`),
  ADD KEY `visa` (`visa`),
  ADD KEY `transport` (`transport`),
  ADD KEY `ticket` (`ticket`);

--
-- Indexes for table `payment_detail_for_reservation`
--
ALTER TABLE `payment_detail_for_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_detail_for_reservation_ibfk_1` (`reservation_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `ticket_service`
--
ALTER TABLE `ticket_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `air_company` (`air_company`);

--
-- Indexes for table `ticket_service_price`
--
ALTER TABLE `ticket_service_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_service_id` (`ticket_service_id`);

--
-- Indexes for table `transport_reservation`
--
ALTER TABLE `transport_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_reservation_ibfk_1` (`reservation_id`),
  ADD KEY `transport_service_id` (`transport_service_id`);

--
-- Indexes for table `transport_service`
--
ALTER TABLE `transport_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_service_price`
--
ALTER TABLE `transport_service_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_service_price_ibfk_1` (`transport_service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visa_price_for_individual`
--
ALTER TABLE `visa_price_for_individual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visa_price_for_individual_ibfk_1` (`visa_service_id`);

--
-- Indexes for table `visa_price_for_package`
--
ALTER TABLE `visa_price_for_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visa_price_for_package_ibfk_1` (`visa_service_id`);

--
-- Indexes for table `visa_reservation`
--
ALTER TABLE `visa_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visa_reservation_ibfk_1` (`reservation_id`);

--
-- Indexes for table `visa_service`
--
ALTER TABLE `visa_service`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `air_company`
--
ALTER TABLE `air_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `collaborator`
--
ALTER TABLE `collaborator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `extra_service`
--
ALTER TABLE `extra_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `extra_service_for_reservation`
--
ALTER TABLE `extra_service_for_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `extra_service_price`
--
ALTER TABLE `extra_service_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `flight_reservation`
--
ALTER TABLE `flight_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `grouping`
--
ALTER TABLE `grouping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `group_ticketing`
--
ALTER TABLE `group_ticketing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `individual_ticketing`
--
ALTER TABLE `individual_ticketing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lodging_reservation`
--
ALTER TABLE `lodging_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lodging_service`
--
ALTER TABLE `lodging_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lodging_service_price_for_individual`
--
ALTER TABLE `lodging_service_price_for_individual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `lodging_service_price_for_package`
--
ALTER TABLE `lodging_service_price_for_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `package_reservation`
--
ALTER TABLE `package_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `package_service`
--
ALTER TABLE `package_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `payment_detail_for_reservation`
--
ALTER TABLE `payment_detail_for_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `ticket_service`
--
ALTER TABLE `ticket_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_service_price`
--
ALTER TABLE `ticket_service_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transport_reservation`
--
ALTER TABLE `transport_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transport_service`
--
ALTER TABLE `transport_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transport_service_price`
--
ALTER TABLE `transport_service_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `visa_price_for_individual`
--
ALTER TABLE `visa_price_for_individual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `visa_price_for_package`
--
ALTER TABLE `visa_price_for_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `visa_reservation`
--
ALTER TABLE `visa_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `visa_service`
--
ALTER TABLE `visa_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`linked_with`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`collaborator`) REFERENCES `collaborator` (`id`);

--
-- Constraints for table `extra_service_for_reservation`
--
ALTER TABLE `extra_service_for_reservation`
  ADD CONSTRAINT `extra_service_for_reservation_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `extra_service_for_reservation_ibfk_2` FOREIGN KEY (`extra_service_id`) REFERENCES `extra_service` (`id`);

--
-- Constraints for table `extra_service_price`
--
ALTER TABLE `extra_service_price`
  ADD CONSTRAINT `extra_service_price_ibfk_1` FOREIGN KEY (`extra_service_id`) REFERENCES `extra_service` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flight_reservation`
--
ALTER TABLE `flight_reservation`
  ADD CONSTRAINT `flight_reservation_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flight_reservation_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `ticket_service` (`id`),
  ADD CONSTRAINT `flight_reservation_ibfk_3` FOREIGN KEY (`air_company_id`) REFERENCES `air_company` (`id`);

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`),
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`grouping_id`) REFERENCES `grouping` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_ticketing`
--
ALTER TABLE `group_ticketing`
  ADD CONSTRAINT `group_ticketing_ibfk_1` FOREIGN KEY (`grouping_id`) REFERENCES `grouping` (`id`);

--
-- Constraints for table `individual_ticketing`
--
ALTER TABLE `individual_ticketing`
  ADD CONSTRAINT `individual_ticketing_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Constraints for table `lodging_reservation`
--
ALTER TABLE `lodging_reservation`
  ADD CONSTRAINT `lodging_reservation_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lodging_reservation_ibfk_2` FOREIGN KEY (`lodging_in_madina`) REFERENCES `lodging_service` (`id`),
  ADD CONSTRAINT `lodging_reservation_ibfk_3` FOREIGN KEY (`lodging_in_makkah`) REFERENCES `lodging_service` (`id`);

--
-- Constraints for table `lodging_service_price_for_individual`
--
ALTER TABLE `lodging_service_price_for_individual`
  ADD CONSTRAINT `lodging_service_price_for_individual_ibfk_1` FOREIGN KEY (`lodging_service_id`) REFERENCES `lodging_service` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lodging_service_price_for_package`
--
ALTER TABLE `lodging_service_price_for_package`
  ADD CONSTRAINT `lodging_service_price_for_package_ibfk_1` FOREIGN KEY (`lodging_service_id`) REFERENCES `lodging_service` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_reservation`
--
ALTER TABLE `package_reservation`
  ADD CONSTRAINT `package_reservation_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `package_reservation_ibfk_2` FOREIGN KEY (`package_service_id`) REFERENCES `package_service` (`id`);

--
-- Constraints for table `package_service`
--
ALTER TABLE `package_service`
  ADD CONSTRAINT `package_service_ibfk_1` FOREIGN KEY (`extra_service_id`) REFERENCES `extra_service` (`id`),
  ADD CONSTRAINT `package_service_ibfk_2` FOREIGN KEY (`lodging_in_madina`) REFERENCES `lodging_service` (`id`),
  ADD CONSTRAINT `package_service_ibfk_3` FOREIGN KEY (`lodging_in_makkah`) REFERENCES `lodging_service` (`id`),
  ADD CONSTRAINT `package_service_ibfk_4` FOREIGN KEY (`visa`) REFERENCES `visa_service` (`id`),
  ADD CONSTRAINT `package_service_ibfk_5` FOREIGN KEY (`transport`) REFERENCES `transport_service` (`id`),
  ADD CONSTRAINT `package_service_ibfk_6` FOREIGN KEY (`ticket`) REFERENCES `ticket_service` (`id`);

--
-- Constraints for table `payment_detail_for_reservation`
--
ALTER TABLE `payment_detail_for_reservation`
  ADD CONSTRAINT `payment_detail_for_reservation_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `ticket_service`
--
ALTER TABLE `ticket_service`
  ADD CONSTRAINT `ticket_service_ibfk_1` FOREIGN KEY (`air_company`) REFERENCES `air_company` (`id`);

--
-- Constraints for table `ticket_service_price`
--
ALTER TABLE `ticket_service_price`
  ADD CONSTRAINT `ticket_service_price_ibfk_1` FOREIGN KEY (`ticket_service_id`) REFERENCES `ticket_service` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_reservation`
--
ALTER TABLE `transport_reservation`
  ADD CONSTRAINT `transport_reservation_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transport_reservation_ibfk_2` FOREIGN KEY (`transport_service_id`) REFERENCES `transport_service` (`id`);

--
-- Constraints for table `transport_service_price`
--
ALTER TABLE `transport_service_price`
  ADD CONSTRAINT `transport_service_price_ibfk_1` FOREIGN KEY (`transport_service_id`) REFERENCES `transport_service` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visa_price_for_individual`
--
ALTER TABLE `visa_price_for_individual`
  ADD CONSTRAINT `visa_price_for_individual_ibfk_1` FOREIGN KEY (`visa_service_id`) REFERENCES `visa_service` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visa_price_for_package`
--
ALTER TABLE `visa_price_for_package`
  ADD CONSTRAINT `visa_price_for_package_ibfk_1` FOREIGN KEY (`visa_service_id`) REFERENCES `visa_service` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visa_reservation`
--
ALTER TABLE `visa_reservation`
  ADD CONSTRAINT `visa_reservation_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
