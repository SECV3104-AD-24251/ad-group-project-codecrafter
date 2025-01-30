-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2025 at 03:34 PM
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
-- Table structure for table `section_info`
--

CREATE TABLE `section_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL,
  `lect_assigned` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `credits` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_info`
--

INSERT INTO `section_info` (`id`, `section`, `capacity`, `lect_assigned`, `user_id`, `course_id`, `credits`, `timestamp`) VALUES
(1, '08', 29, 'Dr. Roselina Salleh', 1, 1, 3, '2024-12-27 13:59:27'),
(2, '07', 25, 'Ms. Lizawati binti Mi Yusuf', NULL, 2, 3, '2024-12-28 00:19:16'),
(3, '07', 25, 'Dr. Mohd Fo\'ad bin Rohani', NULL, 3, 3, '2024-12-28 00:19:16'),
(4, '08', 40, 'Dr. Suriati binti Sadimon', NULL, 4, 3, '2024-12-28 00:19:16'),
(5, '', 0, '', NULL, 5, 2, '2024-12-16 15:35:49'),
(6, '01', 12, 'Dr. Tarmizi bin Adam', NULL, 6, 3, '2024-12-28 01:47:10'),
(7, '01', 40, 'Assoc. Prof. Dr. Haza Nuzly bin Abdull Hamed (P)', NULL, 7, 3, '2024-12-28 01:47:10'),
(8, '01', 30, 'Dr. Muhammad Luqman bin Mohd Shafie (P)', NULL, 8, 3, '2024-12-28 01:47:10'),
(9, '07', 30, 'Dr. Zuriahati binti Mohd Yunos', NULL, 9, 3, '2024-12-28 01:47:10'),
(10, '09', 35, 'Dr. Noraini binti Ibrahim', NULL, 10, 3, '2024-12-28 01:47:10'),
(11, '', 0, '', NULL, 11, 2, '2024-12-16 15:35:49'),
(12, '09', 35, 'Dr. Haslina binti Hashim', NULL, 12, 3, '2024-12-28 01:47:10'),
(13, '01', 35, 'Assoc. Prof. Dr. Haza Nuzly bin Abdull Hamed (P)', NULL, 13, 3, '2024-12-28 01:47:10'),
(14, '10', 35, 'Dr. Fazliaty Edora binti Fadzli', NULL, 14, 3, '2024-12-28 01:47:10'),
(15, '10', 40, 'Dr. Nurfazrina binti Mohd Zamry', NULL, 15, 3, '2024-12-28 01:47:11'),
(16, '09', 30, 'Dr. Sarina binti Sulaiman', NULL, 16, 3, '2024-12-28 01:47:11'),
(17, '01', 40, 'Dr. Nor Erne Nazira binti Bazin (P)', NULL, 17, 3, '2024-12-28 01:47:11'),
(18, '01', 25, 'Ms. Lizawati binti Mi Yusuf', NULL, 18, 3, '2024-12-28 01:47:11'),
(19, '07', 35, 'Dr. Adila Firdaus binti Arbain', NULL, 19, 4, '2024-12-28 01:47:11'),
(20, '', 0, '', NULL, 20, 2, '2024-12-16 15:35:49'),
(21, '', 0, '', NULL, 21, 2, '2024-12-16 15:35:49'),
(22, '06', 40, 'Prof. Ts. Dr. Wan Mohd Nasir bin Wan Kadir', NULL, 22, 3, '2024-12-28 01:47:11'),
(23, '', 0, '', NULL, 23, 2, '2024-12-16 15:35:49'),
(24, '01', 30, 'Dr. Muhamad Razib bin Othman', NULL, 24, 4, '2024-12-27 17:57:42'),
(25, '11', 30, 'Dr. Sim Hiew Moi', NULL, 25, 3, '2024-12-27 17:58:08'),
(26, '01', 30, 'Dr. Norhaida binti Mohd Suaib', NULL, 26, 3, '2024-12-27 17:58:18'),
(27, '01', 30, 'Dr. Md. Sah bin Hj. Salam', NULL, 27, 3, '2024-12-27 17:58:24'),
(28, '01', 30, 'Dr. Jumail bin Taliba', NULL, 28, 3, '2024-12-28 01:52:25'),
(32, '09', 30, 'Dr. Nur Othman', NULL, 1, 3, '2024-12-22 08:30:33'),
(33, '08', 24, 'Ts. Dr. Goh Eg Su', 1, 2, 3, '2024-12-28 01:47:25'),
(34, '08', 24, 'Dr. Farkhana Binti Muchtar', 1, 3, 3, '2024-12-28 01:47:25'),
(35, '09', 39, 'Dr. Pang Yee Yong', 1, 4, 3, '2024-12-28 01:47:25'),
(36, '02', 40, 'Dr. Ahmad Najmi bin Amerhaider Nuar', NULL, 7, 3, '2024-12-28 01:47:25'),
(37, '02', 30, 'Dr. Muhammad Luqman bin Mohd Shafie', NULL, 8, 3, '2024-12-28 01:47:25'),
(38, '08', 30, 'Dr. Mohd Fo\'ad bin Rohani (P', NULL, 9, 3, '2024-12-28 01:47:25'),
(39, '10', 35, 'Ts. Dr. Johanna binti Ahmad', NULL, 10, 3, '2024-12-28 01:47:25'),
(40, '10', 35, 'Dr. Layla Rasheed Abdallah Hasan', NULL, 12, 3, '2024-12-28 01:47:25'),
(41, '02', 35, 'Dr. Ahmad Najmi bin Amerhaider Nuar', NULL, 13, 3, '2024-12-28 01:47:25'),
(42, '11', 35, 'Dr. Fazliaty Edora binti Fadzli', NULL, 14, 3, '2024-12-28 01:47:25'),
(43, '11', 40, 'Dr. Raja Zahilah binti Raja Mohd Radzi', NULL, 15, 3, '2024-12-28 01:47:25'),
(44, '10', 30, 'Dr. Aida binti Ali', NULL, 16, 3, '2024-12-28 01:47:25'),
(45, '02', 40, 'Dr. Mohamad Shukor bin Talib', NULL, 17, 3, '2024-12-28 01:47:25'),
(46, '02', 25, 'Dr. Farkhana Binti Muchtar', NULL, 18, 3, '2024-12-28 01:47:25'),
(47, '08', 35, 'Dr. Muhammad Khatibsyarbini Abd Rahim (P)', NULL, 19, 4, '2024-12-28 01:47:25'),
(48, '07', 40, 'Prof. Ts. Dr. Wan Mohd Nasir bin Wan Kadir', NULL, 22, 3, '2024-12-28 01:47:25'),
(49, '02', 30, 'Dr. Jumail bin Taliba', NULL, 24, 4, '2024-12-28 01:47:25'),
(50, '12', 30, 'Dr. Ruhaidah binti Samsudin', NULL, 25, 3, '2024-12-28 01:47:25'),
(51, '02', 30, 'Dr. Norhaida binti Mohd Suaib', NULL, 26, 3, '2024-12-28 01:52:32'),
(52, '02', 30, 'Dr. Md. Sah bin Hj. Salam', NULL, 27, 3, '2024-12-28 01:52:32'),
(53, '02', 30, 'Dr. Jumail bin Taliba', NULL, 28, 3, '2024-12-27 17:58:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `section_info`
--
ALTER TABLE `section_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_info_user_id_foreign` (`user_id`),
  ADD KEY `section_info_course_id_foreign` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `section_info`
--
ALTER TABLE `section_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `section_info`
--
ALTER TABLE `section_info`
  ADD CONSTRAINT `section_info_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `section_info_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
