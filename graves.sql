-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2023 at 08:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `graves`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `userID` int(11) NOT NULL,
  `friendUserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`userID`, `friendUserID`) VALUES
(5, 2),
(1, 3),
(1, 5),
(2, 5),
(2, 4),
(3, 1),
(3, 4),
(4, 2),
(4, 3),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `graves`
--

CREATE TABLE `graves` (
  `graveID` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `middleName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `birthDate` date NOT NULL,
  `deathDate` date NOT NULL,
  `vetranStatus` tinyint(4) NOT NULL,
  `famous` tinyint(4) NOT NULL,
  `photoName` varchar(255) NOT NULL,
  `latitude` varchar(150) NOT NULL,
  `longitude` varchar(150) NOT NULL,
  `altitude` varchar(150) NOT NULL,
  `graveyardID` int(11) NOT NULL,
  `addedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `graves`
--

INSERT INTO `graves` (`graveID`, `firstName`, `middleName`, `lastName`, `birthDate`, `deathDate`, `vetranStatus`, `famous`, `photoName`, `latitude`, `longitude`, `altitude`, `graveyardID`, `addedBy`) VALUES
(1, 'Alfred', 'P', 'Kafka', '1923-11-24', '1943-09-21', 1, 0, 'kafka.jpg', '42.45.23', '-71.1370', '29.53', 1, 1),
(2, 'Merv', 'NULL', 'Griffin', '1925-07-06', '2007-08-12', 0, 1, 'griffin.png', '31.760107040', '-106.492294312', '37500.00', 2, 2),
(3, 'Joel', 'H', 'Cheskin', '1942-07-23', '2014-02-05', 0, 0, 'cheskin.png', '36.822467804', '-79.397003174', '715.22', 3, 3),
(4, 'Ruth', 'E', 'Brannen', '1907-04-16', '1907-06-18', 0, 0, 'brannen.jpg', '44.282329559', '-73982955933', '1850.39', 4, 4),
(5, 'Steve', 'J', 'Ireland', '1931-09-01', '2001-07-07', 0, 0, 'ireland.png', '45.483539581', '-84.593986511', '613.52', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `graveyards`
--

CREATE TABLE `graveyards` (
  `graveyardID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `street` varchar(150) NOT NULL,
  `city` varchar(150) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `addedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `graveyards`
--

INSERT INTO `graveyards` (`graveyardID`, `name`, `street`, `city`, `state`, `zip`, `phone`, `addedBy`) VALUES
(1, 'Old Forest Cemetery', '1476 Meadowview Drive', 'Winchester', 'VA', '22638', '540-858-3666', 1),
(2, 'Glory Gardens', '1406  Frederick Street', 'El Paso', 'TX', '79906', '915-873-7820', 2),
(3, 'Ashvale Mausoleum', '1413  Worley Avenue', 'Chatham', 'VA', '24531', '434-432-6748', 3),
(4, 'Eden Cemetery', '4943  Hardesty Street', 'Lake Placid', 'NY', '12946', '518-523-9837', 4),
(5, 'Peace of Mind Memorial Park', '1978  Glenview Drive', 'Topinabee', 'MI', '49791', '361-570-6290', 5);

-- --------------------------------------------------------

--
-- Table structure for table `groupmembers`
--

CREATE TABLE `groupmembers` (
  `groupID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `groupID` int(11) NOT NULL,
  `groupName` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `startedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`groupID`, `groupName`, `description`, `startedBy`) VALUES
(1, 'WW2 Enthusiasts', 'We are interested in finding and cataloging the graves of veterans of World War II.', 2),
(2, 'Star Search', 'We want to find where famous people are buried.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `messageText` longtext NOT NULL,
  `senderID` int(11) NOT NULL,
  `recipientID` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageID`, `messageText`, `senderID`, `recipientID`, `date`) VALUES
(1, 'How are things going? Did you find that grave you were looking for?', 1, 3, '2021-02-05 07:00:00'),
(2, 'Welcome to the Gravesite', 2, 4, '2021-01-22 07:00:00'),
(3, 'Things are going very well. I found that grave.', 3, 1, '2021-02-06 07:00:00'),
(4, 'Thanks. I\'m really liking things so far.', 4, 2, '2021-01-22 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permissionID` int(11) NOT NULL,
  `permission` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permissionID`, `permission`) VALUES
(1, 'Add'),
(2, 'Edit'),
(3, 'Delete'),
(4, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `postDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `postText` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `userID`, `postDate`, `postText`) VALUES
(1, 1, '2021-01-25 07:00:00', 'Going out to catalog graves in the local cemetery. '),
(2, 2, '2021-01-26 07:00:00', 'Good luck!'),
(3, 3, '2021-01-26 07:00:00', 'Have fun!'),
(4, 4, '2021-05-02 06:00:00', 'Are there any admins that can help me with a question?'),
(5, 5, '2021-05-28 06:00:00', 'Sorry, that I haven\'t contacted you sooner. What can I do for you?');

-- --------------------------------------------------------

--
-- Table structure for table `threadposts`
--

CREATE TABLE `threadposts` (
  `threadID` int(11) NOT NULL,
  `postID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `threadposts`
--

INSERT INTO `threadposts` (`threadID`, `postID`) VALUES
(1, 1),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `threadID` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `userID` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`threadID`, `title`, `userID`, `date`) VALUES
(1, 'Weekend Plans', 1, '2021-01-25 07:00:00'),
(2, 'Site Questions', 4, '2021-05-02 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `userID` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `city` varchar(150) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dateJoined` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`userID`, `firstName`, `lastName`, `city`, `state`, `zip`, `email`, `dateJoined`) VALUES
(1, 'Evangeline', 'Voss', 'Winchester', 'MA', '22638', 'steevesecurity@AnarchyPsych.com, ', '2010-12-09'),
(2, 'Gabriel', 'Salizar', 'El Paso', 'TX', '79906', 'nyeexchange@GnomeSpyder.com', '2005-05-28'),
(3, 'Kurt', 'Faust', 'Chatham', 'VA', '24531', 'piperiches@Jewelix.com', '2016-03-15'),
(4, 'Leonardo', 'Tobin', 'Lake Placid', 'NY', '12946', 'frightenedaudi@Scannerwa.com', '2021-01-21'),
(5, 'Ruby', 'Frost', 'Topinabee', 'MI', '49791', 'behavejavelin@Bluewo.com', '2014-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `userID` int(11) NOT NULL,
  `permissionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userpermissions`
--

INSERT INTO `userpermissions` (`userID`, `permissionID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`) VALUES
(1, 'steevesecurity', 'PSychiCs'),
(2, 'nyeexchange', 'neurOIsT'),
(3, 'piperiches', 'scopEant'),
(4, 'frightenedaudi', 'aquaIous'),
(5, 'behavejavelin', 'ManiMent');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlistID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `graveID` int(11) NOT NULL,
  `graveyardID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlistID`, `userID`, `graveID`, `graveyardID`) VALUES
(1, 1, 5, 5),
(2, 2, 4, 4),
(3, 3, 2, 2),
(4, 4, 3, 3),
(5, 5, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD KEY `userIDFriends_fk` (`userID`),
  ADD KEY `friendUserID_fk` (`friendUserID`);

--
-- Indexes for table `graves`
--
ALTER TABLE `graves`
  ADD PRIMARY KEY (`graveID`),
  ADD KEY `graveyardID_fk` (`graveyardID`),
  ADD KEY `addedByGraves_fk` (`addedBy`);

--
-- Indexes for table `graveyards`
--
ALTER TABLE `graveyards`
  ADD PRIMARY KEY (`graveyardID`),
  ADD KEY `addedBy_fk` (`addedBy`);

--
-- Indexes for table `groupmembers`
--
ALTER TABLE `groupmembers`
  ADD PRIMARY KEY (`groupID`,`userID`),
  ADD KEY `userIDUser_fk` (`userID`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`groupID`),
  ADD KEY `startedByUsers_fk` (`startedBy`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`),
  ADD KEY `senderIDUser_fk` (`senderID`),
  ADD KEY `recipientIDUser_fk` (`recipientID`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `postUserID_fk` (`userID`);

--
-- Indexes for table `threadposts`
--
ALTER TABLE `threadposts`
  ADD PRIMARY KEY (`threadID`,`postID`),
  ADD KEY `threadPostsPostID_fk` (`postID`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`threadID`),
  ADD KEY `threadsUserID_fk` (`userID`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD KEY `userIDPermissions_fk` (`userID`),
  ADD KEY `permissionIDPermissions_fk` (`permissionID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlistID`),
  ADD KEY `wishlistUserID_fk` (`userID`),
  ADD KEY `wishlistGraveID_fk` (`graveID`),
  ADD KEY `wishlistGraveyardID_fk` (`graveyardID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `graves`
--
ALTER TABLE `graves`
  MODIFY `graveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `graveyards`
--
ALTER TABLE `graveyards`
  MODIFY `graveyardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `groupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permissionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `threadID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friendUserID_fk` FOREIGN KEY (`friendUserID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `userIDFriends_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `graves`
--
ALTER TABLE `graves`
  ADD CONSTRAINT `addedByGraves_fk` FOREIGN KEY (`addedBy`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `graveyardID_fk` FOREIGN KEY (`graveyardID`) REFERENCES `graveyards` (`graveyardID`);

--
-- Constraints for table `graveyards`
--
ALTER TABLE `graveyards`
  ADD CONSTRAINT `addedBy_fk` FOREIGN KEY (`addedBy`) REFERENCES `users` (`userID`);

--
-- Constraints for table `groupmembers`
--
ALTER TABLE `groupmembers`
  ADD CONSTRAINT `groupID_fk` FOREIGN KEY (`groupID`) REFERENCES `groups` (`groupID`),
  ADD CONSTRAINT `userIDUser_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `startedByUsers_fk` FOREIGN KEY (`startedBy`) REFERENCES `users` (`userID`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `recipientIDUser_fk` FOREIGN KEY (`recipientID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `senderIDUser_fk` FOREIGN KEY (`senderID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `postUserID_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `threadposts`
--
ALTER TABLE `threadposts`
  ADD CONSTRAINT `threadPostsPostID_fk` FOREIGN KEY (`postID`) REFERENCES `posts` (`postID`),
  ADD CONSTRAINT `threadPostsThreadID_fk` FOREIGN KEY (`threadID`) REFERENCES `threads` (`threadID`);

--
-- Constraints for table `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `threadsUserID_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD CONSTRAINT `userID_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD CONSTRAINT `permissionIDPermissions_fk` FOREIGN KEY (`permissionID`) REFERENCES `permissions` (`permissionID`),
  ADD CONSTRAINT `userIDPermissions_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlistGraveID_fk` FOREIGN KEY (`graveID`) REFERENCES `graves` (`graveID`),
  ADD CONSTRAINT `wishlistGraveyardID_fk` FOREIGN KEY (`graveyardID`) REFERENCES `graveyards` (`graveyardID`),
  ADD CONSTRAINT `wishlistUserID_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
