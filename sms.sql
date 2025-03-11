-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 11 mars 2025 à 21:55
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sms`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `s_no` int(20) NOT NULL,
  `id` varchar(30) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `image` varchar(40) NOT NULL DEFAULT '1701517055user.png',
  `phone` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`s_no`, `id`, `fname`, `lname`, `dob`, `image`, `phone`, `gender`, `address`) VALUES
(2, 'A9876543210', 'Admin', 'ayman', '12/11/2024', 'A98765432101741555510.jpeg', '1234567890', 'male', 'SYBA');

-- --------------------------------------------------------

--
-- Structure de la table `attendence`
--

CREATE TABLE `attendence` (
  `s_no` int(20) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `attendence` varchar(10) NOT NULL,
  `class` varchar(30) NOT NULL,
  `section` varchar(5) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `attendence`
--

INSERT INTO `attendence` (`s_no`, `student_id`, `attendence`, `class`, `section`, `date`) VALUES
(1, 'S1718791292', '1', 'DEV202', 'A', '2024-06-19 15:32:37');

-- --------------------------------------------------------

--
-- Structure de la table `buses`
--

CREATE TABLE `buses` (
  `s_no` int(11) NOT NULL,
  `bus_id` varchar(20) NOT NULL,
  `bus_title` varchar(100) NOT NULL,
  `bus_number` varchar(20) NOT NULL,
  `request` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `buses`
--

INSERT INTO `buses` (`s_no`, `bus_id`, `bus_title`, `bus_number`, `request`) VALUES
(10, '1718791847', 'Ligne 11', 'XXXXXX', ''),
(11, '1718791949', 'Ligne 14 ', '999999', ''),
(12, '1718791984', 'Ligne 66', 'OOOOOOOO', ''),
(13, '1741549335', 'BELBAKAKAR', '2', '');

-- --------------------------------------------------------

--
-- Structure de la table `bus_root`
--

CREATE TABLE `bus_root` (
  `s_no` int(11) NOT NULL,
  `bus_id` varchar(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `arrival_time` varchar(20) NOT NULL,
  `serial` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bus_root`
--

INSERT INTO `bus_root` (`s_no`, `bus_id`, `location`, `arrival_time`, `serial`) VALUES
(7, '1718791847', 'Azli', '06:50 AM', 1),
(8, '1718791847', 'Gueliz', '07:00 AM', 2),
(9, '1718791847', 'Stop 3', '07:10 AM', 3),
(10, '1718791847', 'SCHOOL', '10:00 AM', 4),
(15, '1718791984', 'Mhamid', '06:45 AM', 1),
(16, '1718791984', 'SCHOOL', '10:00 AM', 2),
(17, '1741549335', 'SCHOOL', '10:00 AM', 1),
(18, '1718791949', 'Semlalia', '06:35 AM', 1),
(19, '1718791949', 'BARID', '07:20 PM', 2),
(20, '1718791949', 'SCHOOL', '10:00 AM', 3);

-- --------------------------------------------------------

--
-- Structure de la table `bus_staff`
--

CREATE TABLE `bus_staff` (
  `s_no` int(11) NOT NULL,
  `id` varchar(20) NOT NULL,
  `bus_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bus_staff`
--

INSERT INTO `bus_staff` (`s_no`, `id`, `bus_id`, `name`, `contact`, `role`) VALUES
(1, 'B1718791847', '1718791847', 'driver ', '8080808080', 'driver'),
(2, 'B1718791847', '1718791847', 'helper ', '0000000000', 'helper'),
(3, 'B1718791949', '1718791949', 'driver 2', '7897898988', 'driver'),
(4, 'B1718791949', '1718791949', 'helper', '7897898988', 'helper'),
(5, 'B1718791984', '1718791984', 'another driver', '7897897898', 'driver'),
(6, 'B1718791984', '1718791984', 'another helper', '7894568796', 'helper'),
(7, 'B1741549335', '1741549335', 'SAID', '0661445511', 'driver'),
(8, 'B1741549335', '1741549335', 'SIMO', '0661445555', 'helper');

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `s_no` int(10) NOT NULL,
  `class` varchar(20) NOT NULL,
  `section` varchar(1) NOT NULL,
  `fees` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `exams`
--

CREATE TABLE `exams` (
  `s_no` int(20) NOT NULL,
  `exam_id` varchar(40) NOT NULL,
  `exam_title` varchar(512) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `class` varchar(30) NOT NULL,
  `section` varchar(10) NOT NULL,
  `total_marks` varchar(10) NOT NULL,
  `passing_marks` varchar(10) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `exams`
--

INSERT INTO `exams` (`s_no`, `exam_id`, `exam_title`, `subject`, `class`, `section`, `total_marks`, `passing_marks`, `timestamp`) VALUES
(3, 'E17187917486672ae442b976', 'LARAVEL', 'C++', 'BTP', '1', '100', '33', '2024-06-19 15:39:08'),
(4, 'E17187928006672b26095672', 'PYTHON', 'PHP', 'DEV', '1', '100', '33', '2024-06-19 15:56:40'),
(5, 'E17187929656672b305cbb25', 'C++', 'EFM REGIONAL', 'DEV', '1', '100', '33', '2024-06-19 15:59:25'),
(6, 'E17187928006672b26095699', 'JAVA', 'JAVA', 'DEV', '1', '200', '120', '2025-03-11 18:13:38'),
(9, 'E17187928006672b26095600', 'LARAVEL', 'LARAVEL', 'DEV', '1', '200', '187', '2025-03-11 20:22:55'),
(29, 'EE96645546', 'ANGULAR', 'ANGULAR', 'DEV', '1', '100', '120', '2025-03-11 20:23:51'),
(44, 'SALA99887', 'REACTJS', 'REACTJS', 'DEV', '1', '200', '100', '2025-03-11 20:22:55'),
(187, 'E17187917486672ae442b966', 'KOTLIN', 'EFM', 'DEV', '1', '200', '188', '2025-03-11 21:21:51'),
(444, 'S1711545977', 'VUEJS', 'VUEJS', 'DEV', '1', '200', '100', '2025-03-11 20:23:51'),
(989, 'E17187917486672ae442b933', 'JAVA', 'JAVA', 'DEV', '1', '200', '177', '2025-03-11 20:46:05'),
(5654, 'E17187929656672b305cbb25', 'C++', 'Controle 1', 'DEV', '1', '200', '100', '2025-03-11 21:47:01'),
(98765, 'EE3322', 'LARAVEL', 'LARAVEL', 'DEV', '1', '100', '80', '2025-03-11 21:05:20');

-- --------------------------------------------------------

--
-- Structure de la table `feedback`
--

CREATE TABLE `feedback` (
  `s_no` int(11) NOT NULL,
  `sender_id` varchar(20) NOT NULL,
  `receiver_id` varchar(20) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fee_record`
--

CREATE TABLE `fee_record` (
  `s_no` int(11) NOT NULL,
  `id` varchar(20) NOT NULL,
  `month` varchar(20) NOT NULL,
  `other_collection` int(5) NOT NULL,
  `total` int(5) NOT NULL,
  `paid` int(5) NOT NULL,
  `balance` int(5) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `leaves`
--

CREATE TABLE `leaves` (
  `s_no` int(10) NOT NULL,
  `sender_id` varchar(20) NOT NULL,
  `send_date` datetime NOT NULL DEFAULT current_timestamp(),
  `leave_type` varchar(100) NOT NULL,
  `leave_desc` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `leaves`
--

INSERT INTO `leaves` (`s_no`, `sender_id`, `send_date`, `leave_type`, `leave_desc`, `start_date`, `end_date`, `status`) VALUES
(12, 'T1718791191', '2024-06-19 15:48:43', 'Medical Leave', 'accept my leave otherwise ....... ', '2024-06-20 00:00:00', '2024-06-27 00:00:00', 'rejected'),
(13, 'T1718791191', '2024-06-19 15:49:23', 'Casual Leave', 'I want some rest please give me leave', '2024-06-29 00:00:00', '2024-07-03 00:00:00', 'rejected'),
(51, 'T1741545065', '2025-03-09 22:12:48', 'Congé OCCASIONEL	', 'Congé de summer ', '2025-03-09 22:10:58', '2025-06-09 22:10:58', 'approved'),
(99, 'T1741553619', '2025-03-09 22:11:40', 'Congé médical	', 'MALADIE', '2025-03-09 22:10:58', '2025-05-09 22:10:58', 'rejected');

-- --------------------------------------------------------

--
-- Structure de la table `marks`
--

CREATE TABLE `marks` (
  `s_no` int(20) NOT NULL,
  `exam_id` varchar(40) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `marks` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marks`
--

INSERT INTO `marks` (`s_no`, `exam_id`, `subject`, `student_id`, `marks`) VALUES
(1, 'E17187917486672ae442b976', 'JAVA', 'S1718791292', '86'),
(2, 'E17187928006672b26095699', 'PHP', 'S1711545977', '62'),
(3, 'E17187917486672ae442b976', 'English', 'S1718791292', '59'),
(4, 'E17187928006672b26095672', 'Java', 'S1718791292', '33'),
(5, 'E17187929656672b305cbb25', 'French', 'S1718791292', '55'),
(6, 'E17187929656672b305cbb25', 'LARAVEL', 'S1718791292', '55'),
(7, 'E17187928006672b26095688', 'JAVA', 'S1711545977', '130'),
(8, 'E17187928006672b26095699', 'JAVA', 'S1711545977', '120'),
(9, 'EE3322', 'LARAVEL', 'S1741545921', '111'),
(10, 'E17187928006672b26095699', 'JAVA', 'S1741545921', '200'),
(11, 'E17187917486672ae442b976', 'JAVA', 'S1741709244', '130'),
(12, 'S1711545977', 'JAVA', 'S1741545930', '110'),
(13, 'E17187917486672ae442b933', 'JAVA', 'S1741623643', '177'),
(123, '', 'LARAVEL', 'S1741545921', '111'),
(8998, 'E17187917486672ae442b966', 'JAVA', 'S1741545930', '188');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE `notes` (
  `s_no` int(20) NOT NULL,
  `sender_id` varchar(40) NOT NULL,
  `editor_id` varchar(40) NOT NULL,
  `class` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `file` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`s_no`, `sender_id`, `editor_id`, `class`, `subject`, `title`, `comment`, `file`, `timestamp`) VALUES
(1, 'A9876543210', 'A9876543210', 'RH', 'french', 'french Homework ', 'do this on time', 'A98765432101718791715.png', '2024-06-19 15:38:35'),
(2, 'A9876543210', 'A9876543210', 'DEV', 'SOFT SKILLS', 'WRITING HOMEWORK', 'DO IT NOW', '', '2025-03-11 18:21:43'),
(3, 'A9876543210', 'A9876543210', 'AUDIT', 'SOFT SKILLS', 'WRITING HOMEWORK', 'DO IT NOW', '', '2025-03-11 18:22:15'),
(4, 'A9876543210', 'A9876543210', 'BTP', 'STATISTIQUE', '  HOMEWORK', 'DO IT NOW', '', '2025-03-11 18:22:50'),
(5, 'A9876543210', 'A9876543210', 'GESTION', 'STATISTIQUE', '  HOMEWORK', 'DO IT NOW', '', '2025-03-11 18:23:02');

-- --------------------------------------------------------

--
-- Structure de la table `notice`
--

CREATE TABLE `notice` (
  `s_no` int(20) NOT NULL,
  `sender_id` varchar(40) NOT NULL,
  `editor_id` varchar(40) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` varchar(1000) NOT NULL,
  `file` varchar(100) NOT NULL,
  `importance` varchar(5) NOT NULL DEFAULT '1',
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `role` varchar(11) NOT NULL,
  `class` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `notice`
--

INSERT INTO `notice` (`s_no`, `sender_id`, `editor_id`, `title`, `body`, `file`, `importance`, `timestamp`, `role`, `class`) VALUES
(51, 'A9876543210', 'A9876543210', 'Notice title', 'body', 'A98765432101718791385.png', '2', '2024-06-19 15:33:05', '', ''),
(52, 'A9876543210', 'A9876543210', 'Title 2', 'body 2', 'A98765432101718791411.png', '3', '2024-06-19 15:33:31', '', ''),
(53, 'A9876543210', 'A9876543210', 'Holiday notice', 'enjoy your holidays', 'A98765432101718791447.png', '1', '2024-06-19 15:34:07', '', ''),
(54, 'A9876543210', 'A9876543210', 'VACANCE ETE 2026', 'Depuis Juin', '', '2', '2025-03-09 20:40:41', '', ''),
(55, 'A9876543210', 'A9876543210', 'FORUM DIGITAL MARKETING', 'FROM JUNE TO AUGUST', '', '1', '2025-03-09 20:44:53', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `s_no` int(20) NOT NULL,
  `sender_id` varchar(40) NOT NULL,
  `class` varchar(30) NOT NULL,
  `section` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `file` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payroll`
--

CREATE TABLE `payroll` (
  `s_no` int(11) NOT NULL,
  `id` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `account_no` varchar(40) NOT NULL,
  `ifsc_code` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reminders`
--

CREATE TABLE `reminders` (
  `s_no` int(20) NOT NULL,
  `id` varchar(40) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `reminders`
--

INSERT INTO `reminders` (`s_no`, `id`, `message`, `status`) VALUES
(68, 'T1718791191', 'Post a homework daily', 'completed'),
(69, 'T1718791191', 'principal meeting', 'pending'),
(71, 'A9876543210', '\nBest of luck', 'completed'),
(72, 'A9876543210', 'EVENEMENT MARKETING', 'pending'),
(73, 'A9876543210', 'WEBINAIRE 2025', 'pending');

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

CREATE TABLE `students` (
  `s_no` int(20) NOT NULL,
  `id` varchar(40) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `father` varchar(200) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `class` varchar(20) NOT NULL,
  `section` varchar(50) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `image` varchar(50) NOT NULL DEFAULT '1701517055user.png',
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `state` varchar(50) NOT NULL,
  `request_date` varchar(30) NOT NULL,
  `request_time` varchar(30) NOT NULL,
  `request` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `students`
--

INSERT INTO `students` (`s_no`, `id`, `fname`, `lname`, `father`, `gender`, `class`, `section`, `dob`, `image`, `phone`, `email`, `address`, `city`, `zip`, `state`, `request_date`, `request_time`, `request`) VALUES
(3, 'S1741545930', 'HISHAM', 'IDRISI', 'BRAHIM', 'Male', 'INFOGRAPHIE', '1', '10-10-1999', 'S17415459301741545930.png', '0666143563', 'KOM@live.com', 'OKO', 'FES', '19990', 'UP', '', '', ''),
(4, 'S1741545921', 'RITA', 'BENACHIR', 'SAID', 'Female', 'RH', '1', '01-01-1970', '1701517055user.png', '0661324242', 'rita@gmail.com', 'fes', 'FES', '19990', 'Panjab', '', '', ''),
(5, 'S1741545956', 'NAWAL', 'EL SAMIRI', 'KAMAL', 'FEMALE', 'GESTION', '1', '', '1701517055user.png', '0669989999', 'hanae@live.com', 'ASFI', 'meknes', '', '', '', '', ''),
(6, 'S1741545900', 'MORO', 'ABDEREZAQ', 'SAID', 'MALE', 'DEV', '1', '2012-12-10', '1701517055user.png', '0661557', 'moro@gmail.com', '', '', '', '', '', '', ''),
(7, 'S1718791211', 'KAMARZ', 'OK', 'OK', 'Female', 'COMMERCE', '1', '10-10-0010', '1701517055user.png', '0661324242', 'moraggd@live.com', 'undefined', 'undefined', 'undefined', 'Gujrat', '', '', ''),
(8, 'S1741623643', 'AMINE', 'BENANI', 'SAID', 'Male', 'AUDIT', '1', '10-10-2000', 'S17416236431741623643.png', '0666778899', 'benan@gmail.com', 'fes azli', 'fes', 'undefined', 'UP', '', '', ''),
(9, 'S1711545977', 'MORO', 'ABDEREZAQ', 'SAID', 'MALE', 'DEV202', '1', '2012-12-10', '1701517055user.png', '0661557', 'moro@gmail.com', '', '', '', '', '', '', ''),
(10, 'S1741707488', 'ZIAD', 'LOUIKSANI', '', 'Female', 'COMMERCE', '1', '10-10-2003', '1701517055user.png', '0661324242', 'rita@gmail.com', 'fes', 'FES', '19990', 'KECH', '', '', ''),
(16, 'S1741709244', 'HAMZA', 'HILALI', '', 'Female', 'COMMERCE', '1', '10-10-0020', '1701517055user.png', '0661324242', 'moi@live.fr', 'fes', 'FES', '19990', 'FES', '', '', ''),
(19, 'S1741710055', 'WISAL', 'AHMAD', '', 'Female', 'COMMERCE', '2', '10-10-0010', '1701517055user.png', '0661324242', 'moi@live.fr', 'fes', 'FES', '19990', 'KECH', '', '', ''),
(20, 'S1741710317', 'kk', 'kk', 'K', 'Female', 'COMMERCE', '1', '10-10-0200', '1701517055user.png', '0661324242', 'moi@live.fr', 'fes', 'FES', '19990', 'FES', '', '', ''),
(1741710684, 'S1741710684', 'FF', 'FF', '', 'Female', 'COMMERCE', '1', '10-10-2000', '1701517055user.png', '0661324242', 'moiS@live.fr', 'fes', 'FES', '19990', 'FES', '', '', ''),
(1741710708, 'S1741710708', 'nn', 'nnfd', '', 'Female', 'COMMERCE', '1', '10-10-0200', '1701517055user.png', '0661324242', 'moiS@live.fr', 'fes', 'FES', '19990', 'KECH', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `student_guardian`
--

CREATE TABLE `student_guardian` (
  `s_no` int(20) NOT NULL,
  `id` varchar(40) NOT NULL,
  `gname` varchar(200) NOT NULL,
  `gphone` varchar(20) NOT NULL,
  `gaddress` varchar(200) NOT NULL,
  `gcity` varchar(100) NOT NULL,
  `gzip` varchar(50) NOT NULL,
  `relation` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_guardian`
--

INSERT INTO `student_guardian` (`s_no`, `id`, `gname`, `gphone`, `gaddress`, `gcity`, `gzip`, `relation`) VALUES
(3, 'S1741545930', 'ABDELHAMID', '0661324242', 'OKO', 'FES', '19990', 'SI'),
(5, 'S1741545921', 'SAID', '0654443344', 'fes azli', 'FES', '999', 'OK'),
(6, 'S1741571539', 'SAID', '0654443344', 'fes azli', 'FES', '999', 'OK'),
(7, 'S1741571658', 'SAID', '0654443344', 'fes azli', 'FES', '999', 'OK'),
(8, 'S1741708420', 'undefined', '0661324242', 'undefined', 'undefined', 'undefined', 'undefined'),
(9, 'S1741708543', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(10, 'S1741709105', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(11, 'S1741709244', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(12, 'S1741709337', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(13, 'S1741709558', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(14, 'S1741709574', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(15, 'S1741709681', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(16, 'S1741709745', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(19, 'S1741710055', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(20, 'S1741710317', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(1741710684, 'S1741710684', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES'),
(1741710708, 'S1741710708', 'undefined', '0661324242', 'undefined', 'FES', 'FES', 'FES');

-- --------------------------------------------------------

--
-- Structure de la table `subjects`
--

CREATE TABLE `subjects` (
  `s_no` int(20) NOT NULL,
  `subject_id` varchar(40) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `class` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `subjects`
--

INSERT INTO `subjects` (`s_no`, `subject_id`, `subject_name`, `class`) VALUES
(1, '12c6672ac911a253', ' LARAVEL', 'DEV'),
(2, '12c6672ac9c45d68', 'C++', 'RH'),
(3, '12c6672aca78c3c7', 'ALL', 'BTP'),
(4, 'FINANCE67ce10f64e065', 'JAVA', 'FINANCE'),
(5, 'MARKETING67ce1103eeb4f', 'PHP', 'MARKETING');

-- --------------------------------------------------------

--
-- Structure de la table `syllabus`
--

CREATE TABLE `syllabus` (
  `s_no` int(20) NOT NULL,
  `class` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `syllabus`
--

INSERT INTO `syllabus` (`s_no`, `class`, `subject`, `file`) VALUES
(12, 'DEV', 'LARAVEL', 'A98765432101741630429.png'),
(13, 'FINANCE', 'English', 'T17187911911718792285.png'),
(19, 'BTP', 'WEBINAIRE', 'EN COURS');

-- --------------------------------------------------------

--
-- Structure de la table `teachers`
--

CREATE TABLE `teachers` (
  `s_no` int(20) NOT NULL,
  `id` varchar(40) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `father` varchar(150) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT '1701517055user.png',
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(512) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `state` varchar(50) NOT NULL,
  `class` varchar(20) NOT NULL,
  `section` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `teachers`
--

INSERT INTO `teachers` (`s_no`, `id`, `fname`, `lname`, `father`, `subject`, `gender`, `dob`, `image`, `phone`, `email`, `address`, `city`, `zip`, `state`, `class`, `section`) VALUES
(1, 'T1718791191', 'teacher', 'OMAR', '', 'LARAVEL', 'Male', '19-06-2024', 'T17187911911718792416.png', '7896541230', 'teacher@gmail.com', 'near admins house', 'home town', '478548', 'Delhi', '12c', 'A'),
(2, 'T1741545065', 'MOHAMED ', 'AJINANE', '', 'C++', 'Male', '10-10-1920', '1701517055user.png', '0666143563', 'morad11@live.com', 'MHAMID', 'FES', '1990', 'UP', 'AUDIT', '1'),
(4, 'T1741553619', 'HASNAE ', 'BOUISKRANE', '', 'JAVASCRIPT', 'Female', '10-10-1999', '1701517055user.png', '0661889988', 'hasnae@live.com', 'AGADIR', 'FES', '1990', 'UP', 'DEV', '1'),
(5, 'T1741617776', 'ALI', 'IHSAN', '', 'STATISTIQUE', 'Male', '11-01-1910', '1701517055user.png', '0661177889', 'morosm@gmail.com', 'fes azli', 'FES', '19990', 'UP', 'COMPTA', '3'),
(6, 'T1741649884', 'KAMAL', 'KADIMI', '', 'PHP', 'Male', '10-10-2000', '1701517055user.png', '0661324242', 'morad@live.com', 'undefined', 'FES', '19990', 'Panjab', 'COMMERCE', '1'),
(7, 'T1741710127', 'BRAHIM', 'DIAZ', '', 'PHP', 'Female', '10-10-2000', '1701517055user.png', '0661324242', 'moraSDd@live.com', 'undefined', 'FES', '19990', 'Delhi', 'INFRASTRUCTURE', '1');

-- --------------------------------------------------------

--
-- Structure de la table `teacher_guardian`
--

CREATE TABLE `teacher_guardian` (
  `s_no` int(20) NOT NULL,
  `id` varchar(40) NOT NULL,
  `gname` varchar(256) NOT NULL,
  `gphone` varchar(20) NOT NULL,
  `gaddress` varchar(256) NOT NULL,
  `gcity` varchar(50) NOT NULL,
  `gzip` varchar(20) NOT NULL,
  `relation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `teacher_guardian`
--

INSERT INTO `teacher_guardian` (`s_no`, `id`, `gname`, `gphone`, `gaddress`, `gcity`, `gzip`, `relation`) VALUES
(1, 'T1718791191', 'Mohamed Fayade', '1234567895', 'Fes', 'Maggie', 'Mckee', 'Consequatur Volupta'),
(2, 'T1741545065', 'ABDELKADER', '0661838383', 'fes azli', 'FES', '1990', 'KFKO'),
(4, 'T1741553619', 'BRAHAIM', '0650778877', 'fes azli', 'FES', '1990', 'OK'),
(5, 'T1741617776', 'SAID', '0654443344', 'fes azli', 'FES', '1990', 'KFKO'),
(6, 'T1741649884', 'M MARWANE', '0661324242', 'OKO', 'FES', '19990', 'fes'),
(7, 'T1741710127', 'M MARWANE', '0661324242', 'OKO', 'FES', '19990', 'FES');

-- --------------------------------------------------------

--
-- Structure de la table `time_table`
--

CREATE TABLE `time_table` (
  `s_no` int(20) NOT NULL,
  `class` varchar(50) NOT NULL,
  `section` varchar(10) NOT NULL,
  `start_time` varchar(20) NOT NULL,
  `end_time` varchar(20) NOT NULL,
  `mon` varchar(30) NOT NULL,
  `tue` varchar(30) NOT NULL,
  `wed` varchar(30) NOT NULL,
  `thu` varchar(30) NOT NULL,
  `fri` varchar(30) NOT NULL,
  `sat` varchar(30) NOT NULL,
  `editor_id` varchar(40) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `time_table`
--

INSERT INTO `time_table` (`s_no`, `class`, `section`, `start_time`, `end_time`, `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `editor_id`, `timestamp`) VALUES
(1, 'DEV202', '1', '07:00', '08:00', 'ANGULAR', 'JS', '', '', '', '', 'A9876543210', '2024-06-19 15:37:37'),
(2, 'FINANCE', '1', '08:00', '09:00', 'English', '', 'PHP', '', '', '', 'A9876543210', '2024-06-19 15:37:37'),
(3, '12c', '1', '09:00', '10:00', 'Math', '', '', 'C', '', '', 'A9876543210', '2024-06-19 15:37:37'),
(4, 'DEV', '1', '10:00', '11:00', 'REACTJS', 'PYTHON', 'C', 'JAVA', 'C++', 'FRENCH', 'A9876543210', '2024-06-19 15:37:37'),
(5, '12c', '1', '11:00', '12:00', 'English', '', '', '', '', '', 'A9876543210', '2024-06-19 15:37:37'),
(6, 'DEV', '2', '12:00', '01:00', 'PYTHON', '', '', '', '', 'RH', 'A9876543210', '2024-06-19 15:37:37'),
(7, 'MARKETING', '1', '01:00', '02:00', 'Commerce', '', '', '', '', '', 'A9876543210', '2024-06-19 15:37:37'),
(8, 'RH', '1', '02:00', '03:00', 'LARAVEL', '', '', 'C#', '', '', 'A9876543210', '2024-06-19 15:37:37'),
(9, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 21:55:29'),
(10, 'BTP', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 21:55:29'),
(11, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 21:55:29'),
(12, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 21:55:29'),
(13, 'RH', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 21:55:30'),
(14, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 21:55:30'),
(15, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 21:55:30'),
(16, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 21:55:30'),
(17, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:55:27'),
(18, 'AUDIT', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:55:27'),
(19, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:55:27'),
(20, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:55:27'),
(21, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:55:27'),
(22, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:55:27'),
(23, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:55:27'),
(24, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:55:27'),
(25, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:33'),
(26, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:33'),
(27, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:33'),
(28, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:33'),
(29, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:33'),
(30, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:33'),
(31, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:34'),
(32, 'COMMERCE', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:34'),
(33, 'DEV', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:43'),
(34, 'DEV', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:43'),
(35, 'DEV', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:43'),
(36, 'DEV', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:43'),
(37, 'DEV', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:44'),
(38, 'DEV', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:44'),
(39, 'DEV', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:44'),
(40, 'DEV', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-09 22:56:44'),
(41, 'all', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-10 16:38:26'),
(42, 'all', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-10 16:38:26'),
(43, 'all', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-10 16:38:26'),
(44, 'all', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-10 16:38:26'),
(45, 'all', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-10 16:38:26'),
(46, 'all', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-10 16:38:26'),
(47, 'all', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-10 16:38:26'),
(48, 'all', '1', '', '', '', '', '', '', '', '', 'A9876543210', '2025-03-10 16:38:27');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `s_no` int(15) NOT NULL,
  `id` varchar(40) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password_hash` varchar(700) NOT NULL,
  `role` varchar(20) NOT NULL,
  `theme` varchar(20) NOT NULL DEFAULT 'light'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`s_no`, `id`, `email`, `password_hash`, `role`, `theme`) VALUES
(1, 'A9876543210', 'admin@gmail.com', 'admin', 'admin', 'dark'),
(2, 'T1718791191', 'teacher@gmail.com', 'teacher', 'teacher', 'light'),
(4, 'O7898987845', 'owner@gmail.com', 'owner', 'owner', 'light'),
(6, 'T1741545065', 'morad11@live.com', '$2y$10$mA.ANBRRxIW9K1trhBI3heI0LLSkOfswL26t1MHwh85vwPzJ/F76e', 'teacher', 'light'),
(7, 'S1741545930', 'KOM@live.com', '$2y$10$9eeTjJ6AGyaiF0XYjFnmjObvpfeYgQ/Tu/Tkcih6NWoPkCOlv4al6', 'student', 'light'),
(10, 'T1741553619', 'hasnae@live.com', '$2y$10$plBvZ/s6ntJL2GOShhbX.uYIWWDyoGHIZ5JLPgLOterEHFMXIovKy', 'teacher', 'light'),
(11, 'S1741554904', 'zako@live.com', '$2y$10$ORl4dHmjF5jW9XVVd/oswO5bAiwAy9Mp1m449n3/ob98XA8EErSV.', 'student', 'light'),
(12, 'S1741571539', 'moro@gmail.com', '$2y$10$s0aKbgeIG1DybXyjskv/9uNe2zHWO9LqsAFaPP4UNGDAM4UMuzece', 'student', 'light'),
(13, 'S1741571658', 'moro222@gmail.com', '$2y$10$l1hR8uPuV1E5Dk9/SB9.dOWbqHBnpJh3R0BOIhQlwVBFHCblczpde', 'student', 'light'),
(14, 'T1741617776', 'morosm@gmail.com', '$2y$10$XmZZ2XmpzG93NwxCqr3f5Ox465FaZ8XByUcfiBokJ1eZsqK5/y.HK', 'teacher', 'light'),
(15, 'T1741649884', 'morad@live.com', '$2y$10$eE5pM5xbahgl4wqv9Rjib.sZtizrh7aCGEUfz7lHbX.rjZbZ9zNte', 'teacher', 'light'),
(16, 'S1741709105', 'HAMZA@gmail.com', '$2y$10$ZxjNyAR8CtUqoMnl64yM2OxyFIXMlfwdoFkVwUuySyeNbKAjxfBaa', 'student', 'light'),
(17, 'T1741710127', 'moraSDd@live.com', '$2y$10$GcsbS7p4Szafjp5PCvhUouerYHTF5unsZStMgEZkWsbtTan.Jy1ju', 'teacher', 'light');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `attendence`
--
ALTER TABLE `attendence`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `bus_root`
--
ALTER TABLE `bus_root`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `bus_staff`
--
ALTER TABLE `bus_staff`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `fee_record`
--
ALTER TABLE `fee_record`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `student_guardian`
--
ALTER TABLE `student_guardian`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `syllabus`
--
ALTER TABLE `syllabus`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `teacher_guardian`
--
ALTER TABLE `teacher_guardian`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `time_table`
--
ALTER TABLE `time_table`
  ADD PRIMARY KEY (`s_no`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`s_no`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `attendence`
--
ALTER TABLE `attendence`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `buses`
--
ALTER TABLE `buses`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `bus_root`
--
ALTER TABLE `bus_root`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `bus_staff`
--
ALTER TABLE `bus_staff`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `s_no` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `exams`
--
ALTER TABLE `exams`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98766;

--
-- AUTO_INCREMENT pour la table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `fee_record`
--
ALTER TABLE `fee_record`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `s_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT pour la table `marks`
--
ALTER TABLE `marks`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123322;

--
-- AUTO_INCREMENT pour la table `notes`
--
ALTER TABLE `notes`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `notice`
--
ALTER TABLE `notice`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT pour la table `students`
--
ALTER TABLE `students`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT pour la table `student_guardian`
--
ALTER TABLE `student_guardian`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1741710709;

--
-- AUTO_INCREMENT pour la table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `syllabus`
--
ALTER TABLE `syllabus`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `teacher_guardian`
--
ALTER TABLE `teacher_guardian`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `time_table`
--
ALTER TABLE `time_table`
  MODIFY `s_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `s_no` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
