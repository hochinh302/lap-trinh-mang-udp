-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2025 at 03:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `worker_manage`
--

-- --------------------------------------------------------

--
-- Table structure for table `hometown`
--

CREATE TABLE `hometown` (
  `id` char(36) NOT NULL DEFAULT 'UUID()',
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hometown`
--

INSERT INTO `hometown` (`id`, `code`, `name`) VALUES
('8b0a2646-791c-11f0-8be5-58112296cf17', 'ha-noi', 'Hà Nội'),
('8b0a27fc-791c-11f0-8be5-58112296cf17', 'ha-giang', 'Hà Giang'),
('8b0a2860-791c-11f0-8be5-58112296cf17', 'cao-bang', 'Cao Bằng'),
('8b0a287e-791c-11f0-8be5-58112296cf17', 'bac-kan', 'Bắc Kạn'),
('8b0a2898-791c-11f0-8be5-58112296cf17', 'tuyen-quan', 'Tuyên Quang'),
('8b0a28dd-791c-11f0-8be5-58112296cf17', 'lao-cai', 'Lào Cai'),
('8b0a28fa-791c-11f0-8be5-58112296cf17', 'dien-bien', 'Điện Biên'),
('8b0a293c-791c-11f0-8be5-58112296cf17', 'lai-chau', 'Lai Châu'),
('8b0a2959-791c-11f0-8be5-58112296cf17', 'son-la', 'Sơn La'),
('8b0a2998-791c-11f0-8be5-58112296cf17', 'yen-bai', 'Yên Bái'),
('8b0a29b2-791c-11f0-8be5-58112296cf17', 'hoa-binh', 'Hòa Bình'),
('8b0a29c8-791c-11f0-8be5-58112296cf17', 'thai-nguye', 'Thái Nguyên'),
('8b0a29e6-791c-11f0-8be5-58112296cf17', 'lang-son', 'Lạng Sơn'),
('8b0a29fd-791c-11f0-8be5-58112296cf17', 'quang-ninh', 'Quảng Ninh'),
('8b0a2a12-791c-11f0-8be5-58112296cf17', 'bac-giang', 'Bắc Giang'),
('8b0a2a28-791c-11f0-8be5-58112296cf17', 'phu-tho', 'Phú Thọ'),
('8b0a2a3e-791c-11f0-8be5-58112296cf17', 'vinh-phuc', 'Vĩnh Phúc'),
('8b0a2a58-791c-11f0-8be5-58112296cf17', 'bac-ninh', 'Bắc Ninh'),
('8b0a2a71-791c-11f0-8be5-58112296cf17', 'hai-duong', 'Hải Dương'),
('8b0a2a88-791c-11f0-8be5-58112296cf17', 'hai-phong', 'Hải Phòng'),
('8b0a2a9d-791c-11f0-8be5-58112296cf17', 'hung-yen', 'Hưng Yên'),
('8b0a2adc-791c-11f0-8be5-58112296cf17', 'thai-binh', 'Thái Bình'),
('8b0a2af2-791c-11f0-8be5-58112296cf17', 'ha-nam', 'Hà Nam'),
('8b0a2b0a-791c-11f0-8be5-58112296cf17', 'nam-dinh', 'Nam Định'),
('8b0a2b1f-791c-11f0-8be5-58112296cf17', 'ninh-binh', 'Ninh Bình'),
('8b0a2b5d-791c-11f0-8be5-58112296cf17', 'thanh-hoa', 'Thanh Hóa'),
('8b0a2bc3-791c-11f0-8be5-58112296cf17', 'nghe-an', 'Nghệ An'),
('8b0a2bdb-791c-11f0-8be5-58112296cf17', 'ha-tinh', 'Hà Tĩnh'),
('8b0a2bf2-791c-11f0-8be5-58112296cf17', 'quang-binh', 'Quảng Bình'),
('8b0a2c08-791c-11f0-8be5-58112296cf17', 'quang-tri', 'Quảng Trị'),
('8b0a2c1f-791c-11f0-8be5-58112296cf17', 'thua-thien', 'Thừa Thiên Huế'),
('8b0a2c37-791c-11f0-8be5-58112296cf17', 'da-nang', 'Đà Nẵng'),
('8b0a2c4d-791c-11f0-8be5-58112296cf17', 'quang-nam', 'Quảng Nam'),
('8b0a2c62-791c-11f0-8be5-58112296cf17', 'quang-ngai', 'Quảng Ngãi'),
('8b0a2c78-791c-11f0-8be5-58112296cf17', 'binh-dinh', 'Bình Định'),
('8b0a2c8d-791c-11f0-8be5-58112296cf17', 'phu-yen', 'Phú Yên'),
('8b0a2ca3-791c-11f0-8be5-58112296cf17', 'khanh-hoa', 'Khánh Hòa'),
('8b0a2cb8-791c-11f0-8be5-58112296cf17', 'ninh-thuan', 'Ninh Thuận'),
('8b0a2cce-791c-11f0-8be5-58112296cf17', 'binh-thuan', 'Bình Thuận'),
('8b0a2ce4-791c-11f0-8be5-58112296cf17', 'kon-tum', 'Kon Tum'),
('8b0a2cfa-791c-11f0-8be5-58112296cf17', 'gia-lai', 'Gia Lai'),
('8b0a2d0f-791c-11f0-8be5-58112296cf17', 'dak-lak', 'Đắk Lắk'),
('8b0a2d25-791c-11f0-8be5-58112296cf17', 'dak-nong', 'Đắk Nông'),
('8b0a2d3d-791c-11f0-8be5-58112296cf17', 'lam-dong', 'Lâm Đồng'),
('8b0a2d54-791c-11f0-8be5-58112296cf17', 'binh-phuoc', 'Bình Phước'),
('8b0a2d6a-791c-11f0-8be5-58112296cf17', 'tay-ninh', 'Tây Ninh'),
('8b0a2d82-791c-11f0-8be5-58112296cf17', 'binh-duong', 'Bình Dương'),
('8b0a2d97-791c-11f0-8be5-58112296cf17', 'dong-nai', 'Đồng Nai'),
('8b0a2dac-791c-11f0-8be5-58112296cf17', 'ba-ria-vun', 'Bà Rịa - Vũng Tàu'),
('8b0a2dc8-791c-11f0-8be5-58112296cf17', 'ho-chi-min', 'TP Hồ Chí Minh'),
('8b0a2ddf-791c-11f0-8be5-58112296cf17', 'long-an', 'Long An'),
('8b0a2df5-791c-11f0-8be5-58112296cf17', 'tien-giang', 'Tiền Giang'),
('8b0a2e0e-791c-11f0-8be5-58112296cf17', 'ben-tre', 'Bến Tre'),
('8b0a2e23-791c-11f0-8be5-58112296cf17', 'tra-vinh', 'Trà Vinh'),
('8b0a2e39-791c-11f0-8be5-58112296cf17', 'vinh-long', 'Vĩnh Long'),
('8b0a2e4e-791c-11f0-8be5-58112296cf17', 'dong-thap', 'Đồng Tháp'),
('8b0a2e63-791c-11f0-8be5-58112296cf17', 'an-giang', 'An Giang'),
('8b0a2e79-791c-11f0-8be5-58112296cf17', 'kien-giang', 'Kiên Giang'),
('8b0a2e8d-791c-11f0-8be5-58112296cf17', 'can-tho', 'Cần Thơ'),
('8b0a2ea3-791c-11f0-8be5-58112296cf17', 'hau-giang', 'Hậu Giang'),
('8b0a2eb9-791c-11f0-8be5-58112296cf17', 'soc-trang', 'Sóc Trăng'),
('8b0a2ece-791c-11f0-8be5-58112296cf17', 'bac-lieu', 'Bạc Liêu'),
('8b0a2ee6-791c-11f0-8be5-58112296cf17', 'ca-mau', 'Cà Mau');

-- --------------------------------------------------------

--
-- Table structure for table `worker`
--

CREATE TABLE `worker` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birth_year` int(11) DEFAULT NULL,
  `hometown_id` varchar(10) DEFAULT NULL,
  `salary` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `worker`
--

INSERT INTO `worker` (`id`, `name`, `birth_year`, `hometown_id`, `salary`) VALUES
('3103539f-0c73-48f5-8b94-2b85139dc406', 'Nguyễn Hoàng Nam', 2000, 'ha-noi', 41155112.00),
('38c3b99e-0cc3-43ba-909c-0b193207366a', 'Bùi Duy Mạnh', 2002, 'ha-giang', 100000.00),
('528b1e76-782e-4d0d-a4fe-c1f67bdc933e', 'Đoàn Khánh Toàn', 2002, 'quang-ninh', 10000000.00),
('648dc9af-c85b-4657-bd28-01d4fd69a925', 'Hồ Thân Chính', 2002, 'ha-noi', 2000000.00),
('e7d87114-4dc4-4bcb-97f6-c590692edbeb', 'Hồ Văn Nam', 2002, 'bac-kan', 10000000.00),
('fb076dd7-2ca2-49b0-a35c-35422294c5f8', 'Hồ Thị Trinh', 2004, 'nghe-an', 5000000000.00),
('fc73c79d-fd61-4892-82e6-61e9de81dabe', 'Lê Phùng Sơn', 2002, 'thai-nguye', 150000000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hometown`
--
ALTER TABLE `hometown`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_worker_hometown` (`hometown_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `fk_worker_hometown` FOREIGN KEY (`hometown_id`) REFERENCES `hometown` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
