-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 29, 2018 at 02:12 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larasiadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `dsnNidn` int(11) NOT NULL,
  `dsnNip` int(11) DEFAULT NULL,
  `dsnNama` varchar(60) DEFAULT NULL,
  `dsnProdiKode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `jurKode` int(11) NOT NULL,
  `jurNama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `klsId` int(11) NOT NULL,
  `klsMkKurId` int(11) DEFAULT NULL,
  `klsDsnNidn` int(11) DEFAULT NULL,
  `klsSempId` int(11) DEFAULT NULL,
  `klsNama` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kode_nilai`
--

CREATE TABLE `kode_nilai` (
  `kdnlId` varchar(1) NOT NULL,
  `kdnlBobot` int(11) DEFAULT NULL,
  `kdnlRangeBawah` int(11) DEFAULT NULL,
  `kdnlRangeAtas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `krsId` int(11) NOT NULL,
  `krsSempId` int(11) DEFAULT NULL,
  `krsNim` varchar(45) DEFAULT NULL,
  `krsPaketSem` tinyint(4) DEFAULT NULL,
  `krsTglTransaksi` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `krs_detail`
--

CREATE TABLE `krs_detail` (
  `krsdtId` int(11) NOT NULL,
  `krsdtKrsId` int(11) DEFAULT NULL,
  `krsdtBobotNilai` tinyint(4) DEFAULT NULL,
  `krsdtKodeNilai` varchar(1) DEFAULT NULL,
  `krsKlsId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `krs_nilai`
--

CREATE TABLE `krs_nilai` (
  `krsnaId` int(11) NOT NULL,
  `krsnaKrsDtId` int(11) DEFAULT NULL,
  `krsnaNilaiTugas` int(11) DEFAULT NULL,
  `krsnaNilaiUTS` int(11) DEFAULT NULL,
  `krsnaNilaiUAS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `kurId` int(11) NOT NULL,
  `kurProdiKode` int(11) DEFAULT NULL,
  `kurTahun` int(11) DEFAULT NULL,
  `kurNama` varchar(45) DEFAULT NULL,
  `kurNoSkRektor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `mhsNim` varchar(15) NOT NULL,
  `mhsNama` varchar(60) DEFAULT NULL,
  `mhsProdiKode` int(11) DEFAULT NULL,
  `mhsAngkatan` int(11) DEFAULT NULL,
  `mhsKurId` varchar(45) DEFAULT NULL,
  `mhsKelompok` varchar(1) DEFAULT NULL COMMENT 'Kelompok ini mirip ID kelas',
  `mhsStatusAktif` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah_kurikulum`
--

CREATE TABLE `matakuliah_kurikulum` (
  `mkkurId` int(11) NOT NULL,
  `mkkurKode` varchar(45) DEFAULT NULL,
  `mkkurNama` varchar(45) DEFAULT NULL,
  `mkkurKurId` int(11) DEFAULT NULL,
  `mkkurSemester` tinyint(4) DEFAULT NULL,
  `mkkurJenisSemester` tinyint(4) DEFAULT NULL,
  `mkkurJumlahSks` tinyint(4) DEFAULT NULL,
  `mkkurJumlahSksTeori` tinyint(4) DEFAULT NULL,
  `mkkurJumlahSksPraktek` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `nama` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `presensiId` int(10) NOT NULL,
  `presensiMhsNim` varchar(14) DEFAULT NULL,
  `presensiStatus` varchar(5) DEFAULT NULL,
  `presensiJmlAlpha` int(13) DEFAULT NULL,
  `presensiSemId` int(11) DEFAULT NULL,
  `presensiKelasId` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE `program_studi` (
  `prodiKode` int(11) NOT NULL,
  `prodiNama` varchar(45) DEFAULT NULL,
  `prodiKodeJurusan` int(11) DEFAULT NULL,
  `prodiJjarKode` varchar(4) DEFAULT NULL,
  `prodiKodeLabel` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semId` int(11) NOT NULL,
  `semTglMulai` date DEFAULT NULL,
  `semTglSelesai` date DEFAULT NULL,
  `semTahun` int(11) DEFAULT NULL,
  `semNmSmtId` tinyint(4) DEFAULT NULL,
  `semStatus` int(1) DEFAULT NULL,
  `semKeterangan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semId`, `semTglMulai`, `semTglSelesai`, `semTahun`, `semNmSmtId`, `semStatus`, `semKeterangan`) VALUES
(20181, '2018-08-20', '2018-12-30', 2018, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `semester_prodi`
--

CREATE TABLE `semester_prodi` (
  `sempId` int(11) NOT NULL,
  `sempSemId` int(11) DEFAULT NULL,
  `sempTglMulaiKrs` date DEFAULT NULL,
  `sempTglSelesaiKrs` date DEFAULT NULL,
  `sempTglMulaiInputNilai` date DEFAULT NULL,
  `sempTglSelesaiInputNilai` date DEFAULT NULL,
  `sempIsAktif` tinyint(4) DEFAULT '0',
  `semProdiKode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `level`) VALUES
(4, 'admin', 'admin', 'admin@gmail.com', '$2y$10$/ksTXyJ2EAyzjliAkonhnewNjNj3BX8e3gnJgmVIso2Up8ydeA/cy', 'nt9kWUE0TT9PEdcW5NGIoBHXoiZoY8ElUPWYxnUDYqAjJXJA90bSB1000Xja', '2016-03-03 03:35:28', '2018-10-29 12:06:31', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`dsnNidn`),
  ADD UNIQUE KEY `dsnNip_UNIQUE` (`dsnNip`),
  ADD KEY `fk_dosen_1_idx` (`dsnProdiKode`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`jurKode`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`klsId`),
  ADD KEY `fk_kelas_1_idx` (`klsMkKurId`),
  ADD KEY `fk_kelas_2_idx` (`klsDsnNidn`),
  ADD KEY `fk_kelas_3_idx` (`klsSempId`);

--
-- Indexes for table `kode_nilai`
--
ALTER TABLE `kode_nilai`
  ADD PRIMARY KEY (`kdnlId`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`krsId`),
  ADD KEY `fk_krs_1_idx` (`krsNim`),
  ADD KEY `fk_krs_2_idx` (`krsSempId`);

--
-- Indexes for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD PRIMARY KEY (`krsdtId`),
  ADD KEY `fk_krs_detail_1_idx` (`krsdtKrsId`),
  ADD KEY `fk_krs_detail_2_idx` (`krsKlsId`);

--
-- Indexes for table `krs_nilai`
--
ALTER TABLE `krs_nilai`
  ADD PRIMARY KEY (`krsnaId`),
  ADD KEY `fk_krs_nilai_1_idx` (`krsnaKrsDtId`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`kurId`),
  ADD KEY `fk_kurikulum_1_idx` (`kurProdiKode`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`mhsNim`),
  ADD KEY `fk_mahasiswa_1_idx` (`mhsProdiKode`);

--
-- Indexes for table `matakuliah_kurikulum`
--
ALTER TABLE `matakuliah_kurikulum`
  ADD PRIMARY KEY (`mkkurId`),
  ADD KEY `fk_matakuliah_kurikulum_1_idx` (`mkkurKurId`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`presensiId`);

--
-- Indexes for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`prodiKode`),
  ADD KEY `fk_program_studi_1_idx` (`prodiKodeJurusan`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semId`);

--
-- Indexes for table `semester_prodi`
--
ALTER TABLE `semester_prodi`
  ADD PRIMARY KEY (`sempId`),
  ADD KEY `fk_semester_prodi_1_idx` (`sempSemId`),
  ADD KEY `fk_semester_prodi_2_idx` (`semProdiKode`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `klsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `krsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krs_detail`
--
ALTER TABLE `krs_detail`
  MODIFY `krsdtId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krs_nilai`
--
ALTER TABLE `krs_nilai`
  MODIFY `krsnaId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matakuliah_kurikulum`
--
ALTER TABLE `matakuliah_kurikulum`
  MODIFY `mkkurId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `presensiId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semester_prodi`
--
ALTER TABLE `semester_prodi`
  MODIFY `sempId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `fk_dosen_1` FOREIGN KEY (`dsnProdiKode`) REFERENCES `program_studi` (`prodiKode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `fk_kelas_1` FOREIGN KEY (`klsMkKurId`) REFERENCES `matakuliah_kurikulum` (`mkkurId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kelas_2` FOREIGN KEY (`klsDsnNidn`) REFERENCES `dosen` (`dsnNidn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kelas_3` FOREIGN KEY (`klsSempId`) REFERENCES `semester_prodi` (`sempId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `fk_krs_1` FOREIGN KEY (`krsNim`) REFERENCES `mahasiswa` (`mhsNim`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_krs_2` FOREIGN KEY (`krsSempId`) REFERENCES `semester_prodi` (`sempId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD CONSTRAINT `fk_krs_detail_1` FOREIGN KEY (`krsdtKrsId`) REFERENCES `krs` (`krsId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_krs_detail_2` FOREIGN KEY (`krsKlsId`) REFERENCES `kelas` (`klsId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `krs_nilai`
--
ALTER TABLE `krs_nilai`
  ADD CONSTRAINT `fk_krs_nilai_1` FOREIGN KEY (`krsnaKrsDtId`) REFERENCES `krs_detail` (`krsdtId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD CONSTRAINT `fk_kurikulum_1` FOREIGN KEY (`kurProdiKode`) REFERENCES `program_studi` (`prodiKode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `fk_mahasiswa_1` FOREIGN KEY (`mhsProdiKode`) REFERENCES `program_studi` (`prodiKode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `matakuliah_kurikulum`
--
ALTER TABLE `matakuliah_kurikulum`
  ADD CONSTRAINT `fk_matakuliah_kurikulum_1` FOREIGN KEY (`mkkurKurId`) REFERENCES `kurikulum` (`kurId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD CONSTRAINT `fk_program_studi_1` FOREIGN KEY (`prodiKodeJurusan`) REFERENCES `jurusan` (`jurKode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `semester_prodi`
--
ALTER TABLE `semester_prodi`
  ADD CONSTRAINT `fk_semester_prodi_1` FOREIGN KEY (`sempSemId`) REFERENCES `semester` (`semId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_semester_prodi_2` FOREIGN KEY (`semProdiKode`) REFERENCES `program_studi` (`prodiKode`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
