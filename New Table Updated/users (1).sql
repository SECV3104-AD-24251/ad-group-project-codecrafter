-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2025 at 02:02 PM
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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `program` varchar(50) NOT NULL,
  `current_sem` varchar(50) NOT NULL,
  `credits` bigint(50) NOT NULL,
  `remember_token` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `program`, `current_sem`, `credits`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Fakhirah Shakila', 'faki@gmail.com', '$2y$12$eoeKRvsypvKmC4lzjua.HO6IWXZGWic0uJTh15BdjYb/jzsAq5wei', 'student', 'SECVH', 'Year 2 [Semester 1]', 4, '', '2024-12-16 02:05:17', '2025-02-01 03:46:16'),
(2, 'Zanetta Teresa Damia', 'znttatresa@gmail.com', '$2y$12$dJZkBHc7r2altLe7X2x5U.kOkqDz3yx/GWYyHUjivQ.RiZYGFh1QO', 'student', 'SECBH', 'Year 2 [Semester 1]', 0, '', NULL, NULL),
(3, 'Ave Valentine', 'a.valentine@gmail.co', '$2y$12$fXEORC9Guq.K89qrmN1rceD9J388UU/Yj57bt3re9xI6F3HkBPb0m', 'academic_staff', '', '', 0, '', NULL, NULL),
(4, 'Valeria Easter', 'v.easter@gmail.com', '$2y$12$wq1QYK4z5lVGL3nmzAtF0uEn0O2frU.gAL130cW/ODY.rItQBAKqq', 'academic_staff', '', '', 0, '', NULL, NULL),
(5, 'Faiz Haziqah', 'faiz@graduate.utm.my', '$2y$10$meLqEmpt7SPvCXGdak2y9uBtUcLP0NLMAw2MEyzhltGAs6uDFiL4C', 'student', 'SCSEH', 'Year 1 [Semester 1]', 0, '', NULL, NULL),
(6, 'Aisyah Bahar', 'ecah@graduate.utm.my', '$2y$10$mCeM8rDF80fSGGckgPc/jOEPf8TwMnmZzY.FZ9pddNsEJGvfgCm46', 'student', 'SECJH', 'Year 3 [Semester 2]', 0, '', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
