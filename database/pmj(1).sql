-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2022 at 05:51 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmj`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_pengunjung`
--

CREATE TABLE `detail_pengunjung` (
  `id_detail_pengunjung` int(11) NOT NULL,
  `id_pengunjung` varchar(5) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(25) NOT NULL,
  `pendidikan` varchar(25) NOT NULL,
  `id_produk` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pengunjung`
--

INSERT INTO `detail_pengunjung` (`id_detail_pengunjung`, `id_pengunjung`, `nama`, `alamat`, `no_hp`, `pendidikan`, `id_produk`) VALUES
(1, '3', 'pengunjung', 'pjh', 'nohp pj', 'TK', '3'),
(2, '3', 'pengunjung', 'pjh', 'nohp pj', 'TK', '3'),
(3, '', 'Hamid Septian', 'Disana', '081212121212', 'TK', '3'),
(4, '', '4', 'l', 'l', 'TK', '3'),
(5, '3', 'Hanif', 'maransi', '081212121', 'TK', '5'),
(6, '4', 'hamid', 'disana', '0', 'TK', '6'),
(7, '4', 'cok', 'disini', '0811817', 'TK', '6');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(3) NOT NULL,
  `nama_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `nohp_pelanggan` varchar(12) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `nohp_pelanggan`, `username`, `password`) VALUES
(1, 'Ahmad Syarif', 'maransi', '081212121212', '11', '11'),
(2, 'Ahmad Syarif', 'maransi', '081212121212', '11', '11'),
(3, 'Ahmad Syarif', 'maransi', '081212121212', '11', '11'),
(4, 'Ahmad Syarif', 'maransi', '081212121212', '11', '11');

-- --------------------------------------------------------

--
-- Table structure for table `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id_pengunjung` int(11) NOT NULL,
  `nama_kelompok` varchar(25) NOT NULL,
  `tgl_kunjungan` date NOT NULL DEFAULT current_timestamp(),
  `pj` varchar(25) NOT NULL,
  `nohp_pj` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengunjung`
--

INSERT INTO `pengunjung` (`id_pengunjung`, `nama_kelompok`, `tgl_kunjungan`, `pj`, `nohp_pj`, `status`) VALUES
(3, 'pengunjung', '2022-05-10', 'pjh', 'nohp pj', 'Langsung Di Tempat'),
(4, 'stmik', '2022-05-17', 'ica', '086977', 'Booking');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_pengunjung` varchar(5) NOT NULL,
  `id_detail_pengunjung` varchar(5) NOT NULL,
  `id_produk` varchar(5) NOT NULL,
  `qty` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_pengunjung`, `id_detail_pengunjung`, `id_produk`, `qty`) VALUES
(1, '3', '2', '3', '6'),
(2, '', '3', '3', '4'),
(3, '', '4', '3', '4'),
(4, '3', '5', '5', '9'),
(5, '3', '2', '3', '5'),
(6, '3', '2', '6', '4'),
(7, '3', '5', '5', '2'),
(8, '4', '6', '6', '2'),
(9, '4', '7', '6', '1'),
(10, '4', '7', '5', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pmj`
--

CREATE TABLE `pmj` (
  `id` int(3) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `nohp` varchar(13) NOT NULL,
  `jabatan` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pmj`
--

INSERT INTO `pmj` (`id`, `nama`, `alamat`, `nohp`, `jabatan`, `email`, `password`, `foto`) VALUES
(4, 'Revany ssss', 'Sitebasssss', '0811111', 'Ownersssss', '1111', '1111', '220510040820.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(25) NOT NULL,
  `nama_produk` varchar(25) NOT NULL,
  `harga` int(12) NOT NULL,
  `gambar` text NOT NULL,
  `harga_per` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`, `gambar`, `harga_per`, `keterangan`) VALUES
(5, 'Paket 1', 90000, '220517115141.jpg', 'Paket', 'eskrim\r\nayam\r\nnasi '),
(6, 'Paket 2', 60000, '220510035343.jpg', 'Paket', 'berisi ini dan itu dan lain lain\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pengunjung`
--
ALTER TABLE `detail_pengunjung`
  ADD PRIMARY KEY (`id_detail_pengunjung`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id_pengunjung`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `pmj`
--
ALTER TABLE `pmj`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pengunjung`
--
ALTER TABLE `detail_pengunjung`
  MODIFY `id_detail_pengunjung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id_pengunjung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pmj`
--
ALTER TABLE `pmj`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
