-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2022 at 10:06 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omps_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Smartphones', 'This category is for smartphones product', 1, 0, '2022-04-12 09:38:20', '2022-04-12 09:39:42'),
(2, 'Motorcycle Parts', 'This category is for the motorcycles parts products', 1, 0, '2022-04-12 09:40:25', '2022-04-12 09:40:25'),
(3, 'Car Parts', 'This category is for car parts products.', 1, 0, '2022-04-12 09:40:52', '2022-04-12 09:40:52'),
(4, 'Bicycle Parts', 'This category is for bicycle products.', 1, 0, '2022-04-12 09:41:39', '2022-04-12 09:41:39'),
(5, 'RTW', 'This category is for ready-to-wear products.', 1, 0, '2022-04-12 09:42:42', '2022-04-12 09:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `title` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `short_description` text NOT NULL,
  `selling_price` float(15,2) NOT NULL DEFAULT 0.00,
  `stock` int(10) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Available, 0=Soldout',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `user_id`, `title`, `category_id`, `short_description`, `selling_price`, `stock`, `status`, `date_created`, `date_updated`) VALUES
(1, 2, 'Samsung S22 Ultra (128 | 8gb)', 1, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed gravida in ipsum ut egestas. Donec fermentum tristique velit, ut suscipit libero euismod eget.', 68990.00, 10, 1, '2022-04-12 13:03:32', '2022-04-12 13:42:32'),
(2, 2, 'Sample', 5, 'Mauris bibendum quis ex sed fermentum. Proin eleifend sem augue, interdum consequat quam ultricies in. Fusce quis lorem volutpat metus pulvinar dignissim. Suspendisse potenti. Aenean eu leo diam. Aenean pharetra arcu ac dolor feugiat cursus. Nullam venenatis quam vitae orci bibendum, ullamcorper rutrum lorem laoreet. Aliquam iaculis, orci ac facilisis egestas, est nisi accumsan ante, rhoncus tristique neque libero ut augue.', 1500.00, 20, 1, '2022-04-12 14:45:23', '2022-04-12 14:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `seller_meta`
--

CREATE TABLE `seller_meta` (
  `user_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_meta`
--

INSERT INTO `seller_meta` (`user_id`, `meta_field`, `meta_value`) VALUES
(2, 'contact', '+5531992549164'),
(2, 'email', 'munizalex@gmail.com'),
(2, 'website', 'https://virgilhawkins00.github.io/'),
(3, 'contact', '+5531992549164'),
(3, 'email', 'munizalex45@gmail.com'),
(3, 'website', 'https://virgilhawkins00.github.io/'),

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Market Place Site'),
(6, 'short_name', 'OMPS - PHP'),
(11, 'logo', 'uploads/system-logo.png'),
(14, 'cover', 'uploads/system-cover.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Admin,\r\n2 = Seller\r\n',
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `type`, `last_login`, `date_added`, `date_updated`) VALUES
(1, 'Administrator', '', 'Admin', 'admin', '$2y$10$n2s5dbrCwxWa7i6Fr/U44O8miS9d9zB07ZQbGzrFg4LLu6rPTdFkq', 'uploads/users/avatar-1.png?v=1648628905', 1, '2023-06-21 03:48:55', '2023-06-21 09:49:16', '2023-06-21 08:47:09'),
(2, 'Alex', 'Muniz', 'Junior', 'lexus', '$2y$10$nb7Q2Pf8s066unvrSTqcFu6gGtBXHQYMcjGs1FwffkbeX5bnQjGoi', 'uploads/users/avatar-2.png?v=1649730849', 2, NULL, '2023-06-21 10:34:09', '2023-06-21 10:34:09'),
(3, 'George', 'D', 'Wilson', 'gwilson', '$2y$10$dYPjyU/YGx437xBzB8bugOyGWKWcao2gxXnKKgU7h5NRI6neUJxtO', 'uploads/users/avatar-3.png?v=1649750262', 2, NULL, '2023-06-21 15:57:42', '2023-06-21 15:57:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `seller_meta`
--
ALTER TABLE `seller_meta`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `seller_meta`
--
ALTER TABLE `seller_meta`
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
