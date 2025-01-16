-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2025 at 11:02 PM
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
-- Database: `registrationsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `credits` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `section` int(11) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_code`, `credits`, `created_at`, `updated_at`, `section`, `semester`, `day`, `start_time`, `end_time`) VALUES
(1, 'Discrete Structure', 'SECI1013', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 1 [Semester 1]', '', '00:00:00', '00:00:00'),
(2, 'Programming Technique I', 'SECJ1013', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 1 [Semester 1]', '', '00:00:00', '00:00:00'),
(3, 'Digital Logic', 'SECR1013', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 1 [Semester 1]', '', '00:00:00', '00:00:00'),
(4, 'Technology & Information System', 'SECP1513', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 1 [Semester 1]', '', '00:00:00', '00:00:00'),
(5, 'Value and Identity', 'ULRS1012', 2, '2024-12-16 06:51:29', NULL, 10, 'Available Every Semester', '', '00:00:00', '00:00:00'),
(6, 'Mathematics for Computer Graphics', 'SECV1113', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 1 [Semester 2]', '', '00:00:00', '00:00:00'),
(7, 'Probability & Statistical Data Analysis', 'SECl1143', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 1 [Semester 2]', '', '00:00:00', '00:00:00'),
(8, 'Programming Technique II', 'SECJ1023', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 1 [Semester 2]', '', '00:00:00', '00:00:00'),
(9, 'Computer Organisation and Architecture', 'SECR1033', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 1 [Semester 2]', '', '00:00:00', '00:00:00'),
(10, 'Software Engineering', 'SECJ2203', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 1 [Semester 2]', '', '00:00:00', '00:00:00'),
(11, 'Appreciation of Ethics and Civilisations', 'UHMS1182', 2, '2024-12-16 06:51:29', NULL, 10, 'Available Every Semester', '', '00:00:00', '00:00:00'),
(12, 'Database', 'SECD2523', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 2 [Semester 1]', '', '00:00:00', '00:00:00'),
(13, 'System Analysis and Design', 'SECD2613', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 2 [Semester 1]', '', '00:00:00', '00:00:00'),
(14, 'Data Structure and Algorithm', 'SECJ2013', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 2 [Semester 1]', '', '00:00:00', '00:00:00'),
(15, 'Network Communications', 'SECR2213', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 2 [Semester 1]', '', '00:00:00', '00:00:00'),
(16, 'Human Computer Interaction', 'SECV2113', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 2 [Semester 1]', '', '00:00:00', '00:00:00'),
(17, 'Web Programming', 'SECV2223', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 2 [Semester 2]', '', '00:00:00', '00:00:00'),
(18, 'Operating Systems', 'SECR2043', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 2 [Semester 2]', '', '00:00:00', '00:00:00'),
(19, 'Object Oriented Programming', 'SECJ2154', 4, '2024-12-16 06:51:29', NULL, 2, 'Year 2 [Semester 2]', '', '00:00:00', '00:00:00'),
(20, 'Professional Communication Skills 1', 'UHLB2122', 2, '2024-12-16 06:51:29', NULL, 10, 'Available Every Semester', '', '00:00:00', '00:00:00'),
(21, 'Philosophy and Current Issues', 'UHIS1022', 2, '2024-12-16 06:51:29', NULL, 10, 'Available Every Semester', '', '00:00:00', '00:00:00'),
(22, 'Fundamental of Computer Graphics', 'SECV2213', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 2 [Semester 2]', '', '00:00:00', '00:00:00'),
(23, 'Professional Communication Skills 2', 'UHLB3132', 2, '2024-12-16 06:51:29', NULL, 10, 'Available Every Semester', '', '00:00:00', '00:00:00'),
(24, 'Applications Development', 'SECV3104', 4, '2024-12-16 06:51:29', NULL, 2, 'Year 3 [Semester 1]', '', '00:00:00', '00:00:00'),
(25, 'Artificial Intelligence', 'SECJ3553', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 3 [Semester 1]', '', '00:00:00', '00:00:00'),
(26, 'Geometric Modelling', 'SECV3313', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 3 [Semester 1]', '', '00:00:00', '00:00:00'),
(27, 'Fundamental of Image Processing', 'SECV3213', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 3 [Semester 1]', '', '00:00:00', '00:00:00'),
(28, 'Mobile Application Programming', 'SECJ3623', 3, '2024-12-16 06:51:29', NULL, 2, 'Year 3 [Semester 1]', '', '00:00:00', '00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courses_course_code_unique` (`course_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
