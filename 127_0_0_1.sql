-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2026 at 01:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumah_sakit_db`
--
CREATE DATABASE IF NOT EXISTS `rumah_sakit_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rumah_sakit_db`;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `spesialisasi` varchar(100) NOT NULL,
  `tarif_konsultasi` decimal(12,2) NOT NULL,
  `status_dokter` enum('Aktif','Cuti','Nonaktif') NOT NULL DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `id_poli`, `spesialisasi`, `tarif_konsultasi`, `status_dokter`) VALUES
(1, 'Dr. Zahra Aulia Ramadhani', 1, 'Dokter Umum', 75000.00, 'Aktif'),
(2, 'Dr. Fera Febriana Putri', 2, 'Dokter Anak', 100000.00, 'Aktif'),
(3, 'Dr. Dewa Arya Pratama', 3, 'Dokter Gigi', 125000.00, 'Aktif'),
(4, 'Dr. Nanda Putri Amelia', 4, 'Dokter Jantung', 200000.00, 'Aktif'),
(5, 'Dr. Wildan Fajar Ramadhan', 5, 'Dokter Mata', 150000.00, 'Aktif'),
(6, 'Dr. Alvin Maulana Hakim', 6, 'Dokter Saraf', 175000.00, 'Cuti'),
(7, 'Dr. Muhammad Farhan Akbar', 7, 'Penyakit Dalam', 150000.00, 'Aktif'),
(8, 'Dr. Rania Putri Lestari', 8, 'Dokter Kulit', 125000.00, 'Aktif'),
(9, 'Dr. Rizky Maulana Saputra', 9, 'Dokter THT', 150000.00, 'Aktif'),
(10, 'Dr. Aditya Bagus Pratama', 10, 'Dokter Bedah', 250000.00, 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `jenis_kunjungan` enum('Umum','Kontrol','Darurat') NOT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `status_kunjungan` enum('Menunggu','Diperiksa','Selesai','Batal') NOT NULL DEFAULT 'Menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `id_pasien`, `id_dokter`, `tanggal_kunjungan`, `jenis_kunjungan`, `diagnosis`, `status_kunjungan`) VALUES
(1, 1, 1, '2026-10-01', 'Umum', 'Demam', 'Selesai'),
(2, 2, 2, '2026-10-02', 'Kontrol', 'Kontrol kesehatan', 'Selesai'),
(3, 3, 3, '2026-10-03', 'Umum', 'Sakit gigi', 'Selesai'),
(4, 4, 4, '2026-10-04', 'Darurat', 'Nyeri dada', 'Diperiksa'),
(5, 5, 5, '2026-10-05', 'Umum', 'Gangguan penglihatan', 'Selesai'),
(6, 6, 7, '2026-10-06', 'Kontrol', 'Kontrol tekanan darah', 'Selesai'),
(7, 7, 8, '2026-10-07', 'Umum', 'Alergi kulit', 'Selesai'),
(8, 8, 9, '2026-10-08', 'Darurat', 'Infeksi telinga', 'Batal'),
(9, 9, 10, '2026-10-09', 'Umum', 'Cedera ringan', 'Selesai'),
(10, 10, 1, '2026-10-10', 'Kontrol', 'Kontrol rutin', 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `no_hp`) VALUES
(1, 'Syifa Aulia Putri', 'P', '2005-01-12', 'Bandar Lampung', '081234560001'),
(2, 'Luna Safitri Ramadhani', 'P', '2005-03-15', 'Kedaton', '081234560002'),
(3, 'Selfiana Putri Maharani', 'P', '2005-05-20', 'Rajabasa', '081234560003'),
(4, 'Alif Nur Khasanah', 'P', '2004-07-11', 'Sukarame', '081234560004'),
(5, 'Naufal Rizky Pratama', 'L', '2004-09-18', 'Kemiling', '081234560005'),
(6, 'Razqa Alfarizi Maulana', 'L', '2005-02-22', 'Way Halim', '081234560006'),
(7, 'Guntur Saputra Wijaya', 'L', '2004-11-09', 'Teluk Betung', '081234560007'),
(8, 'Rafi Ahmad Firmansyah', 'L', '2005-06-14', 'Panjang', '081234560008'),
(9, 'Tegar Dwi Prakoso', 'L', '2004-04-17', 'Sukabumi', '081234560009'),
(10, 'Bagas Aditya Nugraha', 'L', '2005-08-25', 'Langkapura', '081234560010');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_kunjungan` int(11) NOT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `biaya_konsultasi` decimal(12,2) NOT NULL DEFAULT 0.00,
  `biaya_obat` decimal(12,2) NOT NULL DEFAULT 0.00,
  `biaya_laboratorium` decimal(12,2) NOT NULL DEFAULT 0.00,
  `diskon` decimal(12,2) NOT NULL DEFAULT 0.00,
  `metode_bayar` enum('Tunai','Transfer','Asuransi') NOT NULL,
  `status_bayar` enum('Lunas','Belum Lunas') NOT NULL DEFAULT 'Belum Lunas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_kunjungan`, `tanggal_bayar`, `biaya_konsultasi`, `biaya_obat`, `biaya_laboratorium`, `diskon`, `metode_bayar`, `status_bayar`) VALUES
(1, 1, '2026-10-01', 75000.00, 25000.00, 0.00, 5000.00, 'Tunai', 'Lunas'),
(2, 2, '2026-10-02', 100000.00, 30000.00, 0.00, 10000.00, 'Transfer', 'Lunas'),
(3, 3, '2026-10-03', 125000.00, 50000.00, 25000.00, 0.00, 'Tunai', 'Lunas'),
(4, 4, NULL, 200000.00, 50000.00, 100000.00, 0.00, 'Asuransi', 'Belum Lunas'),
(5, 5, '2026-10-05', 150000.00, 40000.00, 50000.00, 20000.00, 'Transfer', 'Lunas'),
(6, 6, '2026-10-06', 150000.00, 30000.00, 0.00, 10000.00, 'Asuransi', 'Lunas'),
(7, 7, '2026-10-07', 125000.00, 25000.00, 0.00, 0.00, 'Tunai', 'Lunas'),
(8, 8, NULL, 150000.00, 30000.00, 0.00, 0.00, 'Transfer', 'Belum Lunas'),
(9, 9, '2026-10-09', 250000.00, 50000.00, 100000.00, 0.00, 'Transfer', 'Lunas'),
(10, 10, '2026-10-10', 75000.00, 20000.00, 0.00, 5000.00, 'Tunai', 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id_poli` int(11) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `lantai` int(11) NOT NULL,
  `status_poli` enum('Aktif','Nonaktif') NOT NULL DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `lantai`, `status_poli`) VALUES
(1, 'Poli Umum', 1, 'Aktif'),
(2, 'Poli Anak', 2, 'Aktif'),
(3, 'Poli Gigi', 1, 'Aktif'),
(4, 'Poli Jantung', 3, 'Aktif'),
(5, 'Poli Mata', 2, 'Aktif'),
(6, 'Poli Saraf', 3, 'Aktif'),
(7, 'Poli Penyakit Dalam', 2, 'Aktif'),
(8, 'Poli Kulit', 2, 'Aktif'),
(9, 'Poli THT', 3, 'Aktif'),
(10, 'Poli Bedah', 4, 'Aktif');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_soal4_kunjungan_lengkap`
-- (See below for the actual view)
--
CREATE TABLE `vw_soal4_kunjungan_lengkap` (
`id_pasien` int(11)
,`nama_pasien` varchar(100)
,`id_dokter` int(11)
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`spesialisasi` varchar(100)
,`tanggal_kunjungan` date
,`status_kunjungan` enum('Menunggu','Diperiksa','Selesai','Batal')
,`diagnosis` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_soal5_rekap_pasien`
-- (See below for the actual view)
--
CREATE TABLE `vw_soal5_rekap_pasien` (
`nama_pasien` varchar(100)
,`no_hp` varchar(15)
,`jumlah_kunjungan` bigint(21)
,`tanggal_kunjungan_terakhir` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_soal6_dokter_kunjungan`
-- (See below for the actual view)
--
CREATE TABLE `vw_soal6_dokter_kunjungan` (
`nama_dokter` varchar(100)
,`spesialisasi` varchar(100)
,`nama_poli` varchar(100)
,`id_kunjungan` int(11)
,`status_kunjungan` enum('Menunggu','Diperiksa','Selesai','Batal')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_soal7_laporan_pemeriksaan_pembayaran`
-- (See below for the actual view)
--
CREATE TABLE `vw_soal7_laporan_pemeriksaan_pembayaran` (
`nama_pasien` varchar(100)
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`tanggal_kunjungan` date
,`diagnosis` varchar(200)
,`total_sebelum_diskon` decimal(14,2)
,`diskon` decimal(12,2)
,`total_setelah_diskon` decimal(15,2)
,`metode_bayar` enum('Tunai','Transfer','Asuransi')
,`status_bayar` enum('Lunas','Belum Lunas')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_soal8_keterangan_diskon`
-- (See below for the actual view)
--
CREATE TABLE `vw_soal8_keterangan_diskon` (
`id_pembayaran` int(11)
,`id_kunjungan` int(11)
,`biaya_konsultasi` decimal(12,2)
,`biaya_obat` decimal(12,2)
,`biaya_laboratorium` decimal(12,2)
,`diskon` decimal(12,2)
,`keterangan_diskon` varchar(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_soal9_klasifikasi_biaya`
-- (See below for the actual view)
--
CREATE TABLE `vw_soal9_klasifikasi_biaya` (
`id_pembayaran` int(11)
,`id_kunjungan` int(11)
,`total_biaya` decimal(15,2)
,`klasifikasi_biaya` varchar(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_soal10_status_prioritas`
-- (See below for the actual view)
--
CREATE TABLE `vw_soal10_status_prioritas` (
`id_kunjungan` int(11)
,`id_pasien` int(11)
,`id_dokter` int(11)
,`jenis_kunjungan` enum('Umum','Kontrol','Darurat')
,`status_kunjungan` enum('Menunggu','Diperiksa','Selesai','Batal')
,`status_prioritas` varchar(17)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_soal4_kunjungan_lengkap`
--
DROP TABLE IF EXISTS `vw_soal4_kunjungan_lengkap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_soal4_kunjungan_lengkap`  AS SELECT `p`.`id_pasien` AS `id_pasien`, `p`.`nama_pasien` AS `nama_pasien`, `d`.`id_dokter` AS `id_dokter`, `d`.`nama_dokter` AS `nama_dokter`, `pol`.`nama_poli` AS `nama_poli`, `d`.`spesialisasi` AS `spesialisasi`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan`, `k`.`diagnosis` AS `diagnosis` FROM (((`kunjungan` `k` join `pasien` `p` on(`k`.`id_pasien` = `p`.`id_pasien`)) join `dokter` `d` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `pol` on(`d`.`id_poli` = `pol`.`id_poli`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_soal5_rekap_pasien`
--
DROP TABLE IF EXISTS `vw_soal5_rekap_pasien`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_soal5_rekap_pasien`  AS SELECT `p`.`nama_pasien` AS `nama_pasien`, `p`.`no_hp` AS `no_hp`, count(`k`.`id_kunjungan`) AS `jumlah_kunjungan`, max(`k`.`tanggal_kunjungan`) AS `tanggal_kunjungan_terakhir` FROM (`pasien` `p` left join `kunjungan` `k` on(`p`.`id_pasien` = `k`.`id_pasien`)) GROUP BY `p`.`id_pasien`, `p`.`nama_pasien`, `p`.`no_hp` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_soal6_dokter_kunjungan`
--
DROP TABLE IF EXISTS `vw_soal6_dokter_kunjungan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_soal6_dokter_kunjungan`  AS SELECT `d`.`nama_dokter` AS `nama_dokter`, `d`.`spesialisasi` AS `spesialisasi`, `pol`.`nama_poli` AS `nama_poli`, `k`.`id_kunjungan` AS `id_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan` FROM ((`dokter` `d` left join `kunjungan` `k` on(`k`.`id_dokter` = `d`.`id_dokter`)) left join `poli` `pol` on(`d`.`id_poli` = `pol`.`id_poli`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_soal7_laporan_pemeriksaan_pembayaran`
--
DROP TABLE IF EXISTS `vw_soal7_laporan_pemeriksaan_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_soal7_laporan_pemeriksaan_pembayaran`  AS SELECT `p`.`nama_pasien` AS `nama_pasien`, `d`.`nama_dokter` AS `nama_dokter`, `pol`.`nama_poli` AS `nama_poli`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`diagnosis` AS `diagnosis`, `pem`.`biaya_konsultasi`+ `pem`.`biaya_obat` + `pem`.`biaya_laboratorium` AS `total_sebelum_diskon`, `pem`.`diskon` AS `diskon`, `pem`.`biaya_konsultasi`+ `pem`.`biaya_obat` + `pem`.`biaya_laboratorium` - `pem`.`diskon` AS `total_setelah_diskon`, `pem`.`metode_bayar` AS `metode_bayar`, `pem`.`status_bayar` AS `status_bayar` FROM ((((`kunjungan` `k` join `pasien` `p` on(`k`.`id_pasien` = `p`.`id_pasien`)) join `dokter` `d` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `pol` on(`d`.`id_poli` = `pol`.`id_poli`)) left join `pembayaran` `pem` on(`k`.`id_kunjungan` = `pem`.`id_kunjungan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_soal8_keterangan_diskon`
--
DROP TABLE IF EXISTS `vw_soal8_keterangan_diskon`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_soal8_keterangan_diskon`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`biaya_konsultasi` AS `biaya_konsultasi`, `pembayaran`.`biaya_obat` AS `biaya_obat`, `pembayaran`.`biaya_laboratorium` AS `biaya_laboratorium`, `pembayaran`.`diskon` AS `diskon`, if(`pembayaran`.`diskon` > 0,'Mendapat Diskon','Tidak Mendapat Diskon') AS `keterangan_diskon` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_soal9_klasifikasi_biaya`
--
DROP TABLE IF EXISTS `vw_soal9_klasifikasi_biaya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_soal9_klasifikasi_biaya`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`biaya_konsultasi`+ `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` AS `total_biaya`, if(`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` < 100000,'Ekonomis',if(`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` < 300000,'Menengah','Premium')) AS `klasifikasi_biaya` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_soal10_status_prioritas`
--
DROP TABLE IF EXISTS `vw_soal10_status_prioritas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_soal10_status_prioritas`  AS SELECT `kunjungan`.`id_kunjungan` AS `id_kunjungan`, `kunjungan`.`id_pasien` AS `id_pasien`, `kunjungan`.`id_dokter` AS `id_dokter`, `kunjungan`.`jenis_kunjungan` AS `jenis_kunjungan`, `kunjungan`.`status_kunjungan` AS `status_kunjungan`, if(`kunjungan`.`jenis_kunjungan` = 'Darurat' and `kunjungan`.`status_kunjungan` <> 'Batal','Prioritas Tinggi',if(`kunjungan`.`jenis_kunjungan` = 'Kontrol' and `kunjungan`.`status_kunjungan` = 'Selesai','Kontrol Selesai',if(`kunjungan`.`status_kunjungan` = 'Batal','Tidak Dilayani','Pelayanan Reguler'))) AS `status_prioritas` FROM `kunjungan` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `id_kunjungan` (`id_kunjungan`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
