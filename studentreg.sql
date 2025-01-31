-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2025 at 06:13 PM
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
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `program` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `subject_code`, `subject_name`, `credit_hours`, `no_section`, `semester`, `program`, `timestamp`) VALUES
(1, 'SECB3104', 'Application Development', 4, 1, 'Year 3 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(2, 'SECR3104', 'Application Development', 4, 3, 'Year 3 [Semester 1]', 'SECRH', '2025-01-16 10:42:57'),
(3, 'SECJ3104', 'Application Development', 4, 4, 'Year 3 [Semester 1]', 'SECJH', '2025-01-16 10:42:57'),
(4, 'SECV3104', 'Application Development', 4, 2, 'Year 3 [Semester 1]', 'SECVH', '2025-01-16 10:42:57'),
(5, 'SECJ3553', 'Artificial Intelligence', 3, 13, 'Year 3 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(6, 'SEBB1513', 'Basic Anatomy and Physiology', 3, 2, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(7, 'SBEA1223', 'Basic Architectural Computing', 3, 1, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(8, 'SBEA 1223', 'Basic Architectural Computing', 2, 1, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(9, 'SSCG2423', 'Bioethics in Research and Development', 3, 1, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(10, 'SECB3103', 'Bioinformatics II', 3, 1, 'Year 3 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(11, 'SECB3032', 'Bioinformatics Project I', 3, 1, 'Year 3 [Semester 2]', 'SECBH', '2025-01-16 10:42:57'),
(12, 'SEBB4173', 'Cell & Molecular Biology for Bioinformatics', 3, 1, 'Year 1 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(13, 'SECI1113', 'Computational Mathematics', 3, 1, 'Year 2 [Semester 1]', 'SECBH/SECRH', '2025-01-16 10:42:57'),
(14, 'SECR3032', 'Computer Network and Security Project I', 3, 1, 'Year 3 [Semester 2]', 'SECRH', '2025-01-16 10:42:57'),
(15, 'UHMS2022', 'Critical and Creative Thinking(International Stude', 2, 1, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(16, 'SECP3223', 'Data Analytics Programming', 3, 2, 'Year 3 [Semester 1]', 'SECPH', '2025-01-16 10:42:57'),
(17, 'SECJ2013', 'Data Structure and Algorithm', 3, 14, 'Year 2 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(18, 'SECD2523', 'Database', 3, 12, 'Year 2 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(19, 'SECD2524', 'Database', 4, 1, 'Year 2 [Semester 1]', 'SECVH', '2025-01-16 10:42:57'),
(20, 'SCST1143', 'Database Engineering', 4, 4, 'Year 1 [Semester 1]', 'SCSEH', '2025-01-16 10:42:57'),
(21, 'SECP2523', 'Database WBL', 4, 2, 'Year 2 [Semester 1]', 'SECPH', '2025-01-16 10:42:57'),
(22, 'SCSR1013', 'Digital Logic', 4, 4, 'Year 1 [Semester 1]', 'SCSEH', '2025-01-16 10:42:57'),
(23, 'SECR1013', 'Digital Logic', 3, 9, 'Year 1 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(24, 'SECI1013', 'Discrete Structure', 3, 10, 'Year 1 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(25, 'SEAA1213', 'Engineering Mechanics', 3, 1, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(26, 'UHLB1112', 'English Communication Skills', 2, 6, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(27, 'SECP3744', 'Enterprise System Design & Modeling', 3, 2, 'Year 3 [Semester 1]', 'SECPH', '2025-01-16 10:42:57'),
(28, 'SEAA3913', 'Environmental Management', 2, 1, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(29, 'UKQT3001', 'Extra-curricular Experiential Learning (ExCEL)', 2, 2, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(30, 'SECV3213', 'Fundamental of Image Processing', 3, 3, 'Year 2 [Semester 2]', 'SECVH', '2025-01-16 10:42:57'),
(31, 'SCSE1013', 'Fundamental Programming Concept', 3, 4, 'Year 1 [Semester 1]', 'SCSEH', '2025-01-16 10:42:57'),
(32, 'SECV3113', 'Geometric Modelling', 3, 3, 'Year 2 [Semester 2]', 'SECVH', '2025-01-16 10:42:57'),
(33, 'SECV2113', 'Human Computer Interaction', 3, 11, 'Year 2 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(34, 'Information Technology Business', '#NULL!', 3, 2, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(35, 'SEEU2123', 'Instrumentation and Measurement', 3, 2, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(36, 'ULRS1032', 'Integrity and Anti-Corruption Course(International', 2, 11, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(37, 'SSPB2133', 'International Business', 3, 2, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(38, 'SECJ3303', 'Internet Programming', 3, 6, 'Year 2 [Semester 2]', 'SECJH', '2025-01-16 10:42:57'),
(39, 'SECR3242', 'Internetworking Technology', 3, 5, 'Year 2 [Semester 2]', 'SECRH', '2025-01-16 10:42:57'),
(40, 'SECR3941', 'Internetworking Technology Lab', 3, 5, 'Year 2 [Semester 2]', 'SECRH', '2025-01-16 10:42:57'),
(41, 'SECR3443', 'Introduction to Cryptography', 3, 4, 'Year 3 [Semester 1]', 'SECRH', '2025-01-16 10:42:57'),
(42, 'UBSS1032', 'Introduction to Entrepreneurship', 3, 3, 'Year 3 [Semester 2]', 'SECJH', '2025-01-16 10:42:57'),
(43, 'SBEZ1652', 'Introduction to Landscape Architecture', 2, 1, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(44, 'SBEQ1343', 'Introduction to Quantity Surveying', 3, 2, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(45, 'SEMM2613', 'Materials Science', 2, 2, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(46, 'SECV1113', 'Mathematics for Computer Graphics', 3, 1, 'Year 2 [Semester 1]', 'SECVH', '2025-01-16 10:42:57'),
(47, 'SCST1123', 'Mathematics for Software Engineer', 3, 4, 'Year 1 [Semester 1]', 'SCSEH', '2025-01-16 10:42:57'),
(48, 'SECJ3623', 'Mobile Application Programming', 3, 2, 'Year 2 [Semester 2]', 'SECVH', '2025-01-16 10:42:57'),
(49, 'SSPG2223', 'National Integrity', 3, 2, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(50, 'SECR1213', 'Network Communications', 3, 15, 'Year 2 [Semester 1]', 'SECVH', '2025-01-16 10:42:57'),
(51, 'UHIS1022', 'Philosophy & Current Issues', 2, 4, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(52, 'UHLB3132', 'Professional Communication Skills', 2, 11, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(53, 'UHLB2122', 'Professional Communication Skills 1', 2, 7, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(54, 'UHMT2132', 'Professional Ethics', 2, 3, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(55, 'SECB3203', 'Programming for Bioinformatics', 3, 1, 'Year 3 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(56, 'SECJ1013', 'Programming Technique I', 4, 9, 'Year 1 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(57, 'SECJ1023', 'Programming Technique II', 4, 2, 'Year 1 [Semester 2]', 'SECRH/SECJH', '2025-01-16 10:42:57'),
(58, 'SECV3032', 'Project I (Graphics and Multimedia Software)', 3, 1, 'Year 3 [Semester 2]', 'SECVH', '2025-01-16 10:42:57'),
(59, 'UHIT2302', 'Science & Technology Thinking(International Studen', 2, 8, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(60, 'ULRF2xx2', 'Service Learning Co-Curriculum', 3, 1, 'Available Every Semester', 'SECJH/ SECVH', '2025-01-16 10:42:57'),
(61, 'SBEW3153', 'Social Impact Assessment', 2, 1, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(62, 'SHMY1033', 'Social Psychology', 3, 1, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(63, 'SECJ3323', 'Software Design & Architecture', 4, 6, 'Year 3 [Semester 1]', 'SECJH', '2025-01-16 10:42:57'),
(64, 'SECJ2203', 'Software Engineering', 3, 14, 'Year 1 [Semester 2]', 'SECJH', '2025-01-16 10:42:57'),
(65, 'SECJ3032', 'Software Engineering Project I', 3, 1, 'Year 3 [Semester 2]', 'SECJH', '2025-01-16 10:42:57'),
(66, 'SECP3204', 'Software Engineering WBL', 3, 2, 'Year 2 [Semester 1]', 'SECPH', '2025-01-16 10:42:57'),
(67, 'SSCP2413', 'Solid State Physics', 3, 2, 'Year 1 [Semester 1]', 'ALL', '2025-01-16 10:42:57'),
(68, 'SBEC4182', 'Sustainable Construction', 2, 1, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(69, 'SECP3723', 'System Development Technology WBL', 3, 2, 'Year 2 [Semester 1]', 'SECPH', '2025-01-16 10:42:57'),
(70, 'SECP1513', 'Technology & Information System', 3, 11, 'Year 1 [Semester 1]', 'SECBH', '2025-01-16 10:42:57'),
(71, 'SBSD3063', 'Technology Entrepreneurship', 2, 1, 'Available Every Semester', 'ALL', '2025-01-16 10:42:57'),
(72, 'SECD3761', 'Technopreneurship Seminar', 3, 1, 'Year 3 [Semester 2]', 'SECJH', '2025-01-16 10:42:57'),
(73, 'SECJ3203', 'Theory of Computer Science', 3, 3, 'Year 2 [Semester 2]', 'SECRH', '2025-01-16 10:42:57'),
(74, 'SxxxXxx3', 'University Free Elective', 2, 1, 'Available Every Semester', 'SECRH', '2025-01-16 10:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `courses_copy`
--

CREATE TABLE `courses_copy` (
  `id` bigint(50) UNSIGNED NOT NULL,
  `subject_code` varchar(50) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `credit_hours` int(50) NOT NULL,
  `no_section` int(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `courses_copy`
--

INSERT INTO `courses_copy` (`id`, `subject_code`, `subject_name`, `credit_hours`, `no_section`, `semester`, `timestamp`) VALUES
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
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(7, '0001_01_01_000002_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('03e129a6-39cc-4293-abbd-c36334b46f97', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:02:49', '2024-12-29 08:02:49'),
('0c4e2a72-7856-4ea8-a1d8-89ccb3880c53', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:10:36', '2024-12-29 08:10:36'),
('102355e4-5de3-4852-9f03-4b877a2e9b1b', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"Approved\",\"message\":\"Your waitlist request for \'\' has been approved.\"}', NULL, '2025-01-16 15:02:52', '2025-01-16 15:02:52'),
('109dd0cf-b491-4278-8f06-8ed971088acc', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:16:41', '2024-12-29 08:16:41'),
('1485a2c9-8aaa-45b6-bd87-b586c0748d63', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"approved\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'approved\'.\"}', NULL, '2025-01-16 15:24:38', '2025-01-16 15:24:38'),
('17acd941-55b9-49e0-aa0b-b4c3ea134403', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:04:28', '2024-12-29 08:04:28'),
('3016947d-6418-4cd0-a997-53e041330822', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"Approved\",\"message\":\"Your waitlist request for \'\' has been approved.\"}', NULL, '2025-01-16 15:02:47', '2025-01-16 15:02:47'),
('377462bc-6143-47bd-b80c-41e0dcb3d9d0', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 17:33:21', '2025-01-16 17:33:21'),
('45fc4f43-9d8d-4b7d-916c-e4ed4f509f09', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:09:40', '2024-12-29 08:09:40'),
('5ffe2e8d-5bfc-4484-90fd-4b83520ff879', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"approved\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'approved\'.\"}', NULL, '2025-01-16 18:02:28', '2025-01-16 18:02:28'),
('6175bc32-222e-446d-8ce1-16e07fbe14c9', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 17:33:21', '2025-01-16 17:33:21'),
('6d103b89-7e1b-420b-a863-f9d279e77fe3', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"Rejected\",\"message\":\"Your waitlist request for \'\' has been rejected.\"}', NULL, '2025-01-16 15:03:01', '2025-01-16 15:03:01'),
('6d5b47af-e87a-40b1-891e-f92c049af95c', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 17:33:18', '2025-01-16 17:33:18'),
('82a315aa-7e24-4896-9291-9b4109bbbc37', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:20:34', '2024-12-29 08:20:34'),
('8c8ea64e-92be-42fc-a312-7d274b7b1027', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 18:02:37', '2025-01-16 18:02:37'),
('93e6f78d-4360-4ee8-be66-697d67916100', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 3, '{\"course_name\":null,\"status\":\"approved\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'approved\'.\"}', NULL, '2025-01-27 12:32:02', '2025-01-27 12:32:02'),
('979b1fb3-be3c-4236-bad1-48f86515e9ed', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:21:12', '2024-12-29 08:21:12'),
('9d98cdc9-891b-48d7-8184-70a9fa053ea6', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 2, '{\"course_name\":null,\"status\":\"approved\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'approved\'.\"}', NULL, '2025-01-16 18:00:25', '2025-01-16 18:00:25'),
('9fa1dd83-76e1-4c5b-a002-63f0b5482165', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:03:59', '2024-12-29 08:03:59'),
('b0a942e1-ac64-4740-b06b-b67f7ec2a6e7', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:03:30', '2024-12-29 08:03:30'),
('b2a7dc29-d3b2-47ce-b7df-81e814907029', 'App\\Notifications\\InsufficientCreditHoursNotification', 'App\\Models\\User', 1, '{\"message\":\"Your registered credit hours are insufficient. \\r\\n                          You currently have 0 credit hours, \\r\\n                          but 15 are required.\",\"required_credit_hours\":15,\"current_credit_hours\":0}', NULL, '2024-12-29 08:16:20', '2024-12-29 08:16:20'),
('b92cbf1f-b1ca-4e5a-b5ca-e00ace5aff67', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 17:33:15', '2025-01-16 17:33:15'),
('c7039109-8766-4da4-8c80-1ee05a116750', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 18:02:41', '2025-01-16 18:02:41'),
('cf065eee-cc18-4151-84e4-f273b1f24b06', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"approved\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'approved\'.\"}', NULL, '2025-01-16 15:14:31', '2025-01-16 15:14:31'),
('e595f0cd-a75e-4111-a996-5c856debbd85', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 15:24:41', '2025-01-16 15:24:41'),
('e87d8069-db71-4250-ae37-a5bd96d339ed', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 2, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 18:02:42', '2025-01-16 18:02:42'),
('e883f2b6-7833-441e-8c8c-0a20d941dfe8', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"approved\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'approved\'.\"}', NULL, '2025-01-16 15:16:23', '2025-01-16 15:16:23'),
('ee088f6a-febe-4848-a19c-f4ca12bcc0ea', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 2, '{\"course_name\":null,\"status\":\"approved\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'approved\'.\"}', NULL, '2025-01-16 18:03:22', '2025-01-16 18:03:22'),
('f64abdaa-8b51-4015-af2b-9c3b7986439a', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 2, '{\"course_name\":null,\"status\":\"approved\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'approved\'.\"}', NULL, '2025-01-16 18:33:49', '2025-01-16 18:33:49'),
('f71d097a-1c01-400a-bcf7-6e25abde1a72', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 18:02:40', '2025-01-16 18:02:40'),
('fe3b9af9-8acd-4e61-a812-b7e6452c8783', 'App\\Notifications\\WaitlistStatusNotification', 'App\\Models\\User', 1, '{\"course_name\":null,\"status\":\"rejected\",\"message\":\"Your waitlist status for the course \'\' has been updated to \'rejected\'.\"}', NULL, '2025-01-16 18:02:39', '2025-01-16 18:02:39');

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
-- Table structure for table `pg`
--

CREATE TABLE `pg` (
  `Updated : 15/09/2024 @ 3.52 pm` varchar(9) DEFAULT NULL,
  `B` varchar(145) DEFAULT NULL,
  `C` varchar(119) DEFAULT NULL,
  `D` varchar(155) DEFAULT NULL,
  `E` varchar(133) DEFAULT NULL,
  `F` varchar(12) DEFAULT NULL,
  `G` varchar(25) DEFAULT NULL,
  `H` varchar(133) DEFAULT NULL,
  `I` varchar(117) DEFAULT NULL,
  `J` varchar(11) DEFAULT NULL,
  `K` varchar(10) DEFAULT NULL,
  `L` varchar(10) DEFAULT NULL,
  `M` varchar(10) DEFAULT NULL,
  `N` varchar(10) DEFAULT NULL,
  `O` varchar(10) DEFAULT NULL,
  `P` varchar(10) DEFAULT NULL,
  `Q` varchar(10) DEFAULT NULL,
  `R` varchar(10) DEFAULT NULL,
  `S` varchar(10) DEFAULT NULL,
  `T` varchar(10) DEFAULT NULL,
  `U` varchar(10) DEFAULT NULL,
  `V` varchar(10) DEFAULT NULL,
  `W` varchar(10) DEFAULT NULL,
  `X` varchar(10) DEFAULT NULL,
  `Y` varchar(10) DEFAULT NULL,
  `Z` varchar(10) DEFAULT NULL,
  `AA` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pg`
--

INSERT INTO `pg` (`Updated : 15/09/2024 @ 3.52 pm`, `B`, `C`, `D`, `E`, `F`, `G`, `H`, `I`, `J`, `K`, `L`, `M`, `N`, `O`, `P`, `Q`, `R`, `S`, `T`, `U`, `V`, `W`, `X`, `Y`, `Z`, `AA`) VALUES
(NULL, '2', '3', '4', '5', '6', '7', '8', '9', '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('TIME/DAY', '8.00 - 9.00', '9.00 - 10.00', '10.00 - 11.00', '11.00 - 12.00', '12.00 - 1.00', '1.00 - 2.00', '2.00 - 3.00', '3.00 - 4.00', '4.00 - 5.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('SUNDAY', 'MECS\nMECS0023 (01) : Artificial Intelligence\nAssoc. Prof. Dr. Siti Zaiton binti Mohd Hashim\n\nMakmal Pengaturcaraan Komputer 3 (MPK3), Aras 5, N28', NULL, NULL, 'MECS\nMECS0033 (01) : Data Structure & Algorithm\nMPK6\nDr. Zuraini binti Ali Shah\n\nMakmal Pengaturcaraan Komputer 3 (MPK3), Aras 5, N28', NULL, 'B\n\n\n\n\nR\n\n\n\n\nE\n\n\n\n\nA\n\n\n\n\nK', 'MCSD\nMCSD1043 : Research Design and Analysis in Data Science\nAssoc. Prof. Dr. Mohd Shahizan bin Othman\n\nLecture Room 5, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MCSD/MECS/MECR\nUECS6013 : IT Project Management\nDr. Ahmad Fadhil bin Yusof\n\nLecture Room 5, Level 1, N28a', NULL, NULL, NULL, 'MECC\nMECC1316 : Innovative Computing Project 2\nDr. Md Sah bin Salam\n\nLecture Room 1, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('MONDAY', NULL, NULL, 'MECC\nMECC1453 : Virtual and Augmented Reality\nProf. Dr. Mohd Shahrizal bin Sunar\n\nLecture Room 1, Level 1, N28a', NULL, NULL, NULL, 'MCSD\nMCSD1133 : Operational Research and Optimization\nDr. Nor Azizah binti Ali\n\nData-Analytics Lab, Level 3, N28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MCSD\nMCSD2123 : Massive Data Mining and Streaming\nDr. Chan Weng Howe\n\nData-Analytics Lab, Level 3, N28', NULL, NULL, NULL, 'MECR/MECS\nMECR1063 : Cryptographic Engineering\nDr. Muhalim bin Mohamed Amin\n\nLecture Room 1, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL, 'MCSD\nMCSD1143 : Supply Chain Analytics\nDr. Noorfa Haszlinna binti Mustaffa\n\nMakmal Pengajaran 1 (MP1), Level 2, N28a', NULL, NULL, 'MCSD/MECS/MECR\nUECS6023 : Introduction to Technopreneurship\nDr. Ahmad Najmi bin Amerhaider Nuar\n\nLecture Room 5, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECS\nMECS1023 : Advanced Data Structure and Algorithm\nProf. Dr. Dayang Norhayati binti Abang Jawawi\n\nLecture Room 5, Level 1, N28', NULL, NULL, NULL, 'MECR0023\nMECR0023 (Section 01) : Computer Security\nDr. Nurfazrina binti Mohd Zamry\n\nComputer Security Lab (CSL), Level 3, N28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, 'MECR\nMECR2323 : Malware Analysis\nDr. Mohd Zamri bin Osman\n\nSecurity Operation Centre (SOC), Level 2, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('TUESDAY', 'MECS\nMECS0033 / SECJ2013 (04) : Data Structure & Algorithm\nDr. Zuraini binti Ali Shah\n\nMakmal Pengaturcaraan Komputer 6 (MPK6)', NULL, 'MECS\nMECS0013 / SECJ3203 (01) : Theory of Computer Science\nDr. Zalmiyah binti Zakaria\n\nMakmal Pengaturcaraan Komputer 2 (MPK2)', NULL, NULL, NULL, 'MECR\nMECR1013 : Research Methodology\nDr. Maheyzah binti Md Siraj\n\nMakmal Pengajaran Sistem Maklumat (ISTL Lab), N28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECS\nMECS1033 : Advanced Artificial Intelligence\nAssoc. Prof. Dr. Haza Nuzly bin Abdull Hamed\n\nLecture Room 2, Level 1, N28a', NULL, NULL, NULL, '\nMECS\nMECS1013 (Section 01) : Advanced Theory Computer Science\nDr. Yusliza binti Yusoff\n\nLecture Room 1, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MCSD\nMCSD1023 : Programming for Data Science\nDr. Suhaila binti Mohamad Yusof\n\nData-Analytics Lab, Level 3, N28', NULL, NULL, NULL, 'MCSD\nMCSD1113 : Statistic for Data Science\nAssoc. Prof. Dr. Azurah binti A. Samah\n\nMakmal Pengajaran 1 (MP1), Level 2, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL, 'MCSD\nMCSD2213 : Advanced Analytics for Data Science\nDr. Nor Haizan binti Mohamed Radzi\n\nMakmal Pengajaran 1 (MP1), Level 2, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECC\nMECC1543 : Professional Special Topic\nAssoc. Prof. Dr. Farhan bin Mohamed\n\nLecture Room 1, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, 'MECR\nMECR0013 / SECR3443 (01) : Cryptography\nMiss Rashidah binti Kadir\n\nLecture Room 2, Level 1, N28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, 'MECR/MECS\nMECR2213 : Cyber Threat Intelligence\nDr. Anazida binti Zainal\n\nSecurity Operation Centre (SOC), Level 2, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('WEDNESDAY', NULL, NULL, 'MECR/MECS\nMECR1023/Information Security Governance & Risk Management\nAssoc. Prof. Dr. Norafida binti Ithnin\n\nSecurity Operation Centre (SOC), Level 2, N28a', NULL, NULL, NULL, 'MECR\nMECR1033 : Digital Forensics\nDr. Siti Hajar binti Othman\n\nSecurity Operation Centre (SOC), Level 2, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECC\nMECC1143 : Cloud Computing\nDr. Pang Yee Yong\n\nLecture Room 1, Level 1, N28a', NULL, NULL, NULL, 'MCSD\nMCSD1053 : Data Science Governance\nAssoc. Prof. Dr. Roliana binti Ibrahim\n\nLecture Room 5, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECS\nMECS2323 : Advanced Computer Network and Cloud Computing\nAssoc. Prof. Dr. Mohd Murtadha bin Mohamad\n\nLecture Room 2, Level 1, N28a', NULL, NULL, NULL, 'MECS\nMECS2313 : Advanced Computer System & Architecture\nAssoc. Prof. Dr. Mohd Shahizan bin Othman\n\nLecture Room 1, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MCSD\nMCSD1123 : Big Data Management\nDr. Haslina binti Hashim\n\nMakmal Pengajaran 1 (MP1), Level 2, N28a', NULL, NULL, NULL, 'MECC\nMECC1433 : Advance Human Computer Interaction\nDr. Nur Zuraifah Syazrah binti Othman\n\nLecture Room 2, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MCSD\nMCSD1143 : Supply Chain Analytics\nDr. Noorfa Haszlinna binti Mustaffa\n\nMakmal Pengajaran 1 (MP1), Level 2, N28a', 'MCSD\nMCSD2213 : Advanced Analytics for Data Science\nDr. Nor Haizan binti Mohamed Radzi\n\nLecture Room 2, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('THURSDAY', NULL, NULL, 'MCSD\nMCSD1013 : Business Intelligence and Analytics\nDr. Erne Nazira binti Bazin\n\nMakmal Pengajaran 1 (MP1), Aras 2, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECS\nMECS1043 (Section 01) : Research Methodology in Computer Science\nAssoc. Prof. Dr. Norafida binti Ithnin\n\nLecture Room 5, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECR\nMECR1073 : Penetration Testing\nDr. Muhammad Zafran bin Muhammad Zaly Shah\n\nHYFLEX Room, Level 1, N28a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MCSD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'MECC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, 'SUBJEK UMUM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, '01', 39, 'Dr. Muhamad Razib bin Othman', '2025-01-31 15:10:30', 1, 1, NULL),
(2, '01', 30, 'Assoc. Prof. Dr. Mohd. Yazid bin Idris', '2025-01-16 19:12:55', NULL, 2, NULL),
(3, '02', 29, 'Assoc. Prof. Dr. Hishamuddin bin Asmuni @ Hasmuni', '2025-01-31 15:11:26', 1, 2, NULL),
(4, '03', 30, 'Assoc. Prof. Dr. Shahida binti Sulaiman (P)', '2025-01-16 19:12:55', NULL, 2, NULL),
(5, '01', 35, 'Assoc. Prof. Dr. Shahida binti Sulaiman', '2025-01-16 19:12:55', NULL, 3, NULL),
(6, '02', 35, 'Assoc. Prof. Dr. Hishamuddin bin Asmuni @ Hasmuni', '2025-01-16 19:12:55', NULL, 3, NULL),
(7, '03', 35, 'Dr. Mohd. Razak bin Samingan', '2025-01-16 19:12:55', NULL, 3, NULL),
(8, '04', 35, 'Dr. Adila Firdaus binti Arbain', '2025-01-16 19:12:55', NULL, 3, NULL),
(9, '01', 30, 'Dr. Muhamad Razib bin Othman', '2025-01-16 19:12:55', NULL, 4, NULL),
(10, '02', 30, 'Dr. Jumail bin Taliba', '2025-01-16 19:12:55', NULL, 4, NULL),
(11, '01', 35, 'Dr. Sarina binti Sulaiman', '2025-01-16 19:12:55', NULL, 5, NULL),
(12, '02', 35, 'Assoc. Prof. Dr. Mohd Adham bin Isa', '2025-01-16 19:12:55', NULL, 5, NULL),
(13, '03', 35, 'Dr. Nur Eiliyah @ Wong Yee Leng', '2025-01-16 19:12:55', NULL, 5, NULL),
(14, '04', 35, 'Dr. Aida binti Ali', '2025-01-16 19:12:55', NULL, 5, NULL),
(15, '05', 35, 'Dr. Shafaatunnur binti Hassan (P)', '2025-01-16 19:12:55', NULL, 5, NULL),
(16, '06', 35, 'Assoc. Prof. Dr. Siti Zaiton binti Mohd Hashim', '2025-01-16 19:12:55', NULL, 5, NULL),
(17, '07', 35, 'Assoc. Prof. Ts. Dr. Rohayanti binti Hassan', '2025-01-16 19:12:55', NULL, 5, NULL),
(18, '08', 35, 'Dr. Shafaatunnur binti Hassan', '2025-01-16 19:12:55', NULL, 5, NULL),
(19, '09', 35, 'Dr. Ruhaidah binti Samsudin', '2025-01-16 19:12:55', NULL, 5, NULL),
(20, '10', 35, 'Dr. Sim Hiew Moi', '2025-01-16 19:12:55', NULL, 5, NULL),
(21, '11', 30, 'Dr. Sim Hiew Moi', '2025-01-16 19:12:55', NULL, 5, NULL),
(22, '12', 30, 'Dr. Ruhaidah binti Samsudin', '2025-01-16 19:12:55', NULL, 5, NULL),
(23, '01', 40, '', '2025-01-16 19:12:55', NULL, 5, NULL),
(24, 'EB1', 40, 'Dr. Muhammad Faiz bin Md Shakhih', '2025-01-16 19:12:55', NULL, 6, NULL),
(25, 'EB1', 40, 'Dr. Muhammad Faiz bin Md Shakhih', '2025-01-16 19:12:55', NULL, 6, NULL),
(26, 'EB1', 30, 'Ts. Dr. Azari bin Mat Yasir', '2025-01-16 19:12:55', NULL, 7, NULL),
(27, 'EB1', 40, 'Ts. Dr. Azari bin Mat Yasir', '2025-01-16 19:12:55', NULL, 8, NULL),
(28, 'EB1', 30, 'Dr. Mira Panadi', '2025-01-16 19:12:55', NULL, 9, NULL),
(29, '02', 40, 'Dr. Chan Weng Howe', '2025-01-16 19:12:55', NULL, 10, NULL),
(30, '01', 3, 'Dr. Nies Hui Wen', '2025-01-16 19:12:55', NULL, 11, NULL),
(31, '01', 30, 'Dr. Noor Hidayah binti Zakaria', '2025-01-16 19:12:55', NULL, 12, NULL),
(32, '01', 30, 'Dr. Muhammad Aliif bin Ahmad', '2025-01-16 19:12:55', NULL, 13, NULL),
(33, '01', 13, 'Ms. Hazinah Kutty Mammi', '2025-01-16 19:12:55', NULL, 14, NULL),
(34, '03', 40, 'Dr. Muhammed Fauzi bin Othman', '2025-01-16 19:12:55', NULL, 15, NULL),
(35, '01', 40, 'Dr. Nor Erne Nazira binti Bazin (P)', '2025-01-16 19:12:55', NULL, 16, NULL),
(36, '02', 40, 'Dr. Mohamad Shukor bin Talib', '2025-01-16 19:12:55', NULL, 16, NULL),
(37, '01', 35, 'Dr. Nur Eiliyah @ Wong Yee Leng', '2025-01-16 19:12:55', NULL, 17, NULL),
(38, '02', 35, 'Dr. Zuraini binti Ali Shah', '2025-01-16 19:12:55', NULL, 17, NULL),
(39, '03', 35, 'Dr. Mohd Razak bin Samingan', '2025-01-16 19:12:55', NULL, 17, NULL),
(40, '04', 35, 'Dr. Nur Eiliyah @ Wong Yee Leng', '2025-01-16 19:12:55', NULL, 17, NULL),
(41, '05', 35, 'Mr. Norizam bin Katmon', '2025-01-16 19:12:55', NULL, 17, NULL),
(42, '06', 35, 'Dr. Ruhaidah binti Samsudin', '2025-01-16 19:12:55', NULL, 17, NULL),
(43, '07', 35, 'Dr. Mohd Razak bin Samingan (P)', '2025-01-16 19:12:55', NULL, 17, NULL),
(44, '08', 35, 'Dr. Zuraini binti Ali Shah', '2025-01-16 19:12:55', NULL, 17, NULL),
(45, '09', 35, 'Dr. Pang Yee Yong', '2025-01-16 19:12:55', NULL, 17, NULL),
(46, '10', 35, 'Dr. Fazliaty Edora binti Fadzli', '2025-01-16 19:12:55', NULL, 17, NULL),
(47, '11', 35, 'Dr. Fazliaty Edora binti Fadzli', '2025-01-16 19:12:55', NULL, 17, NULL),
(48, '04-06', 25, '', '2025-01-16 19:12:55', NULL, 17, NULL),
(49, '08-10', 25, '', '2025-01-16 19:12:55', NULL, 17, NULL),
(50, '11-12', 25, '', '2025-01-16 19:12:55', NULL, 17, NULL),
(51, '05-08', 25, '', '2025-01-16 19:12:55', NULL, 18, NULL),
(52, '02-04', 25, '', '2025-01-16 19:12:55', NULL, 18, NULL),
(53, '09-10', 25, '', '2025-01-16 19:12:55', NULL, 18, NULL),
(54, '01', 40, 'Dr. Haslina binti Hashim', '2025-01-16 19:12:55', NULL, 18, NULL),
(55, '02', 35, 'Dr. Nies Hui Wen (P)', '2025-01-16 19:12:55', NULL, 18, NULL),
(56, '03', 35, 'Dr. Izyan Izzati binti Kamsani', '2025-01-16 19:12:55', NULL, 18, NULL),
(57, '04', 35, 'Dr. Ahmad Najmi bin Amerhaider Nuar', '2025-01-16 19:12:55', NULL, 18, NULL),
(58, '05', 35, 'Dr. Izyan Izzati binti Kamsani', '2025-01-16 19:12:55', NULL, 18, NULL),
(59, '06', 35, 'Dr. Layla Rasheed Abdallah Hasan', '2025-01-16 19:12:55', NULL, 18, NULL),
(60, '07', 35, 'Dr. Nies Hui Wen', '2025-01-16 19:12:55', NULL, 18, NULL),
(61, '08', 35, 'Dr. Seah Choon Sen', '2025-01-16 19:12:55', NULL, 18, NULL),
(62, '09', 35, 'Dr. Haslina binti Hashim', '2025-01-16 19:12:55', NULL, 18, NULL),
(63, '10', 35, 'Dr. Layla Rasheed Abdallah Hasan', '2025-01-16 19:12:55', NULL, 19, NULL),
(64, '01', 30, 'Dr. Sharin Hazlin binti Huspi', '2025-01-16 19:12:55', NULL, 20, NULL),
(65, '02', 30, 'Ms. Rozilawati binti Dollah @ Md. Zain', '2025-01-16 19:12:55', NULL, 20, NULL),
(66, '03', 30, 'Dr. Noor Hidayah binti Zakaria (P)', '2025-01-16 19:12:55', NULL, 20, NULL),
(67, '04', 30, 'Ms. Rozilawati binti Dollah @ Md. Zain', '2025-01-16 19:12:55', NULL, 20, NULL),
(68, '01', 30, 'Ms. Rozilawati binti Dollah @ Md. Zain (P)', '2025-01-16 19:12:55', NULL, 21, NULL),
(69, '02', 30, 'Dr. Seah Choon Sen', '2025-01-16 19:12:55', NULL, 21, NULL),
(70, '01', 30, 'Dr. Zuriahati binti Mohd Yunos', '2025-01-16 19:12:55', NULL, 22, NULL),
(71, '02', 30, 'Dr. Mohd Fo\'ad bin Rohani (P)', '2025-01-16 19:12:55', NULL, 22, NULL),
(72, '03', 30, 'Assoc. Prof. Dr. Norafida binti Ithnin', '2025-01-16 19:12:55', NULL, 22, NULL),
(73, '04', 30, 'Mr. Ahmad Fariz bin Ali', '2025-01-16 19:12:55', NULL, 22, NULL),
(74, '01', 40, 'Mr. Ahmad Fariz bin Ali', '2025-01-16 19:12:55', NULL, 23, NULL),
(75, '02', 30, 'Mr. Ahmad Fariz bin Ali', '2025-01-16 19:12:55', NULL, 23, NULL),
(76, '03', 30, 'Dr. Farkhana Binti Muchtar', '2025-01-16 19:12:55', NULL, 23, NULL),
(77, '04', 35, 'Ts. Dr. Nur Haliza binti Abdul Wahab', '2025-01-16 19:12:55', NULL, 23, NULL),
(78, '05', 35, 'Dr. Zuriahati binti Mohd Yunos', '2025-01-16 19:12:55', NULL, 23, NULL),
(79, '06', 35, 'Dr. Mohd Fo\'ad bin Rohani (P)', '2025-01-16 19:12:55', NULL, 23, NULL),
(80, '07', 25, 'Dr. Mohd Fo\'ad bin Rohani', '2025-01-16 19:12:55', NULL, 23, NULL),
(81, '08', 25, 'Dr. Farkhana Binti Muchtar', '2025-01-16 19:12:55', NULL, 23, NULL),
(82, '09', 30, 'Dr. Mohd Kufaisal bin Mohd Sidik', '2025-01-16 19:12:55', NULL, 23, NULL),
(83, '01', 40, 'Dr. Nor Erne Nazira binti Bazin', '2025-01-16 19:12:55', NULL, 24, NULL),
(84, '02', 30, 'Dr. Noorfa Haszlinna binti Mustaffa', '2025-01-16 19:12:55', NULL, 24, NULL),
(85, '03', 30, 'Dr. Muhammad Aliif bin Ahmad (P)', '2025-01-16 19:12:55', NULL, 24, NULL),
(86, '04', 35, 'Dr. Muhammad Aliif bin Ahmad', '2025-01-16 19:12:55', NULL, 24, NULL),
(87, '05', 35, 'Dr. Seah Choon Sen', '2025-01-16 19:12:55', NULL, 24, NULL),
(88, '06', 35, 'Prof. Dr. Azlan bin Mohd Zain', '2025-01-16 19:12:55', NULL, 24, NULL),
(89, '07', 30, 'Dr. Tarmizi bin Adam', '2025-01-16 19:12:55', NULL, 24, NULL),
(90, '08', 30, 'Ts. Dr. Goh Eg Su', '2025-01-16 19:12:55', NULL, 24, NULL),
(91, '09', 40, 'Dr. Mohd Kufaisal bin Mohd Sidik', '2025-01-16 19:12:55', NULL, 24, NULL),
(92, '04-06', 40, '', '2025-01-16 19:12:55', NULL, 24, NULL),
(93, 'EB1', 30, '', '2025-01-16 19:12:55', NULL, 25, NULL),
(94, '16', 27, 'Language Academy', '2025-01-16 19:12:55', NULL, 26, NULL),
(95, '17', 24, 'Language Academy', '2025-01-16 19:12:55', NULL, 26, NULL),
(96, '18', 24, 'Language Academy', '2025-01-16 19:12:55', NULL, 26, NULL),
(97, '16', 35, 'Language Academy', '2025-01-16 19:12:55', NULL, 26, NULL),
(98, '17', 35, 'Language Academy', '2025-01-16 19:12:55', NULL, 26, NULL),
(99, '18', 35, 'Language Academy', '2025-01-16 19:12:55', NULL, 26, NULL),
(100, '01', 40, 'Dr. Aryati binti Bakri (P)', '2025-01-16 19:12:55', NULL, 27, NULL),
(101, '02', 40, 'Assoc. Prof. Dr. Roliana binti Ibrahim', '2025-01-16 19:12:55', NULL, 27, NULL),
(102, 'EB1', 40, '', '2025-01-16 19:12:55', NULL, 28, NULL),
(103, '01-16', 40, 'UGS', '2025-01-16 19:12:55', NULL, 29, NULL),
(104, '01-16', 40, 'UGS', '2025-01-16 19:12:55', NULL, 29, NULL),
(105, '01-02', 40, '', '2025-01-16 19:12:55', NULL, 30, NULL),
(106, '01', 30, 'Dr. Md. Sah bin Hj. Salam', '2025-01-16 19:12:55', NULL, 30, NULL),
(107, '02', 30, 'Dr. Md. Sah bin Hj. Salam', '2025-01-16 19:12:55', NULL, 30, NULL),
(108, '01', 30, 'Dr. Noraini binti Ibrahim', '2025-01-16 19:12:55', NULL, 31, NULL),
(109, '02', 30, 'Dr. Muhammad Khatibsyarbini Abd Rahim', '2025-01-16 19:12:55', NULL, 31, NULL),
(110, '03', 30, 'Dr. Nor Azizah binti Sa’adon', '2025-01-16 19:12:55', NULL, 31, NULL),
(111, '04', 30, 'Dr. Sim Hiew Moi (P)', '2025-01-16 19:12:55', NULL, 31, NULL),
(112, '01-02', 30, '', '2025-01-16 19:12:55', NULL, 32, NULL),
(113, '01', 30, 'Dr. Norhaida binti Mohd Suaib', '2025-01-16 19:12:55', NULL, 32, NULL),
(114, '02', 30, 'Dr. Norhaida binti Mohd Suaib', '2025-01-16 19:12:55', NULL, 32, NULL),
(115, '01', 40, 'Dr. Nur Zuraifah Syazrah binti Othman', '2025-01-16 19:12:55', NULL, 33, NULL),
(116, '02', 30, 'Dr. Cik Suhaimi bin Yusof', '2025-01-16 19:12:55', NULL, 33, NULL),
(117, '03', 30, 'Ms. Nor Anita Fairos binti Ismail', '2025-01-16 19:12:55', NULL, 33, NULL),
(118, '04', 30, 'Assoc. Prof. Dr. Nor Azman bin Ismail', '2025-01-16 19:12:55', NULL, 33, NULL),
(119, '05', 30, 'Dr. Aida binti Ali', '2025-01-16 19:12:55', NULL, 33, NULL),
(120, '06', 30, 'Dr. Cik Suhaimi bin Yusof', '2025-01-16 19:12:55', NULL, 33, NULL),
(121, '07', 30, 'Dr. Sarina binti Sulaiman (P)', '2025-01-16 19:12:55', NULL, 33, NULL),
(122, '08', 30, 'Assoc. Prof. Dr. Nor Azman bin Ismail', '2025-01-16 19:12:55', NULL, 33, NULL),
(123, '09', 30, 'Dr. Sarina binti Sulaiman', '2025-01-16 19:12:55', NULL, 33, NULL),
(124, '10', 30, 'Dr. Aida binti Ali', '2025-01-16 19:12:55', NULL, 33, NULL),
(125, '', 30, '', '2025-01-16 19:12:55', NULL, 33, NULL),
(126, 'EB1', 30, 'Dr. Nazmona binti Mat Ali', '2025-01-16 19:12:55', NULL, 34, NULL),
(127, 'EB2', 30, 'Dr. Noorminsah binti Iahad', '2025-01-16 19:12:55', NULL, 34, NULL),
(128, 'EB1', 40, 'Tn. Hj. Mohamad Shukri bin Abdul Manaf', '2025-01-16 19:12:55', NULL, 35, NULL),
(129, 'EB1', 40, 'Tn. Hj. Mohamad Shukri bin Abdul Manaf', '2025-01-16 19:12:55', NULL, 35, NULL),
(130, '08*', 130, 'Dr. Norhidayu binti Muhamad Zain', '2025-01-16 19:12:55', NULL, 36, NULL),
(131, '16', 130, 'Assoc. Prof. Dr. Kamarul Azmi bin Jasmi', '2025-01-16 19:12:55', NULL, 36, NULL),
(132, '04', 130, 'Dr. Siti Nur Hadis bin A Rahman', '2025-01-16 19:12:55', NULL, 36, NULL),
(133, 'EB1', 15, '', '2025-01-16 19:12:55', NULL, 37, NULL),
(134, 'EB1', 40, 'UTMSPACE', '2025-01-16 19:12:55', NULL, 37, NULL),
(135, '01-04', 40, '', '2025-01-16 19:12:55', NULL, 38, NULL),
(136, '01', 30, 'Dr. Nor Azizah binti Sa’adon', '2025-01-16 19:12:55', NULL, 38, NULL),
(137, '02', 30, 'Mr. Norizam bin Katmon (P)', '2025-01-16 19:12:55', NULL, 38, NULL),
(138, '03', 30, 'Dr. Nor Azizah binti Sa’adon', '2025-01-16 19:12:55', NULL, 38, NULL),
(139, '04', 30, 'Mr. Norizam bin Katmon', '2025-01-16 19:12:55', NULL, 38, NULL),
(140, '05', 30, 'Dr. Fazliaty Edora binti Fadzli', '2025-01-16 19:12:55', NULL, 38, NULL),
(141, '01-04', 30, '', '2025-01-16 19:12:55', NULL, 39, NULL),
(142, '01', 28, 'Dr. Johan bin Mohamad Sharif (P)', '2025-01-16 19:12:55', NULL, 39, NULL),
(143, '02', 28, 'Dr. Johan bin Mohamad Sharif', '2025-01-16 19:12:55', NULL, 39, NULL),
(144, '03', 28, 'Dr. Johan bin Mohamad Sharif', '2025-01-16 19:12:55', NULL, 39, NULL),
(145, '04', 28, 'Prof. Ts. Dr. Kamalrulnizam bin Abu Bakar', '2025-01-16 19:12:55', NULL, 39, NULL),
(146, '01-04', 28, '', '2025-01-16 19:12:55', NULL, 40, NULL),
(147, '01', 28, 'Dr. Johan bin Mohamad Sharif (P)', '2025-01-16 19:12:55', NULL, 40, NULL),
(148, '02', 28, 'Dr. Johan bin Mohamad Sharif', '2025-01-16 19:12:55', NULL, 40, NULL),
(149, '03', 28, 'Dr. Johan bin Mohamad Sharif', '2025-01-16 19:12:55', NULL, 40, NULL),
(150, '04', 28, 'Prof. Ts. Dr. Kamalrulnizam bin Abu Bakar', '2025-01-16 19:12:55', NULL, 40, NULL),
(151, '01', 35, 'Ms. Rashidah binti Kadir (P)', '2025-01-16 19:12:55', NULL, 41, NULL),
(152, '02', 35, 'Ms. Rashidah binti Kadir', '2025-01-16 19:12:55', NULL, 41, NULL),
(153, '03', 35, 'Dr. Muhalim bin Mohamed Amin', '2025-01-16 19:12:55', NULL, 41, NULL),
(154, '01-03', 40, '', '2025-01-16 19:12:55', NULL, 41, NULL),
(155, '01', 50, '', '2025-01-16 19:12:55', NULL, 42, NULL),
(156, '02', 50, 'En. Hairudin Abdul Majid', '2025-01-16 19:12:55', NULL, 42, NULL),
(157, '03', 50, 'En. Hairudin Abdul Majid', '2025-01-16 19:12:55', NULL, 42, NULL),
(158, 'EB1', 40, 'Assoc. Prof. Dr. Mohd Hisyam bin Rasidi', '2025-01-16 19:12:55', NULL, 43, NULL),
(159, 'EB1', 30, 'Dr. Muzani Mustapa', '2025-01-16 19:12:55', NULL, 44, NULL),
(160, 'EB1', 40, 'Fara Diva binti Mustapa /\nNaqiyatul Amirah binti M', '2025-01-16 19:12:55', NULL, 44, NULL),
(161, '05-12', 40, '', '2025-01-16 19:12:55', NULL, 36, NULL),
(162, '05', 130, 'Dr. Mohd Sharial bin Bungsu', '2025-01-16 19:12:55', NULL, 36, NULL),
(163, '06', 130, 'Dr. Mohd Nasir bin Markom', '2025-01-16 19:12:55', NULL, 36, NULL),
(164, '07', 130, 'Dr. Radhiahtul Raehan binti Mustafa', '2025-01-16 19:12:55', NULL, 36, NULL),
(165, '09', 130, 'Assoc. Prof. Dr. Sulaiman bin Kadikon', '2025-01-16 19:12:55', NULL, 36, NULL),
(166, '10', 130, 'Assoc. Prof. Dr. Sulaiman Shakib bin Mohd Noor', '2025-01-16 19:12:55', NULL, 36, NULL),
(167, '11', 130, 'Assoc. Prof. Dr. Bushrah bin Basiron', '2025-01-16 19:12:55', NULL, 36, NULL),
(168, '12', 130, 'Assoc. Prof. Dr. Kamarul Azmi bin Jasmi', '2025-01-16 19:12:55', NULL, 36, NULL),
(169, 'EB1', 40, '', '2025-01-16 19:12:55', NULL, 45, NULL),
(170, 'EB2', 40, '', '2025-01-16 19:12:55', NULL, 45, NULL),
(171, '01', 12, 'Dr. Tarmizi bin Adam', '2025-01-16 19:12:55', NULL, 46, NULL),
(172, '01', 30, 'Dr. Nor Haizan binti Mohamed Radzi', '2025-01-16 19:12:55', NULL, 47, NULL),
(173, '02', 30, 'Dr. Nor Azizah binti Ali (P)', '2025-01-16 19:12:55', NULL, 47, NULL),
(174, '03', 30, 'Dr. Mohamad Shukor bin Talib', '2025-01-16 19:12:55', NULL, 47, NULL),
(175, '04', 30, 'Dr. Nor Azizah binti Ali', '2025-01-16 19:12:55', NULL, 47, NULL),
(176, '01-02', 30, '', '2025-01-16 19:12:55', NULL, 48, NULL),
(177, '01', 30, 'Dr. Jumail bin Taliba', '2025-01-16 19:12:55', NULL, 48, NULL),
(178, 'EB2', 40, '', '2025-01-16 19:12:55', NULL, 49, NULL),
(179, 'EB2', 40, 'UTMSPACE', '2025-01-16 19:12:55', NULL, 49, NULL),
(180, '06-09', 40, '', '2025-01-16 19:12:55', NULL, 50, NULL),
(181, '03-05', 40, '', '2025-01-16 19:12:55', NULL, 50, NULL),
(182, '10-11', 40, '', '2025-01-16 19:12:55', NULL, 50, NULL),
(183, '01', 40, 'Dr. Muhammad Zafran bin Muhammad Zaly Shah', '2025-01-16 19:12:55', NULL, 50, NULL),
(184, '02', 40, 'Assoc. Prof. Ts. Dr. Ismail Fauzi bin Isnin', '2025-01-16 19:12:55', NULL, 50, NULL),
(185, '03', 40, 'Ts. Ms. Hazinah binti Kutty Mammi', '2025-01-16 19:12:55', NULL, 50, NULL),
(186, '04', 40, 'Mr. Firoz bin Yusuf Patel Dawoodi', '2025-01-16 19:12:55', NULL, 50, NULL),
(187, '05', 40, 'Ts. Ms. Hazinah binti Kutty Mammi (P)', '2025-01-16 19:12:55', NULL, 50, NULL),
(188, '06', 40, 'Dr. Raja Zahilah binti Raja Mohd Radzi', '2025-01-16 19:12:55', NULL, 50, NULL),
(189, '07', 40, 'Dr. Nurfazrina binti Mohd Zamry', '2025-01-16 19:12:55', NULL, 50, NULL),
(190, '08', 40, 'Dr. Muhammad Zafran bin Muhammad Zaly Shah', '2025-01-16 19:12:55', NULL, 50, NULL),
(191, '09', 40, 'Mr. Firoz bin Yusuf Patel Dawoodi', '2025-01-16 19:12:55', NULL, 50, NULL),
(192, '10', 40, 'Dr. Nurfazrina binti Mohd Zamry', '2025-01-16 19:12:55', NULL, 50, NULL),
(193, '11', 40, 'Dr. Raja Zahilah binti Raja Mohd Radzi', '2025-01-16 19:12:55', NULL, 50, NULL),
(194, '12', 35, 'Mr. Firoz bin Yusuf Patel Dawoodi', '2025-01-16 19:12:55', NULL, 50, NULL),
(195, '03', 40, 'Dr. Zulkiflee bin Haron', '2025-01-16 19:12:55', NULL, 51, NULL),
(196, '03', 40, 'Dr. Zulkiflee bin Haron', '2025-01-16 19:12:55', NULL, 51, NULL),
(197, '04', 40, 'Dr. Nur Izzati binti Mohamad Norzilan', '2025-01-16 19:12:55', NULL, 51, NULL),
(198, '04', 40, 'Dr. Nur Izzati binti Mohamad Norzilan', '2025-01-16 19:12:55', NULL, 51, NULL),
(199, '34', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(200, '35', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(201, '36', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(202, '37', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(203, '38', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(204, '39', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(205, '40', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(206, '41', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(207, '42', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(208, '43', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(209, '44', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 52, NULL),
(210, '51', 28, 'Language Academy', '2025-01-16 19:12:55', NULL, 53, NULL),
(211, '52', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 53, NULL),
(212, '53', 28, 'Language Academy', '2025-01-16 19:12:55', NULL, 53, NULL),
(213, '54', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 53, NULL),
(214, '55', 30, 'Language Academy', '2025-01-16 19:12:55', NULL, 53, NULL),
(215, '51-55', 28, '', '2025-01-16 19:12:55', NULL, 53, NULL),
(216, '51-55', 40, '', '2025-01-16 19:12:55', NULL, 53, NULL),
(217, '01', 50, 'Dr. Azlah bin Md. Ali', '2025-01-16 19:12:55', NULL, 54, NULL),
(218, '03', 50, 'Dr. Azlah bin Md. Ali', '2025-01-16 19:12:55', NULL, 54, NULL),
(219, '02', 50, 'Dr. Mohd. Koharuddin bin Mohd. Balwi', '2025-01-16 19:12:55', NULL, 54, NULL),
(220, '01', 40, 'Dr. Nies Hui Wen', '2025-01-16 19:12:55', NULL, 55, NULL),
(221, '01', 40, 'Dr. Izyan Izzati binti Kamsani', '2025-01-16 19:12:55', NULL, 56, NULL),
(222, '02', 30, 'Dr. Jamilah binti Mahmood', '2025-01-16 19:12:55', NULL, 56, NULL),
(223, '03', 30, 'Dr. Alif Ridzuan bin Khairuddin (P)', '2025-01-16 19:12:55', NULL, 56, NULL),
(224, '04', 35, 'Ms. Lizawati binti Mi Yusuf', '2025-01-16 19:12:55', NULL, 56, NULL),
(225, '05', 35, 'Dr. Jamilah binti Mahmood', '2025-01-16 19:12:55', NULL, 56, NULL),
(226, '06', 35, 'Dr. Alif Ridzuan bin Khairuddin', '2025-01-16 19:12:55', NULL, 56, NULL),
(227, '07', 25, 'Ms. Lizawati binti Mi Yusuf', '2025-01-16 19:12:55', NULL, 56, NULL),
(228, '08', 25, 'Ts. Dr. Goh Eg Su', '2025-01-16 19:12:55', NULL, 56, NULL),
(229, '09', 26, 'Dr. Jumail bin Taliba', '2025-01-16 19:12:55', NULL, 56, NULL),
(230, '01', 30, 'Dr. Muhammad Luqman bin Mohd Shafie (P)', '2025-01-16 19:12:55', NULL, 57, NULL),
(231, '02', 30, 'Dr. Muhammad Luqman bin Mohd Shafie', '2025-01-16 19:12:55', NULL, 57, NULL),
(232, '01', 3, 'Dr. Pang Yee Yong', '2025-01-16 19:12:55', NULL, 58, NULL),
(233, '03', 45, 'Dr. Norhidayu bin Muhamad Zain', '2025-01-16 19:12:55', NULL, 59, NULL),
(234, '03', 45, 'Dr. Norhidayu bin Muhamad Zain', '2025-01-16 19:12:55', NULL, 59, NULL),
(235, '01', 45, 'Dr. Muhammad Talhah bin Jima\'ain', '2025-01-16 19:12:55', NULL, 59, NULL),
(236, '02', 45, 'Dr. Siti Nur Hadis binti Ab Rahman', '2025-01-16 19:12:55', NULL, 59, NULL),
(237, '04', 45, 'Dr. Muhammad Sobri bin Faisal', '2025-01-16 19:12:55', NULL, 59, NULL),
(238, '01', 45, 'Dr. Muhammad Talhah bin Jima\'ain', '2025-01-16 19:12:55', NULL, 59, NULL),
(239, '02', 45, 'Dr. Siti Nur Hadis binti Ab Rahman', '2025-01-16 19:12:55', NULL, 59, NULL),
(240, '04', 45, 'Dr. Muhammad Sobri bin Faisal', '2025-01-16 19:12:55', NULL, 59, NULL),
(241, '', 45, '', '2025-01-16 19:12:55', NULL, 60, NULL),
(242, 'EB1', 15, 'TPr. Dr. Gobi Kirshna Sinniah', '2025-01-16 19:12:55', NULL, 61, NULL),
(243, 'EB1', 30, 'Dr. Farah Adibah', '2025-01-16 19:12:55', NULL, 62, NULL),
(244, '01', 30, 'Prof. Ts. Dr. Wan Mohd Nasir bin Wan Kadir', '2025-01-16 19:12:55', NULL, 63, NULL),
(245, '02', 30, 'Dr. Adila Firdaus binti Arbain', '2025-01-16 19:12:55', NULL, 63, NULL),
(246, '03', 30, 'Dr. Muhammad Khatibsyarbini Abd Rahim (P)', '2025-01-16 19:12:55', NULL, 63, NULL),
(247, '04', 30, 'Dr. Muhammad Khatibsyarbini Abd Rahim', '2025-01-16 19:12:55', NULL, 63, NULL),
(248, '05', 30, 'Dr. Adila Firdaus binti Arbain', '2025-01-16 19:12:55', NULL, 63, NULL),
(249, '01-04', 30, '', '2025-01-16 19:12:55', NULL, 63, NULL),
(250, '05-08', 30, '', '2025-01-16 19:12:55', NULL, 64, NULL),
(251, '02-04', 30, '', '2025-01-16 19:12:55', NULL, 64, NULL),
(252, '09-10', 30, '', '2025-01-16 19:12:55', NULL, 64, NULL),
(253, '01', 35, 'Dr. Shahliza binti Abd. Halim', '2025-01-16 19:12:55', NULL, 64, NULL),
(254, '02', 35, 'Dr. Jamilah binti Mahmood (P)', '2025-01-16 19:12:55', NULL, 64, NULL),
(255, '03', 35, 'Dr. Alif Ridzuan bin Khairuddin', '2025-01-16 19:12:55', NULL, 64, NULL),
(256, '04', 35, 'Dr. Layla Rasheed Abdallah Hasan', '2025-01-16 19:12:55', NULL, 64, NULL),
(257, '05', 35, 'Dr. Muhammad Luqman bin Mohd Shafie', '2025-01-16 19:12:55', NULL, 64, NULL),
(258, '06', 35, 'Ts. Dr. Johanna binti Ahmad', '2025-01-16 19:12:55', NULL, 64, NULL),
(259, '07', 35, 'Dr. Noraini binti Ibrahim', '2025-01-16 19:12:55', NULL, 64, NULL),
(260, '08', 35, 'Dr. Shahliza binti Abd. Halim', '2025-01-16 19:12:55', NULL, 64, NULL),
(261, '09', 35, 'Dr. Noraini binti Ibrahim', '2025-01-16 19:12:55', NULL, 64, NULL),
(262, '10', 35, 'Ts. Dr. Johanna binti Ahmad', '2025-01-16 19:12:55', NULL, 64, NULL),
(263, '11', 35, 'Ms. Nor Anita Fairos binti Ismail', '2025-01-16 19:12:55', NULL, 64, NULL),
(264, '01', 27, 'Dr. Noraini binti Ibrahim /\nDr. Muhammad Luqman bi', '2025-01-16 19:12:55', NULL, 65, NULL),
(265, '01', 30, 'Dr. Aryati binti Bakri (P)', '2025-01-16 19:12:55', NULL, 66, NULL),
(266, '02', 30, 'Ts. Dr. Muhammad Iqbal Tariq bin Idris', '2025-01-16 19:12:55', NULL, 66, NULL),
(267, 'EB1', 30, '', '2025-01-16 19:12:55', NULL, 67, NULL),
(268, 'EB1', 40, '', '2025-01-16 19:12:55', NULL, 67, NULL),
(269, 'EB1', 40, 'Tantish Kamarudin /\nNfisah Abdul Rahiman', '2025-01-16 19:12:55', NULL, 68, NULL),
(270, '01', 40, 'Assoc. Prof. Dr. Haza Nuzly bin Abdull Hamed (P)', '2025-01-16 19:12:55', NULL, 69, NULL),
(271, '02', 40, 'Dr. Ahmad Najmi bin Amerhaider Nuar', '2025-01-16 19:12:55', NULL, 69, NULL),
(272, '01', 40, 'Assoc. Prof. Dr. Azurah binti Abu Samah', '2025-01-16 19:12:55', NULL, 70, NULL),
(273, '02', 30, 'Dr. Aryati binti Bakri', '2025-01-16 19:12:55', NULL, 70, NULL),
(274, '03', 30, 'Ts. Dr. Muhammad Iqbal Tariq bin Idris (P)', '2025-01-16 19:12:55', NULL, 70, NULL),
(275, '05', 40, 'Dr. Haswadi bin Hasan', '2025-01-16 19:12:55', NULL, 70, NULL),
(276, '06', 40, 'Ts. Dr. Muhammad Iqbal Tariq bin Idris', '2025-01-16 19:12:55', NULL, 70, NULL),
(277, '07', 40, 'Dr. Suriati binti Sadimon', '2025-01-16 19:12:55', NULL, 70, NULL),
(278, '08', 40, 'Dr. Suriati binti Sadimon', '2025-01-16 19:12:55', NULL, 70, NULL),
(279, '09', 40, 'Dr. Pang Yee Yong', '2025-01-16 19:12:55', NULL, 70, NULL),
(280, '07-08', 40, '', '2025-01-16 19:12:55', NULL, 70, NULL),
(281, '08-09', 40, '', '2025-01-16 19:12:55', NULL, 70, NULL),
(282, '04-06', 40, '', '2025-01-16 19:12:55', NULL, 70, NULL),
(283, 'EB1', 40, 'Dr. Umar Haiyat bin Abdul Kohar', '2025-01-16 19:12:55', NULL, 71, NULL),
(284, '01', 60, 'En. Hairudin Abdul Majid', '2025-01-16 19:12:55', NULL, 72, NULL),
(285, '02', 60, '', '2025-01-16 19:12:55', NULL, 73, NULL),
(286, '01', 40, 'Dr. Zalmiyah binti Zakaria', '2025-01-16 19:12:55', NULL, 73, NULL),
(287, '02', 40, 'Dr. Suriati binti Sadimon (P)', '2025-01-16 19:12:55', NULL, 73, NULL),
(288, '', 40, '', '2025-01-16 19:12:55', NULL, 74, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section_info_copy`
--

CREATE TABLE `section_info_copy` (
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
-- Dumping data for table `section_info_copy`
--

INSERT INTO `section_info_copy` (`id`, `section`, `capacity`, `lect_assigned`, `updated_at`, `user_id`, `course_id`, `created_at`) VALUES
(1, '08', 30, 'Dr. Roselina Salleh', '2024-12-29 17:04:44', NULL, 1, NULL),
(2, '07', 25, 'Ms. Lizawati binti Mi Yusuf', '2024-12-29 17:05:17', NULL, 2, NULL),
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
(24, '01', 30, 'Dr. Muhamad Razib bin Othman', '2024-12-29 17:22:55', NULL, 24, NULL),
(25, '11', 30, 'Dr. Sim Hiew Moi', '2024-12-29 17:35:13', NULL, 25, NULL),
(26, '01', 29, 'Dr. Norhaida binti Mohd Suaib', '2024-12-28 01:58:18', 1, 26, NULL),
(27, '01', 29, 'Dr. Md. Sah bin Hj. Salam', '2024-12-28 01:58:24', 1, 27, NULL),
(28, '01', 29, 'Dr. Jumail bin Taliba', '2024-12-29 17:35:55', 1, 28, NULL),
(32, '09', 29, 'Dr. Nur Othman', '2024-12-29 17:04:59', 1, 1, NULL),
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
(50, '12', 29, 'Dr. Ruhaidah binti Samsudin', '2024-12-29 17:35:22', 1, 25, NULL),
(51, '02', 30, 'Dr. Norhaida binti Mohd Suaib', '2024-12-28 09:52:32', NULL, 26, NULL),
(52, '02', 30, 'Dr. Md. Sah bin Hj. Salam', '2024-12-28 09:52:32', NULL, 27, NULL),
(53, '02', 30, 'Dr. Jumail bin Taliba', '2024-12-29 17:35:38', NULL, 28, NULL);

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
('0hsKkJdVRBYWrLzMN5vJ4DD0Fil1bLsBHz2xfchz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzlWYUVETjU4QTY3RUlaOEgyVjl1SE54RU92Vko3amVLeGZDT2IzTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1737080106),
('1wJQViUFiUJAH2eWMifLuQxEJLftiyPOGAqfXAUN', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidkdLcjlmMTZrYnBmSVltdjgyd29nelpXMURLcTZjamw4QWdWRklpRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50L2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1738220825),
('bEP04Vv1pw43yzWIHDZIUYxP87fmdtULGq3rnKND', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQUNHeWtud3kyUHNsUlI2Z01RQ2lNSjFHcGFIanlhN0dHUEhXVXA2ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50L2NvdXJzZXMvcmVnaXN0ZXI/cHJvZ3JhbXM9U0VDUkgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1737081630),
('GKEAp41o40NGEXE2fQPNsYjvJzBOhTK3jyrTc9hV', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR1E4dlU3eVV1bkh3bndTYUU4TFJibTlUdzR5eERBY0N2QWtMcWJwTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50L2NvdXJzZXMvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1738317764),
('IVZjt8l9l5mczMz2jn2BNBwumKYeb5W3CWX3QWdE', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRlNWTFBDSnFjUmxkUFRQUEhtdGt5SmZ3aUQwYnpFZVFqOHVNSXNsNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50L2NoYXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1738343188),
('m7qdoEDPphgyLp2CPo29JDrq0xv7OWYLeDgDHYoV', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaXB1RTVSdm94SzM1cDEyOHNxY1owcURHSlU3Z2h6Y0tLbmVYUHhlNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50L2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1738085162),
('XHJyr7KWbn7itb9qK9cuDeGNfXDvLjcoVkFHjmfA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieWtrNmpRWmFXTnNyanJTM3d4Y2tZREJFbVl5Vm5teGdKQmd3b1VFSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50L2Rhc2hib2FyZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1738174701),
('y5myFtWN813OEElvFhc18qm6QIrtURS6tnHJPkIk', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSUVtS0ExN3VQOGFia3lzQmNuMUJ4UkF6YW4zSlU3NFZtUHVrT1lCMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50L2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1738202507);

-- --------------------------------------------------------

--
-- Table structure for table `sheet1`
--

CREATE TABLE `sheet1` (
  `id` int(2) DEFAULT NULL,
  `subject_code` varchar(9) DEFAULT NULL,
  `subject_name` varchar(64) DEFAULT NULL,
  `credit_hours` varchar(2) DEFAULT NULL,
  `no_section` int(2) DEFAULT NULL,
  `semester` varchar(24) DEFAULT NULL,
  `program` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sheet1`
--

INSERT INTO `sheet1` (`id`, `subject_code`, `subject_name`, `credit_hours`, `no_section`, `semester`, `program`) VALUES
(1, 'SECB3104', 'Application Development', '4.', 1, 'Year 3 [Semester 1]', 'SECBH'),
(2, 'SECR3104', 'Application Development', '4.', 3, 'Year 3 [Semester 1]', 'SECRH'),
(3, 'SECJ3104', 'Application Development', '4.', 4, 'Year 3 [Semester 1]', 'SECJH'),
(4, 'SECV3104', 'Application Development', '4.', 2, 'Year 3 [Semester 1]', 'SECVH'),
(5, 'SECJ3553', 'Artificial Intelligence', '3.', 13, 'Year 3 [Semester 1]', 'SECBH'),
(6, 'SEBB1513', 'Basic Anatomy and Physiology', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(7, 'SBEA1223', 'Basic Architectural Computing', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(8, 'SBEA 1223', 'Basic Architectural Computing', '2.', 1, 'Available Every Semester', 'ALL'),
(9, 'SSCG2423', 'Bioethics in Research and Development', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(10, 'SECB3103', 'Bioinformatics II', '3.', 1, 'Year 3 [Semester 1]', 'SECBH'),
(11, 'SECB3032', 'Bioinformatics Project I', '3.', 1, 'Year 3 [Semester 2]', 'SECBH'),
(12, 'SEBB4173', 'Cell & Molecular Biology for Bioinformatics', '3.', 1, 'Year 1 [Semester 1]', 'SECBH'),
(13, 'SECI1113', 'Computational Mathematics', '3.', 1, 'Year 2 [Semester 1]', 'SECBH/SECRH'),
(14, 'SECR3032', 'Computer Network and Security Project I', '3.', 1, 'Year 3 [Semester 2]', 'SECRH'),
(15, 'UHMS2022', 'Critical and Creative Thinking(International Students)', '2.', 1, 'Available Every Semester', 'ALL'),
(16, 'SECP3223', 'Data Analytics Programming', '3.', 2, 'Year 3 [Semester 1]', 'SECPH'),
(17, 'SECJ2013', 'Data Structure and Algorithm', '3.', 14, 'Year 2 [Semester 1]', 'SECBH'),
(18, 'SECD2523', 'Database', '3.', 12, 'Year 1 [Semester 2]', ''),
(19, 'SECD2524', 'Database', '4.', 1, 'Year 2 [Semester 1]', 'SECVH'),
(20, 'SCST1143', 'Database Engineering', '4.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(21, 'SECP2523', 'Database WBL', '4.', 2, 'Year 2 [Semester 1]', 'SECPH'),
(22, 'SCSR1013', 'Digital Logic', '4.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(23, 'SECR1013', 'Digital Logic', '3.', 9, 'Year 1 [Semester 1]', 'SECBH'),
(24, 'SECI1013', 'Discrete Structure', '3.', 10, 'Year 1 [Semester 1]', 'SECBH'),
(25, 'SEAA1213', 'Engineering Mechanics', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(26, 'UHLB1112', 'English Communication Skills', '2.', 6, 'Available Every Semester', 'ALL'),
(27, 'SECP3744', 'Enterprise System Design & Modeling', '3.', 2, 'Year 3 [Semester 1]', 'SECPH'),
(28, 'SEAA3913', 'Environmental Management', '2.', 1, 'Available Every Semester', 'ALL'),
(29, 'UKQT3001', 'Extra-curricular Experiential Learning (ExCEL)', '2.', 2, 'Available Every Semester', 'ALL'),
(30, 'SECV3213', 'Fundamental of Image Processing', '3.', 3, 'Year 2 [Semester 2]', 'SECVH'),
(31, 'SCSE1013', 'Fundamental Programming Concept', '3.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(32, 'SECV3113', 'Geometric Modelling', '3.', 3, 'Year 2 [Semester 2]', 'SECVH'),
(33, 'SECV2113', 'Human Computer Interaction', '3.', 11, 'Year 2 [Semester 1]', 'SECBH'),
(34, 'SFMD1063', 'Information Technology Business', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(35, 'SEEU2123', 'Instrumentation and Measurement', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(36, 'ULRS1032', 'Integrity and Anti-Corruption Course(International Student Only)', '2.', 11, 'Available Every Semester', 'ALL'),
(37, 'SSPB2133', 'International Business', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(38, 'SECJ3303', 'Internet Programming', '3.', 6, 'Year 2 [Semester 2]', 'SECJH'),
(39, 'SECR3242', 'Internetworking Technology', '3.', 5, 'Year 2 [Semester 2]', 'SECRH'),
(40, 'SECR3941', 'Internetworking Technology Lab', '3.', 5, 'Year 2 [Semester 2]', 'SECRH'),
(41, 'SECR3443', 'Introduction to Cryptography', '3.', 4, 'Year 3 [Semester 1]', 'SECRH'),
(42, 'UBSS1032', 'Introduction to Entrepreneurship', '3.', 3, 'Year 3 [Semester 2]', 'SECJH'),
(43, 'SBEZ1652', 'Introduction to Landscape Architecture', '2.', 1, 'Available Every Semester', 'ALL'),
(44, 'SBEQ1343', 'Introduction to Quantity Surveying', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(45, 'SEMM2613', 'Materials Science', '2.', 2, 'Available Every Semester', 'ALL'),
(46, 'SECV1113', 'Mathematics for Computer Graphics', '3.', 1, 'Year 2 [Semester 1]', 'SECVH'),
(47, 'SCST1123', 'Mathematics for Software Engineer', '3.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(48, 'SECJ3623', 'Mobile Application Programming', '3.', 2, 'Year 2 [Semester 2]', 'SECVH'),
(49, 'SSPG2223', 'National Integrity', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(50, 'SECR1213', 'Network Communications', '3.', 15, 'Year 1 [Semester 2]', ''),
(51, 'UHIS1022', 'Philosophy & Current Issues', '', 4, 'Available Every Semester', 'ALL'),
(52, 'UHLB3132', 'Professional Communication Skills', '', 11, 'Available Every Semester', 'ALL'),
(53, 'UHLB2122', 'Professional Communication Skills 1', '2.', 7, 'Available Every Semester', 'ALL'),
(54, 'UHMT2132', 'Professional Ethics', '2.', 3, 'Available Every Semester', 'ALL'),
(55, 'SECB3203', 'Programming for Bioinformatics', '3.', 1, 'Year 3 [Semester 1]', 'SECBH'),
(56, 'SECJ1013', 'Programming Technique I', '4.', 9, 'Year 1 [Semester 1]', 'SECBH'),
(57, 'SECJ1023', 'Programming Technique II', '4.', 2, 'Year 1 [Semester 2]', 'SECRH/SECJH'),
(58, 'SECV3032', 'Project I (Graphics and Multimedia Software)', '3.', 1, 'Year 3 [Semester 2]', 'SECVH'),
(59, 'UHIT2302', 'Science & Technology Thinking(International Students Only)', '2.', 8, 'Available Every Semester', 'ALL'),
(60, 'ULRF2xx2', 'Service Learning Co-Curriculum', '3.', 1, 'Available Every Semester', 'SECJH/ SECVH'),
(61, 'SBEW3153', 'Social Impact Assessment', '2.', 1, 'Available Every Semester', 'ALL'),
(62, 'SHMY1033', 'Social Psychology', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(63, 'SECJ3323', 'Software Design & Architecture', '4.', 6, 'Year 3 [Semester 1]', 'SECJH'),
(64, 'SECJ2203', 'Software Engineering', '3.', 14, 'Year 1 [Semester 2]', 'SECJH'),
(65, 'SECJ3032', 'Software Engineering Project I', '3.', 1, 'Year 3 [Semester 2]', 'SECJH'),
(66, 'SECP3204', 'Software Engineering WBL', '3.', 2, 'Year 2 [Semester 1]', 'SECPH'),
(67, 'SSCP2413', 'Solid State Physics', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(68, 'SBEC4182', 'Sustainable Construction', '2.', 1, 'Available Every Semester', 'ALL'),
(69, 'SECP3723', 'System Development Technology WBL', '3.', 2, 'Year 2 [Semester 1]', 'SECPH'),
(70, 'SECP1513', 'Technology & Information System', '3.', 11, 'Year 1 [Semester 1]', 'SECBH'),
(71, 'SBSD3063', 'Technology Entrepreneurship', '2.', 1, 'Available Every Semester', 'ALL'),
(72, 'SECD3761', 'Technopreneurship Seminar', '3.', 1, 'Year 3 [Semester 2]', 'SECJH'),
(73, 'SECJ3203', 'Theory of Computer Science', '3.', 3, 'Year 2 [Semester 2]', 'SECRH'),
(74, 'SxxxXxx3', 'University Free Elective', '2.', 1, 'Available Every Semester', 'SECRH'),
(1, 'SECB3104', 'Application Development', '4.', 1, 'Year 3 [Semester 1]', 'SECBH'),
(2, 'SECR3104', 'Application Development', '4.', 3, 'Year 3 [Semester 1]', 'SECRH'),
(3, 'SECJ3104', 'Application Development', '4.', 4, 'Year 3 [Semester 1]', 'SECJH'),
(4, 'SECV3104', 'Application Development', '4.', 2, 'Year 3 [Semester 1]', 'SECVH'),
(5, 'SECJ3553', 'Artificial Intelligence', '3.', 13, 'Year 3 [Semester 1]', 'SECBH'),
(6, 'SEBB1513', 'Basic Anatomy and Physiology', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(7, 'SBEA1223', 'Basic Architectural Computing', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(8, 'SBEA 1223', 'Basic Architectural Computing', '2.', 1, 'Available Every Semester', 'ALL'),
(9, 'SSCG2423', 'Bioethics in Research and Development', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(10, 'SECB3103', 'Bioinformatics II', '3.', 1, 'Year 3 [Semester 1]', 'SECBH'),
(11, 'SECB3032', 'Bioinformatics Project I', '3.', 1, 'Year 3 [Semester 2]', 'SECBH'),
(12, 'SEBB4173', 'Cell & Molecular Biology for Bioinformatics', '3.', 1, 'Year 1 [Semester 1]', 'SECBH'),
(13, 'SECI1113', 'Computational Mathematics', '3.', 1, 'Year 2 [Semester 1]', 'SECBH/SECRH'),
(14, 'SECR3032', 'Computer Network and Security Project I', '3.', 1, 'Year 3 [Semester 2]', 'SECRH'),
(15, 'UHMS2022', 'Critical and Creative Thinking(International Students)', '2.', 1, 'Available Every Semester', 'ALL'),
(16, 'SECP3223', 'Data Analytics Programming', '3.', 2, 'Year 3 [Semester 1]', 'SECPH'),
(17, 'SECJ2013', 'Data Structure and Algorithm', '3.', 14, 'Year 2 [Semester 1]', 'SECBH'),
(18, 'SECD2523', 'Database', '3.', 12, 'Year 1 [Semester 2]', ''),
(19, 'SECD2524', 'Database', '4.', 1, 'Year 2 [Semester 1]', 'SECVH'),
(20, 'SCST1143', 'Database Engineering', '4.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(21, 'SECP2523', 'Database WBL', '4.', 2, 'Year 2 [Semester 1]', 'SECPH'),
(22, 'SCSR1013', 'Digital Logic', '4.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(23, 'SECR1013', 'Digital Logic', '3.', 9, 'Year 1 [Semester 1]', 'SECBH'),
(24, 'SECI1013', 'Discrete Structure', '3.', 10, 'Year 1 [Semester 1]', 'SECBH'),
(25, 'SEAA1213', 'Engineering Mechanics', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(26, 'UHLB1112', 'English Communication Skills', '2.', 6, 'Available Every Semester', 'ALL'),
(27, 'SECP3744', 'Enterprise System Design & Modeling', '3.', 2, 'Year 3 [Semester 1]', 'SECPH'),
(28, 'SEAA3913', 'Environmental Management', '2.', 1, 'Available Every Semester', 'ALL'),
(29, 'UKQT3001', 'Extra-curricular Experiential Learning (ExCEL)', '2.', 2, 'Available Every Semester', 'ALL'),
(30, 'SECV3213', 'Fundamental of Image Processing', '3.', 3, 'Year 2 [Semester 2]', 'SECVH'),
(31, 'SCSE1013', 'Fundamental Programming Concept', '3.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(32, 'SECV3113', 'Geometric Modelling', '3.', 3, 'Year 2 [Semester 2]', 'SECVH'),
(33, 'SECV2113', 'Human Computer Interaction', '3.', 11, 'Year 2 [Semester 1]', 'SECBH'),
(34, 'SFMD1063', 'Information Technology Business', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(35, 'SEEU2123', 'Instrumentation and Measurement', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(36, 'ULRS1032', 'Integrity and Anti-Corruption Course(International Student Only)', '2.', 11, 'Available Every Semester', 'ALL'),
(37, 'SSPB2133', 'International Business', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(38, 'SECJ3303', 'Internet Programming', '3.', 6, 'Year 2 [Semester 2]', 'SECJH'),
(39, 'SECR3242', 'Internetworking Technology', '3.', 5, 'Year 2 [Semester 2]', 'SECRH'),
(40, 'SECR3941', 'Internetworking Technology Lab', '3.', 5, 'Year 2 [Semester 2]', 'SECRH'),
(41, 'SECR3443', 'Introduction to Cryptography', '3.', 4, 'Year 3 [Semester 1]', 'SECRH'),
(42, 'UBSS1032', 'Introduction to Entrepreneurship', '3.', 3, 'Year 3 [Semester 2]', 'SECJH'),
(43, 'SBEZ1652', 'Introduction to Landscape Architecture', '2.', 1, 'Available Every Semester', 'ALL'),
(44, 'SBEQ1343', 'Introduction to Quantity Surveying', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(45, 'SEMM2613', 'Materials Science', '2.', 2, 'Available Every Semester', 'ALL'),
(46, 'SECV1113', 'Mathematics for Computer Graphics', '3.', 1, 'Year 2 [Semester 1]', 'SECVH'),
(47, 'SCST1123', 'Mathematics for Software Engineer', '3.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(48, 'SECJ3623', 'Mobile Application Programming', '3.', 2, 'Year 2 [Semester 2]', 'SECVH'),
(49, 'SSPG2223', 'National Integrity', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(50, 'SECR1213', 'Network Communications', '3.', 15, 'Year 1 [Semester 2]', ''),
(51, 'UHIS1022', 'Philosophy & Current Issues', '', 4, 'Available Every Semester', 'ALL'),
(52, 'UHLB3132', 'Professional Communication Skills', '', 11, 'Available Every Semester', 'ALL'),
(53, 'UHLB2122', 'Professional Communication Skills 1', '2.', 7, 'Available Every Semester', 'ALL'),
(54, 'UHMT2132', 'Professional Ethics', '2.', 3, 'Available Every Semester', 'ALL'),
(55, 'SECB3203', 'Programming for Bioinformatics', '3.', 1, 'Year 3 [Semester 1]', 'SECBH'),
(56, 'SECJ1013', 'Programming Technique I', '4.', 9, 'Year 1 [Semester 1]', 'SECBH'),
(57, 'SECJ1023', 'Programming Technique II', '4.', 2, 'Year 1 [Semester 2]', 'SECRH/SECJH'),
(58, 'SECV3032', 'Project I (Graphics and Multimedia Software)', '3.', 1, 'Year 3 [Semester 2]', 'SECVH'),
(59, 'UHIT2302', 'Science & Technology Thinking(International Students Only)', '2.', 8, 'Available Every Semester', 'ALL'),
(60, 'ULRF2xx2', 'Service Learning Co-Curriculum', '3.', 1, 'Available Every Semester', 'SECJH/ SECVH'),
(61, 'SBEW3153', 'Social Impact Assessment', '2.', 1, 'Available Every Semester', 'ALL'),
(62, 'SHMY1033', 'Social Psychology', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(63, 'SECJ3323', 'Software Design & Architecture', '4.', 6, 'Year 3 [Semester 1]', 'SECJH'),
(64, 'SECJ2203', 'Software Engineering', '3.', 14, 'Year 1 [Semester 2]', 'SECJH'),
(65, 'SECJ3032', 'Software Engineering Project I', '3.', 1, 'Year 3 [Semester 2]', 'SECJH'),
(66, 'SECP3204', 'Software Engineering WBL', '3.', 2, 'Year 2 [Semester 1]', 'SECPH'),
(67, 'SSCP2413', 'Solid State Physics', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(68, 'SBEC4182', 'Sustainable Construction', '2.', 1, 'Available Every Semester', 'ALL'),
(69, 'SECP3723', 'System Development Technology WBL', '3.', 2, 'Year 2 [Semester 1]', 'SECPH'),
(70, 'SECP1513', 'Technology & Information System', '3.', 11, 'Year 1 [Semester 1]', 'SECBH'),
(71, 'SBSD3063', 'Technology Entrepreneurship', '2.', 1, 'Available Every Semester', 'ALL'),
(72, 'SECD3761', 'Technopreneurship Seminar', '3.', 1, 'Year 3 [Semester 2]', 'SECJH'),
(73, 'SECJ3203', 'Theory of Computer Science', '3.', 3, 'Year 2 [Semester 2]', 'SECRH'),
(74, 'SxxxXxx3', 'University Free Elective', '2.', 1, 'Available Every Semester', 'SECRH'),
(1, 'SECB3104', 'Application Development', '4.', 1, 'Year 3 [Semester 1]', 'SECBH'),
(2, 'SECR3104', 'Application Development', '4.', 3, 'Year 3 [Semester 1]', 'SECRH'),
(3, 'SECJ3104', 'Application Development', '4.', 4, 'Year 3 [Semester 1]', 'SECJH'),
(4, 'SECV3104', 'Application Development', '4.', 2, 'Year 3 [Semester 1]', 'SECVH'),
(5, 'SECJ3553', 'Artificial Intelligence', '3.', 13, 'Year 3 [Semester 1]', 'SECBH'),
(6, 'SEBB1513', 'Basic Anatomy and Physiology', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(7, 'SBEA1223', 'Basic Architectural Computing', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(8, 'SBEA 1223', 'Basic Architectural Computing', '2.', 1, 'Available Every Semester', 'ALL'),
(9, 'SSCG2423', 'Bioethics in Research and Development', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(10, 'SECB3103', 'Bioinformatics II', '3.', 1, 'Year 3 [Semester 1]', 'SECBH'),
(11, 'SECB3032', 'Bioinformatics Project I', '3.', 1, 'Year 3 [Semester 2]', 'SECBH'),
(12, 'SEBB4173', 'Cell & Molecular Biology for Bioinformatics', '3.', 1, 'Year 1 [Semester 1]', 'SECBH'),
(13, 'SECI1113', 'Computational Mathematics', '3.', 1, 'Year 2 [Semester 1]', 'SECBH/SECRH'),
(14, 'SECR3032', 'Computer Network and Security Project I', '3.', 1, 'Year 3 [Semester 2]', 'SECRH'),
(15, 'UHMS2022', 'Critical and Creative Thinking(International Students)', '2.', 1, 'Available Every Semester', 'ALL'),
(16, 'SECP3223', 'Data Analytics Programming', '3.', 2, 'Year 3 [Semester 1]', 'SECPH'),
(17, 'SECJ2013', 'Data Structure and Algorithm', '3.', 14, 'Year 2 [Semester 1]', 'SECBH'),
(18, 'SECD2523', 'Database', '3.', 12, 'Year 1 [Semester 2]', ''),
(19, 'SECD2524', 'Database', '4.', 1, 'Year 2 [Semester 1]', 'SECVH'),
(20, 'SCST1143', 'Database Engineering', '4.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(21, 'SECP2523', 'Database WBL', '4.', 2, 'Year 2 [Semester 1]', 'SECPH'),
(22, 'SCSR1013', 'Digital Logic', '4.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(23, 'SECR1013', 'Digital Logic', '3.', 9, 'Year 1 [Semester 1]', 'SECBH'),
(24, 'SECI1013', 'Discrete Structure', '3.', 10, 'Year 1 [Semester 1]', 'SECBH'),
(25, 'SEAA1213', 'Engineering Mechanics', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(26, 'UHLB1112', 'English Communication Skills', '2.', 6, 'Available Every Semester', 'ALL'),
(27, 'SECP3744', 'Enterprise System Design & Modeling', '3.', 2, 'Year 3 [Semester 1]', 'SECPH'),
(28, 'SEAA3913', 'Environmental Management', '2.', 1, 'Available Every Semester', 'ALL'),
(29, 'UKQT3001', 'Extra-curricular Experiential Learning (ExCEL)', '2.', 2, 'Available Every Semester', 'ALL'),
(30, 'SECV3213', 'Fundamental of Image Processing', '3.', 3, 'Year 2 [Semester 2]', 'SECVH'),
(31, 'SCSE1013', 'Fundamental Programming Concept', '3.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(32, 'SECV3113', 'Geometric Modelling', '3.', 3, 'Year 2 [Semester 2]', 'SECVH'),
(33, 'SECV2113', 'Human Computer Interaction', '3.', 11, 'Year 2 [Semester 1]', 'SECBH'),
(34, 'SFMD1063', 'Information Technology Business', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(35, 'SEEU2123', 'Instrumentation and Measurement', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(36, 'ULRS1032', 'Integrity and Anti-Corruption Course(International Student Only)', '2.', 11, 'Available Every Semester', 'ALL'),
(37, 'SSPB2133', 'International Business', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(38, 'SECJ3303', 'Internet Programming', '3.', 6, 'Year 2 [Semester 2]', 'SECJH'),
(39, 'SECR3242', 'Internetworking Technology', '3.', 5, 'Year 2 [Semester 2]', 'SECRH'),
(40, 'SECR3941', 'Internetworking Technology Lab', '3.', 5, 'Year 2 [Semester 2]', 'SECRH'),
(41, 'SECR3443', 'Introduction to Cryptography', '3.', 4, 'Year 3 [Semester 1]', 'SECRH'),
(42, 'UBSS1032', 'Introduction to Entrepreneurship', '3.', 3, 'Year 3 [Semester 2]', 'SECJH'),
(43, 'SBEZ1652', 'Introduction to Landscape Architecture', '2.', 1, 'Available Every Semester', 'ALL'),
(44, 'SBEQ1343', 'Introduction to Quantity Surveying', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(45, 'SEMM2613', 'Materials Science', '2.', 2, 'Available Every Semester', 'ALL'),
(46, 'SECV1113', 'Mathematics for Computer Graphics', '3.', 1, 'Year 2 [Semester 1]', 'SECVH'),
(47, 'SCST1123', 'Mathematics for Software Engineer', '3.', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(48, 'SECJ3623', 'Mobile Application Programming', '3.', 2, 'Year 2 [Semester 2]', 'SECVH'),
(49, 'SSPG2223', 'National Integrity', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(50, 'SECR1213', 'Network Communications', '3.', 15, 'Year 1 [Semester 2]', ''),
(51, 'UHIS1022', 'Philosophy & Current Issues', '', 4, 'Available Every Semester', 'ALL'),
(52, 'UHLB3132', 'Professional Communication Skills', '', 11, 'Available Every Semester', 'ALL'),
(53, 'UHLB2122', 'Professional Communication Skills 1', '2.', 7, 'Available Every Semester', 'ALL'),
(54, 'UHMT2132', 'Professional Ethics', '2.', 3, 'Available Every Semester', 'ALL'),
(55, 'SECB3203', 'Programming for Bioinformatics', '3.', 1, 'Year 3 [Semester 1]', 'SECBH'),
(56, 'SECJ1013', 'Programming Technique I', '4.', 9, 'Year 1 [Semester 1]', 'SECBH'),
(57, 'SECJ1023', 'Programming Technique II', '4.', 2, 'Year 1 [Semester 2]', 'SECRH/SECJH'),
(58, 'SECV3032', 'Project I (Graphics and Multimedia Software)', '3.', 1, 'Year 3 [Semester 2]', 'SECVH'),
(59, 'UHIT2302', 'Science & Technology Thinking(International Students Only)', '2.', 8, 'Available Every Semester', 'ALL'),
(60, 'ULRF2xx2', 'Service Learning Co-Curriculum', '3.', 1, 'Available Every Semester', 'SECJH/ SECVH'),
(61, 'SBEW3153', 'Social Impact Assessment', '2.', 1, 'Available Every Semester', 'ALL'),
(62, 'SHMY1033', 'Social Psychology', '3.', 1, 'Year 1 [Semester 1]', 'ALL'),
(63, 'SECJ3323', 'Software Design & Architecture', '4.', 6, 'Year 3 [Semester 1]', 'SECJH'),
(64, 'SECJ2203', 'Software Engineering', '3.', 14, 'Year 1 [Semester 2]', 'SECJH'),
(65, 'SECJ3032', 'Software Engineering Project I', '3.', 1, 'Year 3 [Semester 2]', 'SECJH'),
(66, 'SECP3204', 'Software Engineering WBL', '3.', 2, 'Year 2 [Semester 1]', 'SECPH'),
(67, 'SSCP2413', 'Solid State Physics', '3.', 2, 'Year 1 [Semester 1]', 'ALL'),
(68, 'SBEC4182', 'Sustainable Construction', '2.', 1, 'Available Every Semester', 'ALL'),
(69, 'SECP3723', 'System Development Technology WBL', '3.', 2, 'Year 2 [Semester 1]', 'SECPH'),
(70, 'SECP1513', 'Technology & Information System', '3.', 11, 'Year 1 [Semester 1]', 'SECBH'),
(71, 'SBSD3063', 'Technology Entrepreneurship', '2.', 1, 'Available Every Semester', 'ALL'),
(72, 'SECD3761', 'Technopreneurship Seminar', '3.', 1, 'Year 3 [Semester 2]', 'SECJH'),
(73, 'SECJ3203', 'Theory of Computer Science', '3.', 3, 'Year 2 [Semester 2]', 'SECRH'),
(74, 'SxxxXxx3', 'University Free Elective', '2.', 1, 'Available Every Semester', 'SECRH'),
(1, 'SECB3104', 'Application Development', '4', 1, 'Year 3 [Semester 1]', 'SECBH'),
(2, 'SECR3104', 'Application Development', '4', 3, 'Year 3 [Semester 1]', 'SECRH'),
(3, 'SECJ3104', 'Application Development', '4', 4, 'Year 3 [Semester 1]', 'SECJH'),
(4, 'SECV3104', 'Application Development', '4', 2, 'Year 3 [Semester 1]', 'SECVH'),
(5, 'SECJ3553', 'Artificial Intelligence', '3', 13, 'Year 3 [Semester 1]', 'SECBH'),
(6, 'SEBB1513', 'Basic Anatomy and Physiology', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(7, 'SBEA1223', 'Basic Architectural Computing', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(8, 'SBEA 1223', 'Basic Architectural Computing', '2', 1, 'Available Every Semester', 'ALL'),
(9, 'SSCG2423', 'Bioethics in Research and Development', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(10, 'SECB3103', 'Bioinformatics II', '3', 1, 'Year 3 [Semester 1]', 'SECBH'),
(11, 'SECB3032', 'Bioinformatics Project I', '3', 1, 'Year 3 [Semester 2]', 'SECBH'),
(12, 'SEBB4173', 'Cell & Molecular Biology for Bioinformatics', '3', 1, 'Year 1 [Semester 1]', 'SECBH'),
(13, 'SECI1113', 'Computational Mathematics', '3', 1, 'Year 2 [Semester 1]', 'SECBH/SECRH'),
(14, 'SECR3032', 'Computer Network and Security Project I', '3', 1, 'Year 3 [Semester 2]', 'SECRH'),
(15, 'UHMS2022', 'Critical and Creative Thinking(International Students)', '2', 1, 'Available Every Semester', 'ALL'),
(16, 'SECP3223', 'Data Analytics Programming', '3', 2, 'Year 3 [Semester 1]', 'SECPH'),
(17, 'SECJ2013', 'Data Structure and Algorithm', '3', 14, 'Year 2 [Semester 1]', 'SECBH'),
(18, 'SECD2523', 'Database', '3', 12, 'Year 1 [Semester 2]', ''),
(19, 'SECD2524', 'Database', '4', 1, 'Year 2 [Semester 1]', 'SECVH'),
(20, 'SCST1143', 'Database Engineering', '4', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(21, 'SECP2523', 'Database WBL', '4', 2, 'Year 2 [Semester 1]', 'SECPH'),
(22, 'SCSR1013', 'Digital Logic', '4', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(23, 'SECR1013', 'Digital Logic', '3', 9, 'Year 1 [Semester 1]', 'SECBH'),
(24, 'SECI1013', 'Discrete Structure', '3', 10, 'Year 1 [Semester 1]', 'SECBH'),
(25, 'SEAA1213', 'Engineering Mechanics', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(26, 'UHLB1112', 'English Communication Skills', '2', 6, 'Available Every Semester', 'ALL'),
(27, 'SECP3744', 'Enterprise System Design & Modeling', '3', 2, 'Year 3 [Semester 1]', 'SECPH'),
(28, 'SEAA3913', 'Environmental Management', '2', 1, 'Available Every Semester', 'ALL'),
(29, 'UKQT3001', 'Extra-curricular Experiential Learning (ExCEL)', '2', 2, 'Available Every Semester', 'ALL'),
(30, 'SECV3213', 'Fundamental of Image Processing', '3', 3, 'Year 2 [Semester 2]', 'SECVH'),
(31, 'SCSE1013', 'Fundamental Programming Concept', '3', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(32, 'SECV3113', 'Geometric Modelling', '3', 3, 'Year 2 [Semester 2]', 'SECVH'),
(33, 'SECV2113', 'Human Computer Interaction', '3', 11, 'Year 2 [Semester 1]', 'SECBH'),
(34, 'SFMD1063', 'Information Technology Business', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(35, 'SEEU2123', 'Instrumentation and Measurement', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(36, 'ULRS1032', 'Integrity and Anti-Corruption Course(International Student Only)', '2', 11, 'Available Every Semester', 'ALL'),
(37, 'SSPB2133', 'International Business', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(38, 'SECJ3303', 'Internet Programming', '3', 6, 'Year 2 [Semester 2]', 'SECJH'),
(39, 'SECR3242', 'Internetworking Technology', '3', 5, 'Year 2 [Semester 2]', 'SECRH'),
(40, 'SECR3941', 'Internetworking Technology Lab', '3', 5, 'Year 2 [Semester 2]', 'SECRH'),
(41, 'SECR3443', 'Introduction to Cryptography', '3', 4, 'Year 3 [Semester 1]', 'SECRH'),
(42, 'UBSS1032', 'Introduction to Entrepreneurship', '3', 3, 'Year 3 [Semester 2]', 'SECJH'),
(43, 'SBEZ1652', 'Introduction to Landscape Architecture', '2', 1, 'Available Every Semester', 'ALL'),
(44, 'SBEQ1343', 'Introduction to Quantity Surveying', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(45, 'SEMM2613', 'Materials Science', '2', 2, 'Available Every Semester', 'ALL'),
(46, 'SECV1113', 'Mathematics for Computer Graphics', '3', 1, 'Year 2 [Semester 1]', 'SECVH'),
(47, 'SCST1123', 'Mathematics for Software Engineer', '3', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(48, 'SECJ3623', 'Mobile Application Programming', '3', 2, 'Year 2 [Semester 2]', 'SECVH'),
(49, 'SSPG2223', 'National Integrity', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(50, 'SECR1213', 'Network Communications', '3', 15, 'Year 1 [Semester 2]', ''),
(51, 'UHIS1022', 'Philosophy & Current Issues', '', 4, 'Available Every Semester', 'ALL'),
(52, 'UHLB3132', 'Professional Communication Skills', '', 11, 'Available Every Semester', 'ALL'),
(53, 'UHLB2122', 'Professional Communication Skills 1', '2', 7, 'Available Every Semester', 'ALL'),
(54, 'UHMT2132', 'Professional Ethics', '2', 3, 'Available Every Semester', 'ALL'),
(55, 'SECB3203', 'Programming for Bioinformatics', '3', 1, 'Year 3 [Semester 1]', 'SECBH'),
(56, 'SECJ1013', 'Programming Technique I', '4', 9, 'Year 1 [Semester 1]', 'SECBH'),
(57, 'SECJ1023', 'Programming Technique II', '4', 2, 'Year 1 [Semester 2]', 'SECRH/SECJH'),
(58, 'SECV3032', 'Project I (Graphics and Multimedia Software)', '3', 1, 'Year 3 [Semester 2]', 'SECVH'),
(59, 'UHIT2302', 'Science & Technology Thinking(International Students Only)', '2', 8, 'Available Every Semester', 'ALL'),
(60, 'ULRF2xx2', 'Service Learning Co-Curriculum', '3', 1, 'Available Every Semester', 'SECJH/ SECVH'),
(61, 'SBEW3153', 'Social Impact Assessment', '2', 1, 'Available Every Semester', 'ALL'),
(62, 'SHMY1033', 'Social Psychology', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(63, 'SECJ3323', 'Software Design & Architecture', '4', 6, 'Year 3 [Semester 1]', 'SECJH'),
(64, 'SECJ2203', 'Software Engineering', '3', 14, 'Year 1 [Semester 2]', 'SECJH'),
(65, 'SECJ3032', 'Software Engineering Project I', '3', 1, 'Year 3 [Semester 2]', 'SECJH'),
(66, 'SECP3204', 'Software Engineering WBL', '3', 2, 'Year 2 [Semester 1]', 'SECPH'),
(67, 'SSCP2413', 'Solid State Physics', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(68, 'SBEC4182', 'Sustainable Construction', '2', 1, 'Available Every Semester', 'ALL'),
(69, 'SECP3723', 'System Development Technology WBL', '3', 2, 'Year 2 [Semester 1]', 'SECPH'),
(70, 'SECP1513', 'Technology & Information System', '3', 11, 'Year 1 [Semester 1]', 'SECBH'),
(71, 'SBSD3063', 'Technology Entrepreneurship', '2', 1, 'Available Every Semester', 'ALL'),
(72, 'SECD3761', 'Technopreneurship Seminar', '3', 1, 'Year 3 [Semester 2]', 'SECJH'),
(73, 'SECJ3203', 'Theory of Computer Science', '3', 3, 'Year 2 [Semester 2]', 'SECRH'),
(74, 'SxxxXxx3', 'University Free Elective', '2', 1, 'Available Every Semester', 'SECRH'),
(1, 'SECB3104', 'Application Development', '4', 1, 'Year 3 [Semester 1]', 'SECBH'),
(2, 'SECR3104', 'Application Development', '4', 3, 'Year 3 [Semester 1]', 'SECRH'),
(3, 'SECJ3104', 'Application Development', '4', 4, 'Year 3 [Semester 1]', 'SECJH'),
(4, 'SECV3104', 'Application Development', '4', 2, 'Year 3 [Semester 1]', 'SECVH'),
(5, 'SECJ3553', 'Artificial Intelligence', '3', 13, 'Year 3 [Semester 1]', 'SECBH'),
(6, 'SEBB1513', 'Basic Anatomy and Physiology', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(7, 'SBEA1223', 'Basic Architectural Computing', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(8, 'SBEA 1223', 'Basic Architectural Computing', '2', 1, 'Available Every Semester', 'ALL'),
(9, 'SSCG2423', 'Bioethics in Research and Development', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(10, 'SECB3103', 'Bioinformatics II', '3', 1, 'Year 3 [Semester 1]', 'SECBH'),
(11, 'SECB3032', 'Bioinformatics Project I', '3', 1, 'Year 3 [Semester 2]', 'SECBH'),
(12, 'SEBB4173', 'Cell & Molecular Biology for Bioinformatics', '3', 1, 'Year 1 [Semester 1]', 'SECBH'),
(13, 'SECI1113', 'Computational Mathematics', '3', 1, 'Year 2 [Semester 1]', 'SECBH/SECRH'),
(14, 'SECR3032', 'Computer Network and Security Project I', '3', 1, 'Year 3 [Semester 2]', 'SECRH'),
(15, 'UHMS2022', 'Critical and Creative Thinking(International Students)', '2', 1, 'Available Every Semester', 'ALL'),
(16, 'SECP3223', 'Data Analytics Programming', '3', 2, 'Year 3 [Semester 1]', 'SECPH'),
(17, 'SECJ2013', 'Data Structure and Algorithm', '3', 14, 'Year 2 [Semester 1]', 'SECBH'),
(18, 'SECD2523', 'Database', '3', 12, 'Year 1 [Semester 2]', ''),
(19, 'SECD2524', 'Database', '4', 1, 'Year 2 [Semester 1]', 'SECVH'),
(20, 'SCST1143', 'Database Engineering', '4', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(21, 'SECP2523', 'Database WBL', '4', 2, 'Year 2 [Semester 1]', 'SECPH'),
(22, 'SCSR1013', 'Digital Logic', '4', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(23, 'SECR1013', 'Digital Logic', '3', 9, 'Year 1 [Semester 1]', 'SECBH'),
(24, 'SECI1013', 'Discrete Structure', '3', 10, 'Year 1 [Semester 1]', 'SECBH'),
(25, 'SEAA1213', 'Engineering Mechanics', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(26, 'UHLB1112', 'English Communication Skills', '2', 6, 'Available Every Semester', 'ALL'),
(27, 'SECP3744', 'Enterprise System Design & Modeling', '3', 2, 'Year 3 [Semester 1]', 'SECPH'),
(28, 'SEAA3913', 'Environmental Management', '2', 1, 'Available Every Semester', 'ALL'),
(29, 'UKQT3001', 'Extra-curricular Experiential Learning (ExCEL)', '2', 2, 'Available Every Semester', 'ALL'),
(30, 'SECV3213', 'Fundamental of Image Processing', '3', 3, 'Year 2 [Semester 2]', 'SECVH'),
(31, 'SCSE1013', 'Fundamental Programming Concept', '3', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(32, 'SECV3113', 'Geometric Modelling', '3', 3, 'Year 2 [Semester 2]', 'SECVH'),
(33, 'SECV2113', 'Human Computer Interaction', '3', 11, 'Year 2 [Semester 1]', 'SECBH'),
(34, 'SFMD1063', 'Information Technology Business', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(35, 'SEEU2123', 'Instrumentation and Measurement', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(36, 'ULRS1032', 'Integrity and Anti-Corruption Course(International Student Only)', '2', 11, 'Available Every Semester', 'ALL'),
(37, 'SSPB2133', 'International Business', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(38, 'SECJ3303', 'Internet Programming', '3', 6, 'Year 2 [Semester 2]', 'SECJH'),
(39, 'SECR3242', 'Internetworking Technology', '3', 5, 'Year 2 [Semester 2]', 'SECRH'),
(40, 'SECR3941', 'Internetworking Technology Lab', '3', 5, 'Year 2 [Semester 2]', 'SECRH'),
(41, 'SECR3443', 'Introduction to Cryptography', '3', 4, 'Year 3 [Semester 1]', 'SECRH'),
(42, 'UBSS1032', 'Introduction to Entrepreneurship', '3', 3, 'Year 3 [Semester 2]', 'SECJH'),
(43, 'SBEZ1652', 'Introduction to Landscape Architecture', '2', 1, 'Available Every Semester', 'ALL'),
(44, 'SBEQ1343', 'Introduction to Quantity Surveying', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(45, 'SEMM2613', 'Materials Science', '2', 2, 'Available Every Semester', 'ALL'),
(46, 'SECV1113', 'Mathematics for Computer Graphics', '3', 1, 'Year 2 [Semester 1]', 'SECVH'),
(47, 'SCST1123', 'Mathematics for Software Engineer', '3', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(48, 'SECJ3623', 'Mobile Application Programming', '3', 2, 'Year 2 [Semester 2]', 'SECVH'),
(49, 'SSPG2223', 'National Integrity', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(50, 'SECR1213', 'Network Communications', '3', 15, 'Year 1 [Semester 2]', ''),
(51, 'UHIS1022', 'Philosophy & Current Issues', '', 4, 'Available Every Semester', 'ALL'),
(52, 'UHLB3132', 'Professional Communication Skills', '', 11, 'Available Every Semester', 'ALL'),
(53, 'UHLB2122', 'Professional Communication Skills 1', '2', 7, 'Available Every Semester', 'ALL'),
(54, 'UHMT2132', 'Professional Ethics', '2', 3, 'Available Every Semester', 'ALL'),
(55, 'SECB3203', 'Programming for Bioinformatics', '3', 1, 'Year 3 [Semester 1]', 'SECBH'),
(56, 'SECJ1013', 'Programming Technique I', '4', 9, 'Year 1 [Semester 1]', 'SECBH'),
(57, 'SECJ1023', 'Programming Technique II', '4', 2, 'Year 1 [Semester 2]', 'SECRH/SECJH'),
(58, 'SECV3032', 'Project I (Graphics and Multimedia Software)', '3', 1, 'Year 3 [Semester 2]', 'SECVH'),
(59, 'UHIT2302', 'Science & Technology Thinking(International Students Only)', '2', 8, 'Available Every Semester', 'ALL'),
(60, 'ULRF2xx2', 'Service Learning Co-Curriculum', '3', 1, 'Available Every Semester', 'SECJH/ SECVH'),
(61, 'SBEW3153', 'Social Impact Assessment', '2', 1, 'Available Every Semester', 'ALL'),
(62, 'SHMY1033', 'Social Psychology', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(63, 'SECJ3323', 'Software Design & Architecture', '4', 6, 'Year 3 [Semester 1]', 'SECJH'),
(64, 'SECJ2203', 'Software Engineering', '3', 14, 'Year 1 [Semester 2]', 'SECJH'),
(65, 'SECJ3032', 'Software Engineering Project I', '3', 1, 'Year 3 [Semester 2]', 'SECJH'),
(66, 'SECP3204', 'Software Engineering WBL', '3', 2, 'Year 2 [Semester 1]', 'SECPH'),
(67, 'SSCP2413', 'Solid State Physics', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(68, 'SBEC4182', 'Sustainable Construction', '2', 1, 'Available Every Semester', 'ALL'),
(69, 'SECP3723', 'System Development Technology WBL', '3', 2, 'Year 2 [Semester 1]', 'SECPH'),
(70, 'SECP1513', 'Technology & Information System', '3', 11, 'Year 1 [Semester 1]', 'SECBH'),
(71, 'SBSD3063', 'Technology Entrepreneurship', '2', 1, 'Available Every Semester', 'ALL'),
(72, 'SECD3761', 'Technopreneurship Seminar', '3', 1, 'Year 3 [Semester 2]', 'SECJH'),
(73, 'SECJ3203', 'Theory of Computer Science', '3', 3, 'Year 2 [Semester 2]', 'SECRH'),
(74, 'SxxxXxx3', 'University Free Elective', '2', 1, 'Available Every Semester', 'SECRH'),
(1, 'SECB3104', 'Application Development', '4', 1, 'Year 3 [Semester 1]', 'SECBH'),
(2, 'SECR3104', 'Application Development', '4', 3, 'Year 3 [Semester 1]', 'SECRH'),
(3, 'SECJ3104', 'Application Development', '4', 4, 'Year 3 [Semester 1]', 'SECJH'),
(4, 'SECV3104', 'Application Development', '4', 2, 'Year 3 [Semester 1]', 'SECVH'),
(5, 'SECJ3553', 'Artificial Intelligence', '3', 13, 'Year 3 [Semester 1]', 'SECBH'),
(6, 'SEBB1513', 'Basic Anatomy and Physiology', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(7, 'SBEA1223', 'Basic Architectural Computing', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(8, 'SBEA 1223', 'Basic Architectural Computing', '2', 1, 'Available Every Semester', 'ALL'),
(9, 'SSCG2423', 'Bioethics in Research and Development', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(10, 'SECB3103', 'Bioinformatics II', '3', 1, 'Year 3 [Semester 1]', 'SECBH'),
(11, 'SECB3032', 'Bioinformatics Project I', '3', 1, 'Year 3 [Semester 2]', 'SECBH'),
(12, 'SEBB4173', 'Cell & Molecular Biology for Bioinformatics', '3', 1, 'Year 1 [Semester 1]', 'SECBH'),
(13, 'SECI1113', 'Computational Mathematics', '3', 1, 'Year 2 [Semester 1]', 'SECBH/SECRH'),
(14, 'SECR3032', 'Computer Network and Security Project I', '3', 1, 'Year 3 [Semester 2]', 'SECRH'),
(15, 'UHMS2022', 'Critical and Creative Thinking(International Students)', '2', 1, 'Available Every Semester', 'ALL'),
(16, 'SECP3223', 'Data Analytics Programming', '3', 2, 'Year 3 [Semester 1]', 'SECPH'),
(17, 'SECJ2013', 'Data Structure and Algorithm', '3', 14, 'Year 2 [Semester 1]', 'SECBH'),
(18, 'SECD2523', 'Database', '3', 12, 'Year 1 [Semester 2]', ''),
(19, 'SECD2524', 'Database', '4', 1, 'Year 2 [Semester 1]', 'SECVH'),
(20, 'SCST1143', 'Database Engineering', '4', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(21, 'SECP2523', 'Database WBL', '4', 2, 'Year 2 [Semester 1]', 'SECPH'),
(22, 'SCSR1013', 'Digital Logic', '4', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(23, 'SECR1013', 'Digital Logic', '3', 9, 'Year 1 [Semester 1]', 'SECBH'),
(24, 'SECI1013', 'Discrete Structure', '3', 10, 'Year 1 [Semester 1]', 'SECBH'),
(25, 'SEAA1213', 'Engineering Mechanics', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(26, 'UHLB1112', 'English Communication Skills', '2', 6, 'Available Every Semester', 'ALL'),
(27, 'SECP3744', 'Enterprise System Design & Modeling', '3', 2, 'Year 3 [Semester 1]', 'SECPH'),
(28, 'SEAA3913', 'Environmental Management', '2', 1, 'Available Every Semester', 'ALL'),
(29, 'UKQT3001', 'Extra-curricular Experiential Learning (ExCEL)', '2', 2, 'Available Every Semester', 'ALL'),
(30, 'SECV3213', 'Fundamental of Image Processing', '3', 3, 'Year 2 [Semester 2]', 'SECVH'),
(31, 'SCSE1013', 'Fundamental Programming Concept', '3', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(32, 'SECV3113', 'Geometric Modelling', '3', 3, 'Year 2 [Semester 2]', 'SECVH'),
(33, 'SECV2113', 'Human Computer Interaction', '3', 11, 'Year 2 [Semester 1]', 'SECBH'),
(34, 'SFMD1063', 'Information Technology Business', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(35, 'SEEU2123', 'Instrumentation and Measurement', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(36, 'ULRS1032', 'Integrity and Anti-Corruption Course(International Student Only)', '2', 11, 'Available Every Semester', 'ALL'),
(37, 'SSPB2133', 'International Business', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(38, 'SECJ3303', 'Internet Programming', '3', 6, 'Year 2 [Semester 2]', 'SECJH'),
(39, 'SECR3242', 'Internetworking Technology', '3', 5, 'Year 2 [Semester 2]', 'SECRH'),
(40, 'SECR3941', 'Internetworking Technology Lab', '3', 5, 'Year 2 [Semester 2]', 'SECRH'),
(41, 'SECR3443', 'Introduction to Cryptography', '3', 4, 'Year 3 [Semester 1]', 'SECRH'),
(42, 'UBSS1032', 'Introduction to Entrepreneurship', '3', 3, 'Year 3 [Semester 2]', 'SECJH'),
(43, 'SBEZ1652', 'Introduction to Landscape Architecture', '2', 1, 'Available Every Semester', 'ALL'),
(44, 'SBEQ1343', 'Introduction to Quantity Surveying', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(45, 'SEMM2613', 'Materials Science', '2', 2, 'Available Every Semester', 'ALL'),
(46, 'SECV1113', 'Mathematics for Computer Graphics', '3', 1, 'Year 2 [Semester 1]', 'SECVH'),
(47, 'SCST1123', 'Mathematics for Software Engineer', '3', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(48, 'SECJ3623', 'Mobile Application Programming', '3', 2, 'Year 2 [Semester 2]', 'SECVH'),
(49, 'SSPG2223', 'National Integrity', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(50, 'SECR1213', 'Network Communications', '3', 15, 'Year 1 [Semester 2]', ''),
(51, 'UHIS1022', 'Philosophy & Current Issues', '', 4, 'Available Every Semester', 'ALL'),
(52, 'UHLB3132', 'Professional Communication Skills', '', 11, 'Available Every Semester', 'ALL'),
(53, 'UHLB2122', 'Professional Communication Skills 1', '2', 7, 'Available Every Semester', 'ALL'),
(54, 'UHMT2132', 'Professional Ethics', '2', 3, 'Available Every Semester', 'ALL'),
(55, 'SECB3203', 'Programming for Bioinformatics', '3', 1, 'Year 3 [Semester 1]', 'SECBH'),
(56, 'SECJ1013', 'Programming Technique I', '4', 9, 'Year 1 [Semester 1]', 'SECBH'),
(57, 'SECJ1023', 'Programming Technique II', '4', 2, 'Year 1 [Semester 2]', 'SECRH/SECJH'),
(58, 'SECV3032', 'Project I (Graphics and Multimedia Software)', '3', 1, 'Year 3 [Semester 2]', 'SECVH'),
(59, 'UHIT2302', 'Science & Technology Thinking(International Students Only)', '2', 8, 'Available Every Semester', 'ALL'),
(60, 'ULRF2xx2', 'Service Learning Co-Curriculum', '3', 1, 'Available Every Semester', 'SECJH/ SECVH'),
(61, 'SBEW3153', 'Social Impact Assessment', '2', 1, 'Available Every Semester', 'ALL'),
(62, 'SHMY1033', 'Social Psychology', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(63, 'SECJ3323', 'Software Design & Architecture', '4', 6, 'Year 3 [Semester 1]', 'SECJH'),
(64, 'SECJ2203', 'Software Engineering', '3', 14, 'Year 1 [Semester 2]', 'SECJH'),
(65, 'SECJ3032', 'Software Engineering Project I', '3', 1, 'Year 3 [Semester 2]', 'SECJH'),
(66, 'SECP3204', 'Software Engineering WBL', '3', 2, 'Year 2 [Semester 1]', 'SECPH'),
(67, 'SSCP2413', 'Solid State Physics', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(68, 'SBEC4182', 'Sustainable Construction', '2', 1, 'Available Every Semester', 'ALL'),
(69, 'SECP3723', 'System Development Technology WBL', '3', 2, 'Year 2 [Semester 1]', 'SECPH'),
(70, 'SECP1513', 'Technology & Information System', '3', 11, 'Year 1 [Semester 1]', 'SECBH'),
(71, 'SBSD3063', 'Technology Entrepreneurship', '2', 1, 'Available Every Semester', 'ALL'),
(72, 'SECD3761', 'Technopreneurship Seminar', '3', 1, 'Year 3 [Semester 2]', 'SECJH'),
(73, 'SECJ3203', 'Theory of Computer Science', '3', 3, 'Year 2 [Semester 2]', 'SECRH'),
(74, 'SxxxXxx3', 'University Free Elective', '2', 1, 'Available Every Semester', 'SECRH'),
(1, 'SECB3104', 'Application Development', '4', 1, 'Year 3 [Semester 1]', 'SECBH'),
(2, 'SECR3104', 'Application Development', '4', 3, 'Year 3 [Semester 1]', 'SECRH'),
(3, 'SECJ3104', 'Application Development', '4', 4, 'Year 3 [Semester 1]', 'SECJH'),
(4, 'SECV3104', 'Application Development', '4', 2, 'Year 3 [Semester 1]', 'SECVH'),
(5, 'SECJ3553', 'Artificial Intelligence', '3', 13, 'Year 3 [Semester 1]', 'SECBH'),
(6, 'SEBB1513', 'Basic Anatomy and Physiology', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(7, 'SBEA1223', 'Basic Architectural Computing', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(8, 'SBEA 1223', 'Basic Architectural Computing', '2', 1, 'Available Every Semester', 'ALL'),
(9, 'SSCG2423', 'Bioethics in Research and Development', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(10, 'SECB3103', 'Bioinformatics II', '3', 1, 'Year 3 [Semester 1]', 'SECBH'),
(11, 'SECB3032', 'Bioinformatics Project I', '3', 1, 'Year 3 [Semester 2]', 'SECBH'),
(12, 'SEBB4173', 'Cell & Molecular Biology for Bioinformatics', '3', 1, 'Year 1 [Semester 1]', 'SECBH'),
(13, 'SECI1113', 'Computational Mathematics', '3', 1, 'Year 2 [Semester 1]', 'SECBH/SECRH'),
(14, 'SECR3032', 'Computer Network and Security Project I', '3', 1, 'Year 3 [Semester 2]', 'SECRH'),
(15, 'UHMS2022', 'Critical and Creative Thinking(International Students)', '2', 1, 'Available Every Semester', 'ALL'),
(16, 'SECP3223', 'Data Analytics Programming', '3', 2, 'Year 3 [Semester 1]', 'SECPH'),
(17, 'SECJ2013', 'Data Structure and Algorithm', '3', 14, 'Year 2 [Semester 1]', 'SECBH'),
(18, 'SECD2523', 'Database', '3', 12, 'Year 1 [Semester 2]', ''),
(19, 'SECD2524', 'Database', '4', 1, 'Year 2 [Semester 1]', 'SECVH'),
(20, 'SCST1143', 'Database Engineering', '4', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(21, 'SECP2523', 'Database WBL', '4', 2, 'Year 2 [Semester 1]', 'SECPH'),
(22, 'SCSR1013', 'Digital Logic', '4', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(23, 'SECR1013', 'Digital Logic', '3', 9, 'Year 1 [Semester 1]', 'SECBH'),
(24, 'SECI1013', 'Discrete Structure', '3', 10, 'Year 1 [Semester 1]', 'SECBH'),
(25, 'SEAA1213', 'Engineering Mechanics', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(26, 'UHLB1112', 'English Communication Skills', '2', 6, 'Available Every Semester', 'ALL'),
(27, 'SECP3744', 'Enterprise System Design & Modeling', '3', 2, 'Year 3 [Semester 1]', 'SECPH'),
(28, 'SEAA3913', 'Environmental Management', '2', 1, 'Available Every Semester', 'ALL'),
(29, 'UKQT3001', 'Extra-curricular Experiential Learning (ExCEL)', '2', 2, 'Available Every Semester', 'ALL'),
(30, 'SECV3213', 'Fundamental of Image Processing', '3', 3, 'Year 2 [Semester 2]', 'SECVH'),
(31, 'SCSE1013', 'Fundamental Programming Concept', '3', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(32, 'SECV3113', 'Geometric Modelling', '3', 3, 'Year 2 [Semester 2]', 'SECVH'),
(33, 'SECV2113', 'Human Computer Interaction', '3', 11, 'Year 2 [Semester 1]', 'SECBH'),
(34, 'SFMD1063', 'Information Technology Business', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(35, 'SEEU2123', 'Instrumentation and Measurement', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(36, 'ULRS1032', 'Integrity and Anti-Corruption Course(International Student Only)', '2', 11, 'Available Every Semester', 'ALL'),
(37, 'SSPB2133', 'International Business', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(38, 'SECJ3303', 'Internet Programming', '3', 6, 'Year 2 [Semester 2]', 'SECJH'),
(39, 'SECR3242', 'Internetworking Technology', '3', 5, 'Year 2 [Semester 2]', 'SECRH'),
(40, 'SECR3941', 'Internetworking Technology Lab', '3', 5, 'Year 2 [Semester 2]', 'SECRH'),
(41, 'SECR3443', 'Introduction to Cryptography', '3', 4, 'Year 3 [Semester 1]', 'SECRH'),
(42, 'UBSS1032', 'Introduction to Entrepreneurship', '3', 3, 'Year 3 [Semester 2]', 'SECJH'),
(43, 'SBEZ1652', 'Introduction to Landscape Architecture', '2', 1, 'Available Every Semester', 'ALL'),
(44, 'SBEQ1343', 'Introduction to Quantity Surveying', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(45, 'SEMM2613', 'Materials Science', '2', 2, 'Available Every Semester', 'ALL'),
(46, 'SECV1113', 'Mathematics for Computer Graphics', '3', 1, 'Year 2 [Semester 1]', 'SECVH'),
(47, 'SCST1123', 'Mathematics for Software Engineer', '3', 4, 'Year 1 [Semester 1]', 'SCSEH'),
(48, 'SECJ3623', 'Mobile Application Programming', '3', 2, 'Year 2 [Semester 2]', 'SECVH'),
(49, 'SSPG2223', 'National Integrity', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(50, 'SECR1213', 'Network Communications', '3', 15, 'Year 1 [Semester 2]', ''),
(51, 'UHIS1022', 'Philosophy & Current Issues', '', 4, 'Available Every Semester', 'ALL'),
(52, 'UHLB3132', 'Professional Communication Skills', '', 11, 'Available Every Semester', 'ALL'),
(53, 'UHLB2122', 'Professional Communication Skills 1', '2', 7, 'Available Every Semester', 'ALL'),
(54, 'UHMT2132', 'Professional Ethics', '2', 3, 'Available Every Semester', 'ALL'),
(55, 'SECB3203', 'Programming for Bioinformatics', '3', 1, 'Year 3 [Semester 1]', 'SECBH'),
(56, 'SECJ1013', 'Programming Technique I', '4', 9, 'Year 1 [Semester 1]', 'SECBH'),
(57, 'SECJ1023', 'Programming Technique II', '4', 2, 'Year 1 [Semester 2]', 'SECRH/SECJH'),
(58, 'SECV3032', 'Project I (Graphics and Multimedia Software)', '3', 1, 'Year 3 [Semester 2]', 'SECVH'),
(59, 'UHIT2302', 'Science & Technology Thinking(International Students Only)', '2', 8, 'Available Every Semester', 'ALL'),
(60, 'ULRF2xx2', 'Service Learning Co-Curriculum', '3', 1, 'Available Every Semester', 'SECJH/ SECVH'),
(61, 'SBEW3153', 'Social Impact Assessment', '2', 1, 'Available Every Semester', 'ALL'),
(62, 'SHMY1033', 'Social Psychology', '3', 1, 'Year 1 [Semester 1]', 'ALL'),
(63, 'SECJ3323', 'Software Design & Architecture', '4', 6, 'Year 3 [Semester 1]', 'SECJH'),
(64, 'SECJ2203', 'Software Engineering', '3', 14, 'Year 1 [Semester 2]', 'SECJH'),
(65, 'SECJ3032', 'Software Engineering Project I', '3', 1, 'Year 3 [Semester 2]', 'SECJH'),
(66, 'SECP3204', 'Software Engineering WBL', '3', 2, 'Year 2 [Semester 1]', 'SECPH'),
(67, 'SSCP2413', 'Solid State Physics', '3', 2, 'Year 1 [Semester 1]', 'ALL'),
(68, 'SBEC4182', 'Sustainable Construction', '2', 1, 'Available Every Semester', 'ALL'),
(69, 'SECP3723', 'System Development Technology WBL', '3', 2, 'Year 2 [Semester 1]', 'SECPH'),
(70, 'SECP1513', 'Technology & Information System', '3', 11, 'Year 1 [Semester 1]', 'SECBH'),
(71, 'SBSD3063', 'Technology Entrepreneurship', '2', 1, 'Available Every Semester', 'ALL'),
(72, 'SECD3761', 'Technopreneurship Seminar', '3', 1, 'Year 3 [Semester 2]', 'SECJH'),
(73, 'SECJ3203', 'Theory of Computer Science', '3', 3, 'Year 2 [Semester 2]', 'SECRH'),
(74, 'SxxxXxx3', 'University Free Elective', '2', 1, 'Available Every Semester', 'SECRH');

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
  `credits` bigint(50) NOT NULL,
  `remember_token` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `credits`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Fakhirah Shakila', 'faki@gmail.com', '$2y$12$eoeKRvsypvKmC4lzjua.HO6IWXZGWic0uJTh15BdjYb/jzsAq5wei', 'student', 8, '', '2024-12-16 02:05:17', '2025-01-31 07:11:26'),
(2, 'Zanetta Teresa Damia', 'znttatresa@gmail.com', '$2y$12$dJZkBHc7r2altLe7X2x5U.kOkqDz3yx/GWYyHUjivQ.RiZYGFh1QO', 'student', 0, '', NULL, NULL),
(3, 'Ave Valentine', 'a.valentine@gmail.co', '$2y$12$fXEORC9Guq.K89qrmN1rceD9J388UU/Yj57bt3re9xI6F3HkBPb0m', 'academic_staff', 0, '', NULL, NULL),
(4, 'Valeria Easter', 'v.easter@gmail.com', '$2y$12$wq1QYK4z5lVGL3nmzAtF0uEn0O2frU.gAL130cW/ODY.rItQBAKqq', 'academic_staff', 0, '', NULL, NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `waitlists`
--

CREATE TABLE `waitlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `course_section_id` bigint(20) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL,
  `status` enum('active','notified') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `waitlists`
--

INSERT INTO `waitlists` (`id`, `student_id`, `course_section_id`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'active', '2025-01-16 21:41:34', '2025-01-16 21:41:34'),
(6, 1, 4, 2, 'active', '2025-01-16 21:44:04', '2025-01-16 21:44:04'),
(7, 1, 2, 3, 'notified', '2025-01-16 21:44:04', '2025-01-16 21:44:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses_copy`
--
ALTER TABLE `courses_copy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

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
-- Indexes for table `section_info_copy`
--
ALTER TABLE `section_info_copy`
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
-- Indexes for table `waitlists`
--
ALTER TABLE `waitlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `courses_copy`
--
ALTER TABLE `courses_copy`
  MODIFY `id` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `section_info`
--
ALTER TABLE `section_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `section_info_copy`
--
ALTER TABLE `section_info_copy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `waitlists`
--
ALTER TABLE `waitlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);

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
