-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2025 at 09:30 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
