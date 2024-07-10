-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2024 pada 10.08
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telecom_issues`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `issue_name` varchar(255) NOT NULL,
  `symptoms` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `issues`
--

INSERT INTO `issues` (`id`, `issue_name`, `symptoms`) VALUES
(1, 'Kabel Terputus', 'Tidak ada koneksi, lampu indikator modem mati total'),
(2, 'Setting Modem Salah', 'Modem tidak bisa konek ke jaringan, lampu DSL berkedip'),
(3, 'Interferensi Sinyal', 'Koneksi sering putus-putus, kualitas sinyal buruk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `solutions`
--

CREATE TABLE `solutions` (
  `id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `solution` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `solutions`
--

INSERT INTO `solutions` (`id`, `issue_id`, `solution`) VALUES
(1, 1, 'Periksa dan ganti kabel jaringan yang putus'),
(2, 1, 'Pastikan konektor kabel terpasang dengan benar'),
(3, 2, 'Reset modem dan konfigurasi ulang setting modem'),
(4, 2, 'Periksa username dan password ISP di setting modem'),
(5, 3, 'Ubah kanal WiFi untuk menghindari interferensi'),
(6, 3, 'Pindahkan modem ke lokasi yang lebih terbuka');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `solutions`
--
ALTER TABLE `solutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issue_id` (`issue_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `solutions`
--
ALTER TABLE `solutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `solutions`
--
ALTER TABLE `solutions`
  ADD CONSTRAINT `solutions_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
