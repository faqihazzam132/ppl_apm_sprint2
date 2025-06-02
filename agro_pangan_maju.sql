-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 05:18 PM
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
-- Database: `agro_pangan_maju`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'frozen food');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `sender_id`, `receiver_id`, `message`, `created_at`) VALUES
(1, 1, 1, 'halo', '2025-04-26 16:03:26'),
(2, 1, 1, 'apakah aku boleh negosiasi harga', '2025-04-26 16:03:46'),
(3, 1, 1, 'halo', '2025-04-26 16:07:31'),
(4, 1, 1, 'halo', '2025-04-26 16:08:27'),
(5, 1, 1, 'halo', '2025-04-26 16:08:28'),
(6, 1, 1, 'a', '2025-04-26 16:08:28'),
(7, 1, 1, 'a', '2025-04-26 16:08:28'),
(8, 1, 1, 'a', '2025-04-26 16:08:29'),
(9, 1, 1, 'a', '2025-04-26 16:08:29'),
(10, 1, 1, 'a', '2025-04-26 16:08:29'),
(11, 1, 1, 'a', '2025-04-26 16:08:29'),
(12, 1, 1, 'a', '2025-04-26 16:08:29'),
(13, 1, 1, 'a', '2025-04-26 16:08:30'),
(14, 1, 1, 'a', '2025-04-26 16:08:30'),
(15, 2, 1, 'halo', '2025-04-26 16:11:04'),
(16, 2, 1, 'ada apa ya', '2025-04-26 16:11:06'),
(17, 1, 1, 'aaa', '2025-04-26 16:15:01'),
(18, 1, 1, 'aaa', '2025-04-26 16:15:02'),
(19, 1, 1, 'aaaa', '2025-04-26 16:15:04'),
(20, 1, 1, 'aaaa', '2025-04-26 16:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `address` text DEFAULT NULL,
  `address_updated` tinyint(1) DEFAULT 0,
  `payment_method` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Menunggu Konfirmasi',
  `tracking_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `address`, `address_updated`, `payment_method`, `status`, `tracking_info`) VALUES
(1, 1, '2025-04-08 21:02:07', 'jalan kaki', 0, 'Transfer Bank', 'Dikirim', 'cakung KHBN'),
(2, 1, '2025-04-08 16:09:55', 'aaaaa', 0, 'cod', 'Diproses', NULL),
(3, 1, '2025-04-08 16:10:30', 'AaAA', 0, 'transfer', 'Menunggu Pembayaran', NULL),
(4, 1, '2025-04-08 16:14:45', 'kikiki', 1, 'transfer', 'Menunggu Pembayaran', NULL),
(5, 1, '2025-04-08 16:18:18', 'dfsdrfs', 0, 'cod', 'Diproses', NULL),
(6, 1, '2025-04-08 16:24:01', 'anjay mabar', 0, 'transfer', 'Menunggu Pembayaran', NULL),
(7, 2, '2025-04-08 19:56:01', 'hfxghdghd', 0, 'cod', 'Diproses', NULL),
(8, 1, '2025-04-09 06:42:47', 'asasassa', 0, 'transfer', 'Dikirim', 'DI JALAN JALAN'),
(9, 1, '2025-04-11 14:59:32', 'xccxzcxzczx', 0, 'transfer', 'Dibatalkan', ''),
(10, 1, '2025-04-12 13:48:01', 'dfsdfdf', 0, 'cod', 'Diproses', NULL),
(11, 1, '2025-04-12 15:29:14', 'dukuh atas', 0, 'transfer', 'Menunggu Pembayaran', NULL),
(12, 1, '2025-04-12 15:34:24', 'test', 0, 'transfer', 'Menunggu Pembayaran', NULL),
(13, 1, '2025-04-18 16:29:51', 'halimiun', 1, 'transfer', 'Menunggu Pembayaran', NULL),
(14, 1, '2025-04-18 16:39:37', 'sfdsdsd', 0, 'cod', 'Diproses', NULL),
(15, 1, '2025-04-18 16:50:28', 'jalan kaki bersama saya menyenangkan kan', 1, 'transfer', 'Menunggu Pembayaran', NULL),
(16, 1, '2025-04-18 16:50:46', 'jikk', 1, 'transfer', 'Menunggu Pembayaran', NULL),
(17, 1, '2025-04-18 16:53:55', 'halimun', 1, 'transfer', 'Selesai', ''),
(18, 1, '2025-04-18 17:05:30', 'jakarta', 1, 'transfer', 'Menunggu Pembayaran', NULL),
(19, 1, '2025-04-19 06:41:46', 'hjghjgj', 0, 'transfer', 'Selesai', ''),
(20, 1, '2025-04-26 17:25:30', 'aaaa', 0, 'transfer', 'Menunggu Pembayaran', NULL),
(21, 1, '2025-05-05 08:25:43', 'dgdggd', 0, 'cod', 'Diproses', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 2, 1, NULL),
(2, 1, 3, 1, NULL),
(3, 1, 1, 8, NULL),
(4, 2, 1, 1, 120000.00),
(5, 2, 2, 2, 45000.00),
(6, 4, 1, 1, 120000.00),
(7, 4, 2, 1, 45000.00),
(8, 5, 1, 1, 120000.00),
(9, 5, 2, 1, 45000.00),
(10, 6, 1, 1, 120000.00),
(11, 6, 2, 1, 45000.00),
(12, 6, 3, 1, 90000.00),
(13, 7, 1, 4, 120000.00),
(14, 8, 1, 1, 120000.00),
(15, 8, 2, 1, 45000.00),
(16, 9, 1, 1, 120000.00),
(17, 10, 1, 12, 120000.00),
(18, 10, 2, 1, 45000.00),
(19, 10, 3, 1, 90000.00),
(21, 11, 2, 4, 45000.00),
(22, 11, 3, 1, 90000.00),
(23, 12, 2, 1, 45000.00),
(24, 12, 3, 1, 90000.00),
(25, 13, 1, 1, 99999999.99),
(26, 13, 2, 1, 45000.00),
(27, 13, 3, 1, 90000.00),
(28, 14, 2, 1, 45000.00),
(29, 14, 3, 1, 90000.00),
(30, 15, 2, 1, 45000.00),
(31, 16, 2, 1, 45000.00),
(32, 17, 2, 1, 45000.00),
(33, 18, 1, 3, 99999999.99),
(34, 19, 16, 2, 100000.00),
(35, 19, 2, 1, 45000.00),
(36, 20, 1, 5, 99999999.99),
(37, 20, 2, 2, 45000.00),
(38, 20, 3, 2, 90000.00),
(39, 20, 16, 7, 100000.00),
(40, 21, 3, 1, 90000.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(100) NOT NULL DEFAULT 'Uncategorized'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `category`) VALUES
(1, 'Daging Sapi Premium', 'Daging sapi kualitas ekspor, segar dan halal', 1200000000, 'uploads/67fa4a176c378_daging1.png', 'Uncategorized'),
(2, 'ayam', 'Fillet ayam tanpa tulang, siap masak', 45000, 'uploads/67fa49f62aef2_ging gung.png', 'Uncategorized'),
(3, 'Daging Kambing Muda', 'Kambing muda segar cocok untuk sate', 90000, 'uploads/67fa49ec3358c_daging2.png', 'Uncategorized'),
(16, 'daging ayam', 'paha ayam', 100000, 'uploads/67fa73edb36e8_daging1.png', 'Uncategorized'),
(17, 'ayam segar', 'ayam', 1000000, 'uploads/680bceac5cf0c_frozen.png', 'frozen food'),
(18, 'Fresh Chicken', 'High quality fresh chicken', 50000, 'uploads/chicken.png', 'Poultry'),
(19, 'Seafood Mix', 'Assorted fresh seafood', 75000, 'uploads/seafood.png', 'Seafood'),
(20, 'Beef Steak', 'Premium beef steak', 120000, 'uploads/beef.png', 'Meat'),
(21, 'Frozen Sausages', 'Delicious frozen sausages', 40000, 'uploads/sausages.png', 'Sausages'),
(22, 'Fresh Vegetables', 'Organic fresh vegetables', 30000, 'uploads/vegetables.png', 'Vegetable');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_approved` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `order_id`, `user_id`, `product_id`, `rating`, `review`, `created_at`, `is_approved`) VALUES
(1, 19, 1, 2, 5, 'bagus sekali', '2025-04-26 01:08:07', 1),
(2, 17, 1, 2, 5, 'bagus\r\n', '2025-04-26 08:57:18', 1),
(3, 101, 1, 1, 5, 'Very fresh and tasty chicken!', '2025-04-26 22:29:17', 1),
(4, 102, 2, 2, 4, 'Good variety of seafood.', '2025-04-26 22:29:17', 1),
(5, 103, 3, 3, 5, 'Best beef I have ever had.', '2025-04-26 22:29:17', 1),
(6, 104, 1, 4, 3, 'Sausages were okay.', '2025-04-26 22:29:17', 1),
(7, 105, 2, 5, 4, 'Fresh and crisp vegetables.', '2025-04-26 22:29:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `komentar` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `password`, `role`) VALUES
(1, 'dimas', 'admin', 'raihanzakym@gmail.com', '089508050186', '$2y$10$a5EircPiMoeCNs7a.rVOLOUJdB2xOmkxoB2ijCa5U6FXkiKFwBIR.', 'user'),
(2, 'raihan zaky', 'raihan', 'raihanzakym@gmail.com', '089508050186', '$2y$10$IQZ1r7Q4N9ArTx2SqMr5XegRl.dO7EklwjcY/Brgox1rxKwJ9nypy', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
