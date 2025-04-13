-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2025 at 05:05 PM
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
  `country` varchar(50) NOT NULL,
  `bio` text DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `country`, `bio`, `created`, `modified`) VALUES
(1, 'J.K. Rowling', 'USA', 'Author of the Harry Potter series', '2025-03-25 23:28:04', '2025-04-12 14:52:36'),
(2, 'George R.R. Martin', 'USA', 'Author of A Song of Ice and Fire', '2025-03-25 23:28:04', '2025-04-11 23:30:56'),
(3, 'J.R.R. Tolkien', 'USA', 'Author of The Lord of the Rings', '2025-03-25 23:28:04', '2025-04-11 23:31:00');

-- --------------------------------------------------------

--
-- Table structure for table `authors_books`
--

CREATE TABLE `authors_books` (
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `authors_publishers`
--

CREATE TABLE `authors_publishers` (
  `author_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors_publishers`
--

INSERT INTO `authors_publishers` (`author_id`, `publisher_id`) VALUES
(1, 1),
(1, 2),
(2, 1);

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
  `status` varchar(50) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `publisher_id`, `author_id`, `published_year`, `status`, `created`, `modified`) VALUES
(1, 'Harry Potter and the Sorcerer’s Stone', 1, 1, '1997-01-15', 'published', '2025-03-25 23:28:04', '2025-04-12 14:50:47'),
(2, 'Harry Potter and the Chamber of Secrets', 1, 1, '1997-01-01', 'published', '2025-03-25 23:28:04', '2025-04-11 23:30:18'),
(3, 'A Game of Thrones', 2, 2, '1997-01-01', 'published', '2025-03-25 23:28:04', '2025-04-12 14:51:00'),
(4, 'A Clash of Kings', 2, 2, '1997-01-01', 'published', '2025-03-25 23:28:04', '2025-04-12 14:51:09'),
(5, 'The Hobbit', 3, 3, '1997-01-01', 'published', '2025-03-25 23:28:04', '2025-04-12 14:51:16'),
(6, 'The Lord of the Rings', 3, 3, '1997-01-01', 'published', '2025-03-25 23:28:04', '2025-04-12 14:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `books_publishers`
--

CREATE TABLE `books_publishers` (
  `book_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Bloomsbury', 'United Kingdom', '9638527410', '2025-03-25 23:29:41', '2025-04-12 14:53:46'),
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
-- Indexes for table `authors_books`
--
ALTER TABLE `authors_books`
  ADD PRIMARY KEY (`author_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `authors_publishers`
--
ALTER TABLE `authors_publishers`
  ADD PRIMARY KEY (`author_id`,`publisher_id`),
  ADD KEY `publisher_id` (`publisher_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `books_publishers`
--
ALTER TABLE `books_publishers`
  ADD PRIMARY KEY (`book_id`,`publisher_id`),
  ADD KEY `publisher_id` (`publisher_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors_books`
--
ALTER TABLE `authors_books`
  ADD CONSTRAINT `authors_books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `authors_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `authors_publishers`
--
ALTER TABLE `authors_publishers`
  ADD CONSTRAINT `authors_publishers_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `authors_publishers_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `books_publishers`
--
ALTER TABLE `books_publishers`
  ADD CONSTRAINT `books_publishers_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_publishers_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
