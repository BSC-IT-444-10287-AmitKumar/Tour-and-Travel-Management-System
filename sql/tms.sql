-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2026 at 08:45 PM
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
-- Database: `tms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `EmailId` varchar(250) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Name`, `EmailId`, `MobileNumber`, `Password`, `updationDate`) VALUES
(1, 'admin', 'Administrator', 'test@gmail.com', 7894561239, 'f925916e2754e5e03f75dd58a5733251', '2025-10-09 11:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `BookingId` int(11) NOT NULL,
  `PackageId` int(11) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `FromDate` varchar(100) DEFAULT NULL,
  `ToDate` varchar(100) DEFAULT NULL,
  `Comment` mediumtext DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `CancelledBy` varchar(5) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`BookingId`, `PackageId`, `UserEmail`, `FromDate`, `ToDate`, `Comment`, `RegDate`, `status`, `CancelledBy`, `UpdationDate`) VALUES
(1, 2, 'garima12@gmail.com', '2025-11-20', '2025-11-25', 'NA', '2025-11-04 18:02:10', 1, NULL, '2025-11-05 06:25:07'),
(2, 4, 'test@gmail.com', '2025-12-01', '2025-12-05', 'Hello', '2025-11-04 18:02:58', 1, NULL, '2025-11-05 06:25:04'),
(3, 9, 'test@gmail.com', '2025-12-20', '2025-12-25', 'NA', '2025-11-04 18:03:26', 2, 'a', '2026-01-12 06:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblenquiry`
--

CREATE TABLE `tblenquiry` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `MobileNumber` char(10) DEFAULT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblenquiry`
--

INSERT INTO `tblenquiry` (`id`, `FullName`, `EmailId`, `MobileNumber`, `Subject`, `Description`, `PostingDate`, `Status`) VALUES
(3, 'Amit Kumar', 'kumaramit983580@gmail.com', '8409108604', 'no', 'asddtyrkdfduuyfghdrydcvbyuky', '2026-01-14 09:26:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblissues`
--

CREATE TABLE `tblissues` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `Issue` varchar(100) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `AdminremarkDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT '',
  `detail` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `type`, `detail`) VALUES
(1, 'terms', '																														<p data-start=\"264\" data-end=\"484\">Welcome to the <strong data-start=\"279\" data-end=\"316\">Tour and Travel Management System</strong>. By accessing or using this website, you agree to comply with and be bound by the following terms and conditions. Please read them carefully before using our services.</p><hr data-start=\"486\" data-end=\"489\"><h3 data-start=\"491\" data-end=\"519\">1. Acceptance of Terms</h3><p data-start=\"520\" data-end=\"713\">By using this website, you acknowledge that you have read, understood, and agreed to these Terms and Conditions. If you do not agree with any part of these terms, please do not use the website.</p><hr data-start=\"715\" data-end=\"718\"><h3 data-start=\"720\" data-end=\"747\">2. Use of the Website</h3><p data-start=\"748\" data-end=\"974\">This website is intended for users who wish to view tour packages, make bookings, and manage travel-related information. You agree to use the website only for lawful purposes and not to misuse any content or services provided.</p><hr data-start=\"976\" data-end=\"979\"><h3 data-start=\"981\" data-end=\"1019\">3. User Registration and Account</h3><p data-start=\"1020\" data-end=\"1260\">To access certain features, users may be required to register an account. You are responsible for maintaining the confidentiality of your login credentials. Any activity performed through your account will be considered your responsibility.</p><hr data-start=\"1262\" data-end=\"1265\"><h3 data-start=\"1267\" data-end=\"1296\">4. Booking and Services</h3><p data-start=\"1297\" data-end=\"1531\">All tour bookings made through the system are subject to availability. The system provides booking information based on data entered by the administrator. We reserve the right to modify or cancel any tour package without prior notice.</p><hr data-start=\"1533\" data-end=\"1536\"><h3 data-start=\"1538\" data-end=\"1570\">5. Pricing and Information</h3><p data-start=\"1571\" data-end=\"1783\">All prices, package details, and travel information displayed on the website are subject to change. While we strive to keep information accurate and up to date, we do not guarantee complete accuracy at all times.</p><hr data-start=\"1785\" data-end=\"1788\"><h3 data-start=\"1790\" data-end=\"1829\">6. Cancellation and Refund Policy</h3><p data-start=\"1830\" data-end=\"2068\">Cancellation and refund policies may vary depending on the tour package. Users are advised to review package details carefully before making a booking. Refunds, if applicable, will be processed as per the terms mentioned for each package.</p><hr data-start=\"2070\" data-end=\"2073\"><h3 data-start=\"2075\" data-end=\"2105\">7. User Responsibilities</h3><p data-start=\"2106\" data-end=\"2301\">Users must provide accurate and complete information during registration and booking. Any false or misleading information may result in cancellation of bookings or suspension of the user account.</p><hr data-start=\"2303\" data-end=\"2306\"><h3 data-start=\"2308\" data-end=\"2338\">8. Intellectual Property</h3><p data-start=\"2339\" data-end=\"2580\">All content on this website, including text, images, logos, and software, is the property of the Tour and Travel Management System project and is protected by applicable copyright laws. Unauthorized use of any content is strictly prohibited.</p><hr data-start=\"2582\" data-end=\"2585\"><h3 data-start=\"2587\" data-end=\"2619\">9. Limitation of Liability</h3><p data-start=\"2620\" data-end=\"2820\">The Tour and Travel Management System shall not be held responsible for any loss, damage, or inconvenience arising from the use of this website or from any travel arrangements made through the system.</p><hr data-start=\"2822\" data-end=\"2825\"><h3 data-start=\"2827\" data-end=\"2864\">10. Privacy and Data Protection</h3><p data-start=\"2865\" data-end=\"3040\">User data collected through this website is used only for system functionality and management purposes. We are committed to protecting user privacy and ensuring data security.</p><hr data-start=\"3042\" data-end=\"3045\"><h3 data-start=\"3047\" data-end=\"3079\">11. Modifications to Terms</h3><p data-start=\"3080\" data-end=\"3267\">We reserve the right to update or modify these Terms and Conditions at any time without prior notice. Continued use of the website after changes indicates acceptance of the revised terms.</p><hr data-start=\"3269\" data-end=\"3272\"><h3 data-start=\"3274\" data-end=\"3297\">12. Governing Law</h3><p align=\"justify\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p data-start=\"3298\" data-end=\"3410\">These Terms and Conditions shall be governed by and interpreted in accordance with the laws applicable in India.</p><p data-start=\"3298\" data-end=\"3410\"><br></p><p data-start=\"3298\" data-end=\"3410\">This website is developed as an academic project for educational purposes.</p>\r\n										\r\n										\r\n										'),
(2, 'privacy', '<p data-start=\"217\" data-end=\"467\">At <strong data-start=\"220\" data-end=\"257\">Tour and Travel Management System</strong>, we respect your privacy and are committed to protecting the personal information of our users. This Privacy Policy explains how we collect, use, store, and protect your data when you visit or use our website.</p>\r\n<h3 data-start=\"469\" data-end=\"500\">1. Information We Collect</h3>\r\n<p data-start=\"501\" data-end=\"776\">We may collect personal information such as your name, email address, phone number, and travel preferences when you register, make a booking, or contact us. We may also collect non-personal information like browser type, IP address, and pages visited for analytical purposes.</p>\r\n<h3 data-start=\"778\" data-end=\"805\">2. Use of Information</h3>\r\n<p data-start=\"806\" data-end=\"843\">The information collected is used to:</p>\r\n<ul data-start=\"844\" data-end=\"1073\">\r\n<li data-start=\"844\" data-end=\"903\">\r\n<p data-start=\"846\" data-end=\"903\">Provide and manage travel bookings and related services</p>\r\n</li>\r\n<li data-start=\"904\" data-end=\"957\">\r\n<p data-start=\"906\" data-end=\"957\">Improve website functionality and user experience</p>\r\n</li>\r\n<li data-start=\"958\" data-end=\"1014\">\r\n<p data-start=\"960\" data-end=\"1014\">Respond to user queries and provide customer support</p>\r\n</li>\r\n<li data-start=\"1015\" data-end=\"1073\">\r\n<p data-start=\"1017\" data-end=\"1073\">Send important updates related to bookings or services</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1075\" data-end=\"1131\">We do not use your information for any unlawful purpose.</p>\r\n<h3 data-start=\"1133\" data-end=\"1169\">3. Data Sharing and Disclosure</h3>\r\n<p data-start=\"1170\" data-end=\"1376\">We do not sell, trade, or rent users’ personal identification information to others. Information may only be shared with trusted service providers when necessary to deliver services or when required by law.</p>\r\n<h3 data-start=\"1378\" data-end=\"1400\">4. Data Security</h3>\r\n<p data-start=\"1401\" data-end=\"1659\">We implement appropriate security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, while we strive to protect your data, no method of transmission over the internet is completely secure.</p>\r\n<h3 data-start=\"1661\" data-end=\"1677\">5. Cookies</h3>\r\n<p data-start=\"1678\" data-end=\"1883\">Our website may use cookies to enhance user experience. Cookies help us understand user behavior and improve our services. Users can choose to disable cookies through their browser settings if they prefer.</p>\r\n<h3 data-start=\"1885\" data-end=\"1905\">6. User Rights</h3>\r\n<p data-start=\"1906\" data-end=\"2102\">Users have the right to access, update, or request deletion of their personal information. If you wish to make changes or have concerns regarding your data, you may contact us through the website.</p>\r\n<h3 data-start=\"2104\" data-end=\"2135\">7. Changes to This Policy</h3>\r\n<p data-start=\"2136\" data-end=\"2306\">We may update this Privacy Policy from time to time. Any changes will be posted on this page, and continued use of the website signifies acceptance of the updated policy.</p>\r\n<h3 data-start=\"2308\" data-end=\"2324\">8. Consent</h3>\r\n<p data-start=\"2325\" data-end=\"2412\">By using this website, you hereby consent to our Privacy Policy and agree to its terms.</p>'),
(3, 'aboutus', '																																																		<div><h2 data-start=\"209\" data-end=\"223\"><span style=\"font-weight: bold;\"><span style=\"font-family: Roboto, sans-serif; color: rgb(51, 51, 51); font-size: 16px;\">Welcome to </span><span data-start=\"236\" data-end=\"273\" style=\"font-family: Roboto, sans-serif; color: rgb(51, 51, 51); font-size: 16px;\">Tour and Travel Management System</span><span style=\"font-family: Roboto, sans-serif; color: rgb(51, 51, 51); font-size: 16px;\">, a modern and user-friendly platform designed to make travel planning simple, convenient, and enjoyable. Our system is developed with the aim of providing travelers with easy access to tour packages, bookings, and travel-related information through a single online platform.</span></span></h2>\r\n<p data-start=\"550\" data-end=\"830\"><span style=\"font-weight: bold;\">We focus on delivering reliable travel solutions by combining technology with customer-centric services. Our platform allows users to explore destinations, view tour details, and book packages efficiently, while administrators can manage tours, customers, and bookings seamlessly.</span></p>\r\n<h2 data-start=\"837\" data-end=\"854\"><span style=\"font-weight: bold;\">Our Mission</span></h2>\r\n<p data-start=\"856\" data-end=\"1194\"><span style=\"font-weight: bold;\">Our mission is to simplify the travel management process by using information technology to reduce manual work, save time, and improve accuracy. We strive to provide a secure, efficient, and easy-to-use system that enhances the overall travel experience for customers and supports travel agencies in managing their operations effectively.</span></p><p data-start=\"856\" data-end=\"1194\"><span style=\"color: rgb(27, 147, 225); font-family: Montserrat, sans-serif; font-size: 2em; font-weight: bold;\">Our Vision</span></p>\r\n<p data-start=\"1220\" data-end=\"1485\"><span style=\"font-weight: bold;\">Our vision is to become a trusted digital travel management solution that supports innovation in the tourism industry. We aim to continuously improve our system by adopting new technologies and features that meet the evolving needs of travelers and travel agencies.</span></p></div>\r\n										\r\n										\r\n										'),
(11, 'contact', '										<p data-start=\"271\" data-end=\"462\" style=\"color: rgb(0, 0, 0); font-size: medium;\">We are always happy to assist you with your travel needs. Whether you have questions about tour packages, bookings, or need support, feel free to get in touch with us using the details below.</p><h3 data-start=\"464\" data-end=\"487\" style=\"color: rgb(0, 0, 0);\">&nbsp;Office Address</h3><p data-start=\"488\" data-end=\"545\" style=\"color: rgb(0, 0, 0); font-size: medium;\">Tour and Travel Management System<br data-start=\"521\" data-end=\"524\">Patna, Bihar, India</p><h3 data-start=\"547\" data-end=\"561\" style=\"color: rgb(0, 0, 0);\">&nbsp;Email</h3><p data-start=\"562\" data-end=\"586\" style=\"color: rgb(0, 0, 0); font-size: medium;\"><a data-start=\"562\" data-end=\"584\" class=\"decorated-link cursor-pointer\" rel=\"noopener\">support@tourtravel.com<span aria-hidden=\"true\" class=\"ms-0.5 inline-block align-middle leading-none\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"20\" height=\"20\" aria-hidden=\"true\" data-rtl-flip=\"\" class=\"block h-[0.75em] w-[0.75em] stroke-current stroke-[0.75]\"><use href=\"/cdn/assets/sprites-core-m5o9ycbv.svg#304883\" fill=\"currentColor\"></use></svg></span></a></p><h3 data-start=\"588\" data-end=\"602\" style=\"color: rgb(0, 0, 0);\">&nbsp;Phone</h3><p data-start=\"603\" data-end=\"619\" style=\"color: rgb(0, 0, 0); font-size: medium;\">+91-9835800175</p><h3 data-start=\"621\" data-end=\"643\" style=\"color: rgb(0, 0, 0);\">&nbsp;Working Hours</h3><p data-start=\"644\" data-end=\"699\" style=\"color: rgb(0, 0, 0); font-size: medium;\">Monday – Saturday: 9:00 AM – 6:00 PM<br data-start=\"680\" data-end=\"683\">Sunday: Closed</p>\r\n										');

-- --------------------------------------------------------

--
-- Table structure for table `tbltourpackages`
--

CREATE TABLE `tbltourpackages` (
  `PackageId` int(11) NOT NULL,
  `PackageName` varchar(200) DEFAULT NULL,
  `PackageType` varchar(150) DEFAULT NULL,
  `PackageLocation` varchar(100) DEFAULT NULL,
  `PackagePrice` int(11) DEFAULT NULL,
  `PackageFetures` varchar(255) DEFAULT NULL,
  `PackageDetails` mediumtext DEFAULT NULL,
  `PackageImage` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbltourpackages`
--

INSERT INTO `tbltourpackages` (`PackageId`, `PackageName`, `PackageType`, `PackageLocation`, `PackagePrice`, `PackageFetures`, `PackageDetails`, `PackageImage`, `Creationdate`, `UpdationDate`) VALUES
(12, 'Golden Triangle Delight (Delhi–Agra)', 'Group Package', 'Delhi and  Agra ', 4500, 'Round-trip AC transportation – Accommodation for 2 nights in Delhi, and 1 night in Agra  – Daily breakfast at hotels – Guided sightseeing tours – Visit to Taj Mahal, Amber Fort and City Palace – All applicable taxes included', 'This package offers a perfect introduction to India’s rich heritage. Begin your journey in Delhi with visits to India Gate and Qutub Minar. Explore the majestic Taj Mahal in Agra before heading to experience royal palaces, colorful bazaars, and traditional culture.', 'delhi.jpg', '2026-01-12 06:14:58', '2026-01-19 07:06:39'),
(13, 'Heritage & Culture Explorer (Student Package)', 'Student Group Package', 'Amritsar,Punjab', 14999, 'AC transportation throughout the tour  Accommodation (shared 3?/budget hotel)  starting from Delhi to Amritsar , punjab', 'Experience the spiritual and cultural richness of Amritsar with this budget-friendly package. The tour includes a visit to the world-famous Golden Temple, where you can experience peace and devotion. Pay tribute to freedom fighters at Jallianwala Bagh and witness the patriotic Wagah Border Retreat Ceremony. Comfortable accommodation and guided local sightseeing make this package ideal for students, families, and first-time travelers.', 'amritsar.jpg', '2026-01-12 06:18:24', '2026-01-19 07:17:01'),
(14, 'Banaras Spiritual & Cultural Tour (Budget Package)', 'Domestic Group Package', 'Varanasi (Banaras), Uttar Pradesh, India', 9999, '2 Nights / 3 Days accommodation  Daily breakfast  Ganga Aarti at Dashashwamedh Ghat  Visit to Kashi Vishwanath Temple  Sarnath sightseeing  Local city tour by cab  All applicable taxes included', 'This spiritual tour of Banaras offers a deep cultural and religious experience. Witness the divine Ganga Aarti, visit the sacred Kashi Vishwanath Temple, and explore Sarnath, where Lord Buddha gave his first sermon. This budget package is ideal for students, pilgrims, and spiritual travelers.', 'banaras.jpg', '2026-01-19 07:11:11', '2026-01-19 07:12:07'),
(15, 'Kerala Backwaters & Nature Escape (Student Special)', 'Domestic Group Package', 'Munnar, Alleppey & Kochi, Kerala, India', 9999, '3 Nights / 4 Days accommodation  Daily breakfast  Houseboat ride in Alleppey  Tea garden visit in Munnar  Sightseeing in Kochi  Local transportation  All applicable taxes included', 'Explore the serene beauty of Kerala with lush green hills, calm backwaters, and scenic landscapes. This package includes a relaxing houseboat cruise, hill station visit to Munnar, and sightseeing in Kochi. Perfect for students and nature lovers.', 'kerela.jpg', '2026-01-19 07:13:25', NULL),
(16, 'Bihar Heritage & Buddhist Circuit Tour', 'Domestic Group Package', 'Bodh Gaya, Nalanda & Rajgir, Bihar, India', 8999, '2 Nights / 3 Days accommodation  Daily breakfast  Mahabodhi Temple visit  Nalanda University ruins  Rajgir sightseeing  Local transportation  All applicable taxes included', 'This heritage tour covers the most important Buddhist destinations in Bihar. Visit Mahabodhi Temple in Bodh Gaya, explore ancient Nalanda University, and enjoy peaceful surroundings in Rajgir. A perfect educational and spiritual tour for students.', 'bihar.png', '2026-01-19 07:14:53', NULL),
(17, 'Rajasthan Royal Heritage Tour (Group Package)', 'Domestic Group Package', 'Jaipur, Jodhpur & Udaipur, Rajasthan, India', 16999, '4 Nights / 5 Days accommodation  Daily breakfast  Visit to Amber Fort, City Palace  Mehrangarh Fort sightseeing  Lake Pichola boat ride  Local sightseeing by cab  All applicable taxes included', 'Experience the royal culture of Rajasthan with grand palaces, forts, and traditional heritage. Visit Jaipur’s Amber Fort, Jodhpur’s Mehrangarh Fort, and enjoy a romantic boat ride in Udaipur. Ideal for students and heritage lovers.', 'rajasthan.avif', '2026-01-19 07:16:09', '2026-01-19 07:16:33');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(10) DEFAULT NULL,
  `EmailId` varchar(70) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Password`, `RegDate`, `UpdationDate`) VALUES
(1, 'Manju Srivatav', '4456464654', 'manju@gmail.com', '202cb962ac59075b964b07152d234b70', '2025-10-10 06:33:20', '2025-11-04 17:59:41'),
(2, 'Kishan', '9871987979', 'kishan@gmail.com', '202cb962ac59075b964b07152d234b70', '2025-10-10 06:33:20', '2025-11-04 17:59:49'),
(3, 'Salvi Chandra', '1398756416', 'salvi@gmail.com', '202cb962ac59075b964b07152d234b70', '2025-10-10 06:33:20', '2025-11-04 17:59:49'),
(4, 'Abir', '4789756456', 'abir@gmail.com', '202cb962ac59075b964b07152d234b70', '2025-10-10 06:33:20', '2025-11-04 17:59:49'),
(5, 'Test', '1987894654', 'test@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2025-10-10 06:33:20', '2025-11-04 17:59:49'),
(9, 'Test Sample', '4654654564', 'testsample@gmail.com', '202cb962ac59075b964b07152d234b70', '2025-10-10 06:33:20', '2025-11-04 17:59:49'),
(10, 'Garima Singh', '1425362540', 'garima12@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2025-10-10 06:33:20', '2025-11-04 17:59:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`BookingId`);

--
-- Indexes for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissues`
--
ALTER TABLE `tblissues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  ADD PRIMARY KEY (`PackageId`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmailId` (`EmailId`),
  ADD KEY `EmailId_2` (`EmailId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `BookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblissues`
--
ALTER TABLE `tblissues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  MODIFY `PackageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
use tms;