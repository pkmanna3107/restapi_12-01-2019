-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2019 at 02:26 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `mtbl_user`
--

CREATE TABLE `mtbl_user` (
  `mtbl_user_id` int(11) NOT NULL,
  `user_first_name` varchar(255) NOT NULL,
  `user_middle_name` varchar(255) NOT NULL,
  `user_surname_name` varchar(255) NOT NULL,
  `user_dob` varchar(255) NOT NULL,
  `user_passport_series` varchar(255) NOT NULL,
  `user_passport_date_of_issue` varchar(255) NOT NULL,
  `user_passport_issued_by` varchar(255) NOT NULL,
  `user_ITN` varchar(255) DEFAULT NULL,
  `user_email_id` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_mobile_number` varchar(255) NOT NULL,
  `user_state` int(11) NOT NULL,
  `user_category_id` int(11) NOT NULL,
  `user_locality` varchar(255) NOT NULL,
  `user_street` varchar(255) NOT NULL,
  `user_house_number` varchar(255) NOT NULL,
  `user_flat_number` varchar(255) NOT NULL,
  `user_registration_date` date NOT NULL,
  `last_update_date` date NOT NULL,
  `user_is_active` enum('Y','N') NOT NULL,
  `user_verify_url` varchar(255) DEFAULT NULL,
  `user_access_salt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mtbl_user`
--

INSERT INTO `mtbl_user` (`mtbl_user_id`, `user_first_name`, `user_middle_name`, `user_surname_name`, `user_dob`, `user_passport_series`, `user_passport_date_of_issue`, `user_passport_issued_by`, `user_ITN`, `user_email_id`, `user_password`, `user_mobile_number`, `user_state`, `user_category_id`, `user_locality`, `user_street`, `user_house_number`, `user_flat_number`, `user_registration_date`, `last_update_date`, `user_is_active`, `user_verify_url`, `user_access_salt`) VALUES
(1, 'William', '', 'Neson', '', '', '', '', '1', 'william@neson.com', '', '9876543210', 0, 0, '', '', '', '', '0000-00-00', '0000-00-00', 'Y', NULL, ''),
(6, 'kjkjkjkjkjk', '', 'jhjhj', '', '', '', '', '', 'jhjhjhj@fgfhjhjhjgfg.com', '', '121548', 0, 0, '', '', '', '', '0000-00-00', '0000-00-00', 'Y', NULL, ''),
(7, 'yuyuyu', '', 'yuyuy', '', '', '', '', NULL, 'yuyuyu@fgfhjhjhjgfg.com', '', '121548', 0, 0, '', '', '', '', '0000-00-00', '0000-00-00', 'Y', NULL, ''),
(8, 'john', '', 'smith', '', '', '', '', NULL, 'john@john.com', '', '1213465846465', 1, 1, '', '', '', '', '0000-00-00', '0000-00-00', 'N', NULL, 'uBnq!kZDxKTO2lvSb%3eOk09NSdd!UnW%nib1b1fmpNqczn2ky*@Z&@V1m%WoSaUz07w'),
(9, 'liam', '', 'neson', '', '', '', '', NULL, 'john@john.com', '', '125649687464165', 1, 1, '', '', '', '', '2019-01-10', '2019-01-11', 'N', NULL, 'AXA3SNlFaVvYDgV?*YHZG@zqy@7h2xuW0J%2bMd&HYo&MJ6XnEw?AzJvMYsVfTY&!rsB'),
(10, 'liam', '', 'neson', '', '', '', '', NULL, 'john@john.com', '', '125649687464165', 1, 1, '', '', '', '', '2019-01-10', '0000-00-00', 'N', NULL, 'UER9mGXbYtor0y74'),
(11, 'fgfgf', '', 'fgfgfg', '', '', '', '', NULL, 'fgfgfgf', '', '1248578945', 1, 1, '', '', '', '', '2019-01-10', '0000-00-00', 'N', NULL, 'wB6CmzaXy3JiKGI9'),
(12, 'fgfgf', '', 'fgfgfg', '', '', '', '', NULL, 'fgfgfgf', '', '1248578945', 1, 1, '', '', '', '', '2019-01-10', '0000-00-00', 'N', NULL, 'pb8EQ1afKUshvD6m'),
(13, 'fffffff', '', 'ffffffff', '', '', '', '', NULL, 'ffffff', '', '1248578945', 1, 1, '', '', '', '', '2019-01-10', '0000-00-00', 'N', NULL, 'HRB8q7Wwp2s4uaY6'),
(14, 'fffffff', '', 'ffffffff', '', '', '', '', NULL, 'ffffff', '', '1248578945', 1, 1, '', '', '', '', '2019-01-10', '0000-00-00', 'N', NULL, '81ClMgjxIwapz7uQ'),
(15, 'fffffff', '', 'ffffffff', '', '', '', '', NULL, 'ffffff', '', '1248578945', 1, 1, '', '', '', '', '2019-01-10', '0000-00-00', 'N', NULL, 'vdAaD8KPYO1fLHiu'),
(16, 'tytyty', '', 'tytyt', '', '', '', '', NULL, 'tytytyt', '', '121212121', 1, 1, '', '', '', '', '2019-01-10', '0000-00-00', 'N', NULL, 'TUOeo18jGInl9YDS'),
(17, 'tytyty', '', 'tytyt', '', '', '', '', NULL, 'tytytyt', '', '121212121', 1, 1, '', '', '', '', '2019-01-10', '0000-00-00', 'N', NULL, 'iBhtp1bS4LU2KgyH'),
(18, 'tytyty', '', 'tytyt', '', '', '', '', NULL, 'tytytyt', '', '121212121', 1, 1, '', '', '', '', '2019-01-11', '0000-00-00', 'N', NULL, 'Kyf0poULFB7YvmsI'),
(19, 'tytyty', '', 'tytyt', '', '', '', '', NULL, 'tytytyt@', '', '121212121', 1, 1, '', '', '', '', '2019-01-11', '2019-01-12', 'Y', NULL, 'hLUFWzwG3AdptDIQ'),
(20, 'jason', '', 'statham', '', '', '', '', NULL, 'jason111@statham.com', '', '39393939393', 1, 1, '', '', '', '', '2019-01-11', '2019-01-12', 'Y', NULL, 'qowKWcD36HudXC0i'),
(21, 'liam', '', 'neson', '', '', '', '', NULL, 'liam@gmail.com', '', '538538383838', 1, 1, '', '', '', '', '2019-01-11', '2019-01-11', 'N', NULL, 'cRiIaFO0mk4l96Hn'),
(22, 'liam', '', 'neson', '', '', '', '', NULL, 'liam111@neson.com', '', '125649687464165', 1, 1, '', '', '', '', '2019-01-11', '2019-01-11', 'N', NULL, 'mwQ2q5forieHXCNp'),
(23, 'jason', '', 'statham', '', '', '', '', NULL, 'jason@statham.com', 'F2W8sHYxqMvd7wb1', '39393939393', 1, 1, '', '', '', '', '2019-01-11', '2019-01-11', 'Y', 'https://verification/J0GQWVkPFayelNqc', 'yXhzWSntpLODvfUj'),
(24, 'Alex', '', 'vidal', '', '', '', '', NULL, 'alex@vidal.com', 'rvI7zx1thuLPpnjR', '123645678910', 1, 1, '', '', '', '', '2019-01-12', '0000-00-00', 'N', 'https://verification/RSylfMXB7YaZU0xE', 'cys3oNuTV6QqpG8O'),
(25, 'Animesh A', '', 'Ji', '', '', '', '', NULL, 'animesh@statham.com', 'uZ9S8kashfp3G2Yw', '39393939800', 1, 1, '', '', '', '', '2019-01-12', '2019-01-12', 'Y', 'https://verification/TSIpAmGoB9baihkg', '8VZMXyNDl1ruxsRP');

-- --------------------------------------------------------

--
-- Table structure for table `sys_state`
--

CREATE TABLE `sys_state` (
  `sys_StateID` int(11) NOT NULL,
  `StateDisplayName` varchar(255) NOT NULL,
  `StateCode` varchar(255) NOT NULL,
  `StateIsActive` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sys_user_category`
--

CREATE TABLE `sys_user_category` (
  `sys_user_category_id` int(11) NOT NULL,
  `user_category_name` varchar(255) NOT NULL,
  `user_is_active` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trnz_login_session`
--

CREATE TABLE `trnz_login_session` (
  `trnz_login_session_id` int(11) NOT NULL,
  `login_session_inst_datetime` datetime NOT NULL,
  `login_session_validity` int(11) NOT NULL,
  `login_session_access_meta` varchar(2555) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trnz_login_session`
--

INSERT INTO `trnz_login_session` (`trnz_login_session_id`, `login_session_inst_datetime`, `login_session_validity`, `login_session_access_meta`) VALUES
(1, '2019-01-12 11:52:25', 1800, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX3Bhc3N3b3JkIjoiRjJXOHNIWXhxTXZkN3diMSJ9.MIF61jFgBR1o7THZ36q_0oFMcRUgRctYPH0heaoEYcY'),
(2, '2019-01-12 11:53:21', 1800, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX3Bhc3N3b3JkIjoiRjJXOHNIWXhxTXZkN3diMSJ9.MIF61jFgBR1o7THZ36q_0oFMcRUgRctYPH0heaoEYcY'),
(3, '2019-01-12 12:55:41', 1800, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX3Bhc3N3b3JkIjoiRjJXOHNIWXhxTXZkN3diMSJ9.MIF61jFgBR1o7THZ36q_0oFMcRUgRctYPH0heaoEYcY'),
(4, '2019-01-12 12:59:34', 1800, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX3Bhc3N3b3JkIjoiRjJXOHNIWXhxTXZkN3diMSJ9.MIF61jFgBR1o7THZ36q_0oFMcRUgRctYPH0heaoEYcY'),
(5, '2019-01-12 13:01:10', 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX3Bhc3N3b3JkIjoiRjJXOHNIWXhxTXZkN3diMSJ9.MIF61jFgBR1o7THZ36q_0oFMcRUgRctYPH0heaoEYcY'),
(6, '2019-01-12 13:16:57', 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX3Bhc3N3b3JkIjoidVo5UzhrYXNoZnAzRzJZdyJ9.AHM9FhtSN-es8i8f58jBiLyJesazD6uF1EAfUxdenkw');

-- --------------------------------------------------------

--
-- Table structure for table `trnz_user_login`
--

CREATE TABLE `trnz_user_login` (
  `trnz_user_login_id` int(11) NOT NULL,
  `user_login_token` varchar(255) NOT NULL,
  `user_login_session_id` int(11) NOT NULL,
  `user_access_salt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trnz_user_login`
--

INSERT INTO `trnz_user_login` (`trnz_user_login_id`, `user_login_token`, `user_login_session_id`, `user_access_salt`) VALUES
(1, 'fffffff', 15, 'vdAaD8KPYO1fLHiu'),
(2, 'tytyty', 16, 'TUOeo18jGInl9YDS'),
(3, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2FjY2Vzc19zYWx0IjoiaUJodHAxYlM0TFUyS2d5SCJ9.igYJDy4FPTAIdK4BQLPp6qAz8GKXhE6ZfZr-MH0zUU0', 17, 'iBhtp1bS4LU2KgyH'),
(4, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2FjY2Vzc19zYWx0IjoiS3lmMHBvVUxGQjdZdm1zSSJ9.XRehw4w0tmbAJGWtyfDLhObqW3uL8nXIQIOg42AVzvY', 18, 'Kyf0poULFB7YvmsI'),
(5, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2FjY2Vzc19zYWx0IjoiaExVRld6d0czQWRwdERJUSJ9.F54fQsACBtvK0NIIJmKt_E79c2zwJmWjtcjUCmMnMKw', 19, 'hLUFWzwG3AdptDIQ'),
(6, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2FjY2Vzc19zYWx0IjoicW93S1djRDM2SHVkWEMwaSJ9.enVMd8W9qgGL2jyIIo98TVhDg1zivahRQ2KrC1UFWOw', 20, 'qowKWcD36HudXC0i'),
(7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2FjY2Vzc19zYWx0IjoiY1JpSWFGTzBtazRsOTZIbiJ9.mniM0ofBNu8rFteKntSvKm5KotFjI2CzgD9bZpWDubg', 21, 'cRiIaFO0mk4l96Hn'),
(8, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2FjY2Vzc19zYWx0IjoibXdRMnE1Zm9yaWVIWENOcCJ9.v6xENiR67TkQUynHZKbg-7t0x8vSoR35Hz8iwepBsbQ', 22, 'mwQ2q5forieHXCNp'),
(9, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2FjY2Vzc19zYWx0IjoieVhoeldTbnRwTE9EdmZVaiJ9.1PfhVDH7gY-M2CEig9Syu4MeVOK30KGPRBuISy0IsRg', 23, 'yXhzWSntpLODvfUj'),
(10, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2FjY2Vzc19zYWx0IjoiY3lzM29OdVRWNlFxcEc4TyJ9.5-mK0-Gry_dx_6IZcviAPpmKImbG0SLuYMCJpvIpyAE', 24, 'cys3oNuTV6QqpG8O'),
(11, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2FjY2Vzc19zYWx0IjoiOFZaTVh5TkRsMXJ1eHNSUCJ9.OuLMQGpe0L-XaFszP1CYb2dsC9Vfu1osmAwBrKpCvxQ', 25, '8VZMXyNDl1ruxsRP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mtbl_user`
--
ALTER TABLE `mtbl_user`
  ADD PRIMARY KEY (`mtbl_user_id`),
  ADD UNIQUE KEY `user_ITN` (`user_ITN`);

--
-- Indexes for table `sys_state`
--
ALTER TABLE `sys_state`
  ADD PRIMARY KEY (`sys_StateID`);

--
-- Indexes for table `sys_user_category`
--
ALTER TABLE `sys_user_category`
  ADD PRIMARY KEY (`sys_user_category_id`);

--
-- Indexes for table `trnz_login_session`
--
ALTER TABLE `trnz_login_session`
  ADD PRIMARY KEY (`trnz_login_session_id`);

--
-- Indexes for table `trnz_user_login`
--
ALTER TABLE `trnz_user_login`
  ADD PRIMARY KEY (`trnz_user_login_id`),
  ADD UNIQUE KEY `user_login_token` (`user_login_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mtbl_user`
--
ALTER TABLE `mtbl_user`
  MODIFY `mtbl_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sys_state`
--
ALTER TABLE `sys_state`
  MODIFY `sys_StateID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sys_user_category`
--
ALTER TABLE `sys_user_category`
  MODIFY `sys_user_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trnz_login_session`
--
ALTER TABLE `trnz_login_session`
  MODIFY `trnz_login_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `trnz_user_login`
--
ALTER TABLE `trnz_user_login`
  MODIFY `trnz_user_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
