-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2023 at 04:45 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `aboutID` int(11) NOT NULL,
  `aboutLOGO` varchar(255) NOT NULL,
  `aboutTITLE` varchar(255) NOT NULL,
  `aboutNAME` varchar(50) NOT NULL,
  `aboutDESCRIPTION` longtext NOT NULL,
  `aboutCONTACT` varchar(255) NOT NULL,
  `aboutEMAIL` varchar(255) NOT NULL,
  `aboutADDRESS` varchar(255) NOT NULL,
  `aboutTIME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`aboutID`, `aboutLOGO`, `aboutTITLE`, `aboutNAME`, `aboutDESCRIPTION`, `aboutCONTACT`, `aboutEMAIL`, `aboutADDRESS`, `aboutTIME`) VALUES
(1, 'remaining', 'DentCareTITLE', 'DentCare', 'DentCareDESCE', '8200626442', 'DentCare@email.com', '123 Street, New York, USA', 'Mon - Tues : 6.00 am - 10.00 pm, Sunday Closed');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `adminNAME` varchar(255) NOT NULL,
  `adminPASSWORD` varchar(255) NOT NULL,
  `adminEMAIL` varchar(255) NOT NULL,
  `adminTYPE` varchar(255) NOT NULL,
  `adminIMG` varchar(255) NOT NULL,
  `adminOTP` varchar(255) DEFAULT NULL,
  `admindec` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `adminNAME`, `adminPASSWORD`, `adminEMAIL`, `adminTYPE`, `adminIMG`, `adminOTP`, `admindec`) VALUES
(1, 'Deep Pinara', 'Deep', 'admin10@gmail.com', 'admin', 'admin.jpg', NULL, 'admin Desc'),
(2, 'admin2', 'admin2', 'admin210@gmail.com', 'admin2', 'admin2.jpg', NULL, 'admin2 Desc');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactID` int(11) NOT NULL,
  `contactNAME` varchar(255) NOT NULL,
  `contactEMAIL` varchar(255) NOT NULL,
  `contactPHONE` varchar(50) NOT NULL,
  `contactSUBJECT` varchar(255) NOT NULL,
  `contactMESSAGE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorID` int(11) NOT NULL,
  `doctorROOMID` int(11) NOT NULL,
  `doctorNAME` varchar(255) NOT NULL,
  `doctorEMAIL` varchar(255) NOT NULL,
  `doctorPHONE` varchar(255) NOT NULL,
  `doctorBOD` date NOT NULL,
  `doctorQUALIFICATION` varchar(255) NOT NULL,
  `doctorUSERNAME` varchar(255) NOT NULL,
  `doctorPASSWORD` varchar(255) NOT NULL,
  `doctorEXPERIENCE` varchar(255) NOT NULL,
  `doctorSKILL` varchar(255) NOT NULL,
  `doctorDESCRIPTION` longtext NOT NULL,
  `doctorTYPE` varchar(255) NOT NULL,
  `doctorIMG` varchar(255) NOT NULL,
  `doctorOTP` int(11) DEFAULT NULL,
  `doctorTIMEING` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorID`, `doctorROOMID`, `doctorNAME`, `doctorEMAIL`, `doctorPHONE`, `doctorBOD`, `doctorQUALIFICATION`, `doctorUSERNAME`, `doctorPASSWORD`, `doctorEXPERIENCE`, `doctorSKILL`, `doctorDESCRIPTION`, `doctorTYPE`, `doctorIMG`, `doctorOTP`, `doctorTIMEING`) VALUES
(1, 1, 'Dr. John Doe', 'Dr._John_Doe@email.com', '8128881663', '1991-11-27', 'MBBS', 'JohnDoe', '123456', '8', 'Implant Surgeon', 'Consultant Dental Surgeon & Implantologist', 'Dental Surgeon', 'remaing', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `offerID` int(11) NOT NULL,
  `offerTITLE` varchar(255) NOT NULL,
  `offerPRICE` varchar(255) NOT NULL,
  `offerDESC` varchar(255) NOT NULL,
  `offerSHOW` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`offerID`, `offerTITLE`, `offerPRICE`, `offerDESC`, `offerSHOW`) VALUES
(1, '30% off', '200', '200 less', 1),
(2, '10% off', '100', '100 less', 1);

-- --------------------------------------------------------

--
-- Table structure for table `opd`
--

CREATE TABLE `opd` (
  `opdID` int(11) NOT NULL,
  `opdPATIENTID` int(11) NOT NULL,
  `opdDATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL,
  `patientSERVICEID` int(11) NOT NULL,
  `patientDOCTORID` int(11) NOT NULL,
  `patientNAME` varchar(255) NOT NULL,
  `patientEMAIL` varchar(255) NOT NULL,
  `patientCONSULTANCYFEES` int(11) DEFAULT NULL,
  `patientGENDER` varchar(11) NOT NULL,
  `patientHEIGHT` float DEFAULT NULL,
  `patientWEIGHT` float DEFAULT NULL,
  `patientAGE` int(11) DEFAULT NULL,
  `patientPHONE` int(11) DEFAULT NULL,
  `patientOFFERID` int(11) DEFAULT NULL,
  `patientDATE` date NOT NULL,
  `patientTIMEING` varchar(255) NOT NULL,
  `patientONILNE_OFFLINE` varchar(255) NOT NULL,
  `patientADDRESS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientID`, `patientSERVICEID`, `patientDOCTORID`, `patientNAME`, `patientEMAIL`, `patientCONSULTANCYFEES`, `patientGENDER`, `patientHEIGHT`, `patientWEIGHT`, `patientAGE`, `patientPHONE`, `patientOFFERID`, `patientDATE`, `patientTIMEING`, `patientONILNE_OFFLINE`, `patientADDRESS`) VALUES
(1, 1, 1, 'test name', 'test@gmail.com', NULL, 'Male', 4.1, 60, 20, NULL, 1, '2023-01-06', '9:20', '1', ''),
(2, 2, 1, 'teswt name', 'teswt@gmail.com', NULL, 'Female', 4.1, 60, 20, NULL, 1, '2023-01-06', '9:40', '1', ''),
(3, 1, 1, 'test', 'test@gmail.com', 400, 'Female', 4.1, 56, 32, 2147483647, 1, '2023-01-06', '9:40', '1', 'testaddress'),
(4, 1, 1, 'old', 'oldtest@gmail.com', 400, 'Female', 4.1, 56, 32, 2147483647, 1, '2023-01-05', '9:40', '1', 'oldtestaddress');

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `receptionistID` int(11) NOT NULL,
  `receptionistNAME` varchar(255) NOT NULL,
  `receptionistEMAIL` varchar(255) NOT NULL,
  `receptionistPASSWORD` varchar(255) NOT NULL,
  `receptionistEXPRIENCE` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`receptionistID`, `receptionistNAME`, `receptionistEMAIL`, `receptionistPASSWORD`, `receptionistEXPRIENCE`) VALUES
(1, 'harsh', 'harsh@gmail.com', 'harsh', 9);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomID` int(11) NOT NULL,
  `roomNO` int(11) NOT NULL,
  `roomALLOCATEdoctorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `serviceID` int(11) NOT NULL,
  `serviceNAME` varchar(255) NOT NULL,
  `serviceIMG` varchar(255) NOT NULL,
  `serviceSHOW` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`serviceID`, `serviceNAME`, `serviceIMG`, `serviceSHOW`) VALUES
(1, 'Cosmetic Dentistry', 'img/service-1.jpg', '1'),
(2, 'Dental Implants', 'img/service-2.jpg', '0'),
(3, 'Dental Bridges', 'img/service-3.jpg', '1'),
(4, 'Teeth Whitening', 'img/service-4.jpg', '0'),
(5, 'testpart', 'img/service-4.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `testimonialID` int(11) NOT NULL,
  `testimonialNAME` varchar(255) NOT NULL,
  `testimonialREVIEW` varchar(255) NOT NULL,
  `testimonialDATE` date NOT NULL,
  `testmonialSHOW` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`testimonialID`, `testimonialNAME`, `testimonialREVIEW`, `testimonialDATE`, `testmonialSHOW`) VALUES
(1, 'Ankita', 'Dolores sed duo clita justo dolor et stet lorem kasd dolore lorem ipsum. At lorem lorem magna ut et, nonumy labore diam erat. Erat dolor rebum sit ipsum.', '2022-11-12', 'yes'),
(2, 'Addie', 'Dolores sed duo clita justo dolor et stet lorem kasd', '2022-11-12', 'yes'),
(3, 'Harsh', 'Dolores sed duo clita justo dolor et stet lorem kasd', '2022-11-12', 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`aboutID`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorID`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`offerID`);

--
-- Indexes for table `opd`
--
ALTER TABLE `opd`
  ADD PRIMARY KEY (`opdID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientID`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`receptionistID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`serviceID`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`testimonialID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `aboutID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `offerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `opd`
--
ALTER TABLE `opd`
  MODIFY `opdID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `receptionistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `serviceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `testimonialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
