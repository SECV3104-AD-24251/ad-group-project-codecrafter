-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2024 at 11:25 AM
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
-- Database: `studentreg`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(50) UNSIGNED NOT NULL,
  `subject_code` varchar(50) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `credit_hours` int(50) NOT NULL,
  `no_section` int(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `subject_code`, `subject_name`, `credit_hours`, `no_section`, `semester`, `timestamp`) VALUES
(1, 'SECI1013', 'Discrete Structure', 3, 2, 'Year 1 [Semester 1]', '2024-12-16 14:51:29'),
(2, 'SECJ1013', 'Programming Technique I', 3, 2, 'Year 1 [Semester 1]', '2024-12-16 14:51:29'),
(3, 'SECR1013', 'Digital Logic', 3, 2, 'Year 1 [Semester 1]', '2024-12-16 14:51:29'),
(4, 'SECP1513', 'Technology & Information System', 3, 2, 'Year 1 [Semester 1]', '2024-12-16 14:51:29'),
(5, 'ULRS1012', 'Value and Identity', 2, 10, 'Available Every Semester', '2024-12-16 14:51:29'),
(6, 'SECV1113', 'Mathematics for Computer Graphics', 3, 1, 'Year 1 [Semester 2]', '2024-12-16 14:51:29'),
(7, 'SECl1143', 'Probability & Statistical Data Analysis', 3, 2, 'Year 1 [Semester 2]', '2024-12-16 14:51:29'),
(8, 'SECJ1023', 'Programming Technique II', 3, 2, 'Year 1 [Semester 2]', '2024-12-16 14:51:29'),
(9, 'SECR1033', 'Computer Organisation and Architecture', 3, 2, 'Year 1 [Semester 2]', '2024-12-16 14:51:29'),
(10, 'SECJ2203', 'Software Engineering', 3, 2, 'Year 1 [Semester 2]', '2024-12-16 14:51:29'),
(11, 'UHMS1182', 'Appreciation of Ethics and Civilisations', 2, 10, 'Available Every Semester', '2024-12-16 14:51:29'),
(12, 'SECD2523', 'Database', 3, 2, 'Year 2 [Semester 1]', '2024-12-16 14:51:29'),
(13, 'SECD2613', 'System Analysis and Design', 3, 2, 'Year 2 [Semester 1]', '2024-12-16 14:51:29'),
(14, 'SECJ2013', 'Data Structure and Algorithm', 3, 2, 'Year 2 [Semester 1]', '2024-12-16 14:51:29'),
(15, 'SECR2213', 'Network Communications', 3, 2, 'Year 2 [Semester 1]', '2024-12-16 14:51:29'),
(16, 'SECV2113', 'Human Computer Interaction', 3, 2, 'Year 2 [Semester 1]', '2024-12-16 14:51:29'),
(17, 'SECV2223', 'Web Programming', 3, 2, 'Year 2 [Semester 2]', '2024-12-16 14:51:29'),
(18, 'SECR2043', 'Operating Systems', 3, 2, 'Year 2 [Semester 2]', '2024-12-16 14:51:29'),
(19, 'SECJ2154', 'Object Oriented Programming', 4, 2, 'Year 2 [Semester 2]', '2024-12-16 14:51:29'),
(20, 'UHLB2122', 'Professional Communication Skills 1', 2, 10, 'Available Every Semester', '2024-12-16 14:51:29'),
(21, 'UHIS1022', 'Philosophy and Current Issues', 2, 10, 'Available Every Semester', '2024-12-16 14:51:29'),
(22, 'SECV2213', 'Fundamental of Computer Graphics', 3, 2, 'Year 2 [Semester 2]', '2024-12-16 14:51:29'),
(23, 'UHLB3132', 'Professional Communication Skills 2', 2, 10, 'Available Every Semester', '2024-12-16 14:51:29'),
(24, 'SECV3104', 'Applications Development', 4, 2, 'Year 3 [Semester 1]', '2024-12-16 14:51:29'),
(25, 'SECJ3553', 'Artificial Intelligence', 3, 2, 'Year 3 [Semester 1]', '2024-12-16 14:51:29'),
(26, 'SECV3313', 'Geometric Modelling', 3, 2, 'Year 3 [Semester 1]', '2024-12-16 14:51:29'),
(27, 'SECV3213', 'Fundamental of Image Processing', 3, 2, 'Year 3 [Semester 1]', '2024-12-16 14:51:29'),
(28, 'SECJ3623', 'Mobile Application Programming', 3, 2, 'Year 3 [Semester 1]', '2024-12-16 14:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '0001_01_01_000000_create_users_table', 1),
(5, '0001_01_01_000001_create_cache_table', 1),
(6, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_info`
--

CREATE TABLE `section_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL,
  `lect_assigned` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(50) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `section_info`
--

INSERT INTO `section_info` (`id`, `section`, `capacity`, `lect_assigned`, `updated_at`, `user_id`, `course_id`, `created_at`) VALUES
(1, '08', 29, 'Dr. Roselina Salleh', '2024-12-27 21:59:27', 1, 1, NULL),
(2, '07', 25, 'Ms. Lizawati binti Mi Yusuf', '2024-12-28 08:19:16', NULL, 2, NULL),
(3, '07', 25, 'Dr. Mohd Fo\'ad bin Rohani', '2024-12-28 08:19:16', NULL, 3, NULL),
(4, '08', 40, 'Dr. Suriati binti Sadimon', '2024-12-28 08:19:16', NULL, 4, NULL),
(5, '', 0, '', '2024-12-16 23:35:49', NULL, 5, NULL),
(6, '01', 12, 'Dr. Tarmizi bin Adam', '2024-12-28 09:47:10', NULL, 6, NULL),
(7, '01', 40, 'Assoc. Prof. Dr. Haza Nuzly bin Abdull Hamed (P)', '2024-12-28 09:47:10', NULL, 7, NULL),
(8, '01', 30, 'Dr. Muhammad Luqman bin Mohd Shafie (P)', '2024-12-28 09:47:10', NULL, 8, NULL),
(9, '07', 30, 'Dr. Zuriahati binti Mohd Yunos', '2024-12-28 09:47:10', NULL, 9, NULL),
(10, '09', 35, 'Dr. Noraini binti Ibrahim', '2024-12-28 09:47:10', NULL, 10, NULL),
(11, '', 0, '', '2024-12-16 23:35:49', NULL, 11, NULL),
(12, '09', 35, 'Dr. Haslina binti Hashim', '2024-12-28 09:47:10', NULL, 12, NULL),
(13, '01', 35, 'Assoc. Prof. Dr. Haza Nuzly bin Abdull Hamed (P)', '2024-12-28 09:47:10', NULL, 13, NULL),
(14, '10', 35, 'Dr. Fazliaty Edora binti Fadzli', '2024-12-28 09:47:10', NULL, 14, NULL),
(15, '10', 40, 'Dr. Nurfazrina binti Mohd Zamry', '2024-12-28 09:47:11', NULL, 15, NULL),
(16, '09', 30, 'Dr. Sarina binti Sulaiman', '2024-12-28 09:47:11', NULL, 16, NULL),
(17, '01', 40, 'Dr. Nor Erne Nazira binti Bazin (P)', '2024-12-28 09:47:11', NULL, 17, NULL),
(18, '01', 25, 'Ms. Lizawati binti Mi Yusuf', '2024-12-28 09:47:11', NULL, 18, NULL),
(19, '07', 35, 'Dr. Adila Firdaus binti Arbain', '2024-12-28 09:47:11', NULL, 19, NULL),
(20, '', 0, '', '2024-12-16 23:35:49', NULL, 20, NULL),
(21, '', 0, '', '2024-12-16 23:35:49', NULL, 21, NULL),
(22, '06', 40, 'Prof. Ts. Dr. Wan Mohd Nasir bin Wan Kadir', '2024-12-28 09:47:11', NULL, 22, NULL),
(23, '', 0, '', '2024-12-16 23:35:49', NULL, 23, NULL),
(24, '01', 29, 'Dr. Muhamad Razib bin Othman', '2024-12-28 01:57:42', 1, 24, NULL),
(25, '11', 29, 'Dr. Sim Hiew Moi', '2024-12-28 01:58:08', 1, 25, NULL),
(26, '01', 29, 'Dr. Norhaida binti Mohd Suaib', '2024-12-28 01:58:18', 1, 26, NULL),
(27, '01', 29, 'Dr. Md. Sah bin Hj. Salam', '2024-12-28 01:58:24', 1, 27, NULL),
(28, '01', 30, 'Dr. Jumail bin Taliba', '2024-12-28 09:52:25', NULL, 28, NULL),
(32, '09', 30, 'Dr. Nur Othman', '2024-12-22 16:30:33', NULL, 1, NULL),
(33, '08', 25, 'Ts. Dr. Goh Eg Su', '2024-12-28 09:47:25', NULL, 2, NULL),
(34, '08', 25, 'Dr. Farkhana Binti Muchtar', '2024-12-28 09:47:25', NULL, 3, NULL),
(35, '09', 40, 'Dr. Pang Yee Yong', '2024-12-28 09:47:25', NULL, 4, NULL),
(36, '02', 40, 'Dr. Ahmad Najmi bin Amerhaider Nuar', '2024-12-28 09:47:25', NULL, 7, NULL),
(37, '02', 30, 'Dr. Muhammad Luqman bin Mohd Shafie', '2024-12-28 09:47:25', NULL, 8, NULL),
(38, '08', 30, 'Dr. Mohd Fo\'ad bin Rohani (P', '2024-12-28 09:47:25', NULL, 9, NULL),
(39, '10', 35, 'Ts. Dr. Johanna binti Ahmad', '2024-12-28 09:47:25', NULL, 10, NULL),
(40, '10', 35, 'Dr. Layla Rasheed Abdallah Hasan', '2024-12-28 09:47:25', NULL, 12, NULL),
(41, '02', 35, 'Dr. Ahmad Najmi bin Amerhaider Nuar', '2024-12-28 09:47:25', NULL, 13, NULL),
(42, '11', 35, 'Dr. Fazliaty Edora binti Fadzli', '2024-12-28 09:47:25', NULL, 14, NULL),
(43, '11', 40, 'Dr. Raja Zahilah binti Raja Mohd Radzi', '2024-12-28 09:47:25', NULL, 15, NULL),
(44, '10', 30, 'Dr. Aida binti Ali', '2024-12-28 09:47:25', NULL, 16, NULL),
(45, '02', 40, 'Dr. Mohamad Shukor bin Talib', '2024-12-28 09:47:25', NULL, 17, NULL),
(46, '02', 25, 'Dr. Farkhana Binti Muchtar', '2024-12-28 09:47:25', NULL, 18, NULL),
(47, '08', 35, 'Dr. Muhammad Khatibsyarbini Abd Rahim (P)', '2024-12-28 09:47:25', NULL, 19, NULL),
(48, '07', 40, 'Prof. Ts. Dr. Wan Mohd Nasir bin Wan Kadir', '2024-12-28 09:47:25', NULL, 22, NULL),
(49, '02', 30, 'Dr. Jumail bin Taliba', '2024-12-28 09:47:25', NULL, 24, NULL),
(50, '12', 30, 'Dr. Ruhaidah binti Samsudin', '2024-12-28 09:47:25', NULL, 25, NULL),
(51, '02', 30, 'Dr. Norhaida binti Mohd Suaib', '2024-12-28 09:52:32', NULL, 26, NULL),
(52, '02', 30, 'Dr. Md. Sah bin Hj. Salam', '2024-12-28 09:52:32', NULL, 27, NULL),
(53, '02', 29, 'Dr. Jumail bin Taliba', '2024-12-28 01:58:32', 1, 28, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BoLJbuL8t1HhLJCY90yudza98qIaAmCWyyOFZsCo', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiV2xEOElmTmJKeUlrZTh1bER0OHhibENObVdKNkhTTXpIc3dTVTUwbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50L2NvdXJzZXMvcmVnaXN0ZXJlZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1735379914);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `remember_token` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'faki', 'faki@gmail.com', '$2y$12$eoeKRvsypvKmC4lzjua.HO6IWXZGWic0uJTh15BdjYb/jzsAq5wei', 'student', '', '2024-12-16 02:05:17', '2024-12-16 02:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_subjects`
--

CREATE TABLE `user_subjects` (
  `course_id` bigint(50) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_subjects`
--

INSERT INTO `user_subjects` (`course_id`, `user_id`) VALUES
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `section_info`
--
ALTER TABLE `section_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `section_info`
--
ALTER TABLE `section_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `section_info`
--
ALTER TABLE `section_info`
  ADD CONSTRAINT `section_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `section_info_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
