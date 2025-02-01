-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2025 at 02:03 PM
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
  `program` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `subject_code`, `subject_name`, `credit_hours`, `no_section`, `semester`, `program`, `type`, `timestamp`) VALUES
(1, 'SECB3104', 'Application Development', 4, 1, 'Year 3 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(2, 'SECR3104', 'Application Development', 4, 3, 'Year 3 [Semester 1]', 'SECRH', 'mandatory', '2025-01-16 10:42:57'),
(3, 'SECJ3104', 'Application Development', 4, 4, 'Year 3 [Semester 1]', 'SECJH', 'mandatory', '2025-01-16 10:42:57'),
(4, 'SECV3104', 'Application Development', 4, 2, 'Year 3 [Semester 1]', 'SECVH', 'mandatory', '2025-01-16 10:42:57'),
(5, 'SECJ3553', 'Artificial Intelligence', 3, 13, 'Year 3 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(6, 'SEBB1513', 'Basic Anatomy and Physiology', 3, 2, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(7, 'SBEA1223', 'Basic Architectural Computing', 3, 1, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(8, 'SBEA 1223', 'Basic Architectural Computing', 2, 1, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(9, 'SSCG2423', 'Bioethics in Research and Development', 3, 1, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(10, 'SECB3103', 'Bioinformatics II', 3, 1, 'Year 3 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(11, 'SECB3032', 'Bioinformatics Project I', 3, 1, 'Year 3 [Semester 2]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(12, 'SEBB4173', 'Cell & Molecular Biology for Bioinformatics', 3, 1, 'Year 1 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(13, 'SECI1113', 'Computational Mathematics', 3, 1, 'Year 2 [Semester 1]', 'SECBH/SECRH', 'mandatory', '2025-01-16 10:42:57'),
(14, 'SECR3032', 'Computer Network and Security Project I', 3, 1, 'Year 3 [Semester 2]', 'SECRH', 'mandatory', '2025-01-16 10:42:57'),
(15, 'UHMS2022', 'Critical and Creative Thinking(International Stude', 2, 1, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(16, 'SECP3223', 'Data Analytics Programming', 3, 2, 'Year 3 [Semester 1]', 'SECPH', 'mandatory', '2025-01-16 10:42:57'),
(17, 'SECJ2013', 'Data Structure and Algorithm', 3, 14, 'Year 2 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(18, 'SECD2523', 'Database', 3, 12, 'Year 2 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(19, 'SECD2524', 'Database', 4, 1, 'Year 2 [Semester 1]', 'SECVH', 'mandatory', '2025-01-16 10:42:57'),
(20, 'SCST1143', 'Database Engineering', 4, 4, 'Year 1 [Semester 1]', 'SCSEH', 'mandatory', '2025-01-16 10:42:57'),
(21, 'SECP2523', 'Database WBL', 4, 2, 'Year 2 [Semester 1]', 'SECPH', 'mandatory', '2025-01-16 10:42:57'),
(22, 'SCSR1013', 'Digital Logic', 4, 4, 'Year 1 [Semester 1]', 'SCSEH', 'mandatory', '2025-01-16 10:42:57'),
(23, 'SECR1013', 'Digital Logic', 3, 9, 'Year 1 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(24, 'SECI1013', 'Discrete Structure', 3, 10, 'Year 1 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(25, 'SEAA1213', 'Engineering Mechanics', 3, 1, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(26, 'UHLB1112', 'English Communication Skills', 2, 6, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(27, 'SECP3744', 'Enterprise System Design & Modeling', 3, 2, 'Year 3 [Semester 1]', 'SECPH', 'mandatory', '2025-01-16 10:42:57'),
(28, 'SEAA3913', 'Environmental Management', 2, 1, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(29, 'UKQT3001', 'Extra-curricular Experiential Learning (ExCEL)', 2, 2, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(30, 'SECV3213', 'Fundamental of Image Processing', 3, 3, 'Year 2 [Semester 2]', 'SECVH', 'mandatory', '2025-01-16 10:42:57'),
(31, 'SCSE1013', 'Fundamental Programming Concept', 3, 4, 'Year 1 [Semester 1]', 'SCSEH', 'mandatory', '2025-01-16 10:42:57'),
(32, 'SECV3113', 'Geometric Modelling', 3, 3, 'Year 2 [Semester 2]', 'SECVH', 'mandatory', '2025-01-16 10:42:57'),
(33, 'SECV2113', 'Human Computer Interaction', 3, 11, 'Year 2 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(34, 'Information Technology Business', '#NULL!', 3, 2, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(35, 'SEEU2123', 'Instrumentation and Measurement', 3, 2, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(36, 'ULRS1032', 'Integrity and Anti-Corruption Course(International', 2, 11, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(37, 'SSPB2133', 'International Business', 3, 2, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(38, 'SECJ3303', 'Internet Programming', 3, 6, 'Year 2 [Semester 2]', 'SECJH', 'mandatory', '2025-01-16 10:42:57'),
(39, 'SECR3242', 'Internetworking Technology', 3, 5, 'Year 2 [Semester 2]', 'SECRH', 'mandatory', '2025-01-16 10:42:57'),
(40, 'SECR3941', 'Internetworking Technology Lab', 3, 5, 'Year 2 [Semester 2]', 'SECRH', 'mandatory', '2025-01-16 10:42:57'),
(41, 'SECR3443', 'Introduction to Cryptography', 3, 4, 'Year 3 [Semester 1]', 'SECRH', 'mandatory', '2025-01-16 10:42:57'),
(42, 'UBSS1032', 'Introduction to Entrepreneurship', 3, 3, 'Year 3 [Semester 2]', 'SECJH', 'mandatory', '2025-01-16 10:42:57'),
(43, 'SBEZ1652', 'Introduction to Landscape Architecture', 2, 1, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(44, 'SBEQ1343', 'Introduction to Quantity Surveying', 3, 2, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(45, 'SEMM2613', 'Materials Science', 2, 2, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(46, 'SECV1113', 'Mathematics for Computer Graphics', 3, 1, 'Year 2 [Semester 1]', 'SECVH', 'mandatory', '2025-01-16 10:42:57'),
(47, 'SCST1123', 'Mathematics for Software Engineer', 3, 4, 'Year 1 [Semester 1]', 'SCSEH', 'mandatory', '2025-01-16 10:42:57'),
(48, 'SECJ3623', 'Mobile Application Programming', 3, 2, 'Year 2 [Semester 2]', 'SECVH', 'mandatory', '2025-01-16 10:42:57'),
(49, 'SSPG2223', 'National Integrity', 3, 2, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(50, 'SECR1213', 'Network Communications', 3, 15, 'Year 2 [Semester 1]', 'SECVH', 'mandatory', '2025-01-16 10:42:57'),
(51, 'UHIS1022', 'Philosophy & Current Issues', 2, 4, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(52, 'UHLB3132', 'Professional Communication Skills', 2, 11, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(53, 'UHLB2122', 'Professional Communication Skills 1', 2, 7, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(54, 'UHMT2132', 'Professional Ethics', 2, 3, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(55, 'SECB3203', 'Programming for Bioinformatics', 3, 1, 'Year 3 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(56, 'SECJ1013', 'Programming Technique I', 4, 9, 'Year 1 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(57, 'SECJ1023', 'Programming Technique II', 4, 2, 'Year 1 [Semester 2]', 'SECRH/SECJH', 'mandatory', '2025-01-16 10:42:57'),
(58, 'SECV3032', 'Project I (Graphics and Multimedia Software)', 3, 1, 'Year 3 [Semester 2]', 'SECVH', 'mandatory', '2025-01-16 10:42:57'),
(59, 'UHIT2302', 'Science & Technology Thinking(International Studen', 2, 8, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(60, 'ULRF2xx2', 'Service Learning Co-Curriculum', 3, 1, 'Available Every Semester', 'SECJH/ SECVH', 'mandatory', '2025-01-16 10:42:57'),
(61, 'SBEW3153', 'Social Impact Assessment', 2, 1, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(62, 'SHMY1033', 'Social Psychology', 3, 1, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(63, 'SECJ3323', 'Software Design & Architecture', 4, 6, 'Year 3 [Semester 1]', 'SECJH', 'mandatory', '2025-01-16 10:42:57'),
(64, 'SECJ2203', 'Software Engineering', 3, 14, 'Year 1 [Semester 2]', 'SECJH', 'mandatory', '2025-01-16 10:42:57'),
(65, 'SECJ3032', 'Software Engineering Project I', 3, 1, 'Year 3 [Semester 2]', 'SECJH', 'mandatory', '2025-01-16 10:42:57'),
(66, 'SECP3204', 'Software Engineering WBL', 3, 2, 'Year 2 [Semester 1]', 'SECPH', 'mandatory', '2025-01-16 10:42:57'),
(67, 'SSCP2413', 'Solid State Physics', 3, 2, 'Year 1 [Semester 1]', 'ALL', 'elective', '2025-01-16 10:42:57'),
(68, 'SBEC4182', 'Sustainable Construction', 2, 1, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(69, 'SECP3723', 'System Development Technology WBL', 3, 2, 'Year 2 [Semester 1]', 'SECPH', 'mandatory', '2025-01-16 10:42:57'),
(70, 'SECP1513', 'Technology & Information System', 3, 11, 'Year 1 [Semester 1]', 'SECBH', 'mandatory', '2025-01-16 10:42:57'),
(71, 'SBSD3063', 'Technology Entrepreneurship', 2, 1, 'Available Every Semester', 'ALL', 'elective', '2025-01-16 10:42:57'),
(72, 'SECD3761', 'Technopreneurship Seminar', 3, 1, 'Year 3 [Semester 2]', 'SECJH', '', '2025-01-16 10:42:57'),
(73, 'SECJ3203', 'Theory of Computer Science', 3, 3, 'Year 2 [Semester 2]', 'SECRH', 'mandatory', '2025-01-16 10:42:57'),
(74, 'SxxxXxx3', 'University Free Elective', 2, 1, 'Available Every Semester', 'SECRH', 'mandatory', '2025-01-16 10:42:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
