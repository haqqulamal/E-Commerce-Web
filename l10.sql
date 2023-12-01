-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Okt 2023 pada 04.10
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `l10`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pesanan_id` bigint(20) UNSIGNED NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id`, `pesanan_id`, `produk_id`, `jumlah`, `sub_total`, `created_at`, `updated_at`) VALUES
(3, 2, 6, 1, 6880000, '2023-10-25 21:37:56', '2023-10-25 21:37:56'),
(4, 3, 6, 1, 6880000, '2023-10-25 21:42:25', '2023-10-25 21:42:25'),
(5, 4, 5, 1, 3899000, '2023-10-25 21:47:38', '2023-10-25 21:47:38'),
(6, 4, 6, 1, 6880000, '2023-10-25 21:47:38', '2023-10-25 21:47:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hadiah`
--

CREATE TABLE `hadiah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `persentase` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `hadiah`
--

INSERT INTO `hadiah` (`id`, `nama`, `persentase`, `created_at`, `updated_at`) VALUES
(1, 'Saldo OVO 100k', 40, '2023-10-24 02:43:17', '2023-10-24 02:43:17'),
(2, 'Robot Earbuds', 10, '2023-10-24 02:43:17', '2023-10-24 02:43:17'),
(3, 'Setrika', 15, '2023-10-24 02:43:17', '2023-10-24 02:43:17'),
(4, 'Kompor Gas', 5, '2023-10-24 02:43:17', '2023-10-24 02:43:17'),
(5, 'Laptop', 1, '2023-10-24 02:43:17', '2023-10-24 02:43:17'),
(6, 'Zonk', 30, '2023-10-24 02:43:17', '2023-10-24 02:43:17'),
(7, 'Kulkas', 2, '2023-10-24 02:43:17', '2023-10-24 02:43:17'),
(8, 'Kipas Angin', 7, '2023-10-24 02:43:17', '2023-10-24 02:43:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(3, 'TV', '2023-10-23 23:28:07', '2023-10-23 23:28:07'),
(4, 'Mouse', '2023-10-25 21:03:05', '2023-10-25 21:03:05'),
(5, 'Kulkas', '2023-10-25 21:06:17', '2023-10-25 21:06:17'),
(6, 'HP', '2023-10-25 21:07:01', '2023-10-25 21:21:37'),
(7, 'Webcam', '2023-10-25 21:07:07', '2023-10-25 21:07:07'),
(8, 'Headphone', '2023-10-25 21:10:40', '2023-10-25 21:10:40'),
(9, 'Keyboard', '2023-10-25 21:19:48', '2023-10-25 21:19:48'),
(10, 'Fan Cooler', '2023-10-25 21:31:21', '2023-10-25 21:31:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_08_06_152040_create_kategoris_table', 1),
(4, '2023_08_06_152104_create_produks_table', 1),
(5, '2023_08_06_152147_create_pesanans_table', 1),
(6, '2023_08_06_152159_create_detail_pesanans_table', 1),
(7, '2023_10_17_082208_create_vouchers_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `total`, `bayar`, `status`, `created_at`, `updated_at`) VALUES
(1, 469114, 470000, 1, '2023-10-23 23:23:00', '2023-10-23 23:23:00'),
(2, 6880000, 7000000, 1, '2023-10-25 21:37:56', '2023-10-25 21:37:56'),
(3, 6880000, 7000000, 1, '2023-10-25 21:42:25', '2023-10-25 21:42:25'),
(4, 10779000, 11000000, 1, '2023-10-25 21:47:38', '2023-10-25 21:47:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `deskripsi`, `foto`, `created_at`, `updated_at`) VALUES
(4, 3, 'SAMSUNG 43T5001 Full HD Digital LED TV 43 Inch T5001', 2890000, 'Spesifikasi Produk:\r\n\r\nMerek : Samsung\r\nMasa Garansi : 12 Bulan\r\nJenis Garansi : Garansi Produsen\r\nUkuran Layar TV : 40-49 inci\r\nTipe Layar TV : LCD/LED\r\nStok : 100\r\nDikirim Dari : KOTA JAKARTA BARAT\r\n\r\nDeskripsi Produk :\r\n\r\nFull HD Resolution\r\nFind 2 times the clarity\r\nYour favorite TV programs and movies get real. The rich and vivid Full HD resolution with twice the resolution of HD TV.\r\n\r\nWide Color Enhancer\r\nMore vibrant colors for better images\r\nBright, rich colors await. Wide Color Enhancer improves your image quality and uncovers details with colors as they were meant to be seen.\r\n\r\nFitur utama :\r\n- Full HD Resolution\r\n- Wide Color Enhancer\r\n- Ultra Clean View\r\n- Mega Contrast\r\n- Slim Design\r\n\r\nSpesifikasi :\r\n- Screen Size : 43 Inch\r\n- Resolution : 1,920 x 1,080\r\n- Motion Rate : 60\r\n- Picture Engine : Hyper Real\r\n- Digital Broadcasting : DVB-T2\r\n- Power Consumption (Max) : 74 W\r\n\r\nINPUTS / OUTPUTS :\r\n- HDMI Input : x2\r\n- USB Ports : x1\r\n- RF Input : x1\r\n- Composite In (AV) : 1\r\n- Digital Audio Output (Optical) : x1\r\n\r\nDimensi :\r\n- TV without Stand (W x H x D) : 954.5 x 559.4 x 88.5 mm\r\n- TV with Stand (W x H x D) : 954.5 x 608.2 x 198.2 mm\r\n- Package Carton (W x H x D) : 1060 x 651 x 145 mm\r\n- TV Stand (WxD) : 780.2 x 198.2 mm\r\n- VESA Mounting (WxH) : 200 x 200 mm', '1698292161_SAMSUNG 43T5001 Full HD Digital LED TV 43 Inch T5001.jpg', '2023-10-25 20:49:21', '2023-10-25 20:49:21'),
(5, 3, 'Samsung 43 Inch Crystal UHD 4K CU7000 Smart TV', 3899000, 'Spesifikasi Produk :\r\n\r\nMerek : Samsung\r\nMasa Garansi : 12 Bulan\r\nJenis Garansi : Garansi Produsen\r\nUkuran Layar TV : 40-49 inci\r\nStok : 50\r\n\r\nDeskripsi Produk :\r\n\r\nHarga produk belum termasuk ongkos kirim. Harap chat dulu untuk menanyakan ongkos kirim.\r\n\r\nTarif Kurir Toko Rp. 0 bukan berarti tidak ada ongkos kirim. Order yang masuk tanpa ongkos kirim akan ditunda sampai Konsumen membayar ongkos kirim nya.\r\n\r\nPengiriman menggunakan ekspedisi pihak ketiga rekanan MyHartono.\r\n\r\nBiaya Pengiriman kurir toko dihitung per unit.\r\n\r\nJADETABEK : Biaya kirim lebih dari 1 unit, unit ke-2 dst dikenakan biaya sebesar Rp. 55.000/unit. Surabaya, Sidoarjo, Gresik dan Malang : Biaya kirim lebih dari 1 unit, unit ke-2 dst dikenakan biaya sebesar Rp. 20.000/unit.\r\n\r\nJika alamat tujuan adalah ekspedisi (depo), maka ada tambahan biaya depo sebesar Rp. 25.000.\r\n\r\nSPECIFICATION :\r\nScreen Size : 43\"\r\nTV Tuner	: Digital\r\n3D Technology : No\r\nSmart tv : Yes\r\nDisplay Type : Flat\r\nSmart Platform : Tizen Smart TV\r\nNumber of HDMI Inputs : 3\r\nNumber Of USB Port(s) : 1\r\nResolution : 3,840 x 2,160', '1698292288_Samsung 43 Inch Crystal UHD 4K CU7000 Smart TV UA43CU7000KXXD.jpg', '2023-10-25 20:51:28', '2023-10-25 20:51:28'),
(6, 3, 'LED TV Sharp 60 inch 4T-C60CH1X Resolusi 4K UHD Digital 60CH1X', 6880000, 'Spesifikasi Produk :\r\n\r\nMerek : Sharp\r\nMasa Garansi : 12 Bulan\r\nJenis Garansi : Garansi Produsen\r\nUkuran Layar TV : 50-60 inci\r\nTipe Layar TV : LCD/LED\r\nStok : 9\r\n\r\nDikirim Dari : KOTA PEKANBARU\r\n\r\nDeskripsi Produk :\r\n\r\nSharp 4T-C60CH1X merupakan LED TV dengan layar flat ukuran 60 inch. Menghadirkan resolusi 4K atau 3840 x 2160 pixel dan didukung fitur HDR yang tentunya akan membuat gambar lebih jernih. Sharp 4T-C60CH1X dilengkapi dengan speaker dibawah sehingga dapat memantulkan suara lebih luas. \r\n\r\n4K Ultra-HD Resolution with HDR\r\nDigital Broadcast Compatible ( DVB-T2 )\r\nX4 Master Engine Pro II\r\nUSB Movie\r\nOptical Audio Out\r\n5years.png7shield%20small.png\r\n\r\nSpecification (TV) (-)\r\nScreen Size (Diagonal)	60\" (153 cm)\r\nResolution	3,840 x 2,160\r\nHdr 10	Yes\r\nEngine	X4 Master Engine Pro II\r\nColour Enhancement	Wide Colour\r\nBrightness Enhancement	No\r\nContrast Enhancement	Yes\r\nMotion Enhancement	AquoMotion 120 Hz\r\nTV Receiving System (Digital)\"	DVB-T2\r\nTV Receiving System (Analogue)	PAL-B/G, -D/K, -I, SECAM-B/G, -D/K, -K/K1\r\nVideo Colour Systems	PAL, SECAM, NTSC 3.58, NTSC 4.43, PAL 60\r\nAntenna Booster	Yes\r\nOutput Power	10W x 2\r\nSurround	Original Surround\r\nDecoder	Dolby Audio\r\nSound Enhancement	Bass Enhancer\r\nPlatform	No\r\nBrowser	No\r\nYoutube	No\r\nVoice Search	No\r\nOthers	No\r\nMirroring / Casting	No\r\nWallpaper Mode	No\r\nComfort Mode	No\r\nChild Timer	No\r\nEco Mode	No\r\nSlim Design	No\r\nHDMI	3\r\nVideo In	1\r\nUSB Movie	1 + 1\r\nSD Card Slot	No\r\nEthernet LAN	No\r\nWireless LAN	No\r\nBluetooth	No\r\nDigital Audio Output	1\r\nHeadphone	1\r\nPC Input ( D-Sub 15 Pin )	No\r\nRS-232C	No\r\nPower Consumption	185 W\r\nDimension Without Stand ( mm )	1358 x 799 x 83\r\nDimension With Stand ( mm )	1358 x 864 x 300\r\nWeight Without Stand ( kg )	17,5\r\nWeight With Stand ( kg )	18,5', '1698292856_LED TV Sharp 60 inch 4T-C60CH1X Resolusi 4K UHD Digital 60CH1X.jpg', '2023-10-25 21:00:56', '2023-10-25 21:00:56'),
(7, 3, 'LED TV Sharp 42 inch 2T-C42DD1I Digital 42DD1I', 3050000, 'Spesifikasi Produk :\r\n\r\nMerek : Sharp\r\nMasa Garansi : 12 Bulan\r\nJenis Garansi : Garansi Produsen\r\nUkuran Layar TV : 40-49 inci\r\nTipe Layar TV : LCD/LED\r\nStok : 8\r\n\r\nDikirim Dari : KOTA PEKANBARU\r\n\r\nDeskripsi Produk :\r\n\r\nFull-HD TV\r\nX2 Master Engine\r\nDigital Broadcast Compatible ( DVB-T2 )\r\nUSB Movie\r\n15W Sound Reflecting Design\r\nChild Timer\r\nSuper Eco Mode\r\nComfort Mode\r\n\r\nSPESIFIKASI :\r\n\r\nDisplay\r\nScreen Size (Diagonal) : 42\"(105cm)\r\nResolution : 1.920 x 1.080 (Full HD)\r\n\r\nAudio\r\nSurround Original Surround\r\nDecoder Dolby Audio\r\nSound Enhancement : Bass Enchancer\r\n\r\nInput/Output\r\nHDMI : 3\r\nVideo In : 1\r\nUSB Movie : 2\r\n\r\nKonektivitas\r\nEthernet LAN : No\r\nWireless LAN : No\r\nHeadphone : 1 (Share with Audio Out)\r\n\r\nLain-lain\r\nHdr 10 : No\r\nEngine : X2 Master Engine\r\nColour Enhancement : Wide Colour\r\nBrightness Enhancement : Standard\r\nTV Receiving System (Digital) : DVB-T2\r\nTV Receiving System (Analogue) : PAL-B/G, -D/K, -I, SECAM-B/G, -D/K, -K/K1, NTSC-M\r\nVideo Colour Systems : PAL, PAL 60 SECAM, NTSC 3.58, NTSC 4.43\r\nAntenna Booster : Yes\r\nWallpaper Mode : No\r\nOutput Power : 15W ( 7.5W + 7.5W )\r\nPower Consumption : 78 W\r\n\r\nDimensi\r\nDimension Without Stand (mm) 956 x 576 x 81\r\nDimension With Stand (mm) 956 x 646 x 248\r\nWeight Without Stand (kg) 7.4\r\nWeight With Stand ( kg ) 7.6\r\n\r\nSyarat dan ketentuan garansi\r\nGaransi 5 tahun service sparepart \r\nGaransi 1 tahun panel\r\nKartu garansi\r\nInvoice pembelian', '1698293033_LED TV Sharp 42 inch 2T-C42DD1I Digital 42DD1I.jpg', '2023-10-25 21:03:53', '2023-10-25 21:03:53'),
(8, 4, 'Taffware Fantech Gaming Mouse Wireless 2000 DPI - W4 BLACK', 34500, 'Dengan harganya yang begitu terjangkau, Anda bukan hanya mendapatkan mouse yang dikhususkan untuk gaming saja, namun juga fitur menarik seperti wireless dan dpi yang cukup tinggi.\r\n\r\nSpesifikasi\r\nTipe Mouse	:Mouse Optik Nirkabel\r\nMax DPI	  :Dapat Disesuaikan hingga 2000 DPI\r\nFrekuensi :2.4 Ghz Nirkabel\r\nJangkauan: 10-15 M\r\nJumlah Tombol	\r\nTombol fisik:\r\n- Klik Kiri dan Kanan\r\n- 2 Tombol Samping\r\n- 1 Tombol Pengaturan DPI\r\nTipe Baterai	\r\n2 x AAA\r\nDimensi	\r\n12 x 7 x 3.5 mm\r\nDesain	\r\nAmbidextrous\r\n\r\nGaransi :\r\nGaransi Toko (Garansi Fungsi selama 7 Hari dari tanggal penerimaan Barang oleh pembeli yang tercatat pada sistem shopee.\r\n\r\nCara Klaiman Garansi Fungsi :Harus disertai foto dan video yang jelas pada saat unboxing dan cara pemakaian.(Tidak ada video dan Foto Klaiman garansi fungsi tidak diterima dengan alasan apapun.', '1698293121_WhatsApp Image 2023-10-26 at 10.45.53.jpeg', '2023-10-25 21:05:21', '2023-10-25 21:05:21'),
(9, 3, 'Sony X75K TV Series: 4K UHD LED', 6629000, '-', '1698293158_KD-43X75K-usp_f68u-7r.jpg', '2023-10-25 21:05:58', '2023-10-25 21:05:58'),
(10, 3, 'LG 50UQ7500 Led Smart Tv 50 Inch 4K UHD AI ThinQ', 4999000, 'Spesifikasi Produk :\r\n\r\nMerek : LG\r\nMasa Garansi : 12 Bulan\r\nJenis Garansi : Garansi Supplier\r\nUkuran Layar TV : 50-60 inci\r\nStok : 5\r\nDikirim Dari : KOTA BANDUNG\r\n\r\nDeskripsi Produk :\r\n\r\nGaransi Resmi LG Indonesia, barang gress 100%\r\nFree ongkir Kota Bandung, pilih Kurir Toko, armada toko yg kirim dan install\r\nOngkir otomatis untuk daerah sbb: Cimahi 35rb, KBB 75rb, Kabupaten 100rb\r\n\r\nProsesor AI α5 Gen 5\r\nTingkatkan pengalaman menonton Anda\r\nProsesor AI α5 Gen5 menyempurnakan LG UHD TV untuk memberi Anda pengalaman yang imersif.\r\n\r\nFitur utama :\r\n- Real 4K\r\n- Desain ramping\r\n- Prosesor AI α5 Gen5 untuk pengalaman menonton yang lebih baik\r\n- ThinQ AI & WebOS\r\n- Active HDR\r\n\r\nSpesifikasi :\r\n- Type : 4K UHD\r\n- Resolution : 3840 x 2160\r\n- Refresh Rate : Refresh Rate 60Hz\r\n- Main Processor (SoC) : α5 Gen5 AI Processor 4K\r\n- Operating System (OS) : webOS Smart TV\r\n- AI Upscaling : 4K Upscaling\r\n- HDR : Active HDR\r\n- HDR10 Pro : Yes\r\n- FILMMAKER MODE™ : Yes\r\n- HDMI : 1 (Rear) / 2 (Side)\r\n- USB : 1 (Side)\r\n- Version : HDMI 2.0', '1698293158_LG 50UQ7500 Led Smart Tv 50 Inch 4K UHD AI ThinQ® 50UQ7500PSF.jpg', '2023-10-25 21:05:58', '2023-10-25 21:05:58'),
(11, 4, 'MOFii Mouse Wireless Gaming Rechargeable Baterai Type-C Fast Charging 1600DPI RGB Light P6', 89900, 'Detail Produk\r\n\r\n-Bahan perumahan: ABS\r\n\r\n-Ukuran: 114*72*40mm\r\n\r\n- Berat: 90g\r\n\r\n- Lampu indikator : 3 buah\r\n\r\n- Jenis mouse: mouse nirkabel USB\r\n\r\n- Fungsi tombol: tombol kiri, tombol kanan, roda gulir, DPI, tombol atas, tombol bawah\r\n\r\n- Model merek sensor gambar: KA8\r\n\r\n- Model merek MCU: NA\r\n\r\n- Model merek gerak mikro: Huanyu 300W\r\n\r\n- Kehidupan beringsut dan encoder: 3 juta kali\r\n\r\n- Kekuatan operasi kunci: 60-70G\r\n\r\n- Tingkat pengembalian: 125HZ\r\n\r\n- Resolusi: 800/1200/1600 default 800\r\n\r\n- Percepatan: 8g\r\n\r\n- Frekuensi pemindaian: 3000 bingkai/detik\r\n\r\n- Kecepatan gerakan: 30 inci / detik\r\n\r\n- Antarmuka lulus: semua 71 kartu warna Zhonghua telah berlalu\r\n\r\n- Kompatibilitas: Port USB yang tersedia: Windows 7/8/ 10/ 11 atau lebih baru macOS 10.5 atau lebih baru Linux® Kernel 2.6+\r\n\r\n- Spesifikasi nirkabel: protokol 2.4G pribadi\r\n\r\n- Model merek penerima 2.4G: HS6209\r\n\r\n- Jarak efektif: 10M\r\n\r\n- Arus konsumsi daya / arus listrik\r\n\r\n          ✨Bekerja dengan kecepatan penuh: 10~12mA\r\n\r\n✨Tidak ada tindakan selama 1 detik: 400uA\r\n\r\n✨Mode hemat daya: 40uA\r\n\r\n✨Tidur nyenyak: 25uA\r\n\r\n- Mendukung pengisian daya: dapat diisi ulang\r\n\r\n- Merek baterai: JXY\r\n\r\n- Jenis Baterai: Baterai Lithium Polymer\r\n\r\n- Kapasitas baterai: 400mAh\r\n\r\n- Tegangan nominal baterai: 3.7V\r\n\r\n- Tegangan pengisian: 3.7V\r\n\r\n- Pengisian arus: 80mAh\r\n\r\n- Waktu pengisian daya: 5,5-6,5 jam', '1698293177_WhatsApp Image 2023-10-26 at 10.47.25.jpeg', '2023-10-25 21:06:17', '2023-10-25 21:06:17'),
(12, 4, 'Mouse Kabel USB 2.0 M20 Optical USB Mouse Wired', 9900, 'DETAIL PRODUK\r\n- Model mouse kabel Unitech G5\r\n- Design model mewah\r\n- Plug & play\r\n- Panjang kabel 100cm\r\n- Cocok untuk penggunaan dirumah atau dikantor\r\n- Kompatibel untuk windows 98 / xp / vista / 7 / 8 atau yang terbaru\r\n- Design ergonomis cocok untuk kebanyakan tangan orang\r\n- Terdiri dari 3 tombol (scroll,tombol kiri,tombol kanan)\r\n\r\nSPESIFIKASI\r\nPanjang kabel : 1 meter\r\nDPI : 800DPI\r\nAntarmuka : USB\r\nJenis : Kabel (optical mouse)\r\nBahan : teknik plastik\r\n\r\nDIMENSI\r\nDimensi produk : 9 x 4 x 2.5 cm\r\nDimensi packaging : 12 x 4 x 3.5 cm\r\n\r\nHIGH ACCURACY MOUSE\r\nDibekali akurasi hingga 800DPI yang emmungkinakan anda dapat menggerakan pointer dilayar secara cepat dan akurat\r\n\r\nERGONOMIC DESIGN\r\nMouse M20 gaming ini sudah didesain dengan ergonomis sehingga sangat nyaman saat digenggam dan digunakan untuk waktu yang lama\r\n\r\nPLUG&PLAY\r\nUnitech Gaming Mouse M20 sangat mudah digunakan tanpa perlu menginstal driver\r\n\r\nSISTEM COMPATIBLE\r\n- Windows 10\r\n- Windows 7\r\n- Windows 8\r\n- Vista\r\n- XP\r\n- Mac OS\r\n- Linux', '1698293213_WhatsApp Image 2023-10-26 at 10.49.31.jpeg', '2023-10-25 21:06:53', '2023-10-25 21:06:53'),
(13, 5, 'POLYTRON Kulkas 2 Pintu Belleza Jumbo 260 Liter PRW 29MNX', 3619000, 'Deskripsi Produk :\r\n \r\nKulkas 2 Pintu dengan kapasitas 260 Liter, Belleza JUMBO hadir dengan design kulkas yang lebih lebar untuk kenyamanan dalam menyimpan makanan anda di kulkas.\r\n\r\nTampil elegan dan modern dengan borderless round edge Tempered Glass Door yang pastinya anti penyok dan anti karat sehingga kulkas Anda akan tetap terlihat cantik dan elegan dari masa ke masa.\r\n\r\nDilengkapi oleh deodorizer yang akan menjaga kulkas agar terbebas dari segala macam bau makanan.\r\n\r\nMiliki kebebasan mengatur luas kompartemen di bagian kulkas bawah dengan rak berbahan tempered glass yang dapat diatur ketinggiannya dan di bagian freezer dengan Removable Ice Twist Tray yang dapat dikeluarkan apabila Anda membutuhkan ukuran freezer yang lebih besar.\r\n\r\nJumbo Cabinet\r\n\r\nAutomatic Defrost System\r\n\r\nBorderless Round Edge Tempered Glass Door\r\n\r\nAdjustable Tempered Glass Rack\r\n\r\nRemovable Ice Twist Tray\r\n\r\nDeodorizer\r\n\r\nBigger Bottle Pocket\r\n\r\nDimension (WxDxH)	587 x 576 x 1589 mm\r\nCapacity	260 Liter	  \r\nPower Consumption	140 Watt\r\n\r\nABS Material\r\n\r\nLow Voltage', '1698293278_POLYTRON Kulkas 2 Pintu Belleza Jumbo 260 Liter PRW 29MNX.jpg', '2023-10-25 21:07:58', '2023-10-25 21:07:58'),
(14, 6, 'APPLE IPHONE 15 PLUS SERIES', 18499000, '-', '1698293278_MU103SA-A_G.jpg', '2023-10-25 21:07:58', '2023-10-25 21:07:58'),
(15, 7, 'W720P Web Cam Camera Microphone Laptop PC Autofocus Google Meet Zoom Skype Videebcam HD o Con Murahference', 45000, '- Plug & Play\r\n- Wide 180degree Viewing Angle\r\n- Microphone Your Voice can be Heard Clearly\r\n- Auto White Balance, auto color correction\r\n- True HD\r\n- Remote Pan Tiif cover more ground\r\n- Two-Way Audio Talk & listen from anywhere\r\n\r\ncatatan:\r\n1.semua barang bergaransi dengan syarat ongkir 100% di tanggung pembeli (bolak balik)\r\n2.barang diambil random dari dalam dus dengan kondisi BARU,di test dan dicek sekilas(tidak detail)\r\n3.kami memberikan free packing bubble/dus, namun kerusakan dalam pengiriman akibat kelalaian kurir bukan tanggung jawab kami (tapi garansi tetap berlaku)\r\n4.pemilihan warna disesuaikan dengan persediaan stok, apabila tidak di tulis WARNA kosong=cancel, akan kami kirim RANDOM\r\n5.Mohon Videokan saat Proses Membuka paket pesanan (unboxing). Untuk klaim/komplain Kekurangan item , Rusak , dan semua jenis klaim Tidak diterima/ditolak tanpa bukti video proses membuka paket!!!\r\n6. membeli=setuju dengan smua syarat 1-5 diatas', '1698293295_WhatsApp Image 2023-10-26 at 10.54.01.jpeg', '2023-10-25 21:08:15', '2023-10-25 21:08:15'),
(16, 5, 'Panasonic Kulkas 2 Pintu NRBB270VH Inverter 266 L', 5179300, 'Spesifikasi Produk :\r\n\r\nMerek : Panasonic\r\nMasa Garansi : 12 Bulan\r\nJenis Garansi : Garansi Resmi Brand\r\nStok : 5\r\nDikirim Dari : KOTA BANDUNG\r\n\r\nDeskripsi Produk :\r\n\r\n1. Tanyakan terlebih dahulu stock ready & harga update sebelum memesan.\r\n2. Pengiriman Khusus Kota Bandung & Kota Cimahi\r\n3. Free Delivery (maksimal 10 km dari toko kami)\r\n4. Diluar area Kota Bandung & Kota Cimahi dikenakan ongkir (mohon ditanyakan dahulu)\r\n5. Pengiriman barang terpisah :\r\n- Logistik yang disediakan seperti JNE,dsb. hanya untuk mengirimkan nota/kwitansi pembelian saja\r\n- Pengiriman barang memakai KURIR TOKO\r\n(KONSUMEN HANYA MEMBAYAR BIAYA PENGIRIMAN MELALUI LOGISTIK YANG TELAH DIPILIH PADA SAAT TRANSAKSI PEMBAYARAN, HAL INI UNTUK MEMENUHI KETENTUAN DARI Marketplace KARENA TIDAK TERSEDIANYA PILIHAN PENGIRIMAN LANGSUNG DARI KURIR TOKO)\r\n6. Pengiriman barang akan dilakukan paling H+1 s.d H+3 setelah proses pemesanan kami terima sebelum jam 15.00 WIB Senin- Minggu. (Pesanan yang masuk melebihi ketentuan diatas maka akan diproses hari berikutnya)\r\n7. Mohon cek barang dengan kurir kami saat penerimaan barang untuk menghindari retur.\r\n(Tipe Barang, Kondisi Fisik dan kelengkapan seperti kartu Garansi, Buku Manual, dll)\r\nBarang Baru 100% dan Garansi Resmi.\r\n\r\nNote :\r\n- Kami tidak menerima retur, karena pada saat sebelum pengiriman barang sudah kami pastikan di cek fungsi & kelengkapan produk.\r\nApabila terdapat rusak fungsi/cacat pabrikan, kami hanya akan membantu/mengarahkan customer untuk berhubungan langsung dengan pihak service center Brand yang bersangkutan.\r\n\r\nEconavi Inverter - Hemat Energi\r\nAg Clean - Anti Bakteri\r\nCool Zone - Suhu Adem di sekitar 0-2°C\r\n\r\nKapasitas Kotor (IEC 60335-1-2009)\r\nTotal Gross 266 L\r\nKapasitas Penyimpanan\r\nTotal Nett 246 L\r\nKompartemen Pendinginan (PC) 191 L\r\nKompartemen Pembeku (FC) 75 L\r\nKompartemen Sayuran (VC) -\r\nKompartemen Pembekuan Segar -\r\nKompartemen Es -\r\nUkuran Produk (WxDxH) W 550 x D 626 x H 1,636 mm\r\nJenis Tanpa Bunga Es Y\r\nPemakaian Energi 234 kWh/y\r\nTingkat Energi -\r\nBerat 51/44 kg\r\nTegangan 220 V~ (Label)', '1698293381_Panasonic Kulkas 2 Pintu NRBB270VH Inverter 266 L.jpg', '2023-10-25 21:09:41', '2023-10-25 21:09:41'),
(17, 8, 'Headphone wireless bluetooth let cat ears p47 m headset bando kucing', 36999, 'Headphone Wireless Bluetooth LED Cat Ears P47M Headset Handsfree Bando Kucing dengan macaron colors.\r\nModel : P47M Headphone\r\n\r\nPilihan Warna:\r\n- Pink\r\n- Blue mix grey\r\n- black\r\n- navy\r\n- grey mix pink\r\n- purple\r\n\r\nSpesifikasi:\r\n\r\n- Working distance: 10M\r\n- Charging time: About 1-2 hours\r\n- Working time: About 5-8 hours\r\n- Call duration: About 6 hours\r\n- Headphone battery: 300mAh\r\n- Wireless Frequency: 2.401-2.480GHz\r\n- Sensitivity: 88 ±3dB\r\n- Input current: 5V 1A\r\n\r\nFitur:\r\n\r\n- Berkualitas tinggi: Koneksi Bluetooth berkecepatan tinggi untuk mendengarkan musik, menjawab panggilan, suara stereo berkualitas.\r\n- Headphone dapat dilipat dan panjangnya dapat disesuaikan dengan kontur kepala sehingga lebih nyaman saat dipakai\r\n- Model stylish, bentuk ramping dengan variasi telinga kelinci dengan lampu LED warna warni, cocok untuk perempuan dan anak-anak\r\n- Mudah untuk mengontrol headphone Anda: Dapat dengan bebas mengontrol pergantian lagu sebelumnya dan lagu berikutnya, menjeda lagu, menjawab panggilan, mengakhiri panggilan, menolak panggilan masuk, memutar nomor terakhir, kontrol volume.\r\n- Dapat dipakai dengan koneksi Bluetooth maupun menggunakan kabel, paket termasuk kabel audio 3,5 mm, support handphone/MP4/MP3/CD/PC dll.\r\n- Mendukung kartu TF dan radio FM.\r\n\r\nIsi Paket:\r\n- 1 x P47M Headphone\r\n- 1 x USB Cable\r\n- 1 x Audio Kabel\r\n- 1 x Manual (English & Chinese)', '1698293521_Screenshot 2023-10-26 111136.png', '2023-10-25 21:12:01', '2023-10-25 21:12:01'),
(18, 8, 'HEADPHONE BANDO KABEL XB450 EXTRA BASS + MIC', 45500, 'Spesifikasi:\r\n- Ukuran: 25.3 x 23.3 x 6.2 Cm\r\n- Input: 3.5mm jack\r\n\r\nDeskripsi Produk :\r\n*Kualitas suara MANTAP\r\n*Jack audio 3.5mm\r\n*Support Mic untuk Telpon\r\n*Up Down Volume\r\n*Desain Bando', '1698293695_Screenshot 2023-10-26 111355.png', '2023-10-25 21:14:55', '2023-10-25 21:14:55'),
(19, 8, 'HEADSET EARPHONE BENDO BANDO OVERHEAD GAMING BRANDED PPT450 SUARA BAGUS', 27900, 'STEREO HEADPHONEPPT 450\r\nColour : Full Black only\r\n\r\n- Dimensi Paket\r\nPanjang : 4.2cm\r\nLebar : 18.8cm\r\nTinggi : 21cm\r\nBerat : 250g\r\n\r\nSTEREO HEADPHONE ini memiliki kualitas suara yang bagus dengan design ergonomis, dan sangat cocok untuk penggunaan dalam jangka waktu lama. dengan bahan plastik ABS dengan sentuhan kulit sintetis pada bagian earphone, menambah kenyamanan dan percaya diri bagi pemakainya, dengan bentuk yang simple dan sederhana, sehingga sangat praktis dalam penggunaan dan penyimpanannya.\r\n\r\nPanjang kabel STEREO HEADPHONE  adalah 120cm dengan menggunakan kabel pipih sehingga tidak mudah kusut seperti permasalahan yang sering terjadi pada kabel headset biasa.\r\n\r\nSTEREO HEADPHONE PPT-450 merupakan sepasang (dua buah) earphone berkekuatan 24 Ohm/1 kHz dengan sensitivitas 102dB/mW dan frekuensi 5Hz-22KHz yang mumpunyai bando (earphone boom) untuk dikenakan di kepala dan dilengkapi mikrofon. STEREO HEADPHONE MDR-XB450AP sangat cocok digunakan untuk mendengarkan musik dari Smartphone, komputer PC, notebook, MP3 & MP4 Player (PMP) atau yang memiliki port keluaran Jack Audio 3,5mm...', '1698293920_fb525c241e257a8eeca62f35ced601fe.jpeg', '2023-10-25 21:18:40', '2023-10-25 21:18:40'),
(20, 5, 'KULKAS 2 PINTU SAMSUNG 255 L RT25FARBDB1', 5799000, '-Digital Inverter Compressor\r\n-Dilengkapi dengan tujuh level kecepatan yang bisa disesuaikan\r\n-Tidak menghasilkan suara bising\r\n-All around cooling\r\n-MoistFresh Zone yang mampu mencegah hilangnya kadar air lebih cepat\r\n-Fitur Cool Packs mempertahankan makanan beku hingga 1 jam\r\n-Dilengkapi dengan rak-rak besar di bagian pintu\r\n-Deodorizing Filter untuk menghilangkan bau tidak sedap\r\n-Rak Easy Slide yang dapat ditarik keluar untuk mengakses makanan dengan mudah\r\n-Terdapat rak untuk botol maupun minuman atau makanan kaleng\r\n-Kapasitas : 255 liter\r\n-Refrigerant : R600a\r\n-Dimensi produk : 63.7 x 55.5 x 163.5 cm\r\n-Dimensi Kemasan: 67.0 x 58.0 x 170.0 cm\r\n-Berat: 50 kg', '1698294203_KULKAS 2 PINTU SAMSUNG 255 L RT25FARBDB1.jpg', '2023-10-25 21:23:23', '2023-10-25 21:23:23'),
(21, 6, 'iPhone 14Pro &14 Pro Max 1TB 512GB 256GB 128GB Second Original Mulus', 12389000, 'iPhone 14Pro 1TB 512GB 256GB 128GB Second Original Mulus\r\niPhone 14Pro Max 1TB 512GB 256GB 128GB Second Original Mulus\r\n\r\niPhone 14 Pro Max. Memotret detail menakjubkan dengan kamera Utama 48 MP. Nikmati iPhone dalam cara yang sepenuhnya baru dengan layar yang Selalu Aktif dan Dynamic Island. Deteksi Tabrakan, sebuah fitur keselamatan baru, memanggil bantuan saat Anda tak bisa.\r\n\r\nPoin-poin fitur utama :\r\n\r\n* Layar Super Retina XDR 6,7 inci yang Selalu Aktif dan dilengkapi ProMotion\r\n\r\n* Dynamic Island, cara baru yang istimewa untuk berinteraksi dengan iPhone\r\n\r\n* Kamera utama 48 MP untuk resolusi hingga 4x lebih besar\r\n\r\n* Mode Sinematik kini dalam Dolby Vision 4K pada kecepatan hingga 30 fps\r\n\r\n* Mode Aksi untuk video handheld yang stabil\r\n\r\n* Teknologi keselamatan penting—Deteksi Tabrakan,1 memanggil bantuan saat Anda tak bisa\r\n\r\n* Kekuatan baterai sepanjang hari dan pemutaran video hingga 29 jam\r\n\r\n* A16 Bionic, chip ponsel pintar paling maksimal. Seluler 5G super cepat\r\n\r\n* Fitur ketahanan terdepan di industri dengan Ceramic Shield dan tahan air\r\n\r\n* iOS 16 menawarkan semakin banyak cara untuk personalisasi, komunikasi, dan berbagi\r\n\r\n\r\n\r\nLegal :\r\n\r\n1. Darurat SOS menggunakan Panggilan Wi-Fi atau koneksi seluler.\r\n\r\n2. Layar memiliki sudut melengkung. Jika diukur sebagai persegi, layarnya memiliki ukuran diagonal 6,69 inci. Area bidang layar berukuran lebih kecil. \r\n\r\n3. Kekuatan baterai bervariasi tergantung penggunaan dan konfigurasi; lihat apple.com/batteries untuk informasi selengkapnya.\r\n\r\n4. Memerlukan paket data. 5G tersedia di pasar tertentu dan melalui operator tertentu. Kecepatan bervariasi menurut kondisi lokasi dan operator. Untuk detail tentang dukungan 5G, hubungi operator Anda dan lihat apple.com/iphone/cellular.\r\n\r\n5. iPhone 14 Pro Max tahan cipratan, air, dan debu dan diuji dalam kondisi laboratorium terkontrol dengan level IP68 menurut standar IEC 60529 (kedalaman maksimum 6 meter hingga selama 30 menit). Ketahanan terhadap cipratan, air, dan debu tidak berlaku secara permanen. Daya tahan mungkin berkurang akibat penggunaan sehari-hari. Jangan coba mengisi daya iPhone yang basah; lihat panduan pengguna untuk instruksi pembersihan dan pengeringan. Kerusakan akibat cairan tidak ditanggung dalam garansi. \r\n\r\n6. Beberapa fitur mungkin tidak tersedia untuk semua negara atau semua wilayah.', '1698294264_id-11134207-7r98r-lm8sraxd39fy44.jpeg', '2023-10-25 21:23:44', '2023-10-25 21:24:24'),
(22, 5, 'LG GN-B332PQMB', 6485900, 'LinearCooling \r\n\r\nTerbungkus Kesegaran Alami Lebih Lama\r\n\r\nLinearCooling mengurangi fluktuasi suhu, mempertahankan kesegaran bahan makanan *hingga 7 hari.\r\n\r\nMulti Air Flow\r\n\r\nSuhu Optimal Di Seluruh Sudut\r\n\r\nMulti-Air Flow System dirancang untuk mempertahankan tingkat suhu ideal yang membantu Anda mempertahankan kesegaran makanan lebih lama. Sensor digital secara konstan memantau kondisi didalam kulkas dan beberapa saluran udara diletakkan mengelilingi makanan Anda dengan udara sejuk untuk menjaganya tetap segar lebih lama.\r\n\r\nEfisien Dalam Energi & Tahan Lama\r\n\r\nLG Smart Inverter Compressor  memberikan tingkatan baru dalam efisiensi energi untuk membuat Anda dapat lebih hemat dan ketenangan sepanjang 10 tahun.\r\n\r\nPull-out Tray\r\n\r\nRak yang mudah ditarik keluar. Memudahkan Anda mengambil makanan yang disimpan di bagian dalam\r\n\r\nBigger Fruits & Veggie Box\r\n\r\nDengan ukuran kompartemen sayuran yang besar,Anda bisa menyimpan lebih banyak sayuran dan buah-buahan sekaligus menjaga kesegarannya.', '1698294296_LG GN-B332PQMB Kulkas 2 Pintu Terbaru, Nett 335L _Gross 360L Dark Graphite Steel, Smart Inverter Compressor.jpg', '2023-10-25 21:24:56', '2023-10-25 21:24:56'),
(23, 5, 'Sharp Kulkas 2 Pintu SJ-326XG-MS', 4197000, 'FITUR:\r\nNew Borderless Glass Door\r\nFan Cooling System\r\nExtra Big Freezer\r\nBig Fresh Room\r\nTempered Glass Tray\r\nLED Lamp\r\nIce Twist\r\nBig Crisper\r\nLow Wattage and Voltage\r\n\r\n\r\nDetail:\r\n- No frost\r\n- Kapasitas 237 Liter\r\n- DIMENSION (W X H X D) : 56 X 162 X 56\r\n- New Borderless Glass Door\r\n- Fan Cooling System\r\n- Extra Big Freezer\r\n- Big Fresh Room\r\n- Tempered Glass Tray\r\n- LED Lamp\r\n- Ice Twist\r\n- Big Crisper\r\n- Garansi Resmi 5Thn Kompressor\r\nSpesifikasi (Kulkas) (-)\r\nWarna Pintu - Matriks Bahan Pintu Hitam\r\nSistem Pendingin Kipas Sistem Pendingin\r\nRefrigeran (NON CFC) -\r\nMencairkan -\r\nKapasitas (Gross / Netto) 256/237\r\nFreezer (Gross / Netto) 68 Liter / 55\r\nKulkas (Gross / Netto) 188/182\r\nSumber 220 - 240\r\nKonsumsi (Watt) 100\r\nKedalaman 560\r\nLebar 562\r\nTinggi 1626\r\nBobot	-\r\nPintu Dua Pintu', '1698294382_Sharp Kulkas 2 Pintu SJ-326XG-MS Shine Glass Matrix Silver 256L.jpg', '2023-10-25 21:26:22', '2023-10-25 21:26:22'),
(24, 6, 'Asus ROG Phone 7 8/256GB & 12/256GB | Snapdragon 8 Gen 2 Garansi Resmi', 10765000, 'Garansi Resmi Asus Indonesia 1 tahun.\r\nGaransi Resmi PT Jaya Evogad Mandiri 1 tahun.\r\nGaransi tukar unit 3x24 jam (dengan catatan segel belum dibuka)\r\nGaransi kerusakan dan ganti unit baru 7x24 jam sejak barang diterima\r\n\r\nTerdapat 2 varian \r\nFree VIP : 9 barang termasuk perdana smartfren\r\nFree VIP A : 9 barang + Lcd 8,5inc\r\n\r\nSpesifikasi :\r\n\r\nDimensions : 173 x 77 x 10.3 mm (6.81 x 3.03 x 0.41 in)\r\nSIM : Dual SIM (Nano-SIM, dual stand-by), IP54, dust and splash resistan\r\nDisplay : 6.78 inches, AMOLED, 1B colors, 165Hz, HDR10+, 1000 nits (HBM), 1500 nits (peak)\r\nResolution : 1080 x 2448 pixels (~395 ppi density)\r\nProtection : Corning Gorilla Glass Victus\r\nOS : Android 13\r\nChipset : Qualcomm SM8550-AB Snapdragon 8 Gen 2 (4 nm)\r\nCPU : Octa-core (1x3.2 GHz Cortex-X3 & 2x2.8 GHz Cortex-A715 & 2x2.8 GHz Cortex-A710 & 3x2.0 GHz Cortex-A510)\r\nGPU : Adreno 740\r\nInternal : 8/256GB & 12/256GB\r\nCamera : Triple (50 MP, f/1.9, 24mm (wide), 1/1.56\", 1.0µm, PDAF, 13 MP, f/2.2, 13mm, 120˚ (ultrawide), 5 MP, f/2.0, (macro) )\r\nVideo : 8K@24fps, 4K@30/60fps, 1080p@30/60/120/240fps, 720p@480fps; gyro-EIS, HDR10+\r\nSelfie Camera : 32 MP, f/2.5, 29mm (wide), 1/3.2\", 0.7µm\r\nVideos : 1080p@30fps.\r\nSound : 3.5mm jack, channel suara 2.1\r\nNFC : Yes\r\nUSB : USB Type-C 3.1 (side), DisplayPort 1.4; USB Type-C 2.0 (bottom), OTG, accessory connector\r\nSensors : Fingerprint (under display, optical), accelerometer, gyro, proximity, compass\r\nBattery : Li-Po 6000 mAh, non-removable, 65W wired,10W reverse wired', '1698294400_id-11134207-7qul7-lj8850sbjiwrec.jpeg', '2023-10-25 21:26:40', '2023-10-25 21:26:40'),
(25, 9, 'redragon dragonborn k630 mechanical keyboard', 345000, 'K630\r\nHotswappable mechanical Outemu brown switch\r\nQuite/soft touch/durable key\r\n61 keys, detachable cable, portable for travel\r\nN-Key rollover / Anti-ghosting\r\nSingle pink backlighting', '1698294579_WhatsApp Image 2023-10-26 at 11.25.40.jpeg', '2023-10-25 21:29:39', '2023-10-25 21:29:39'),
(26, 10, 'GAMEN Fan Cooler Radiator Pendingin HP Cooling Fan Gaming GMR02', 60000, '1. Kipas berkecepatan tinggi 5000rpm\r\n\r\n2. Menurunkan suhu 53°C hingga 15°C hanya dalam waktu 30 menit\r\n\r\n3. Tingkat kebisingan rendah 25DB\r\n\r\n4. Dazzling lights, desain ringan dan keren dengan lampu RGB\r\n\r\n5. Kompatibel dengan semua ponsel 4.7-7.5 inchi (6.5 – 8.7 cm)\r\n\r\nSilahkan Bertanya Ke Costumer Service Kami Mengenai Produk^^\r\n\r\nSpesifikasi:\r\n\r\n*Model : GMR02\r\n\r\n*Size : 8 x 5 x 2 cm\r\n\r\n*Weight : 45g\r\n\r\n*Battery : 300mah\r\n\r\n*Input : DC5V/1A\r\n\r\n*RPM : 5.000/min', '1698294735_sg-11134201-22100-lwwkzl2iq3iv08.jpeg', '2023-10-25 21:32:15', '2023-10-25 21:32:15'),
(27, 10, 'Smartphone Cooling Fan Kipas Pendingin HP Gaming Radiator Heat Sink', 30900, 'Saat sedang main game Anda mungkin merasakan smartphone Anda sangat panas hingga Anda sangat tidak nyaman menggenggamnya. Dengan menggunakan smartphone cooling fan ini, masalah smartphone panas Anda pasti menghilang, dengan kecepatan kipas hingga 5000RPM membuatnya dapat dengan cepat mendinginkan permukaan smartphone Anda yang panas sehingga Anda semakin nyaman saat bermain game di smartphone Anda.\r\n\r\n5000RPM\r\nKipas dari cooling fan ini mampu mencapai kecepatan 5000RPM. Dengan kecepatan tersebut, smartphone Anda yang panas bisa dengan sekejap bisa didinginkan dengan sangat mudah.\r\n\r\nMaterial yang Kuat\r\nSmartphone Cooling Fan ini terbuat dari bahan berkualitas sehingga dapat Anda gunakan untuk jangka waktu lama. Selain itu cooling pad ini menghasilkan angin yang tinggi sehingga dapat menjaga laptop/notebook Anda dari overheat\r\n\r\nUSB Fan ini dapat dinyalakan dengan mencolokkan plug USB ke USB port dari laptop/notebook. Tidak perlu menginstall apapun dalam menggunakan cooling pad ini sehingga mudah untuk digunakan.\r\n\r\nRingan\r\nCooling Fan ini memiliki berat yang ringan sehingga tidak membebani smartphone Anda saat digunakan bermain game.\r\n\r\n yang Anda dapatkan untuk pembelian produk ini:\r\n\r\n1 x  Smartphone Cooling Fan Kipas Pendingin Radiator Heat Sink \r\n1 x Kabel Micro USB', '1698294794_a3071373408a21a546036f6588b66a46.jpeg', '2023-10-25 21:33:14', '2023-10-25 21:33:14'),
(28, 7, 'Taffware CZ01 Full HD 1080P Video Conference Webcam with Microphone', 59700, 'Taffware CZ01 Full HD 1080P Video Conference Webcam with Microphone\r\n\r\nHanya punya webcam bawaan dari laptop yang kualitasnya buruk? atau belum memiliki webcam sama sekali? Anda bisa memiliki webcam yang satu ini. Webcam ini sudah mampu menghasilkan video 1080P yang membuat gambar Anda bisa jernih. Selain itu, webcam ini sudah dilengkapi dengan built-in microphone sehingga Anda sudah tak membutuhkan microphone yang membuat ribet lagi.\r\n\r\nFitur\r\nWebcam Berkualitas\r\nWebcam ini memiliki kualitas yang tidak kalah dengan webcam premium pada umumnya. Selain itu webcam ini sudah bisa menghasilkan video yang jernih dan HD yaitu 1080P.\r\n\r\nTrue HD 1080P\r\nDengan menggunakan webcam ini Anda dapat teleconfrence atau video call dengan kualitas gambar yang tajam sehingga lawan bicara Anda pun dapat melihat Anda dengan baik.\r\n\r\nMikrofon bawaan\r\nWebcam ini sudah dilengkapi dengan microphone sehingga Anda tak membutuhkan lagi microphone external. Suara yang dihasilkan pun akan bisa terdengar jelas saat Anda menggunakannya untuk video call atau telepon. Webcam ini dapat digunakan untuk berbagai macam aplikasi video conference seperti skype, zoom, google meet dan lainnya.\r\n\r\nSpesifikasi\r\nTipe Lensa \r\n110 Degree Wide Angle\r\nDimensi \r\n70 x 30 mm\r\nVideo \r\n1920 x 1080 30FPS\r\n\r\nWEB 141 1', '1698295024_id-11134201-7qul2-ljxxnxskasfzda.jpeg', '2023-10-25 21:37:04', '2023-10-25 21:37:04'),
(29, 7, 'WebCam LOGITECH C270 HD 720P Web Camera For Streaming/Laptop/Komputer', 265000, 'HARAP MEMASTIKAN STOK TERLEBIH DAHULU SEBELUM MELAKUKAN TRANSAKSI\r\n\r\nSpesifikasi Teknik :\r\nPanggilan video HD (1280 x 720 piksel) dengan sistem yang direkomendasikan.\r\nPerekaman video: Hingga 1280 x 720 piksel.\r\nFoto: Hingga 3,0 megapiksel (ditingkatkan menggunakan software).\r\nMikrofon bawaan dengan teknologi Logitech RightSound.\r\nBersertifikat Hi-Speed USB 2.0 (direkomendasikan).\r\nKlip universal cocok dengan berbagai laptop, monitor LCD atau CRT.\r\n\r\nDimensi kemasan : Tinggi x Lebar x Tebal (cm) : 21 x 16 x 9.\r\n\r\nIsi Kemasan :\r\n- Webcam dengan kabel sepanjang 150 cm.\r\n- Dokumentasi pengguna', '1698295100_Screenshot 2023-10-26 113744.png', '2023-10-25 21:38:20', '2023-10-25 21:38:20'),
(30, 7, 'XIHANCAM 3-Led Ring Light Camera Laptop USB Webcam 1080p Web Cam PC', 185000, '🙋Fitur menarik pada webcam antara lain adalah fitur auto-focus, resolusi Full HD 1080, dan touchscreen LED dengan tiga level pencahayaan. Fitur tersebut memungkinkan kamera web ini mendapatkan gambar berkualitas tinggi dan jelas. \r\n\r\n🙋Mengandalkan lensa CMOS seri 800W yang terbukti sensitif dan dapat memetakan obyek secara optimal, meskipun dalam kondisi rendah cahaya. \r\n\r\nSpesifikasi:\r\n📌Maks. Resolusi: 1080P（1920*1080）\r\n📌Jenis kamera: webcam dengan cahaya\r\n📌Sensor Gambar: CMOS\r\n📌Format Foto: BMP, JPG\r\n📌Jenis antarmuka: USB\r\n📌Power Input:5V\r\n📌Working Temperature :-10℃ - 50℃\r\n📌Viewing Angle:120°\r\n📌Video Format:H.264 / H.265 / MJPG / NV12 / YUY2\r\n📌System Support:MacOS10.5 and above\r\n📌Support:Windows7/8/10, Linux2.4.6 and above\r\n📌Panjang kabel: 1.5M\r\n\r\nFitur terbesar:\r\n🙋Tiga warna kecerahan: Putih/Putih Hangat/Kuning\r\n🌈Anda dapat menyesuaikan kecerahan setiap warna. Anda hanya perlu menekan bagian atas panel beberapa saat, cahaya bisa menjadi lebih terang.\r\n🌈Ring light built-in, dapat disesuaikan dalam 3 kecerahan, menawarkan pencahayaan yang merata dan menyanjung dan menghilangkan bayangan yang keras.\r\n🌈Efek kecantikan otomatis,Memberikan sentuhan pada wajah Anda agar terlihat semakin cantik untuk tampil percaya diri\r\n\r\n🙋Kamera web desktop dan laptop dengan fokus tetap dilengkapi dengan resolusi full HD 8MP, merekam video pada sudut lebar hingga 120 derajat, sudut desain rotasi spiritual 360° dapat diubah sesuka hati, dan 30fps untuk menghadirkan keindahan rincian; kamera streaming profesional canggih dengan teknologi kompresi video H.264 memberi Anda video berkualitas tinggi di sebagian besar perangkat lunak.\r\n🙋Resolusi definisi tinggi Panorama yang nyata, dirancang khusus untuk konferensi video profesional saat bekerja di rumah. dan video sosial, video game, gambar halus untuk konferensi Skype, panggilan video, dan rekaman YouTube.\r\n🙋Dengan mikrofon internal ganda, webcam ini dapat menangkap audio dalam jarak 9,8 kaki sekaligus mengurangi kebisingan dari latar belakang pada saat yang bersamaan, memberikan Anda dialog paling jelas dan lengkap saat melakukan panggilan video atau streaming video.\r\n🙋Kompatibel dengan WinXP/Vista/Win7/Win8/Win10 dan sistem operasi lain dan mendukung platform siaran langsung utama. Anda dapat dengan mudah menggunakannya untuk pengajaran online, panggilan video, panggilan kerja baru, koleksi potret dan banyak bidang lainnya.\r\n🙋Mendukung berbagai perangkat lunak rapat video, Rapat ZOOM, Google Meet, yaitu Netmeeting dan berfungsi baik dengan MSN, Yahoo dan Skype, dll.\r\n🙋Webcam night vision yang baru ditingkatkan dapat secara otomatis menyesuaikan warna dan kecerahan di bawah cahaya alami, sehingga Anda dapat mempertahankan mode webcam terbaik bahkan dalam kondisi cahaya redup.\r\n\r\n📩 Jika Anda memiliki pertanyaan, silakan kirimkan pertanyaan Anda kepada kami dan kami akan memberikan solusi yang sesuai.\r\n\r\n📦 Paket Termasuk:\r\n-1 X Kamera Komputer USB\r\n-1 X Panduan Pengguna\r\n-1 X Penutup Privasi', '1698295186_Screenshot 2023-10-26 113901.png', '2023-10-25 21:39:46', '2023-10-25 21:39:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$7NKmte1Azl337jACyBTCoOhpO9lcBapr5.7.f956.FWO7Qt1vGCb6', 0, '2023-10-23 23:18:46', '2023-10-23 23:18:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voucher`
--

CREATE TABLE `voucher` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) NOT NULL,
  `digunakan` int(11) NOT NULL DEFAULT 0,
  `hadiah` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `voucher`
--

INSERT INTO `voucher` (`id`, `kode`, `digunakan`, `hadiah`, `created_at`, `updated_at`) VALUES
(1, 'HGyt0sTO', 1, 'Kopi 2x', '2023-10-23 23:23:00', '2023-10-23 23:24:35'),
(2, 'ctQG56aZ', 1, 'Zonk', '2023-10-25 21:37:56', '2023-10-25 21:42:42'),
(3, 'OSW0Ov2c', 0, NULL, '2023-10-25 21:42:25', '2023-10-25 21:42:25'),
(4, 'fZ4iPFsd', 2, 'Kompor Gas', '2023-10-25 21:47:38', '2023-10-25 21:48:41');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_pesanan_pesanan_id_foreign` (`pesanan_id`),
  ADD KEY `detail_pesanan_produk_id_foreign` (`produk_id`);

--
-- Indeks untuk tabel `hadiah`
--
ALTER TABLE `hadiah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_kategori_id_foreign` (`kategori_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voucher_kode_unique` (`kode`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `hadiah`
--
ALTER TABLE `hadiah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `detail_pesanan_pesanan_id_foreign` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_pesanan_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
