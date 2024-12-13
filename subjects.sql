-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2024 at 08:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `credit_hours` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_code`, `subject_name`, `credit_hours`, `created_at`, `updated_at`) VALUES
(1, 'SEC11013', 'DISCRETE STRUCTURE', 3, NULL, NULL),
(2, 'SECJ1013', 'PROGRAMMING TECHNIQUE I', 3, NULL, NULL),
(3, 'SECR1013', 'DIGITAL LOGIC', 3, NULL, NULL),
(4, 'SECP1513', 'TECHNOLOGY & INFORMATION SYSTEM', 3, NULL, NULL),
(5, 'ULRS1012', 'VALUE AND IDENTITY', 2, NULL, NULL),
(6, 'SECV1113', 'MATHEMATICS FOR COMPUTER GRAPHICS', 3, NULL, NULL),
(7, 'SEC11143', 'PROBABILITY & STATISTICAL DATA ANALYSIS', 3, NULL, NULL),
(8, 'SECJ1023', 'PROGRAMMING TECHNIQUE II', 3, NULL, NULL),
(9, 'SECR1033', 'COMPUTER ORGANISATION AND ARCHITECTURE', 3, NULL, NULL),
(10, 'SECJ2203', 'SOFTWARE ENGINEERING', 3, NULL, NULL),
(11, 'SECD2523', 'DATABASE', 3, NULL, NULL),
(12, 'SECD2613', 'SYSTEM ANALYSIS AND DESIGN', 3, NULL, NULL),
(13, 'SECJ2013', 'DATA STRUCTURE AND ALGORITHM', 3, NULL, NULL),
(14, 'SECR2213', 'NETWORK COMMUNICATIONS', 3, NULL, NULL),
(15, 'SECV2113', 'HUMAN COMPUTER INTERACTION', 3, NULL, NULL),
(16, 'SECV2223', 'WEB PROGRAMMING', 3, NULL, NULL),
(17, 'SECR2043', 'OPERATING SYSTEMS', 3, NULL, NULL),
(18, 'SECJ2154', 'OBJECT ORIENTED PROGRAMMING', 4, NULL, NULL),
(19, 'UHLB2122', 'PROFESSIONAL COMMUNICATION SKILLS 1', 2, NULL, NULL),
(20, 'UHIS1022', 'PHILOSOPHY AND CURRENT ISSUES', 2, NULL, NULL),
(21, 'UHLB3132', 'PROFESSIONAL COMMUNICATION SKILLS 2', 2, NULL, NULL),
(22, 'SECV3032', 'GRAPHICS AND MULTIMEDIA SOFTWARE PROJECT 1', 2, NULL, NULL),
(23, 'ULRS3032', 'ENTERPRENEURSHIP AND INNOVATION', 2, NULL, NULL),
(24, 'SECV4118', 'INDUSTRIAL TRAINING(HW)', 8, NULL, NULL),
(25, 'SECV4114', 'INDUSTRIAL TRAINING REPORT', 4, NULL, NULL),
(26, 'SECV4134', 'GRAPHICS AND MULTIMEDIA SOFTWARE PROJECT II', 4, NULL, NULL),
(27, 'SECD3761', 'TECHNOPRENEURSHIP SEMINAR', 1, NULL, NULL),
(28, 'SECJ3203', 'THEORY OF COMPUTER SCIENCE', 3, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subjects_subject_code_unique` (`subject_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
