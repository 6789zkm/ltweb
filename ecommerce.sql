-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2025 at 10:05 AM
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
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`) VALUES
(1, 5),
(8, 12),
(9, 12),
(10, 12),
(11, 12),
(12, 12),
(13, 12),
(14, 12),
(15, 12),
(16, 12),
(17, 12),
(18, 12),
(19, 12),
(20, 15);

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_sku_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_at` date DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `create_at`, `gender_id`) VALUES
(1, 'áo nam', NULL, 1),
(2, 'quần nam', NULL, 1),
(3, 'áo nữ', '2025-01-11', 2),
(4, 'quần nữ', '2025-01-11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`, `code`) VALUES
(1, 'white', '#E5E2DC'),
(2, 'brown', '#B08F6F'),
(3, 'yellow', '#EDB45A'),
(4, 'red', '#7F212D'),
(5, 'orange', '#EEC6AD'),
(6, 'green', '#0D684D'),
(7, 'blue', '#9EB6D6'),
(8, 'pink', '#E8CFD3'),
(9, 'puple', '#C9B2D3'),
(10, 'beige', '#C6AD8D'),
(11, 'gray', '#D4D4D4'),
(12, 'olive', '#464030'),
(13, 'navy', '#232535'),
(14, 'black', '#1A191C');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`, `create_at`) VALUES
(1, 'nam', NULL),
(2, 'nữ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `product_sku_id` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_sku_id`, `stock`) VALUES
(56, 63, 10),
(57, 64, 12),
(58, 65, 5),
(59, 66, 5),
(60, 67, 2),
(61, 68, 15),
(63, 70, 5),
(64, 71, 3),
(65, 72, 8),
(66, 73, 11),
(67, 74, 12),
(68, 75, 15),
(69, 76, 12),
(70, 77, 14),
(71, 78, 20),
(72, 79, 20),
(73, 80, 20),
(74, 81, 20),
(75, 82, 2),
(76, 83, 4),
(77, 84, 7),
(78, 85, 7),
(79, 86, 7),
(80, 87, 1),
(81, 88, 25),
(82, 89, 3),
(83, 90, 4),
(84, 91, 4),
(85, 92, 5),
(86, 93, 5),
(87, 94, 10),
(88, 95, 9),
(89, 96, 12),
(90, 97, 12),
(91, 98, 12),
(92, 99, 12),
(93, 100, 12),
(94, 101, 12),
(95, 102, 12),
(96, 103, 15),
(97, 104, 15),
(98, 105, 14),
(99, 106, 15),
(100, 107, 15),
(101, 108, 4),
(102, 109, 4),
(103, 110, 0),
(104, 111, 1),
(105, 112, 11),
(106, 113, 5),
(107, 114, 2),
(108, 115, 3),
(109, 116, 3),
(110, 117, 3),
(111, 118, 1),
(112, 119, 1),
(113, 120, 10),
(114, 121, 12),
(115, 122, 4),
(116, 123, 4),
(117, 124, 4),
(118, 125, 4),
(119, 126, 4),
(120, 127, 3),
(121, 128, 6),
(122, 129, 9),
(123, 130, 7),
(124, 131, 7),
(125, 132, 7),
(126, 133, 7),
(127, 134, 7),
(128, 135, 7),
(129, 136, 7),
(130, 137, 7),
(131, 138, 12),
(132, 139, 12),
(133, 140, 12),
(134, 141, 12),
(135, 142, 12),
(136, 143, 12),
(137, 144, 2),
(138, 145, 23),
(139, 146, 12),
(140, 147, 12),
(141, 148, 12),
(142, 149, 12),
(143, 150, 12),
(144, 151, 12),
(145, 152, 4),
(146, 153, 4),
(147, 154, 4),
(148, 155, 4),
(149, 156, 12),
(150, 157, 12),
(151, 158, 12),
(152, 159, 12),
(153, 160, 12),
(154, 161, 4),
(155, 162, 4),
(156, 163, 12),
(157, 164, 11),
(158, 165, 12),
(159, 166, 12),
(160, 167, 12),
(161, 168, 12),
(162, 169, 12),
(163, 170, 12),
(164, 171, 12),
(165, 172, 12),
(166, 173, 12),
(167, 174, 12),
(168, 175, 12),
(169, 176, 12),
(170, 177, 12),
(171, 178, 1),
(172, 179, 1),
(173, 180, 5),
(174, 181, 5),
(175, 182, 5),
(176, 183, 5),
(177, 184, 2),
(178, 185, 1),
(179, 186, 3),
(180, 187, 12),
(181, 188, 2),
(182, 189, 2),
(183, 190, 12),
(184, 191, 12),
(185, 192, 12),
(186, 193, 12),
(187, 194, 12),
(188, 195, 12),
(189, 196, 12),
(190, 197, 12),
(191, 198, 12),
(192, 199, 12),
(193, 200, 12),
(194, 201, 4),
(195, 202, 4),
(196, 203, 4),
(197, 204, 5),
(198, 205, 56),
(199, 206, 12),
(200, 207, 12),
(201, 208, 12),
(202, 209, 8),
(203, 210, 8),
(204, 211, 12),
(205, 212, 12),
(206, 213, 12),
(207, 214, 12),
(208, 215, 12),
(209, 216, 12),
(210, 217, 12),
(211, 218, 12),
(212, 219, 12),
(213, 220, 4),
(214, 221, 4),
(215, 222, 4),
(216, 223, 4),
(217, 224, 12),
(218, 225, 12),
(219, 226, 5),
(220, 227, 5),
(221, 228, 5),
(222, 229, 5),
(223, 230, 12),
(224, 231, 12),
(225, 232, 12),
(226, 233, 12),
(227, 234, 12),
(228, 235, 12),
(229, 236, 12),
(230, 237, 12),
(231, 238, 12),
(232, 239, 5),
(233, 240, 5),
(234, 241, 5),
(235, 242, 7),
(236, 243, 7),
(237, 244, 7),
(238, 245, 7),
(239, 246, 7),
(240, 247, 7),
(241, 248, 23),
(242, 249, 23),
(243, 250, 12),
(244, 251, 12),
(245, 252, 12),
(246, 253, 12),
(247, 254, 12),
(248, 255, 23),
(249, 256, 23),
(250, 257, 2),
(251, 258, 23),
(252, 259, 2),
(253, 260, 12),
(254, 261, 12),
(255, 262, 1),
(256, 263, 1),
(257, 264, 1),
(258, 265, 12),
(259, 266, 12),
(260, 267, 12),
(261, 268, 12),
(262, 269, 6),
(263, 270, 6),
(264, 271, 6),
(265, 272, 6),
(266, 273, 6),
(267, 274, 6),
(268, 275, 64),
(269, 276, 64),
(270, 277, 12),
(271, 278, 64),
(272, 279, 12),
(273, 280, 12),
(274, 281, 3),
(275, 282, 3),
(276, 283, 3),
(277, 284, 12),
(278, 285, 12),
(279, 286, 12),
(280, 287, 12),
(281, 288, 12),
(282, 289, 12),
(283, 290, 5),
(284, 291, 5),
(285, 292, 5),
(286, 293, 5),
(287, 294, 5),
(288, 295, 5),
(289, 296, 8),
(290, 297, 8),
(291, 298, 8),
(292, 299, 12),
(293, 300, 12),
(294, 301, 12),
(295, 302, 12),
(296, 303, 12),
(297, 304, 12),
(298, 305, 12),
(299, 306, 12),
(300, 307, 12),
(301, 308, 12),
(302, 309, 12),
(303, 310, 12),
(304, 311, 12),
(305, 312, 12),
(306, 313, 12),
(307, 314, 12),
(308, 315, 12),
(309, 316, 12),
(310, 317, 5),
(311, 318, 12),
(312, 319, 4),
(313, 320, 4),
(314, 321, 4),
(315, 322, 12),
(316, 323, 12),
(317, 324, 12),
(318, 325, 12),
(319, 326, 12),
(320, 327, 2),
(321, 328, 2),
(322, 329, 2),
(323, 330, 3),
(324, 331, 3),
(325, 332, 3),
(326, 333, 12),
(327, 334, 12),
(328, 335, 2),
(329, 336, 12),
(330, 337, 12),
(331, 338, 12),
(332, 339, 12),
(333, 340, 12),
(334, 341, 12),
(335, 342, 12),
(336, 343, 4),
(337, 344, 4),
(338, 345, 3),
(339, 346, 7),
(340, 347, 7),
(341, 348, 7),
(342, 349, 7),
(343, 350, 6),
(344, 351, 6),
(345, 352, 6),
(346, 353, 6),
(347, 354, 6),
(348, 355, 6),
(349, 356, 12),
(350, 357, 12),
(351, 358, 12),
(352, 359, 12),
(353, 360, 4),
(354, 361, 12),
(355, 362, 12),
(356, 363, 12),
(357, 364, 12),
(358, 365, 12),
(359, 366, 12),
(360, 367, 12),
(361, 368, 12),
(362, 369, 23),
(363, 370, 23),
(364, 371, 23),
(365, 372, 3),
(366, 373, 3),
(367, 374, 23),
(368, 375, 12),
(369, 376, 12),
(370, 377, 12),
(371, 378, 12),
(372, 379, 12),
(373, 380, 12),
(374, 381, 12),
(375, 382, 12),
(376, 383, 12),
(377, 384, 12),
(378, 385, 12),
(379, 386, 12),
(380, 387, 12),
(381, 388, 12),
(382, 389, 12),
(383, 390, 3),
(384, 391, 3),
(385, 392, 3),
(386, 393, 3),
(387, 394, 6),
(388, 395, 6),
(389, 396, 6),
(390, 397, 6),
(391, 398, 6),
(392, 399, 12),
(393, 400, 12),
(394, 401, 12),
(395, 402, 12),
(396, 403, 12),
(397, 404, 2),
(398, 405, 2),
(399, 406, 3),
(400, 407, 3),
(401, 408, 7),
(402, 409, 7),
(403, 410, 7),
(404, 411, 7),
(405, 412, 7),
(406, 413, 7),
(407, 414, 12),
(408, 415, 12),
(409, 416, 1),
(410, 417, 12),
(417, 424, 12),
(418, 425, 12),
(419, 426, 10),
(420, 427, 10),
(421, 428, 15),
(422, 429, 15),
(423, 430, 20),
(424, 431, 10),
(425, 432, 15),
(426, 433, 18),
(427, 434, 25),
(428, 435, 10),
(429, 436, 15),
(430, 437, 15),
(431, 438, 20),
(432, 439, 12),
(433, 440, 3),
(434, 441, 26),
(435, 442, 5),
(436, 443, 15),
(437, 444, 2),
(438, 445, 2),
(439, 446, 12),
(440, 447, 10),
(441, 448, 12),
(442, 449, 1),
(443, 450, 12),
(444, 451, 3),
(445, 452, 5),
(446, 453, 1),
(447, 454, 10),
(448, 455, 10),
(449, 456, 10),
(450, 457, 10),
(451, 458, 10),
(452, 459, 20),
(453, 460, 2),
(454, 461, 10),
(455, 462, 12),
(456, 463, 5),
(457, 464, 5),
(458, 465, 18),
(459, 466, 12),
(460, 467, 5),
(461, 468, 3),
(462, 469, 2),
(463, 470, 2),
(464, 471, 5),
(465, 472, 9),
(466, 473, 10),
(467, 474, 8),
(468, 475, 20),
(469, 476, 7),
(470, 477, 3),
(471, 478, 12),
(472, 479, 12),
(473, 480, 8),
(474, 481, 8),
(475, 482, 15),
(476, 483, 3),
(477, 484, 13),
(478, 485, 15),
(479, 486, 18),
(480, 487, 3),
(481, 488, 12),
(482, 489, 15),
(483, 490, 12),
(484, 491, 10),
(485, 492, 20),
(486, 493, 10),
(487, 494, 15),
(488, 495, 25),
(489, 496, 15),
(490, 497, 10),
(491, 498, 3),
(492, 499, 5),
(493, 500, 16),
(494, 501, 5),
(495, 502, 10),
(496, 503, 20),
(497, 504, 15),
(498, 505, 8),
(499, 506, 12),
(500, 507, 8),
(501, 508, 25),
(502, 509, 5),
(503, 510, 13),
(504, 511, 15),
(505, 512, 18),
(506, 513, 18),
(507, 514, 10),
(508, 515, 14),
(509, 516, 15),
(510, 517, 2),
(511, 518, 3),
(512, 519, 5),
(513, 520, 10),
(514, 521, 9),
(515, 522, 5),
(516, 523, 2),
(517, 524, 5),
(518, 525, 12),
(519, 526, 5),
(520, 527, 10),
(521, 528, 12),
(522, 529, 5),
(523, 530, 15),
(524, 531, 25),
(525, 532, 10),
(526, 533, 20),
(527, 534, 10),
(528, 535, 5),
(529, 536, 8),
(530, 537, 15),
(531, 538, 12),
(532, 539, 3),
(533, 540, 5),
(534, 541, 10),
(535, 542, 5),
(536, 543, 15),
(537, 544, 5),
(538, 545, 18),
(539, 546, 5),
(540, 547, 8),
(541, 548, 5),
(542, 549, 12),
(543, 550, 3),
(544, 551, 20),
(545, 552, 5),
(546, 553, 8),
(547, 554, 5),
(548, 555, 15),
(549, 556, 26),
(550, 557, 3),
(551, 558, 25),
(552, 559, 19),
(553, 560, 6),
(554, 561, 12),
(555, 562, 5),
(556, 563, 8),
(557, 564, 3),
(558, 565, 3),
(559, 566, 17),
(560, 567, 28),
(561, 568, 3),
(562, 569, 1),
(563, 570, 5),
(564, 571, 5),
(565, 572, 7),
(566, 573, 12),
(567, 574, 5),
(568, 575, 7),
(569, 576, 8),
(570, 577, 8),
(571, 578, 6),
(572, 579, 3),
(573, 580, 5),
(574, 581, 9),
(575, 582, 12),
(576, 583, 3),
(577, 584, 5),
(578, 585, 10),
(579, 586, 5),
(580, 587, 8),
(581, 588, 9),
(582, 589, 9),
(583, 590, 3),
(584, 591, 8),
(585, 592, 18),
(586, 593, 6),
(587, 594, 10),
(588, 595, 20),
(589, 596, 15),
(590, 597, 15),
(591, 598, 15),
(592, 599, 10),
(593, 600, 5),
(594, 601, 8),
(595, 602, 6),
(596, 603, 25),
(597, 604, 8),
(598, 605, 6),
(599, 606, 15),
(600, 607, 26),
(601, 608, 25),
(602, 609, 13),
(603, 610, 15),
(604, 611, 15),
(605, 612, 13),
(606, 613, 5),
(607, 614, 12),
(608, 615, 11),
(609, 616, 8),
(610, 617, 9),
(611, 618, 8),
(612, 619, 9),
(613, 620, 6),
(614, 621, 12),
(615, 622, 16);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_status` enum('ĐANG_CHỜ','ĐÃ_HOÀN_THÀNH','ĐÃ_HỦY') NOT NULL,
  `total_price` float NOT NULL,
  `create_at` date DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `sign` text DEFAULT NULL,
  `publicKey` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `order_status`, `total_price`, `create_at`, `customer_email`, `customer_name`, `customer_phone`, `customer_address`, `sign`, `publicKey`) VALUES
(49, NULL, 'ĐANG_CHỜ', 540000, '2025-05-08', '', 'Pham Quoc Khanh', '0565522023', 'Thị xã Dĩ An', NULL, NULL),
(54, 15, 'ĐANG_CHỜ', 784000, '2025-05-17', 'khachhang4@gmail.com', 'Khach Hang 4', '8400932141', 'Thanh Sao Vuong', NULL, NULL),
(55, 15, 'ĐANG_CHỜ', 1176000, '2025-05-17', 'khachhang4@gmail.com', 'Khach Hang 4', '8400932141', 'Thanh Sao Vuong', NULL, NULL),
(58, 15, 'ĐANG_CHỜ', 680000, '2025-05-19', 'khachhang4@gmail.com', 'Khach Hang 4', '8400932141', 'Thanh Sao Vuong', NULL, NULL),
(59, 15, 'ĐANG_CHỜ', 833000, '2025-05-19', 'khachhang4@gmail.com', 'Khach Hang 4', '8400932141', 'Thanh Sao Vuong', NULL, NULL),
(60, 15, 'ĐANG_CHỜ', 441000, '2025-05-19', 'khachhang4@gmail.com', 'Khach Hang 4', '8400932141', 'Thanh Sao Vuong', 'E6Hms1bv7Wv/cJK+ajYy6lCiA5cyRBvV/UOdMahiFXOV0rav2NNvDuJlgJxyAqKrV7DSSwCo8XXbiMqogx64//bT8otSfFXUYNUd7wNok1/7eqF3T7ZFdfUzd/I0s9cvXQNnnUib4R/x6maO2APq21bF0l93r/LCI9twjcPnZPb5vYm/rAJ+0ALmGJ+xxFtjCY9M4dO1uyaQPvYl5xF9u72YfigOLOq7RYNY/VL7GYOHFT7KLhxOcyA9u+vh5+eLSwNIZNVc0TZPgbXafol3qYH3RQYMS+xLjxvv6/suZSBb+ZdXavOhHXEQU1Ki3fEOBDUE6nrJQqWRg3yzqNoEVg==', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6zcFkp+0koYhLS7bp9PvZA2uMwJ0XPApV4MmTlGu4uvrdxbhAD+zBdK0NoE75rjXTlF/Ik9/bbe/wJmRdcpNuK8txGgCEH0AXnQPgXe9QWkkYBkmpBXEl2uzfjD4yF/rfb7l7qaatnlj2B1hCsVElWTiaP0p9l4BPPN62e5U2vvtRHJC0VAzReT5IrHgmuNr9dK0JEiAIO7M/LVxogd0uTWr+gtSn/B0atEeLwRNehjS6+OvOVZZYRRovx0ueZ1n0GbzUfNG3DhImmYrSDdoa+s04bXb+2FfHdDyxd+TjnIlCID3H4L5DlgqeIodSJkBq8dZR4JjTWbCWKPUwT6nmQIDAQAB');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_sku_id` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_sku_id`, `price`, `quantity`) VALUES
(47, 49, 472, 540000, 1),
(49, 54, 95, 392000, 2),
(50, 55, 114, 392000, 1),
(51, 55, 105, 392000, 1),
(52, 55, 73, 392000, 1),
(57, 58, 164, 239000, 1),
(58, 58, 127, 441000, 1),
(59, 60, 129, 441000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `sub_category_id`) VALUES
(91, 'Áo thun nam tay ngắn đắp vải trang trí. Regular', '', 1),
(93, 'Áo thun nam tay ngắn hình thêu. Regular', '', 1),
(94, 'Áo thun nam ngắn tay S Cafe có thêu. Fitted', '', 1),
(95, 'Áo thun tay ngắn nam.Relax', '', 1),
(96, 'Áo thun nam tay ngắn hình in. Regular', '', 1),
(97, ' Áo thun tay ngắn nam có thêu. Regular', '', 1),
(98, ' Áo thun tay ngắn có in. Loose', '', 1),
(99, 'Áo thun nam tay ngắn. Fitted', '', 1),
(100, 'Áo thun tay ngắn nam có in. Loose', '', 1),
(101, 'Áo thun nam ngắn tay S Cafe thêu. Loose', '', 1),
(102, ' Áo thun nam carbon. FITTED', '', 1),
(103, ' Áo Thun Nam Carbon Dập Nổi . FITTED', '', 1),
(104, ' Áo thun nam carbon. FITTED', '', 1),
(105, ' Áo thun tay ngắn nhãn trang trí. LOOSE', '', 1),
(106, 'Áo polo nam. Fitted', '', 2),
(107, 'Áo polo nam trang trí cổ premium. Fitted', '', 2),
(108, ' Áo Polo tay raglan phối màu. FITTED', '', 2),
(109, ' Áo polo phối bo sườn. Fitted', '', 2),
(110, 'Áo polo sọc ngang nhãn trang trí. Boxy', '', 2),
(111, ' Áo polo phối cổ tay.Loose', '', 2),
(112, ' Áo Polo nam phối sọc. FITTED', '', 2),
(113, 'Áo polo active .Regular', '', 2),
(114, ' Áo sơ mi tay dài nam. Fitted', '', 3),
(115, 'Áo sơ mi nam dài tay flannel. Oversize', '', 3),
(116, 'Áo sơ mi dài tay nam Flannel thêu. Loose', '', 3),
(117, ' Áo sơ mi dài tay nam Flannel túi đắp. Regular', '', 3),
(118, ' Áo sơ mi tay ngắn in. Regular', '', 3),
(119, 'Áo sơ mi tay ngắn oxford. Fitted', '', 3),
(120, ' Áo sơ mi sọc ngắn tay. Fitted', '', 3),
(121, ' Áo sơ mi denim nam. Loose', '', 3),
(122, ' Áo sơ mi jean sọc. Oversize', '', 3),
(123, ' Áo sơ mi nam denim. Regular', '', 3),
(124, 'Áo sơ mi nam ngắn tay. Loose', '', 3),
(125, 'Áo sơ mi tay ngắn có túi. Loose', '', 3),
(126, ' Áo sơ mi jean unisex. Loose', '', 3),
(127, ' Áo sơ mi nam ngắn tay. Oversize', '', 3),
(128, 'Áo sơ mi jean tay ngắn nam. Loose', '', 3),
(129, ' Quần jeans nam. Slim', '', 5),
(130, ' Quần jeans nam. Straight', '', 5),
(131, ' Quần denim nam. Wide leg', '', 5),
(132, ' Quần jean nam diễu thân .Straight', '', 5),
(133, ' Quần jean nam trơn.Slim', '', 5),
(134, ' Quần Jeans nam.Slim cropped', '', 5),
(135, 'Quần denim lưng liền. Cocoon', '', 5),
(136, 'Quần denim nam. Straight cropped', '', 5),
(137, 'Quần jean trơn.Straight crop', '', 5),
(138, ' Quần Jean nam vải twill.Slim', '', 5),
(139, ' Quần jean nam garment dye. Straight cropped', '', 5),
(140, ' Quần jeans nam dài. Flared', '', 5),
(141, 'Quần jeans nam trơn. Slimfit', '', 5),
(142, ' Quần dài khaki. Wide leg', '', 6),
(143, ' Quần khaki nam dài. Slim cropped', '', 6),
(144, ' Quần khaki dài. slim cropped', '', 6),
(145, ' Quần khaki nam dài. Slim', '', 6),
(146, ' Quần cargo nam. Wide leg', '', 6),
(147, ' Quần kaki nam. Wide leg', '', 6),
(148, ' Quần dài kaki. Slim crop', '', 6),
(149, ' Quần dài khaki. Straight crop', '', 6),
(150, 'Quần khaki dài gập ly. Slimcrop', '', 6),
(151, ' Quần dài chinos. Slim crop', '', 6),
(152, 'Quần dài khaki lưng thun. Relax', '', 6),
(153, ' Quần dài khaki thun lai. Slim crop', '', 6),
(154, ' Quần tây dài straight lưng thun. Straight', '', 8),
(155, ' Quần dài khaki. Wide leg', '', 8),
(156, ' Quần tây dài nam. Slim cropped', '', 8),
(157, ' Quần tây dài. Slim', '', 8),
(158, ' Quần tây nam dài. Slim cropped', '', 8),
(159, ' Quần tây nam dài. Slim', '', 8),
(160, ' Quần tây. Slim', '', 8),
(161, ' Quần dài vải phối chỉ. Slim', '', 8),
(162, ' Quần dài vải lưng thun điều chỉnh. Slim', '', 8),
(163, ' Quần dài vải lưng thun. Slim crop', '', 8),
(164, ' Quần dài vải gập ly. Slim', '', 8),
(165, ' Quần short jeans nam. Relax', '', 7),
(166, ' Quần short nam ống rộng. Loose', '', 7),
(167, ' Quần short jeans nam. Straight', '', 7),
(168, ' Quần short jeans nam. Straight', '', 7),
(169, ' Quần short nam. Relax', '', 7),
(170, ' Quần bơi nam họa tiết. Straight', '', 7),
(171, ' Quần short lưng chun. Relax', '', 7),
(172, ' Quần bơi in phối dây rút. Regular', '', 7),
(173, ' Quần short nỉ nam. Loose', '', 7),
(174, ' Quần shorts sọc dọc. Relax', '', 7),
(175, ' Quần shorts nỉ nhãn trang trí. Relax', '', 7),
(176, ' Quần short denim nam. Straight', '', 7),
(183, 'Áo polo nữ. Fitted cropped', '', 9),
(184, 'Áo thun tay ngắn nữ tape trang trí.Regular', '', 9),
(185, 'Áo thun tay ngắn nữ thêu.Regular', '', 9),
(186, 'Áo nữ tay ngắn vải linen. Regular cropped', '', 9),
(187, 'Áo thun tay ngắn nữ sọc gân. Fitted Cropped', '', 9),
(188, 'Áo thun tay ngắn gập gấu. Loose cropped', '', 9),
(189, 'Áo sơ mi tay ngắn nữ sọc kẻ. Loose', '', 10),
(190, 'Áo sơ mi tay dài nữ. Loose', '', 10),
(191, 'Áo sơ mi nữ sọc tay dài. Regular cropped', '', 10),
(192, 'Áo sơ mi jean unisex. Oversize', '', 10),
(193, 'Áo sơ mi nữ ngắn tay. Loose', '', 10),
(194, 'Áo sơ mi tay dài nữ sọc. Loose', '', 10),
(195, 'Áo khoác dệt kim cardigan nữ tay dài cổ tròn. Regular', '', 11),
(196, 'Áo dệt kim nữ tay dài cổ kẻ sọc. Loose', '', 11),
(197, 'Áo cộc tay dệt kim hoạ tiết. Regular', '', 11),
(198, 'Áo dệt kim nữ tay dài cổ V. Regular cropped', '', 11),
(199, 'Áo nữ dệt kim tay dài cổ tròn. Regular', '', 11),
(200, 'Áo dệt kim nữ sát nách. Fitted cropped', '', 11),
(201, 'Áo khoác nữ recycled. Oversize', '', 12),
(202, 'Áo khoác cổ rời.Regular', '', 12),
(203, 'Áo khoác denim nữ. Loose', '', 12),
(204, 'Áo khoác tay dài. Loose cropped', '', 12),
(205, 'Áo khoác thể thao nữ chống tia UV. Loose', '', 12),
(206, 'Áo khoác thể thao nữ chống tia UV.Loose', '', 12),
(207, 'Quần denim nữ. Straight', '', 13),
(208, 'Quần jeans nữ. Straight', '', 13),
(209, 'Quần jeans nữ. Wide Leg', '', 13),
(210, 'Quần jeans nữ. Carrot', '', 13),
(211, 'Quần denim nữ. Straight', '', 13),
(212, 'Quần jeans nữ. Straight', '', 13),
(213, 'Quần dài xếp ly trước lệch sườn.Carrot', '', 14),
(214, 'Quần dài xếp ly trước. Carrot', '', 14),
(215, 'Quần dài lưng thun. Wide leg', '', 14),
(216, 'Quần dài xếp ly trước rã trang trí.Carrot', '', 14),
(217, 'Quần dài nữ. Straight', '', 14),
(218, 'Quần dài nữ lưng thun rút dây.Relax', '', 14),
(219, 'Quần khaki nữ dài. Cocoon', '', 15),
(220, 'Quần khaki ủi ly. Straight', '', 15),
(221, 'Quần khaki ống rộng ly đôi. Wide Leg', '', 15),
(222, 'Quần dài xếp ly.Wide Leg', '', 15),
(223, 'Quần dài túi xéo. Straight', '', 15),
(224, 'Quần short nữ diễu mí gân. Relax', '', 16),
(225, 'Quần sweatpants unisex. Relax', '', 16),
(226, 'Quần short nữ. Relax', '', 16),
(227, 'Quần sweatpants túi ốp trước.WIDE LEG', '', 16),
(228, 'Quần dài nỉ unisex. Relax', '', 16);

-- --------------------------------------------------------

--
-- Table structure for table `product_color_img`
--

CREATE TABLE `product_color_img` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `image` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_color_img`
--

INSERT INTO `product_color_img` (`id`, `product_id`, `color_id`, `image`) VALUES
(84, 91, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_tay_ngắn_đắp_vải_trang_trí._Regular_beige.jpg'),
(85, 91, 11, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_tay_ngắn_đắp_vải_trang_trí._Regular_gray.jpg'),
(87, 93, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_tay_ngắn_hình_thêu._Regular_white.jpg'),
(88, 93, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_tay_ngắn_hình_thêu._Regular_black.jpg'),
(89, 94, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_ngắn_tay_S_Cafe_có_thêu._Fitted_black.jpg'),
(90, 94, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_ngắn_tay_S_Cafe_có_thêu._Fitted_white.jpg'),
(91, 94, 4, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_ngắn_tay_S_Cafe_có_thêu._Fitted_red.jpg'),
(92, 95, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nam.Relax_white.jpg'),
(93, 95, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nam.Relax_black.jpg'),
(94, 96, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_tay_ngắn_hình_in._Regular_black.jpg'),
(95, 96, 4, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_tay_ngắn_hình_in._Regular_red.jpg'),
(96, 97, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_tay_ngắn_nam_có_thêu._Regular_pink.jpg'),
(97, 97, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_tay_ngắn_nam_có_thêu._Regular_black.jpg'),
(98, 97, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_tay_ngắn_nam_có_thêu._Regular_brown.jpg'),
(99, 97, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_tay_ngắn_nam_có_thêu._Regular_white.jpg'),
(100, 98, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_tay_ngắn_có_in._Loose_green.jpg'),
(101, 98, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_tay_ngắn_có_in._Loose_white.jpg'),
(102, 99, 13, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_tay_ngắn._Fitted_nauy.jpg'),
(103, 99, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_tay_ngắn._Fitted_beige.jpg'),
(104, 100, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nam_có_in._Loose_white.jpg'),
(105, 100, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nam_có_in._Loose_black.jpg'),
(106, 101, 4, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_nam_ngắn_tay_S_Cafe_thêu._Loose_red.jpg'),
(107, 102, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_nam_carbon._FITTED_blue.jpg'),
(108, 102, 5, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_nam_carbon._FITTED_orange.jpg'),
(109, 102, 4, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_nam_carbon._FITTED_red.jpg'),
(110, 103, 3, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_Thun_Nam_Carbon_Dập_Nổi_._FITTED_yellow.jpg'),
(111, 104, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_nam_carbon._FITTED_black.jpg'),
(112, 104, 3, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_nam_carbon._FITTED_yellow.jpg'),
(113, 105, 9, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_thun_tay_ngắn_nhãn_trang_trí._LOOSE_puple.jpg'),
(114, 106, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_nam._Fitted_white.jpg'),
(115, 106, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_nam._Fitted_black.jpg'),
(116, 106, 4, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_nam._Fitted_red.jpg'),
(117, 107, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_nam_trang_trí_cổ_premium._Fitted_brown.jpg'),
(118, 108, 3, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_Polo_tay_raglan_phối_màu._FITTED_yellow.jpg'),
(119, 109, 3, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_polo_phối_bo_sườn._Fitted_yellow.jpg'),
(120, 110, 5, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_sọc_ngang_nhãn_trang_trí._Boxy_orange.jpg'),
(121, 110, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_sọc_ngang_nhãn_trang_trí._Boxy_green.jpg'),
(122, 111, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_polo_phối_cổ_tay.Loose_white.jpg'),
(123, 111, 5, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_polo_phối_cổ_tay.Loose_orange.jpg'),
(124, 111, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_polo_phối_cổ_tay.Loose_black.jpg'),
(125, 112, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_Polo_nam_phối_sọc._FITTED_blue.jpg'),
(126, 113, 4, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_active_.Regular_red.jpg'),
(127, 113, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_active_.Regular_blue.jpg'),
(128, 113, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_active_.Regular_white.jpg'),
(129, 114, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_tay_dài_nam._Fitted_blue.jpg'),
(130, 115, 13, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_nam_dài_tay_flannel._Oversize_nauy.jpg'),
(131, 115, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_nam_dài_tay_flannel._Oversize_brown.jpg'),
(132, 116, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_dài_tay_nam_Flannel_thêu._Loose_brown.jpg'),
(133, 116, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_dài_tay_nam_Flannel_thêu._Loose_green.jpg'),
(134, 116, 5, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_dài_tay_nam_Flannel_thêu._Loose_orange.jpg'),
(135, 117, 3, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_dài_tay_nam_Flannel_túi_đắp._Regular_yellow.jpg'),
(136, 118, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_tay_ngắn_in._Regular_pink.jpg'),
(137, 119, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_ngắn_oxford._Fitted_white.jpg'),
(138, 119, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_ngắn_oxford._Fitted_beige.jpg'),
(139, 119, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_ngắn_oxford._Fitted_black.jpg'),
(140, 119, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_ngắn_oxford._Fitted_blue.jpg'),
(141, 120, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_sọc_ngắn_tay._Fitted_blue.jpg'),
(142, 120, 11, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_sọc_ngắn_tay._Fitted_gray.jpg'),
(143, 121, 13, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_denim_nam._Loose_nauy.jpg'),
(144, 122, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_jean_sọc._Oversize_blue.jpg'),
(145, 123, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_nam_denim._Regular_black.jpg'),
(146, 124, 11, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_nam_ngắn_tay._Loose_gray.jpg'),
(147, 125, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_ngắn_có_túi._Loose_green.jpg'),
(148, 125, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_ngắn_có_túi._Loose_black.jpg'),
(149, 126, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_jean_unisex._Loose_blue.jpg'),
(150, 127, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_nam_ngắn_tay._Oversize_blue.jpg'),
(151, 127, 5, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Áo_sơ_mi_nam_ngắn_tay._Oversize_orange.jpg'),
(152, 128, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_jean_tay_ngắn_nam._Loose_blue.jpg'),
(153, 129, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_jeans_nam._Slim_blue.jpg'),
(154, 130, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_jeans_nam._Straight_black.jpg'),
(155, 131, 13, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_denim_nam._Wide_leg_nauy.jpg'),
(156, 131, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_denim_nam._Wide_leg_blue.jpg'),
(157, 132, 13, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_jean_nam_diễu_thân_.Straight_nauy.jpg'),
(158, 133, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_jean_nam_trơn.Slim_blue.jpg'),
(159, 134, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_Jeans_nam.Slim_cropped_black.jpg'),
(160, 135, 13, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_denim_lưng_liền._Cocoon_nauy.jpg'),
(161, 136, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_denim_nam._Straight_cropped_blue.jpg'),
(162, 137, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_jean_trơn.Straight_crop_white.jpg'),
(163, 138, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_Jean_nam_vải_twill.Slim_brown.jpg'),
(164, 139, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_jean_nam_garment_dye._Straight_cropped_brown.jpg'),
(165, 139, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_jean_nam_garment_dye._Straight_cropped_beige.jpg'),
(166, 140, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_jeans_nam_dài._Flared_beige.jpg'),
(167, 141, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_jeans_nam_trơn._Slimfit_black.jpg'),
(168, 142, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_khaki._Wide_leg_white.jpg'),
(169, 142, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_khaki._Wide_leg_black.jpg'),
(170, 143, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_khaki_nam_dài._Slim_cropped_black.jpg'),
(171, 143, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_khaki_nam_dài._Slim_cropped_white.jpg'),
(172, 144, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_khaki_dài._slim_cropped_beige.jpg'),
(173, 144, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_khaki_dài._slim_cropped_black.jpg'),
(174, 145, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_khaki_nam_dài._Slim_black.jpg'),
(175, 146, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_cargo_nam._Wide_leg_beige.jpg'),
(176, 147, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_kaki_nam._Wide_leg_white.jpg'),
(177, 148, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_kaki._Slim_crop_white.jpg'),
(178, 148, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_kaki._Slim_crop_black.jpg'),
(179, 149, 5, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_khaki._Straight_crop_orange.jpg'),
(180, 150, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_khaki_dài_gập_ly._Slimcrop_black.jpg'),
(181, 150, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_khaki_dài_gập_ly._Slimcrop_green.jpg'),
(182, 151, 11, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_chinos._Slim_crop_gray.jpg'),
(183, 151, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_chinos._Slim_crop_black.jpg'),
(184, 151, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_chinos._Slim_crop_brown.jpg'),
(185, 152, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_khaki_lưng_thun._Relax_black.jpg'),
(186, 152, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_khaki_lưng_thun._Relax_brown.jpg'),
(187, 153, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_khaki_thun_lai._Slim_crop_black.jpg'),
(188, 154, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_tây_dài_straight_lưng_thun._Straight_black.jpg'),
(189, 155, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_khaki._Wide_leg_black.jpg'),
(190, 155, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_khaki._Wide_leg_white.jpg'),
(191, 156, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_tây_dài_nam._Slim_cropped_black.jpg'),
(192, 157, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_tây_dài._Slim_black.jpg'),
(193, 158, 11, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_tây_nam_dài._Slim_cropped_gray.jpg'),
(194, 158, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_tây_nam_dài._Slim_cropped_black.jpg'),
(195, 159, 11, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_tây_nam_dài._Slim_gray.jpg'),
(196, 159, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_tây_nam_dài._Slim_black.jpg'),
(197, 160, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_tây._Slim_black.jpg'),
(198, 161, 13, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_vải_phối_chỉ._Slim_nauy.jpg'),
(199, 161, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_vải_phối_chỉ._Slim_brown.jpg'),
(200, 162, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_vải_lưng_thun_điều_chỉnh._Slim_black.jpg'),
(201, 162, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_vải_lưng_thun_điều_chỉnh._Slim_white.jpg'),
(202, 163, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_vải_lưng_thun._Slim_crop_brown.jpg'),
(203, 163, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_vải_lưng_thun._Slim_crop_black.jpg'),
(204, 164, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_vải_gập_ly._Slim_blue.jpg'),
(205, 164, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_dài_vải_gập_ly._Slim_black.jpg'),
(206, 165, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_jeans_nam._Relax_blue.jpg'),
(207, 166, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_nam_ống_rộng._Loose_white.jpg'),
(208, 166, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_nam_ống_rộng._Loose_black.jpg'),
(209, 167, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_jeans_nam._Straight_white.jpg'),
(210, 168, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_jeans_nam._Straight_beige.jpg'),
(211, 168, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_jeans_nam._Straight_black.jpg'),
(212, 168, 13, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_jeans_nam._Straight_nauy.jpg'),
(213, 169, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_nam._Relax_green.jpg'),
(214, 169, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_nam._Relax_black.jpg'),
(215, 170, 3, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_bơi_nam_họa_tiết._Straight_yellow.jpg'),
(216, 170, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_bơi_nam_họa_tiết._Straight_blue.jpg'),
(217, 171, 3, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_lưng_chun._Relax_yellow.jpg'),
(218, 171, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_lưng_chun._Relax_white.jpg'),
(219, 172, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_bơi_in_phối_dây_rút._Regular_blue.jpg'),
(220, 172, 5, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_bơi_in_phối_dây_rút._Regular_orange.jpg'),
(221, 172, 4, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_bơi_in_phối_dây_rút._Regular_red.jpg'),
(222, 173, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_nỉ_nam._Loose_green.jpg'),
(223, 174, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_shorts_sọc_dọc._Relax_blue.jpg'),
(224, 175, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_shorts_nỉ_nhãn_trang_trí._Relax_beige.jpg'),
(225, 175, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_shorts_nỉ_nhãn_trang_trí._Relax_blue.jpg'),
(226, 175, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_shorts_nỉ_nhãn_trang_trí._Relax_black.jpg'),
(227, 176, 13, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_denim_nam._Straight_nauy.jpg'),
(228, 176, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/_Quần_short_denim_nam._Straight_blue.jpg'),
(235, 183, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_nữ._Fitted_cropped_black.jpg'),
(236, 183, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_nữ._Fitted_cropped_black.jpg'),
(237, 183, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_nữ._Fitted_cropped_black.jpg'),
(238, 183, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_nữ._Fitted_cropped_pink.jpg'),
(239, 183, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_polo_nữ._Fitted_cropped_pink.jpg'),
(240, 184, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nữ_tape_trang_trí.Regular_white.jpg'),
(241, 184, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nữ_tape_trang_trí.Regular_pink.jpg'),
(242, 185, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nữ_thêu.Regular_black.jpg'),
(243, 185, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nữ_thêu.Regular_white.jpg'),
(244, 185, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nữ_thêu.Regular_pink.jpg'),
(245, 186, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_nữ_tay_ngắn_vải_linen._Regular_cropped_white.jpg'),
(246, 187, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nữ_sọc_gân._Fitted_Cropped_black.jpg'),
(247, 187, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_nữ_sọc_gân._Fitted_Cropped_white.jpg'),
(248, 188, 4, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_gập_gấu._Loose_cropped_red.jpg'),
(249, 188, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_thun_tay_ngắn_gập_gấu._Loose_cropped_white.jpg'),
(250, 189, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_ngắn_nữ_sọc_kẻ._Loose_pink.jpg'),
(251, 189, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_ngắn_nữ_sọc_kẻ._Loose_blue.jpg'),
(252, 190, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_dài_nữ._Loose_pink.jpg'),
(253, 191, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_nữ_sọc_tay_dài._Regular_cropped_blue.jpg'),
(254, 192, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_jean_unisex._Oversize_black.jpg'),
(255, 193, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_nữ_ngắn_tay._Loose_pink.jpg'),
(256, 194, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_dài_nữ_sọc._Loose_pink.jpg'),
(257, 194, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_sơ_mi_tay_dài_nữ_sọc._Loose_green.jpg'),
(258, 195, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_dệt_kim_cardigan_nữ_tay_dài_cổ_tròn._Regular_green.jpg'),
(259, 196, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_dệt_kim_nữ_tay_dài_cổ_kẻ_sọc._Loose_white.jpg'),
(260, 196, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_dệt_kim_nữ_tay_dài_cổ_kẻ_sọc._Loose_blue.jpg'),
(261, 196, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_dệt_kim_nữ_tay_dài_cổ_kẻ_sọc._Loose_pink.jpg'),
(262, 197, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_cộc_tay_dệt_kim_hoạ_tiết._Regular_pink.jpg'),
(263, 197, 3, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_cộc_tay_dệt_kim_hoạ_tiết._Regular_yellow.jpg'),
(264, 198, 5, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_dệt_kim_nữ_tay_dài_cổ_V._Regular_cropped_orange.jpg'),
(265, 198, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_dệt_kim_nữ_tay_dài_cổ_V._Regular_cropped_beige.jpg'),
(266, 199, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_nữ_dệt_kim_tay_dài_cổ_tròn._Regular_black.jpg'),
(267, 200, 3, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_dệt_kim_nữ_sát_nách._Fitted_cropped_yellow.jpg'),
(268, 201, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_nữ_recycled._Oversize_blue.jpg'),
(269, 202, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_cổ_rời.Regular_white.jpg'),
(270, 202, 11, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_cổ_rời.Regular_gray.jpg'),
(271, 203, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_denim_nữ._Loose_blue.jpg'),
(272, 204, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_tay_dài._Loose_cropped_beige.jpg'),
(273, 204, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_tay_dài._Loose_cropped_green.jpg'),
(274, 205, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_thể_thao_nữ_chống_tia_UV._Loose_green.jpg'),
(275, 205, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_thể_thao_nữ_chống_tia_UV._Loose_pink.jpg'),
(276, 206, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_thể_thao_nữ_chống_tia_UV.Loose_black.jpg'),
(277, 206, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Áo_khoác_thể_thao_nữ_chống_tia_UV.Loose_pink.jpg'),
(278, 207, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_denim_nữ._Straight_blue.jpg'),
(279, 208, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_jeans_nữ._Straight_blue.jpg'),
(280, 209, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_jeans_nữ._Wide_Leg_blue.jpg'),
(281, 210, 7, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_jeans_nữ._Carrot_blue.jpg'),
(282, 211, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_denim_nữ._Straight_black.jpg'),
(283, 212, 1, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_jeans_nữ._Straight_white.jpg'),
(284, 212, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_jeans_nữ._Straight_pink.jpg'),
(285, 213, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_xếp_ly_trước_lệch_sườn.Carrot_pink.jpg'),
(286, 214, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_xếp_ly_trước._Carrot_black.jpg'),
(287, 214, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_xếp_ly_trước._Carrot_beige.jpg'),
(288, 215, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_lưng_thun._Wide_leg_pink.jpg'),
(289, 215, 2, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_lưng_thun._Wide_leg_brown.jpg'),
(290, 216, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_xếp_ly_trước_rã_trang_trí.Carrot_pink.jpg'),
(291, 217, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_nữ._Straight_black.jpg'),
(292, 217, 11, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_nữ._Straight_gray.jpg'),
(293, 218, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_nữ_lưng_thun_rút_dây.Relax_green.jpg'),
(294, 218, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_nữ_lưng_thun_rút_dây.Relax_pink.jpg'),
(295, 219, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_khaki_nữ_dài._Cocoon_pink.jpg'),
(296, 220, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_khaki_ủi_ly._Straight_beige.jpg'),
(297, 221, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_khaki_ống_rộng_ly_đôi._Wide_Leg_black.jpg'),
(298, 221, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_khaki_ống_rộng_ly_đôi._Wide_Leg_beige.jpg'),
(299, 222, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_xếp_ly.Wide_Leg_green.jpg'),
(300, 223, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_túi_xéo._Straight_beige.jpg'),
(301, 223, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_túi_xéo._Straight_black.jpg'),
(302, 224, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_short_nữ_diễu_mí_gân._Relax_beige.jpg'),
(303, 224, 5, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_short_nữ_diễu_mí_gân._Relax_orange.jpg'),
(304, 224, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_short_nữ_diễu_mí_gân._Relax_green.jpg'),
(305, 224, 9, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_short_nữ_diễu_mí_gân._Relax_puple.jpg'),
(306, 225, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_sweatpants_unisex._Relax_black.jpg'),
(307, 225, 10, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_sweatpants_unisex._Relax_beige.jpg'),
(308, 226, 4, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_short_nữ._Relax_red.jpg'),
(309, 226, 6, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_short_nữ._Relax_green.jpg'),
(310, 227, 14, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_sweatpants_túi_ốp_trước.WIDE_LEG_black.jpg'),
(311, 228, 8, 'http://localhost:8080/Ecommerce_Web/imgProduct/Quần_dài_nỉ_unisex._Relax_pink.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_sku`
--

CREATE TABLE `product_sku` (
  `id` int(11) NOT NULL,
  `product_color_img_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sku`
--

INSERT INTO `product_sku` (`id`, `product_color_img_id`, `size_id`, `price`) VALUES
(63, 84, 1, 392000),
(64, 84, 3, 392000),
(65, 84, 4, 392000),
(66, 85, 1, 392000),
(67, 85, 2, 392000),
(68, 85, 4, 392000),
(70, 87, 1, 392000),
(71, 87, 2, 392000),
(72, 87, 3, 392000),
(73, 87, 4, 392000),
(74, 88, 1, 392000),
(75, 88, 3, 392000),
(76, 89, 2, 441000),
(77, 89, 3, 441000),
(78, 89, 4, 441000),
(79, 90, 1, 441000),
(80, 90, 2, 441000),
(81, 90, 3, 441000),
(82, 91, 5, 441000),
(83, 92, 1, 294000),
(84, 92, 3, 294000),
(85, 92, 5, 294000),
(86, 93, 2, 294000),
(87, 93, 4, 294000),
(88, 93, 5, 294000),
(89, 94, 1, 392000),
(90, 94, 2, 392000),
(91, 94, 3, 392000),
(92, 95, 3, 392000),
(93, 95, 4, 392000),
(94, 96, 1, 392000),
(95, 96, 3, 392000),
(96, 96, 4, 392000),
(97, 97, 1, 392000),
(98, 97, 3, 392000),
(99, 97, 5, 392000),
(100, 98, 5, 392000),
(101, 99, 1, 392000),
(102, 99, 4, 392000),
(103, 100, 1, 392000),
(104, 100, 2, 392000),
(105, 100, 3, 392000),
(106, 101, 4, 392000),
(107, 101, 5, 392000),
(108, 102, 1, 392000),
(109, 102, 2, 392000),
(110, 102, 3, 392000),
(111, 103, 3, 392000),
(112, 103, 4, 392000),
(113, 103, 5, 392000),
(114, 104, 1, 392000),
(115, 104, 2, 392000),
(116, 104, 3, 392000),
(117, 105, 3, 392000),
(118, 106, 2, 392000),
(119, 106, 3, 392000),
(120, 107, 1, 422000),
(121, 107, 2, 422000),
(122, 107, 3, 422000),
(123, 108, 3, 422000),
(124, 108, 4, 422000),
(125, 109, 4, 422000),
(126, 109, 5, 422000),
(127, 110, 1, 441000),
(128, 110, 2, 441000),
(129, 110, 4, 441000),
(130, 111, 1, 442000),
(131, 111, 2, 442000),
(132, 111, 3, 442000),
(133, 112, 3, 442000),
(134, 112, 4, 442000),
(135, 113, 1, 2350000),
(136, 113, 2, 2350000),
(137, 113, 5, 2350000),
(138, 114, 1, 540000),
(139, 114, 4, 540000),
(140, 114, 5, 540000),
(141, 115, 5, 540000),
(142, 116, 5, 540000),
(143, 116, 1, 540000),
(144, 117, 1, 589000),
(145, 117, 2, 589000),
(146, 118, 1, 199000),
(147, 118, 2, 199000),
(148, 118, 4, 199000),
(149, 119, 3, 239000),
(150, 119, 4, 239000),
(151, 120, 1, 299000),
(152, 120, 2, 299000),
(153, 121, 2, 299000),
(154, 121, 3, 299000),
(155, 121, 1, 299000),
(156, 122, 1, 400000),
(157, 122, 3, 400000),
(158, 123, 3, 400000),
(159, 124, 5, 400000),
(160, 124, 1, 400000),
(161, 125, 1, 2350000),
(162, 125, 3, 2350000),
(163, 126, 1, 239000),
(164, 126, 3, 239000),
(165, 127, 3, 239000),
(166, 128, 3, 239000),
(167, 128, 4, 239000),
(168, 129, 1, 589000),
(169, 129, 3, 589000),
(170, 129, 5, 589000),
(171, 130, 1, 638000),
(172, 130, 2, 638000),
(173, 130, 3, 638000),
(174, 130, 4, 638000),
(175, 131, 4, 638000),
(176, 131, 1, 638000),
(177, 132, 1, 667000),
(178, 132, 2, 667000),
(179, 132, 3, 667000),
(180, 132, 4, 667000),
(181, 133, 4, 667000),
(182, 133, 2, 667000),
(183, 134, 2, 667000),
(184, 134, 3, 667000),
(185, 135, 2, 589000),
(186, 135, 1, 589000),
(187, 136, 1, 471000),
(188, 136, 2, 471000),
(189, 136, 4, 471000),
(190, 137, 1, 500000),
(191, 137, 2, 500000),
(192, 137, 4, 500000),
(193, 138, 4, 500000),
(194, 138, 1, 500000),
(195, 139, 1, 500000),
(196, 139, 2, 500000),
(197, 139, 4, 500000),
(198, 140, 4, 500000),
(199, 141, 1, 442000),
(200, 141, 2, 442000),
(201, 142, 2, 442000),
(202, 142, 1, 442000),
(203, 142, 4, 442000),
(204, 143, 1, 569000),
(205, 143, 3, 569000),
(206, 144, 1, 540000),
(207, 144, 3, 540000),
(208, 144, 5, 540000),
(209, 145, 1, 450000),
(210, 145, 3, 450000),
(211, 146, 1, 471000),
(212, 146, 3, 471000),
(213, 147, 2, 460000),
(214, 147, 3, 460000),
(215, 148, 3, 460000),
(216, 148, 5, 460000),
(217, 148, 1, 460000),
(218, 149, 1, 540000),
(219, 149, 3, 540000),
(220, 150, 1, 299000),
(221, 150, 2, 299000),
(222, 151, 2, 299000),
(223, 151, 3, 299000),
(224, 152, 1, 569000),
(225, 152, 4, 569000),
(226, 153, 6, 589000),
(227, 153, 7, 589000),
(228, 153, 8, 589000),
(229, 153, 9, 589000),
(230, 154, 6, 589000),
(231, 154, 7, 589000),
(232, 154, 9, 589000),
(233, 155, 6, 549000),
(234, 155, 8, 549000),
(235, 155, 9, 549000),
(236, 156, 6, 549000),
(237, 156, 9, 549000),
(238, 157, 6, 569000),
(239, 158, 6, 569000),
(240, 158, 7, 569000),
(241, 158, 9, 569000),
(242, 159, 6, 569000),
(243, 159, 7, 569000),
(244, 159, 9, 569000),
(245, 160, 6, 569000),
(246, 160, 7, 569000),
(247, 160, 9, 569000),
(248, 161, 7, 569000),
(249, 161, 8, 569000),
(250, 162, 6, 569000),
(251, 162, 8, 569000),
(252, 163, 6, 569000),
(253, 163, 7, 569000),
(254, 163, 9, 569000),
(255, 164, 6, 569000),
(256, 164, 8, 569000),
(257, 165, 6, 569000),
(258, 165, 8, 569000),
(259, 165, 10, 569000),
(260, 166, 6, 569000),
(261, 166, 7, 569000),
(262, 167, 6, 670000),
(263, 167, 7, 670000),
(264, 167, 8, 670000),
(265, 168, 6, 618000),
(266, 168, 7, 618000),
(267, 168, 8, 618000),
(268, 169, 8, 618000),
(269, 170, 6, 618000),
(270, 170, 7, 618000),
(271, 170, 9, 618000),
(272, 171, 7, 618000),
(273, 171, 9, 618000),
(274, 171, 10, 618000),
(275, 172, 7, 589000),
(276, 172, 8, 589000),
(277, 173, 6, 589000),
(278, 173, 7, 589000),
(279, 173, 8, 589000),
(280, 173, 10, 589000),
(281, 174, 7, 589000),
(282, 174, 8, 589000),
(283, 174, 9, 589000),
(284, 175, 6, 613000),
(285, 175, 7, 613000),
(286, 175, 8, 613000),
(287, 176, 6, 1276000),
(288, 176, 8, 1276000),
(289, 176, 10, 1276000),
(290, 177, 6, 520000),
(291, 177, 7, 520000),
(292, 177, 8, 520000),
(293, 178, 8, 520000),
(294, 178, 9, 520000),
(295, 178, 10, 520000),
(296, 179, 6, 569000),
(297, 179, 8, 569000),
(298, 179, 9, 569000),
(299, 180, 6, 569000),
(300, 180, 7, 569000),
(301, 181, 7, 569000),
(302, 181, 10, 569000),
(303, 182, 6, 569000),
(304, 182, 7, 569000),
(305, 182, 9, 569000),
(306, 183, 9, 569000),
(307, 183, 10, 569000),
(308, 184, 6, 569000),
(309, 184, 7, 569000),
(310, 184, 10, 569000),
(311, 185, 6, 589000),
(312, 185, 7, 589000),
(313, 185, 8, 589000),
(314, 185, 10, 589000),
(315, 186, 6, 589000),
(316, 186, 7, 589000),
(317, 187, 8, 589000),
(318, 187, 9, 589000),
(319, 188, 6, 589000),
(320, 188, 7, 589000),
(321, 188, 9, 589000),
(322, 189, 6, 618000),
(323, 189, 8, 618000),
(324, 189, 9, 618000),
(325, 190, 8, 618000),
(326, 190, 9, 618000),
(327, 191, 6, 589000),
(328, 191, 7, 589000),
(329, 191, 8, 589000),
(330, 192, 6, 589000),
(331, 192, 7, 589000),
(332, 192, 9, 589000),
(333, 193, 6, 589000),
(334, 193, 8, 589000),
(335, 194, 6, 589000),
(336, 194, 8, 589000),
(337, 195, 6, 589000),
(338, 195, 7, 589000),
(339, 196, 7, 589000),
(340, 196, 9, 589000),
(341, 196, 10, 589000),
(342, 197, 7, 410000),
(343, 197, 8, 410000),
(344, 197, 9, 410000),
(345, 198, 6, 589000),
(346, 198, 7, 589000),
(347, 198, 9, 589000),
(348, 199, 9, 589000),
(349, 199, 10, 589000),
(350, 200, 6, 589000),
(351, 200, 8, 589000),
(352, 200, 9, 589000),
(353, 200, 10, 589000),
(354, 201, 6, 589000),
(355, 201, 10, 589000),
(356, 202, 6, 569000),
(357, 202, 7, 569000),
(358, 202, 9, 569000),
(359, 203, 7, 569000),
(360, 203, 8, 569000),
(361, 203, 9, 569000),
(362, 204, 6, 569000),
(363, 204, 7, 569000),
(364, 204, 9, 569000),
(365, 205, 9, 569000),
(366, 206, 6, 441000),
(367, 206, 7, 441000),
(368, 206, 8, 441000),
(369, 207, 6, 441000),
(370, 207, 7, 441000),
(371, 207, 10, 441000),
(372, 208, 6, 441000),
(373, 208, 8, 441000),
(374, 208, 10, 441000),
(375, 209, 6, 441000),
(376, 209, 7, 441000),
(377, 209, 9, 441000),
(378, 210, 6, 441000),
(379, 210, 8, 441000),
(380, 210, 9, 441000),
(381, 211, 6, 441000),
(382, 211, 8, 441000),
(383, 211, 9, 441000),
(384, 212, 6, 441000),
(385, 212, 7, 441000),
(386, 213, 6, 441000),
(387, 213, 7, 441000),
(388, 213, 9, 441000),
(389, 214, 9, 441000),
(390, 215, 6, 239000),
(391, 215, 7, 239000),
(392, 216, 7, 239000),
(393, 216, 9, 239000),
(394, 217, 6, 239000),
(395, 217, 7, 239000),
(396, 217, 8, 239000),
(397, 218, 8, 239000),
(398, 218, 10, 239000),
(399, 219, 6, 274000),
(400, 219, 7, 274000),
(401, 219, 8, 274000),
(402, 220, 8, 274000),
(403, 221, 8, 274000),
(404, 222, 7, 300000),
(405, 222, 8, 300000),
(406, 223, 6, 390000),
(407, 223, 8, 390000),
(408, 224, 6, 422000),
(409, 224, 8, 422000),
(410, 224, 10, 422000),
(411, 225, 10, 422000),
(412, 226, 8, 422000),
(413, 226, 10, 422000),
(414, 227, 7, 441000),
(415, 227, 9, 441000),
(416, 228, 6, 441000),
(417, 228, 9, 441000),
(424, 235, 2, 392000),
(425, 236, 3, 392000),
(426, 237, 4, 392000),
(427, 238, 1, 392000),
(428, 239, 2, 392000),
(429, 240, 2, 274000),
(430, 240, 3, 274000),
(431, 240, 4, 274000),
(432, 241, 1, 274000),
(433, 241, 2, 274000),
(434, 241, 3, 274000),
(435, 242, 1, 274000),
(436, 242, 3, 274000),
(437, 243, 2, 274000),
(438, 243, 4, 274000),
(439, 244, 1, 274000),
(440, 244, 5, 274000),
(441, 244, 2, 274000),
(442, 245, 1, 441000),
(443, 245, 2, 441000),
(444, 245, 3, 441000),
(445, 245, 4, 441000),
(446, 246, 1, 196000),
(447, 247, 1, 196000),
(448, 247, 2, 196000),
(449, 247, 3, 196000),
(450, 248, 1, 343000),
(451, 248, 2, 343000),
(452, 248, 3, 343000),
(453, 248, 5, 343000),
(454, 249, 1, 343000),
(455, 249, 3, 343000),
(456, 250, 1, 471000),
(457, 250, 2, 471000),
(458, 251, 2, 471000),
(459, 251, 4, 471000),
(460, 251, 5, 471000),
(461, 252, 2, 540000),
(462, 252, 3, 540000),
(463, 252, 5, 540000),
(464, 252, 1, 540000),
(465, 252, 4, 540000),
(466, 253, 1, 471000),
(467, 253, 2, 471000),
(468, 253, 3, 471000),
(469, 253, 4, 471000),
(470, 254, 2, 540000),
(471, 254, 3, 540000),
(472, 254, 1, 540000),
(473, 255, 1, 490000),
(474, 255, 2, 490000),
(475, 255, 3, 490000),
(476, 255, 4, 490000),
(477, 255, 5, 490000),
(478, 256, 2, 540000),
(479, 256, 1, 540000),
(480, 256, 3, 540000),
(481, 257, 1, 540000),
(482, 257, 2, 540000),
(483, 257, 4, 540000),
(484, 258, 1, 471000),
(485, 258, 2, 471000),
(486, 258, 3, 471000),
(487, 258, 4, 471000),
(488, 259, 1, 589000),
(489, 259, 2, 589000),
(490, 260, 2, 589000),
(491, 260, 3, 589000),
(492, 260, 4, 589000),
(493, 261, 1, 589000),
(494, 261, 2, 589000),
(495, 261, 3, 589000),
(496, 262, 1, 324000),
(497, 262, 2, 324000),
(498, 262, 3, 324000),
(499, 263, 2, 324000),
(500, 263, 4, 324000),
(501, 263, 5, 324000),
(502, 264, 1, 249000),
(503, 265, 1, 249000),
(504, 265, 2, 249000),
(505, 265, 3, 249000),
(506, 266, 1, 249000),
(507, 266, 2, 249000),
(508, 266, 3, 249000),
(509, 266, 4, 249000),
(510, 266, 5, 249000),
(511, 267, 1, 199000),
(512, 267, 2, 199000),
(513, 267, 3, 199000),
(514, 267, 5, 199000),
(515, 267, 4, 199000),
(516, 268, 1, 638000),
(517, 268, 2, 638000),
(518, 269, 1, 981000),
(519, 269, 2, 981000),
(520, 270, 2, 981000),
(521, 270, 3, 981000),
(522, 270, 4, 981000),
(523, 271, 1, 638000),
(524, 271, 2, 638000),
(525, 271, 3, 638000),
(526, 272, 1, 349000),
(527, 273, 1, 349000),
(528, 273, 3, 349000),
(529, 274, 1, 716000),
(530, 274, 2, 716000),
(531, 274, 3, 716000),
(532, 275, 1, 716000),
(533, 276, 1, 716000),
(534, 276, 2, 716000),
(535, 276, 3, 716000),
(536, 277, 1, 716000),
(537, 277, 2, 716000),
(538, 278, 6, 540000),
(539, 278, 7, 540000),
(540, 278, 8, 540000),
(541, 279, 6, 589000),
(542, 279, 7, 589000),
(543, 279, 9, 589000),
(544, 280, 6, 589000),
(545, 280, 8, 589000),
(546, 281, 6, 589000),
(547, 281, 8, 589000),
(548, 281, 10, 589000),
(549, 282, 6, 638000),
(550, 282, 8, 638000),
(551, 283, 6, 540000),
(552, 283, 7, 540000),
(553, 283, 8, 540000),
(554, 284, 7, 540000),
(555, 284, 8, 540000),
(556, 284, 10, 540000),
(557, 285, 6, 589000),
(558, 285, 7, 589000),
(559, 285, 8, 589000),
(560, 286, 6, 589000),
(561, 286, 8, 589000),
(562, 287, 7, 589000),
(563, 288, 7, 540000),
(564, 288, 8, 540000),
(565, 288, 10, 540000),
(566, 289, 6, 540000),
(567, 289, 8, 540000),
(568, 289, 10, 540000),
(569, 290, 7, 540000),
(570, 290, 8, 540000),
(571, 291, 8, 589000),
(572, 292, 6, 589000),
(573, 292, 9, 589000),
(574, 293, 8, 618000),
(575, 294, 6, 618000),
(576, 294, 9, 618000),
(577, 295, 6, 589000),
(578, 295, 7, 589000),
(579, 295, 9, 589000),
(580, 296, 6, 299000),
(581, 296, 8, 299000),
(582, 296, 9, 299000),
(583, 297, 8, 299000),
(584, 297, 10, 299000),
(585, 298, 9, 299000),
(586, 299, 6, 618000),
(587, 299, 7, 618000),
(588, 299, 8, 618000),
(589, 299, 9, 618000),
(590, 299, 10, 618000),
(591, 300, 7, 299000),
(592, 301, 7, 299000),
(593, 301, 8, 299000),
(594, 302, 6, 373000),
(595, 302, 7, 373000),
(596, 302, 8, 373000),
(597, 303, 8, 373000),
(598, 304, 7, 373000),
(599, 304, 9, 373000),
(600, 305, 6, 373000),
(601, 305, 7, 373000),
(602, 305, 8, 373000),
(603, 306, 6, 569000),
(604, 306, 7, 569000),
(605, 306, 8, 569000),
(606, 307, 7, 569000),
(607, 307, 9, 569000),
(608, 308, 6, 373000),
(609, 308, 7, 373000),
(610, 309, 6, 373000),
(611, 309, 8, 373000),
(612, 309, 9, 373000),
(613, 310, 6, 299000),
(614, 310, 7, 299000),
(615, 310, 8, 299000),
(616, 310, 9, 299000),
(617, 310, 10, 299000),
(618, 311, 6, 569000),
(619, 311, 7, 569000),
(620, 311, 8, 569000),
(621, 311, 9, 569000),
(622, 311, 10, 569000);

-- --------------------------------------------------------

--
-- Table structure for table `publickeystorage`
--

CREATE TABLE `publickeystorage` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `publicKey` text NOT NULL,
  `updateAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publickeystorage`
--

INSERT INTO `publickeystorage` (`id`, `userID`, `publicKey`, `updateAt`) VALUES
(1, 0, 'dsadasdad', '2025-05-17 08:38:19'),
(2, 15, 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6zcFkp+0koYhLS7bp9PvZA2uMwJ0XPApV4MmTlGu4uvrdxbhAD+zBdK0NoE75rjXTlF/Ik9/bbe/wJmRdcpNuK8txGgCEH0AXnQPgXe9QWkkYBkmpBXEl2uzfjD4yF/rfb7l7qaatnlj2B1hCsVElWTiaP0p9l4BPPN62e5U2vvtRHJC0VAzReT5IrHgmuNr9dK0JEiAIO7M/LVxogd0uTWr+gtSn/B0atEeLwRNehjS6+OvOVZZYRRovx0ueZ1n0GbzUfNG3DhImmYrSDdoa+s04bXb+2FfHdDyxd+TjnIlCID3H4L5DlgqeIodSJkBq8dZR4JjTWbCWKPUwT6nmQIDAQAB', '2025-05-19 13:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `create_at`) VALUES
(1, 'ADMIN', NULL),
(2, 'USER', NULL),
(3, 'STAFF', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `size_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `name`, `size_type_id`) VALUES
(1, 's', 1),
(2, 'm', 1),
(3, 'l', 1),
(4, 'xl', 1),
(5, 'xxl', 1),
(6, '28', 2),
(7, '29', 2),
(8, '30', 2),
(9, '31', 2),
(10, '32', 2);

-- --------------------------------------------------------

--
-- Table structure for table `size_type`
--

CREATE TABLE `size_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size_type`
--

INSERT INTO `size_type` (`id`, `name`) VALUES
(1, 'áo'),
(2, 'quần');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `name`, `category_id`) VALUES
(1, 'áo thun nam', 1),
(2, 'áo polo nam', 1),
(3, 'áo sơ mi nam', 1),
(4, 'áo khoác nam', 1),
(5, 'quần jean nam', 2),
(6, 'quần kaki nam', 2),
(7, 'quần short nam', 2),
(8, 'quần tây nam', 2),
(9, 'áo thun nữ', 3),
(10, 'áo sơ mi nữ', 3),
(11, 'áo len nữ', 3),
(12, 'áo khoác nữ', 3),
(13, 'quần jean nữ', 4),
(14, 'quần tây nữ', 4),
(15, 'quần kaki nữ', 4),
(16, 'quần nỉ nữ', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_at` date DEFAULT NULL,
  `update_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `phone`, `address`, `password`, `name`, `create_at`, `update_at`) VALUES
(5, 'admin@abc.com', '84111111111', NULL, '123', NULL, NULL, NULL),
(12, 'phamquockhanh0812@gmail.com', '84111111115', 'abc', NULL, 'Quốc Khánh', NULL, NULL),
(14, 'H@gmail.com', '84567567567', '123ASSD', 'agr', '123', '2025-01-13', NULL),
(15, 'khachhang4@gmail.com', '8400932141', 'Thanh Sao Vuong', 'ZYKeVC3RUfRDzJlycMYeeMBCqC1ofME4RL8sGBNxRgA=', 'Khach Hang 4', '2025-05-16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
(2, 5, 1),
(7, 14, 3),
(8, 15, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_sku_id` (`product_sku_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gender_id` (`gender_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sku_id` (`product_sku_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_sku_id` (`product_sku_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `product_color_img`
--
ALTER TABLE `product_color_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `product_sku`
--
ALTER TABLE `product_sku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_color_img_id` (`product_color_img_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Indexes for table `publickeystorage`
--
ALTER TABLE `publickeystorage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `size_ibfk_1` (`size_type_id`);

--
-- Indexes for table `size_type`
--
ALTER TABLE `size_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=616;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `product_color_img`
--
ALTER TABLE `product_color_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT for table `product_sku`
--
ALTER TABLE `product_sku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=623;

--
-- AUTO_INCREMENT for table `publickeystorage`
--
ALTER TABLE `publickeystorage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `size_type`
--
ALTER TABLE `size_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `cart_detail_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `cart_detail_ibfk_2` FOREIGN KEY (`product_sku_id`) REFERENCES `product_sku` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_sku_id`) REFERENCES `product_sku` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_sku_id`) REFERENCES `product_sku` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`);

--
-- Constraints for table `product_color_img`
--
ALTER TABLE `product_color_img`
  ADD CONSTRAINT `product_color_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_color_img_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`);

--
-- Constraints for table `product_sku`
--
ALTER TABLE `product_sku`
  ADD CONSTRAINT `product_sku_ibfk_1` FOREIGN KEY (`product_color_img_id`) REFERENCES `product_color_img` (`id`),
  ADD CONSTRAINT `product_sku_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`);

--
-- Constraints for table `size`
--
ALTER TABLE `size`
  ADD CONSTRAINT `size_ibfk_1` FOREIGN KEY (`size_type_id`) REFERENCES `size_type` (`id`);

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `sub_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
