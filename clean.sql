��-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: merge
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pengiriman_id` bigint unsigned DEFAULT NULL,
  `tiket_pengiriman` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_pengiriman_id_foreign` (`pengiriman_id`),
  KEY `attachments_tiket_pengiriman_index` (`tiket_pengiriman`),
  CONSTRAINT `attachments_pengiriman_id_foreign` FOREIGN KEY (`pengiriman_id`) REFERENCES `pengiriman` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (6,26,'TKT-KRM-20250926105132','img_gudang','1758883892_win-20250926-15-29-01-pro_ce9Yby.jpg','uploads/2025/09/1758883892_win-20250926-15-29-01-pro_ce9Yby.jpg','image/jpeg',152491,'2025-09-26 03:51:32','2025-09-26 03:51:32'),(7,26,'TKT-KRM-20250926105132','img_user','1758976478_win-20250927-15-08-42-pro_n45b2j.jpg','bukti_penerimaan/2025/09/1758976478_win-20250927-15-08-42-pro_n45b2j.jpg','image/jpeg',132621,'2025-09-27 05:34:39','2025-09-27 05:34:39');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_barang`
--

DROP TABLE IF EXISTS `detail_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_barang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tiket_sparepart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_id` bigint unsigned NOT NULL,
  `tipe_id` bigint unsigned NOT NULL,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `kode_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('sparepart lama','sparepart baru') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `harga` decimal(15,2) DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `detail_barang_tiket_sparepart_foreign` (`tiket_sparepart`),
  KEY `detail_barang_jenis_id_foreign` (`jenis_id`),
  KEY `detail_barang_tipe_id_foreign` (`tipe_id`),
  KEY `detail_barang_kode_region_foreign` (`kode_region`),
  KEY `detail_barang_vendor_id_foreign` (`vendor_id`),
  CONSTRAINT `detail_barang_jenis_id_foreign` FOREIGN KEY (`jenis_id`) REFERENCES `jenis_barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detail_barang_tiket_sparepart_foreign` FOREIGN KEY (`tiket_sparepart`) REFERENCES `list_barang` (`tiket_sparepart`) ON DELETE CASCADE,
  CONSTRAINT `detail_barang_tipe_id_foreign` FOREIGN KEY (`tipe_id`) REFERENCES `tipe_barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detail_barang_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_barang`
--

LOCK TABLES `detail_barang` WRITE;
/*!40000 ALTER TABLE `detail_barang` DISABLE KEYS */;
INSERT INTO `detail_barang` VALUES (2,'SP-001','617262512',1,1,1,NULL,'12873','Adli',NULL,'sparepart baru','NR','2025-12-17',1,21323143.00,'BUAT CEK DOANG'),(3,'SP-043',NULL,6,43,2,NULL,'32323','FAYYADH',NULL,'sparepart baru','NR','2025-09-12',5,323242.00,'CEK 2'),(4,'SP-051','982478230',2,1,2,NULL,'3232','Faiq',NULL,'sparepart lama','NR','2025-09-16',1,232323.00,'asasasasas'),(6,'SP-051','01892182981',2,1,1,NULL,'32323','Faiq',NULL,'sparepart baru','NR','2025-09-18',1,32234242.00,'data baru nih'),(7,'SP-051','62532751',2,1,1,NULL,'12312','Ka inong',NULL,'sparepart baru','NR','2025-09-22',1,21323223.00,NULL),(8,'SP-001','12345678',1,1,1,NULL,'333','FAYYADH',NULL,'sparepart baru','NR','2025-09-25',1,3000000.00,'INI'),(9,'SP-053','87654321',3,2,2,NULL,'1212','iiii',NULL,'sparepart baru','NR','2025-09-25',1,121212121.00,NULL),(10,'SP-016','1212',1,16,1,NULL,'1212','Ka inong',NULL,'sparepart baru','NR','1212-12-12',1,1212121.00,NULL),(11,'SP-054','012345',5,18,2,NULL,'12312','Adli',NULL,'sparepart lama','NR','2025-09-25',1,8000000.00,NULL);
/*!40000 ALTER TABLE `detail_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_barang`
--

DROP TABLE IF EXISTS `jenis_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jenis_barang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` enum('aset','non-aset') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_barang`
--

LOCK TABLES `jenis_barang` WRITE;
/*!40000 ALTER TABLE `jenis_barang` DISABLE KEYS */;
INSERT INTO `jenis_barang` VALUES (1,'SFP','aset'),(2,'SFP+','aset'),(3,'XFP','aset'),(4,'QSFP','aset'),(5,'CFP4','aset'),(6,'Joint Closure','non-aset');
/*!40000 ALTER TABLE `jenis_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_barang`
--

DROP TABLE IF EXISTS `list_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_barang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tiket_sparepart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_id` bigint unsigned DEFAULT NULL,
  `tipe_id` bigint unsigned DEFAULT NULL,
  `kategori` enum('aset','non-aset') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'non-aset',
  PRIMARY KEY (`id`),
  UNIQUE KEY `list_barang_tiket_sparepart_unique` (`tiket_sparepart`),
  KEY `list_barang_jenis_id_foreign` (`jenis_id`),
  KEY `list_barang_tipe_id_foreign` (`tipe_id`),
  CONSTRAINT `list_barang_jenis_id_foreign` FOREIGN KEY (`jenis_id`) REFERENCES `jenis_barang` (`id`) ON DELETE SET NULL,
  CONSTRAINT `list_barang_tipe_id_foreign` FOREIGN KEY (`tipe_id`) REFERENCES `tipe_barang` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_barang`
--

LOCK TABLES `list_barang` WRITE;
/*!40000 ALTER TABLE `list_barang` DISABLE KEYS */;
INSERT INTO `list_barang` VALUES (1,'SP-001',1,1,'aset'),(2,'SP-002',1,2,'aset'),(3,'SP-003',1,3,'aset'),(4,'SP-004',1,4,'aset'),(5,'SP-005',1,5,'aset'),(6,'SP-006',1,6,'aset'),(7,'SP-007',1,7,'aset'),(8,'SP-008',1,8,'aset'),(9,'SP-009',1,9,'aset'),(10,'SP-010',1,10,'aset'),(11,'SP-011',1,11,'aset'),(12,'SP-012',1,12,'aset'),(13,'SP-013',1,13,'aset'),(14,'SP-014',1,14,'aset'),(15,'SP-015',1,15,'aset'),(16,'SP-016',1,16,'aset'),(17,'SP-017',2,17,'aset'),(18,'SP-018',2,18,'aset'),(19,'SP-019',2,19,'aset'),(20,'SP-020',2,20,'aset'),(21,'SP-021',2,21,'aset'),(22,'SP-022',2,22,'aset'),(23,'SP-023',2,23,'aset'),(24,'SP-024',2,24,'aset'),(25,'SP-025',2,25,'aset'),(26,'SP-026',2,26,'aset'),(27,'SP-027',2,27,'aset'),(28,'SP-028',2,28,'aset'),(29,'SP-029',2,29,'aset'),(30,'SP-030',2,30,'aset'),(31,'SP-031',3,31,'aset'),(32,'SP-032',3,32,'aset'),(33,'SP-033',3,33,'aset'),(34,'SP-034',3,34,'aset'),(35,'SP-035',4,35,'aset'),(36,'SP-036',4,36,'aset'),(37,'SP-037',4,37,'aset'),(38,'SP-038',5,38,'aset'),(39,'SP-039',5,39,'aset'),(40,'SP-040',5,40,'aset'),(41,'SP-041',5,41,'aset'),(42,'SP-042',5,42,'aset'),(43,'SP-043',6,43,'non-aset'),(44,'SP-044',6,44,'non-aset'),(45,'SP-045',6,45,'non-aset'),(46,'SP-046',6,46,'non-aset'),(47,'SP-047',6,47,'non-aset'),(48,'SP-048',6,48,'non-aset'),(49,'SP-049',6,49,'non-aset'),(50,'SP-050',6,50,'non-aset'),(51,'SP-051',2,1,'aset'),(52,'SP-052',NULL,NULL,'non-aset'),(53,'SP-053',3,2,'aset'),(54,'SP-054',5,18,'aset');
/*!40000 ALTER TABLE `list_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'2025_08_22_015614_create_region_table',1),(4,'2025_08_22_020039_create_jenis_barang_table',1),(5,'2025_08_22_020159_create_tipe_barang_table',1),(6,'2025_08_22_020355_create_list_barang_table',1),(7,'2025_08_22_020410_create_detail_barang_table',1),(8,'2025_08_22_020521_create_permintaan_table',1),(9,'2025_08_22_020645_create_permintaan_detail_table',1),(10,'2025_08_22_020849_create_pengiriman_table',1),(11,'2025_08_22_021158_create_pengiriman_detail_table',1),(12,'2025_08_22_021354_create_verifikasi_permintaan_table',1),(13,'2025_09_10_040310_create_vendor_table',1),(14,'2025_09_10_040443_update_list_barang_table',1),(15,'2025_09_10_040635_update_detail_barang_table',1),(16,'2025_09_22_042138_add_catatan_admin_to_permintaan_table',2),(17,'2025_09_26_074237_create_attachments_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengiriman`
--

DROP TABLE IF EXISTS `pengiriman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengiriman` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tiket_pengiriman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `tiket_permintaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `status` enum('pending','on_delivery','diterima','close') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `ekspedisi` enum('ya','tidak') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_resi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_gudang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_perubahan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pengiriman_tiket_pengiriman_unique` (`tiket_pengiriman`),
  KEY `pengiriman_user_id_foreign` (`user_id`),
  KEY `pengiriman_tiket_permintaan_foreign` (`tiket_permintaan`),
  KEY `pengiriman_tiket_pengiriman_index` (`tiket_pengiriman`),
  CONSTRAINT `pengiriman_tiket_permintaan_foreign` FOREIGN KEY (`tiket_permintaan`) REFERENCES `permintaan` (`tiket`) ON DELETE CASCADE,
  CONSTRAINT `pengiriman_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengiriman`
--

LOCK TABLES `pengiriman` WRITE;
/*!40000 ALTER TABLE `pengiriman` DISABLE KEYS */;
INSERT INTO `pengiriman` VALUES (1,'PG_REQ-CLG-09-2025-008',4,'REQ-CLG-09-2025-008','2025-09-19','pending',NULL,NULL,NULL,NULL,'2025-09-19 09:25:05'),(2,'TKT-KRM-TEST',1,'REQ-XXX-09-2025-010','2025-09-23','pending',NULL,NULL,NULL,NULL,'2025-09-23 00:33:44'),(3,'TKT-KRM-20250923083308',4,'REQ-XXX-09-2025-011','2025-09-23','pending',NULL,NULL,NULL,NULL,'2025-09-23 01:33:08'),(4,'TKT-KRM-20250923084003',4,'REQ-CLG-09-2025-011','2025-09-23','pending',NULL,NULL,NULL,NULL,'2025-09-23 01:40:03'),(5,'TKT-KRM-20250924094844',4,'REQ-CLG-09-2025-012','2025-09-24','pending',NULL,NULL,NULL,NULL,'2025-09-24 02:48:44'),(6,'TKT-KRM-20250925073903',4,'REQ-XXX-09-2025-001','2025-09-25','pending',NULL,NULL,NULL,NULL,'2025-09-25 00:39:03'),(7,'TKT-KRM-20250925082658',4,'REQ-CLG-09-2025-016','2025-09-25','pending',NULL,NULL,NULL,NULL,'2025-09-25 01:26:58'),(8,'TKT-KRM-20250925082939',4,'REQ-BKS-09-2025-014','2025-09-25','pending',NULL,NULL,NULL,NULL,'2025-09-25 01:29:39'),(9,'TKT-KRM-20250925103200',4,'REQ-XXX-09-2025-011','2025-09-25','pending',NULL,NULL,NULL,NULL,'2025-09-25 03:32:00'),(10,'TKT-KRM-20250925103259',4,'REQ-CLG-09-2025-017','2025-09-25','pending',NULL,NULL,NULL,NULL,'2025-09-25 03:32:59'),(11,'TKT-KRM-20250926015851',4,'REQ-CLG-09-2025-021','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 18:58:51'),(12,'TKT-KRM-20250926022056',4,'REQ-CLG-09-2025-022','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 19:20:56'),(13,'TKT-KRM-20250926022225',4,'REQ-CLG-09-2025-023','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 19:22:25'),(14,'TKT-KRM-20250926031935',4,'REQ-CLG-09-2025-013','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 20:19:35'),(15,'TKT-KRM-20250926032009',4,'REQ-BKS-09-2025-005','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 20:20:09'),(16,'TKT-KRM-20250926032041',4,'REQ-BKS-09-2025-006','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 20:20:41'),(17,'TKT-KRM-20250926032105',4,'REQ-BKS-09-2025-007','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 20:21:05'),(18,'TKT-KRM-20250926034727',4,'REQ-CLG-09-2025-018','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 20:47:27'),(19,'TKT-KRM-20250926034813',4,'REQ-CLG-09-2025-011','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 20:48:13'),(20,'TKT-KRM-20250926040559',4,'REQ-CLG-09-2025-019','2025-09-26','pending',NULL,NULL,NULL,NULL,'2025-09-25 21:05:59'),(26,'TKT-KRM-20250926105132',4,'REQ-BKS-09-2025-008','2025-09-26','close','ya','pasti','uploads/2025/09/1758883892_win-20250926-15-29-01-pro_ce9Yby.jpg','bukti_penerimaan/2025/09/1758976478_win-20250927-15-08-42-pro_n45b2j.jpg','2025-09-27 22:40:39');
/*!40000 ALTER TABLE `pengiriman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengiriman_detail`
--

DROP TABLE IF EXISTS `pengiriman_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengiriman_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tiket_pengiriman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jumlah` int NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `pengiriman_detail_tiket_pengiriman_foreign` (`tiket_pengiriman`),
  CONSTRAINT `pengiriman_detail_tiket_pengiriman_foreign` FOREIGN KEY (`tiket_pengiriman`) REFERENCES `pengiriman` (`tiket_pengiriman`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengiriman_detail`
--

LOCK TABLES `pengiriman_detail` WRITE;
/*!40000 ALTER TABLE `pengiriman_detail` DISABLE KEYS */;
INSERT INTO `pengiriman_detail` VALUES (3,'PG_REQ-CLG-09-2025-008','Laptop ASUS Vivobook',NULL,'ASUS','SN-LAP-CLG-001','X515','Laptop untuk staff cabang',1,'Baru'),(4,'PG_REQ-CLG-09-2025-008','Mouse Wireless Silent',NULL,'Logitech','SN-MOU-CLG-001','M330','Mouse ergonomis',2,'Bekas'),(5,'PG_REQ-CLG-09-2025-008','Keyboard Mechanical',NULL,'Razer','SN-KBD-CLG-001','BlackWidow Lite','Keyboard gaming ringan',1,'Dipakai'),(6,'TKT-KRM-20250923083308','1','aset','121313','121212122','1G-1550/1490nm-80km',NULL,1,'ada'),(7,'TKT-KRM-20250923084003','5','aset','daihaitu','61782776','100G-1310nm-20km',NULL,1,'ada'),(8,'TKT-KRM-20250923084003','1','aset','mitsubitsi','912881218','1G-1550nm-100km',NULL,1,'ga ada'),(9,'TKT-KRM-20250924094844','5','aset','apa','1219721','100G-1310nm-10km',NULL,1,'Baru'),(10,'TKT-KRM-20250925073903','SFP','aset','PT Techno Global','12345678','1G-850nm-300m',NULL,1,'ada'),(11,'TKT-KRM-20250925082658','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,'ada'),(12,'TKT-KRM-20250925082939','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,'ada'),(13,'TKT-KRM-20250925103200','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,NULL),(14,'TKT-KRM-20250925103259','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,NULL),(15,'TKT-KRM-20250926015851','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,'ada'),(16,'TKT-KRM-20250926022056','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,NULL),(17,'TKT-KRM-20250926022225','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,NULL),(18,'TKT-KRM-20250926031935','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,'123'),(19,'TKT-KRM-20250926032009','SFP','aset','PT Techno Global','12345678','1G-850nm-300m',NULL,1,'Cek status final'),(20,'TKT-KRM-20250926032041','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,'asas'),(21,'TKT-KRM-20250926032105','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,NULL),(22,'TKT-KRM-20250926034727','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,'asas'),(23,'TKT-KRM-20250926034813','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,'ada'),(24,'TKT-KRM-20250926040559','CFP4','aset','CV Digital Nusantara','012345','10G-1310nm-10km',NULL,1,'asas'),(30,'TKT-KRM-20250926105132','SFP+','aset','PT Techno Global','62532751','1G-850nm-300m',NULL,1,NULL);
/*!40000 ALTER TABLE `pengiriman_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permintaan`
--

DROP TABLE IF EXISTS `permintaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permintaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tiket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `tanggal_permintaan` date NOT NULL,
  `status` enum('pending','diterima','ditolak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status_barang` enum('pending','on_delivery','diterima','close','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `status_final` enum('pending','rejected','close') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `catatan_final` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status_ro` enum('pending','on progres','approved','rejected','close') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on progres',
  `catatan_ro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status_gudang` enum('pending','on progres','approved','rejected','close') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `catatan_gudang` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status_admin` enum('pending','on progres','approved','rejected','close') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status_super_admin` enum('pending','on progres','approved','rejected','close') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `status_penerimaan` enum('pending','diterima') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `approved_by_ro` bigint unsigned DEFAULT NULL,
  `approved_by_gudang` bigint unsigned DEFAULT NULL,
  `approved_by_admin` bigint unsigned DEFAULT NULL,
  `catatan_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `catatan_super_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approved_by_super_admin` bigint unsigned DEFAULT NULL,
  `nomor_resi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_bukti_penerimaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_penerimaan` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permintaan_tiket_unique` (`tiket`),
  KEY `permintaan_user_id_foreign` (`user_id`),
  KEY `permintaan_tiket_index` (`tiket`),
  CONSTRAINT `permintaan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permintaan`
--

LOCK TABLES `permintaan` WRITE;
/*!40000 ALTER TABLE `permintaan` DISABLE KEYS */;
INSERT INTO `permintaan` VALUES (1,'REQ-PUSAT-09-2025-001',4,'2025-09-15','pending','pending','pending',NULL,'pending',NULL,'on progres',NULL,'on progres','pending','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'REQ-XXX-09-2025-001',5,'2025-09-15','pending','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',3,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL),(3,'REQ-XXX-09-2025-002',5,'2025-09-16','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'REQ-XXX-09-2025-003',5,'2025-09-16','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'REQ-XXX-09-2025-004',5,'2025-09-16','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'REQ-XXX-09-2025-005',5,'2025-09-16','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'REQ-XXX-09-2025-006',5,'2025-09-16','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'REQ-XXX-09-2025-007',5,'2025-09-16','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'REQ-XXX-09-2025-008',5,'2025-09-16','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'REQ-CLG-09-2025-001',17,'2025-09-16','ditolak','pending','pending',NULL,'pending',NULL,'on progres',NULL,'on progres','pending','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'REQ-CLG-09-2025-002',17,'2025-09-16','ditolak','pending','pending',NULL,'pending',NULL,'on progres',NULL,'on progres','pending','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'REQ-CLG-09-2025-003',17,'2025-09-16','ditolak','pending','pending',NULL,'pending',NULL,'on progres',NULL,'on progres','pending','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'REQ-PUSAT-09-2025-002',4,'2025-09-16','pending','pending','pending',NULL,'pending',NULL,'on progres',NULL,'on progres','pending','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'REQ-CLG-09-2025-004',17,'2025-09-16','diterima','pending','pending',NULL,'pending',NULL,'on progres',NULL,'on progres','approved','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'REQ-CLG-09-2025-005',17,'2025-09-16','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'REQ-CLG-09-2025-006',17,'2025-09-17','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',7,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(17,'REQ-CLG-09-2025-007',17,'2025-09-17','ditolak','pending','pending',NULL,'rejected',NULL,'rejected',NULL,'rejected','rejected','pending',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'REQ-CLG-09-2025-008',17,'2025-09-17','pending','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'REQ-CLG-09-2025-009',17,'2025-09-17','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'REQ-JKT-09-2025-001',21,'2025-09-18','pending','pending','pending',NULL,'pending',NULL,'on progres',NULL,'on progres','pending','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'REQ-BKS-09-2025-001',19,'2025-09-18','ditolak','pending','pending',NULL,'rejected',NULL,'rejected',NULL,'rejected','rejected','pending',8,NULL,15,NULL,'asda',16,NULL,NULL,NULL),(22,'REQ-CLG-09-2025-010',17,'2025-09-18','pending','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',7,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL),(23,'REQ-BKS-09-2025-002',19,'2025-09-19','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',8,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(24,'REQ-BKS-09-2025-003',19,'2025-09-19','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',8,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(25,'REQ-XXX-09-2025-009',5,'2025-09-21','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',3,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(26,'REQ-BKS-09-2025-004',19,'2025-09-22','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',8,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(27,'REQ-BKS-09-2025-005',19,'2025-09-22','ditolak','pending','pending',NULL,'rejected',NULL,'rejected',NULL,'rejected','rejected','pending',8,NULL,15,NULL,'asda',16,NULL,NULL,NULL),(28,'REQ-BKS-09-2025-006',19,'2025-09-22','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',8,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(29,'REQ-BKS-09-2025-007',19,'2025-09-22','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',8,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(30,'REQ-BKS-09-2025-008',19,'2025-09-22','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'on progres','pending','pending',8,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL),(31,'REQ-BKS-09-2025-009',19,'2025-09-22','ditolak','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'REQ-BKS-09-2025-010',19,'2025-09-22','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'REQ-BKS-09-2025-011',19,'2025-09-22','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'REQ-BKS-09-2025-012',19,'2025-09-22','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',8,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(35,'REQ-BKS-09-2025-013',19,'2025-09-22','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'REQ-XXX-09-2025-010',5,'2025-09-23','diterima','pending','pending',NULL,'approved',NULL,'on progres',NULL,'on progres','pending','pending',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'REQ-XXX-09-2025-011',5,'2025-09-23','ditolak','pending','pending',NULL,'rejected',NULL,'rejected',NULL,'rejected','rejected','pending',3,NULL,15,'asdsas',NULL,NULL,NULL,NULL,NULL),(38,'REQ-CLG-09-2025-011',17,'2025-09-23','ditolak','pending','pending',NULL,'rejected',NULL,'rejected',NULL,'rejected','rejected','pending',7,NULL,15,'1231',NULL,NULL,NULL,NULL,NULL),(39,'REQ-CLG-09-2025-012',17,'2025-09-24','pending','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',7,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(40,'REQ-CLG-09-2025-013',17,'2025-09-25','ditolak','pending','pending',NULL,'rejected',NULL,'rejected',NULL,'rejected','rejected','pending',7,NULL,15,'asda',NULL,NULL,NULL,NULL,NULL),(41,'REQ-CLG-09-2025-014',17,'2025-09-25','pending','pending','pending',NULL,'rejected','Ditolak oleh Kepala RO','on progres',NULL,'on progres','rejected','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'REQ-CLG-09-2025-015',17,'2025-09-25','pending','pending','pending',NULL,'rejected','ga da status','rejected',NULL,'rejected','rejected','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'REQ-CLG-09-2025-016',17,'2025-09-25','pending','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',7,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(44,'REQ-BKS-09-2025-014',19,'2025-09-25','pending','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',8,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(45,'REQ-CLG-09-2025-017',17,'2025-09-25','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',7,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(46,'REQ-CLG-09-2025-018',17,'2025-09-25','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','on progres','pending',7,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL),(47,'REQ-CLG-09-2025-019',17,'2025-09-26','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',7,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(48,'REQ-CLG-09-2025-020',17,'2025-09-26','pending','pending','pending',NULL,'on progres',NULL,'on progres',NULL,'on progres','pending','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'REQ-CLG-09-2025-021',17,'2025-09-26','diterima','on_delivery','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',7,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(50,'REQ-CLG-09-2025-022',17,'2025-09-26','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',7,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(51,'REQ-CLG-09-2025-023',17,'2025-09-26','diterima','pending','pending',NULL,'approved',NULL,'approved',NULL,'approved','approved','pending',7,NULL,15,NULL,NULL,16,NULL,NULL,NULL),(52,'REQ-CLG-09-2025-024',17,'2025-09-26','ditolak','pending','pending',NULL,'rejected',NULL,'rejected','Ditolak oleh Kepala Gudang','rejected','rejected','pending',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'REQ-CLG-09-2025-025',17,'2025-09-26','pending','rejected','pending',NULL,'rejected','cek status final','rejected',NULL,'rejected','rejected','pending',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `permintaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permintaan_detail`
--

DROP TABLE IF EXISTS `permintaan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permintaan_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tiket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permintaan_detail_tiket_index` (`tiket`),
  CONSTRAINT `permintaan_detail_tiket_foreign` FOREIGN KEY (`tiket`) REFERENCES `permintaan` (`tiket`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permintaan_detail`
--

LOCK TABLES `permintaan_detail` WRITE;
/*!40000 ALTER TABLE `permintaan_detail` DISABLE KEYS */;
INSERT INTO `permintaan_detail` VALUES (1,'REQ-PUSAT-09-2025-001','2','4',1,'asas'),(2,'REQ-XXX-09-2025-001','1','1',1,'asas'),(3,'REQ-XXX-09-2025-002','2','4',1,'a'),(4,'REQ-XXX-09-2025-003','2','4',1,'l'),(5,'REQ-XXX-09-2025-004','2','4',1,'da'),(6,'REQ-XXX-09-2025-005','2','4',1,'da'),(7,'REQ-XXX-09-2025-006','2','4',1,'da'),(8,'REQ-XXX-09-2025-007','2','4',1,'da'),(9,'REQ-XXX-09-2025-008','2','4',2,'daadda'),(10,'REQ-CLG-09-2025-001','2','4',1,'kn'),(11,'REQ-CLG-09-2025-002','2','4',1,'ad'),(12,'REQ-CLG-09-2025-003','2','4',9,'cek cek'),(13,'REQ-PUSAT-09-2025-002','5','100G-1310nm-10km',1,'apa ini'),(14,'REQ-CLG-09-2025-004','7','tambahan',8378,'mau banyak gua'),(15,'REQ-CLG-09-2025-005','5','100G-1310nm-10km',1,'mau ini'),(16,'REQ-CLG-09-2025-005','4','40G-1310nm-40km',1,'sama yang ini juga'),(17,'REQ-CLG-09-2025-006','CFP4','100G-1310nm-10km',1,'detail bisa ga?'),(18,'REQ-CLG-09-2025-007','SFP','1G-1550nm-100km',1,'cek detail 2'),(19,'REQ-CLG-09-2025-008','CFP4','100G-1310nm-10km',1,'ini untuk cek'),(20,'REQ-CLG-09-2025-008','Joint Closure','24 core NWC dome',1,'data lebih'),(21,'REQ-CLG-09-2025-008','SFP','1G-1550nm-80km',1,'dari 1'),(22,'REQ-CLG-09-2025-009','CFP4','100G-1310nm-10km',1,'cek lebih'),(23,'REQ-CLG-09-2025-009','Joint Closure','24 core NWC dome',1,'dari 1 (2)'),(24,'REQ-JKT-09-2025-001','QSFP','40G-1310nm-10km',1,'cek ro'),(25,'REQ-JKT-09-2025-001','SFP+','10G-1330/1270nm-20km',1,'lain'),(26,'REQ-BKS-09-2025-001','CFP4','100G-1310nm-10km',1,'cek'),(27,'REQ-BKS-09-2025-001','QSFP','40G-1310nm-40km',1,'data lebih'),(28,'REQ-CLG-09-2025-010','SFP+','10G-1330/1270nm-10km',1,'cek cek'),(29,'REQ-CLG-09-2025-010','Joint Closure','24 core NWC dome',1,'cek cek cek'),(30,'REQ-BKS-09-2025-002','QSFP','40G-1310nm-10km',1,'Cek Data 2'),(31,'REQ-BKS-09-2025-003','Joint Closure','24 core NWC dome',1,'cek detail 3'),(32,'REQ-XXX-09-2025-009','SFP','1G-1550/1310nm-10km',1,'a'),(33,'REQ-BKS-09-2025-004','5','100G-1310nm-10km',1,'cek merge'),(34,'REQ-BKS-09-2025-004','6','24 core PAZ duct',1,'punya hanif'),(35,'REQ-BKS-09-2025-005','5','100G-1310nm-10km',1,'cek gabungan'),(36,'REQ-BKS-09-2025-006','5','100G-1310nm-10km',1,'fds'),(37,'REQ-BKS-09-2025-008','5','100G-1310nm-10km',1,'ad'),(38,'REQ-BKS-09-2025-009','CFP4','100G-1310nm-10km',1,'sa'),(39,'REQ-BKS-09-2025-010','SFP','1G-1310/1550nm-10km',1,'asasin'),(40,'REQ-BKS-09-2025-011','SFP','1G-850nm-300m',1,'testing'),(41,'REQ-BKS-09-2025-012','SFP','1G-1490/1550nm-80km',1,'cek data aja'),(42,'REQ-BKS-09-2025-013','QSFP','40G-1310nm-40km',5,'jumlah'),(43,'REQ-XXX-09-2025-010','CFP4','100G-1310nm-20km',1,'c'),(44,'REQ-XXX-09-2025-010','QSFP','40G-1310nm-40km',1,'e'),(45,'REQ-XXX-09-2025-010','SFP','1G-1550nm-120km',1,'k'),(46,'REQ-XXX-09-2025-011','QSFP','40G-1310nm-40km',1,'1w12qas'),(47,'REQ-XXX-09-2025-011','SFP','1G-1550nm-120km',1,'ajbzlna;'),(48,'REQ-CLG-09-2025-011','CFP4','100G-1310nm-20km',1,'asasino cappucino'),(49,'REQ-CLG-09-2025-012','CFP4','100G-1310nm-10km',1,'lkmzx'),(50,'REQ-CLG-09-2025-013','SFP','1G-1550nm-100km',1,'tes'),(51,'REQ-CLG-09-2025-013','QSFP','40G-1310nm-10km',1,'RO'),(52,'REQ-CLG-09-2025-014','QSFP','40G-1310nm-10km',1,'status'),(53,'REQ-CLG-09-2025-015','QSFP','40G-1310nm-10km',1,'cek status'),(54,'REQ-CLG-09-2025-016','CFP4','100G-1310nm-10km',1,'PILIHHHHH'),(55,'REQ-CLG-09-2025-016','CFP4','100G-1310nm-10km',1,'TESTTT'),(56,'REQ-BKS-09-2025-014','CFP4','100G-1310nm-10km',1,'ada'),(57,'REQ-CLG-09-2025-017','CFP4','100G-1310nm-10km',1,'int'),(58,'REQ-CLG-09-2025-018','CFP4','100G-1310nm-10km',1,'bisa'),(59,'REQ-CLG-09-2025-019','CFP4','100G-1310nm-10km',1,'26/09'),(60,'REQ-CLG-09-2025-020','SFP','1G-1550nm-120km',1,'08:46 29'),(61,'REQ-CLG-09-2025-021','SFP','1G-1550nm-120km',1,'default'),(62,'REQ-CLG-09-2025-022','SFP','1G-850nm-300m',1,'Cek status final'),(63,'REQ-CLG-09-2025-023','CFP4','100G-850nm-300m',1,'Cek status final'),(64,'REQ-CLG-09-2025-024','SFP','Electrical RJ45',1,'Cek status final'),(65,'REQ-CLG-09-2025-025','SFP','1G-850nm-300m',1,'Cek status final');
/*!40000 ALTER TABLE `permintaan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_region` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `region_kode_region_unique` (`kode_region`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'R01','Jakarta','jakarta@company.com','Jl. Sudirman No.1 Jakarta'),(2,'R02','Bandung','bandung@company.com','Jl. Asia Afrika No.23 Bandung'),(3,'R03','Surabaya','surabaya@company.com','Jl. Pemuda No.15 Surabaya'),(5,'BTM','Batam',NULL,NULL);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('cFTYZnf9yTWMiqfOHtZ70jYFW35wjcAUwH52QL4M',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkNaTUlBWVRBZ0ZjSXdhMHBUSHpCSFRST3BjTWVtUzZJbGlVZDhySSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1759047631),('CQItDEJOd4hqSmzKkMaDjlXKxiOvre1JcqWdgW1k',19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYlB5QTdiY1hiV2E2cnJqWTJQbXJWbm43eUVsZzdaU1k0Z3VraUp6ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE5O30=',1759049062);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipe_barang`
--

DROP TABLE IF EXISTS `tipe_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipe_barang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` enum('aset','non-aset') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipe_barang`
--

LOCK TABLES `tipe_barang` WRITE;
/*!40000 ALTER TABLE `tipe_barang` DISABLE KEYS */;
INSERT INTO `tipe_barang` VALUES (1,'1G-850nm-300m','aset'),(2,'1G-1310nm-10km','aset'),(3,'1G-1310/1550nm-10km','aset'),(4,'1G-1550/1310nm-10km','aset'),(5,'1G-1310nm-20km','aset'),(6,'1G-1310/1550nm-20km','aset'),(7,'1G-1550/1310nm-20km','aset'),(8,'1G-1550nm-40km','aset'),(9,'1G-1310/1550nm-40km','aset'),(10,'1G-1550/1310nm-40km','aset'),(11,'1G-1550nm-80km','aset'),(12,'1G-1490/1550nm-80km','aset'),(13,'1G-1550/1490nm-80km','aset'),(14,'1G-1550nm-100km','aset'),(15,'1G-1550nm-120km','aset'),(16,'Electrical RJ45','aset'),(17,'10G-850nm-300m','aset'),(18,'10G-1310nm-10km','aset'),(19,'10G-1270/1330nm-10km','aset'),(20,'10G-1330/1270nm-10km','aset'),(21,'10G-1310nm-20km','aset'),(22,'10G-1270/1330nm-20km','aset'),(23,'10G-1330/1270nm-20km','aset'),(24,'10G-1550nm-40km','aset'),(25,'10G-1270/1330nm-40km','aset'),(26,'10G-1330/1270nm-40km','aset'),(27,'10G-1550nm-80km','aset'),(28,'10G-1270/1330nm-80km','aset'),(29,'10G-1330/1270nm-80km','aset'),(30,'10G-1550nm-100km','aset'),(31,'10G-850nm-300m','aset'),(32,'10G-1310nm-10km','aset'),(33,'10G-1550nm-40km','aset'),(34,'10G-1550nm-80km','aset'),(35,'40G-850nm-300m','aset'),(36,'40G-1310nm-10km','aset'),(37,'40G-1310nm-40km','aset'),(38,'100G-850nm-300m','aset'),(39,'100G-1310nm-10km','aset'),(40,'100G-1310nm-20km','aset'),(41,'100G-1550nm-40km','aset'),(42,'100G-1310nm-10km','aset'),(43,'24 core NWC duct','non-aset'),(44,'48 core NWC duct','non-aset'),(45,'96 core NWC duct','non-aset'),(46,'24 core NWC dome','non-aset'),(47,'48 core NWC dome','non-aset'),(48,'96 core NWC dome','non-aset'),(49,'24 core PAZ duct','non-aset'),(50,'48 core PAZ duct','non-aset');
/*!40000 ALTER TABLE `tipe_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('1','2','3','4') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perusahaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noktp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bagian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atasan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adli Admin','adli@example.com','$2y$12$en1Cj7w8L6VfTq0bqFsvk.M8C9shccW.zAaUZXsaqEJM9NdvgYVOi','1','JKT',NULL,NULL,NULL,NULL,NULL,'Mba Inong',NULL,NULL,'2025-09-12 00:00:55','2025-09-18 02:18:00'),(2,'Hanif Superadmin','hanif@example.com','$2y$12$wy7Hoo3EWkHY64fsvTydbu.F4u3NuW20e.WuUuKnefKZO/Df3J0li','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-12 00:00:55','2025-09-12 00:00:55'),(3,'Kepala RO','kepalaro@example.com','$2y$12$BSyLUXre8MOSO8aSBaJVb.9Jto84xbLh8g5gKwIaH8boZDbcx7u0S','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-12 00:00:55','2025-09-12 00:00:55'),(4,'Kepala Gudang','kepalagudang@example.com','$2y$12$gnmD3wl9RPG0KI6NstXCaOjmyrq8JRYaZ2uqhvEARHk960TVmtOQW','3','PUSAT',NULL,NULL,NULL,NULL,'Warehouse Head',NULL,NULL,NULL,'2025-09-12 00:00:56','2025-09-12 00:00:56'),(5,'User Biasa','user@example.com','$2y$12$XmG.WlUvGbv/eX3dTROmq.wegRMnGUmnA4lO7D1rXwYCbNGWhXFpa','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-12 00:00:56','2025-09-12 00:00:56'),(6,'Kepala RO JTM','kepala.jtm@example.com','$2y$12$MjuCZpFCbkYIBfbcgBW8COjFy28fuJPF/C1hacA67wP239oKvbo2K','2','JTM',NULL,NULL,NULL,NULL,'Regional Office Head',NULL,NULL,NULL,'2025-09-14 17:37:36','2025-09-14 18:11:56'),(7,'Kepala RO CLG','kepala.clg@example.com','$2y$12$wdJhZmB7fxzPbb6GQJThg.WkH9qFexcbT8srDKI9rAlMdqmf7kOxC','2','CLG',NULL,NULL,NULL,NULL,'Regional Office Head',NULL,NULL,NULL,'2025-09-14 17:37:36','2025-09-14 18:11:56'),(8,'Kepala RO BKS','kepala.bks@example.com','$2y$12$1sO/etQow58YyqS4NwnxW.4/c3e1CDRnM/Du.h52bGKsi/1GOwumy','2','BKS',NULL,NULL,NULL,NULL,'Regional Office Head',NULL,NULL,NULL,'2025-09-14 17:37:37','2025-09-14 18:11:56'),(9,'Kepala RO PWK','kepala.pwk@example.com','$2y$12$02q3bUtKw3iZDaUK8FvMMuj/T9.osT5WLrHRVYG/hRxwUX9p0bCiG','2','PWK',NULL,NULL,NULL,NULL,'Regional Office Head',NULL,NULL,NULL,'2025-09-14 17:37:37','2025-09-14 18:11:57'),(10,'Kepala RO TGR','kepala.tgr@example.com','$2y$12$PoO4Pet4Fmpt2td3S2ItAO5dY7KpHWwFDw2ojZAcEuVt/CkUk7Gaa','2','TGR',NULL,NULL,NULL,NULL,'Regional Office Head',NULL,NULL,NULL,'2025-09-14 17:37:37','2025-09-14 18:11:57'),(11,'Kepala RO CBN','kepala.cbn@example.com','$2y$12$bQC1t/s12w/oMkOXY28F..nQp7ZXu76TyHoLVQhL8KMlCv7rVNvT.','2','CBN',NULL,NULL,NULL,NULL,'Regional Office Head',NULL,NULL,NULL,'2025-09-14 17:37:37','2025-09-14 18:11:57'),(12,'Kepala RO BGR','kepala.bgr@example.com','$2y$12$Cckr.ysFdqw0AMPZn5ZkMOpKuj6LxSYUqYxFOlvs/aLtT1AeNDSka','2','BGR',NULL,NULL,NULL,NULL,'Regional Office Head',NULL,NULL,NULL,'2025-09-14 17:37:38','2025-09-14 18:11:57'),(13,'Kepala RO SKBM','kepala.skbm@example.com','$2y$12$Q3Engh.zE2GRYOXR3EynNuAUUm4myPTyV7VXbY/CG/9KbjnAcQks6','2','SKBM',NULL,NULL,NULL,NULL,'Regional Office Head',NULL,NULL,NULL,'2025-09-14 17:37:38','2025-09-14 18:11:58'),(14,'Kepala RO KDR','kepala.kdr@example.com','$2y$12$siFE.C6X7MHW1iHnB7H/v.pMeKvAlhM9ug.dO0yMWRxVMbxd9XwIO','2','KDR',NULL,NULL,NULL,NULL,'Regional Office Head',NULL,NULL,NULL,'2025-09-14 17:37:38','2025-09-14 18:11:58'),(15,'Nurlela Ginting','kainong@example.com','$2y$12$zGqrAVYKOxAOcBwKrHI/geIDTEU.6MLDSgOSPH67/nUEpplgsJ8la','1','Pusat','081943340628','PT. PGN','12345678','Jakarta','Leader Infarstructure Maintenance','pak bandi','2025-09-14 17:51:00',NULL,'2025-09-14 17:51:00','2025-09-14 17:51:00'),(16,'Septian','masseptian@example.com','$2y$12$MbDiDvin.HEn3ecaegi8TO80HjG.H/qT.C7zR8RwRgRTV60xf00gm','1','Pusat','nul','PT. PGN','12345678','jakarta','Head of Departement NR','pak bandi','2025-09-14 17:51:00',NULL,'2025-09-14 17:51:00','2025-09-14 17:51:00'),(17,'User CLG 1','user1_CLG@example.com','$2y$12$NZnOPduNzdtZj7k1H2wLMesGahhOBMHjvVbqhPES8SNUFh7FzvduS','4','CLG',NULL,NULL,NULL,NULL,'Field Technician',NULL,NULL,NULL,'2025-09-14 18:00:37','2025-09-14 18:00:37'),(18,'User CLG 2','user2_CLG@example.com','$2y$12$sL202HkS9CHjwxJxgkJko.AZ69ECqqxfk6gkOIUPUMExjXt/A/VKa','4','CLG',NULL,NULL,NULL,NULL,'Field Technician',NULL,NULL,NULL,'2025-09-14 18:00:37','2025-09-14 18:00:37'),(19,'User BKS 1','user1_BKS@example.com','$2y$12$wh6OLVdg0wP7jnQE3dmpTe0HOcHr5PNaQzdokG7E3C33fr6J7Hx9y','4','BKS',NULL,NULL,NULL,NULL,'Field Technician',NULL,NULL,NULL,'2025-09-14 18:00:37','2025-09-14 18:00:37'),(20,'User BKS 2','user2_BKS@example.com','$2y$12$ycqcqHkZWk3BUwRiCu7rYeoVM8kqlEwmwFfttVsSiiJfHYoohTHaS','4','BKS',NULL,NULL,NULL,NULL,'Field Technician',NULL,NULL,NULL,'2025-09-14 18:00:38','2025-09-14 18:00:38'),(21,'User JKT 1','user1_JKT@example.com','$2y$12$bQ695YBg96DcC.ikoLn7LeH6CUmh3o6yPXBYubCdVpfFa1MhgziRq','4','JKT',NULL,NULL,NULL,NULL,'Field Technician',NULL,NULL,NULL,'2025-09-14 18:00:38','2025-09-14 18:00:38'),(22,'User JKT 2','user2_JKT@example.com','$2y$12$wFG9J8evXCJIM54I80qOwuNX8DV8QiBWFV7jEdP8ksS10Cci9dzay','4','JKT',NULL,NULL,NULL,NULL,'Field Technician',NULL,NULL,NULL,'2025-09-14 18:00:38','2025-09-14 18:00:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'PT Techno Global'),(2,'CV Digital Nusantara'),(3,'PT Office Supplies');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verifikasi_permintaan`
--

DROP TABLE IF EXISTS `verifikasi_permintaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verifikasi_permintaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `region_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','diterima','ditolak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `signed_by` bigint unsigned DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `verifikasi_permintaan_user_id_foreign` (`user_id`),
  KEY `verifikasi_permintaan_signed_by_foreign` (`signed_by`),
  KEY `verifikasi_permintaan_region_id_foreign` (`region_id`),
  CONSTRAINT `verifikasi_permintaan_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE,
  CONSTRAINT `verifikasi_permintaan_signed_by_foreign` FOREIGN KEY (`signed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `verifikasi_permintaan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verifikasi_permintaan`
--

LOCK TABLES `verifikasi_permintaan` WRITE;
/*!40000 ALTER TABLE `verifikasi_permintaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `verifikasi_permintaan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-28 15:48:38
