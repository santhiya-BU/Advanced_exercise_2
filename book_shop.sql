-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2025 at 07:00 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` text DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `bio`, `created`, `modified`) VALUES
(1, 'J.K. Rowling', 'Author of the Harry Potter series', '2025-03-25 23:28:04', '2025-03-25 23:28:04'),
(2, 'George R.R. Martin', 'Author of A Song of Ice and Fire', '2025-03-25 23:28:04', '2025-03-25 23:28:04'),
(3, 'J.R.R. Tolkien', 'Author of The Lord of the Rings', '2025-03-25 23:28:04', '2025-03-25 23:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `published_year` date DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `publisher_id`, `author_id`, `published_year`, `created`, `modified`) VALUES
(1, 'Harry Potter and the Sorcerer’s Stone', NULL, 1, '0000-00-00', '2025-03-25 23:28:04', '2025-03-25 23:28:04'),
(2, 'Harry Potter and the Chamber of Secrets', NULL, 1, '0000-00-00', '2025-03-25 23:28:04', '2025-03-25 23:28:04'),
(3, 'A Game of Thrones', NULL, 2, '0000-00-00', '2025-03-25 23:28:04', '2025-03-25 23:28:04'),
(4, 'A Clash of Kings', NULL, 2, '0000-00-00', '2025-03-25 23:28:04', '2025-03-25 23:28:04'),
(5, 'The Hobbit', NULL, 3, '0000-00-00', '2025-03-25 23:28:04', '2025-03-25 23:28:04'),
(6, 'The Lord of the Rings', NULL, 3, '0000-00-00', '2025-03-25 23:28:04', '2025-03-25 23:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `address`, `phone`, `created`, `modified`) VALUES
(1, 'Bloomsbury', 'United Kingdom', '9638527410', '2025-03-25 23:29:41', '2025-03-25 23:29:41'),
(2, 'Bantam Books', 'United States', '9638527410', '2025-03-25 23:29:41', '2025-03-25 23:29:41'),
(3, 'HarperCollins', 'United States', '9638527410', '2025-03-25 23:29:41', '2025-03-25 23:29:41'),
(4, 'Houghton Mifflin', 'United States', '9638527410', '2025-03-25 23:29:41', '2025-03-25 23:29:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
