/*
 Navicat Premium Data Transfer

 Source Server         : kominfo
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : db_spk_saw

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 26/05/2022 00:04:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_guru
-- ----------------------------
DROP TABLE IF EXISTS `t_guru`;
CREATE TABLE `t_guru`  (
  `kode_alternatif` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_lengkap` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_kelamin` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tempat_lahir` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `pendidikan` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pangkat_golongan` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_masuk` date NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 1,
  `created_at` datetime(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`kode_alternatif`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_guru
-- ----------------------------
INSERT INTO `t_guru` VALUES ('G1', '196412041994031003', 'Drs. H.Dedi Jubaedi, M.M.', 'L', 'Bandung', '1964-05-05', 'S2', 'IV/b', '2016-04-01', 1, '2022-05-24 11:47:36');
INSERT INTO `t_guru` VALUES ('G2', '196911282000031002', 'H. Idiyana, S.Pd.', 'L', 'Karawang', '1969-11-28', 'S1', 'IV/a', '2010-10-01', 1, '2022-05-24 11:53:17');
INSERT INTO `t_guru` VALUES ('G3', '198010052009022004', 'Kuswita Sitiadefi, S.Si.', 'P', 'Garut', '1980-10-05', 'S1', ' III/c', '2018-10-01', 1, '2022-05-24 11:53:18');
INSERT INTO `t_guru` VALUES ('G4', '198107062009021003', 'Komarudin, S.Pd.I.', 'L', 'Karawang', '1981-07-06', 'S1', ' III/c', '2018-10-01', 1, '2022-05-24 11:53:19');
INSERT INTO `t_guru` VALUES ('G5', '197710312010012006', 'Catur Margi Kurniani, S.S.', 'P', 'Jakarta', '1977-10-31', 'S1', ' III/c', '2017-04-01', 1, '2022-05-24 11:53:20');
INSERT INTO `t_guru` VALUES ('G6', '198004282010012005', 'Rini Yastuti Suhari, S.S.', 'P', 'Bandung', '1980-04-28', 'S1', 'III/c', '2016-10-01', 1, '2022-05-24 11:53:22');
INSERT INTO `t_guru` VALUES ('G7', '198111132010011010', 'H.Aos Sogiri, S.Pd.', 'L', 'Karawang', '1981-11-13', 'S1', ' III/c', '2017-04-01', 1, '2022-05-24 11:53:23');
INSERT INTO `t_guru` VALUES ('G8', '198204142010012012', 'Reny Yustanti, S.Pd.I.', 'P', 'Kediri', '1982-04-14', 'S1', ' III/b', '2014-04-01', 1, '2022-05-24 11:53:24');

-- ----------------------------
-- Table structure for t_hasil
-- ----------------------------
DROP TABLE IF EXISTS `t_hasil`;
CREATE TABLE `t_hasil`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_alternatif` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hasil` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT current_timestamp(0),
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hasil
-- ----------------------------
INSERT INTO `t_hasil` VALUES (1, 'G1', '0.89761009644983', '2022-05-25 17:30:27', NULL);
INSERT INTO `t_hasil` VALUES (2, 'G2', '0.91228743416102', '2022-05-25 17:30:27', NULL);
INSERT INTO `t_hasil` VALUES (3, 'G3', '0.77821212121212', '2022-05-25 17:30:27', NULL);
INSERT INTO `t_hasil` VALUES (4, 'G4', '0.78490662836035', '2022-05-25 17:30:27', NULL);
INSERT INTO `t_hasil` VALUES (5, 'G5', '0.81586319173678', '2022-05-25 17:30:27', NULL);
INSERT INTO `t_hasil` VALUES (6, 'G6', '0.81993693139066', '2022-05-25 17:30:27', NULL);
INSERT INTO `t_hasil` VALUES (7, 'G7', '0.82401067104453', '2022-05-25 17:30:27', NULL);
INSERT INTO `t_hasil` VALUES (8, 'G8', '0.87581571926944', '2022-05-25 17:30:27', NULL);

-- ----------------------------
-- Table structure for t_kompetensi
-- ----------------------------
DROP TABLE IF EXISTS `t_kompetensi`;
CREATE TABLE `t_kompetensi`  (
  `kode_kompetensi` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kompetensi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 1,
  `created_by` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`kode_kompetensi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_kompetensi
-- ----------------------------
INSERT INTO `t_kompetensi` VALUES ('KP01', 'Menguasai Karakteristik Peserta Didik', 1, '196103161986031001', '2022-05-23 21:46:35');
INSERT INTO `t_kompetensi` VALUES ('KP02', 'Menguasai Teori belajar dan prinsip-prinsip pembelajaran yang mendidik', 1, '196103161986031001', '2022-05-23 21:46:56');
INSERT INTO `t_kompetensi` VALUES ('KP03', 'Pengembangan Kurikulum', 1, '196103161986031001', '2022-05-23 21:52:46');
INSERT INTO `t_kompetensi` VALUES ('KP04', 'Kegiatan Pembelajaran yang Mendidik', 1, '196103161986031001', '2022-05-23 21:54:42');
INSERT INTO `t_kompetensi` VALUES ('KP05', 'Pengembangan potensi anak didik', 1, '196103161986031001', '2022-05-23 21:55:05');
INSERT INTO `t_kompetensi` VALUES ('KP06', 'Komunikasi dengan peserta didik', 1, '196103161986031001', '2022-05-23 21:55:09');
INSERT INTO `t_kompetensi` VALUES ('KP07', 'Penilaian dan evaluasi', 1, '196103161986031001', '2022-05-23 21:55:10');
INSERT INTO `t_kompetensi` VALUES ('KP08', 'Bertindak sesuai dengan norma agama, hukum, sosial dan kebudayaan nasional', 1, '196103161986031001', '2022-05-23 21:55:11');
INSERT INTO `t_kompetensi` VALUES ('KP09', 'Menunjukan pribadi yang dewasa dan teladan', 1, '196103161986031001', '2022-05-23 21:55:14');
INSERT INTO `t_kompetensi` VALUES ('KP10', 'Etos kerja, tanggungjawab yang tinggi, rasa bangga menjadi guru', 1, '196103161986031001', '2022-05-23 21:55:15');
INSERT INTO `t_kompetensi` VALUES ('KP11', 'Bersikap inklusif, bertindak obyektif, serta tidak diskriminatif', 1, '196103161986031001', '2022-05-23 21:55:16');
INSERT INTO `t_kompetensi` VALUES ('KP12', 'Komunikasi dengan sesama guru, tenaga kependidikan, orangtua, peserta didik dan masayarakat', 1, '196103161986031001', '2022-05-23 21:55:18');
INSERT INTO `t_kompetensi` VALUES ('KP13', 'Penguasaan materi, struktur, konsep dan pola pikir keilmuan yang mendukung mata pelajaran yang diampu', 1, '196103161986031001', '2022-05-23 21:57:53');
INSERT INTO `t_kompetensi` VALUES ('KP14', 'Mengembangkan keprofesionalan melalui tindakan yang reflektif', 1, '196103161986031001', '2022-05-23 21:59:20');

-- ----------------------------
-- Table structure for t_kriteria
-- ----------------------------
DROP TABLE IF EXISTS `t_kriteria`;
CREATE TABLE `t_kriteria`  (
  `kode_kriteria` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kriteria` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipe` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bobot` int(1) NOT NULL,
  `created_at` datetime(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`kode_kriteria`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_kriteria
-- ----------------------------
INSERT INTO `t_kriteria` VALUES ('K1', 'Absensi', 'benefit', 2, '2022-05-23 21:24:20');
INSERT INTO `t_kriteria` VALUES ('K2', 'Kompetensi', 'benefit', 3, '2022-05-23 21:24:51');
INSERT INTO `t_kriteria` VALUES ('K3', 'Lama Bekerja', 'benefit', 2, '2022-05-23 21:25:05');
INSERT INTO `t_kriteria` VALUES ('K4', 'Pendidikan', 'benefit', 2, '2022-05-23 21:25:17');
INSERT INTO `t_kriteria` VALUES ('K5', 'Kreatifitas', 'benefit', 1, '2022-05-23 21:25:53');

-- ----------------------------
-- Table structure for t_kuesioner
-- ----------------------------
DROP TABLE IF EXISTS `t_kuesioner`;
CREATE TABLE `t_kuesioner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_alternatif` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_kompetensi` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai` int(1) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_kuesioner
-- ----------------------------
INSERT INTO `t_kuesioner` VALUES (1, 'G1', 'KP01', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (2, 'G1', 'KP02', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (3, 'G1', 'KP03', 5, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (4, 'G1', 'KP04', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (5, 'G1', 'KP05', 5, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (6, 'G1', 'KP06', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (7, 'G1', 'KP07', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (8, 'G1', 'KP08', 5, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (9, 'G1', 'KP09', 5, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (10, 'G1', 'KP10', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (11, 'G1', 'KP11', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (12, 'G1', 'KP12', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (13, 'G1', 'KP13', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (14, 'G1', 'KP14', 4, '2022-05-24 22:13:06');
INSERT INTO `t_kuesioner` VALUES (15, 'G2', 'KP01', 4, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (16, 'G2', 'KP02', 4, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (17, 'G2', 'KP03', 4, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (18, 'G2', 'KP04', 4, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (19, 'G2', 'KP05', 5, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (20, 'G2', 'KP06', 4, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (21, 'G2', 'KP07', 5, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (22, 'G2', 'KP08', 4, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (23, 'G2', 'KP09', 5, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (24, 'G2', 'KP10', 3, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (25, 'G2', 'KP11', 4, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (26, 'G2', 'KP12', 4, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (27, 'G2', 'KP13', 3, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (28, 'G2', 'KP14', 4, '2022-05-24 22:14:17');
INSERT INTO `t_kuesioner` VALUES (29, 'G3', 'KP01', 4, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (30, 'G3', 'KP02', 5, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (31, 'G3', 'KP03', 4, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (32, 'G3', 'KP04', 5, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (33, 'G3', 'KP05', 4, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (34, 'G3', 'KP06', 4, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (35, 'G3', 'KP07', 4, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (36, 'G3', 'KP08', 5, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (37, 'G3', 'KP09', 5, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (38, 'G3', 'KP10', 4, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (39, 'G3', 'KP11', 4, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (40, 'G3', 'KP12', 5, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (41, 'G3', 'KP13', 4, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (42, 'G3', 'KP14', 5, '2022-05-25 14:46:34');
INSERT INTO `t_kuesioner` VALUES (43, 'G4', 'KP01', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (44, 'G4', 'KP02', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (45, 'G4', 'KP03', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (46, 'G4', 'KP04', 5, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (47, 'G4', 'KP05', 3, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (48, 'G4', 'KP06', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (49, 'G4', 'KP07', 5, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (50, 'G4', 'KP08', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (51, 'G4', 'KP09', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (52, 'G4', 'KP10', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (53, 'G4', 'KP11', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (54, 'G4', 'KP12', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (55, 'G4', 'KP13', 5, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (56, 'G4', 'KP14', 4, '2022-05-25 14:46:51');
INSERT INTO `t_kuesioner` VALUES (57, 'G5', 'KP01', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (58, 'G5', 'KP02', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (59, 'G5', 'KP03', 5, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (60, 'G5', 'KP04', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (61, 'G5', 'KP05', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (62, 'G5', 'KP06', 5, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (63, 'G5', 'KP07', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (64, 'G5', 'KP08', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (65, 'G5', 'KP09', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (66, 'G5', 'KP10', 3, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (67, 'G5', 'KP11', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (68, 'G5', 'KP12', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (69, 'G5', 'KP13', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (70, 'G5', 'KP14', 4, '2022-05-25 14:47:09');
INSERT INTO `t_kuesioner` VALUES (71, 'G6', 'KP01', 3, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (72, 'G6', 'KP02', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (73, 'G6', 'KP03', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (74, 'G6', 'KP04', 5, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (75, 'G6', 'KP05', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (76, 'G6', 'KP06', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (77, 'G6', 'KP07', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (78, 'G6', 'KP08', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (79, 'G6', 'KP09', 5, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (80, 'G6', 'KP10', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (81, 'G6', 'KP11', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (82, 'G6', 'KP12', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (83, 'G6', 'KP13', 4, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (84, 'G6', 'KP14', 5, '2022-05-25 14:47:33');
INSERT INTO `t_kuesioner` VALUES (85, 'G7', 'KP01', 4, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (86, 'G7', 'KP02', 5, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (87, 'G7', 'KP03', 4, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (88, 'G7', 'KP04', 4, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (89, 'G7', 'KP05', 3, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (90, 'G7', 'KP06', 4, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (91, 'G7', 'KP07', 5, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (92, 'G7', 'KP08', 4, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (93, 'G7', 'KP09', 4, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (94, 'G7', 'KP10', 4, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (95, 'G7', 'KP11', 5, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (96, 'G7', 'KP12', 4, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (97, 'G7', 'KP13', 5, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (98, 'G7', 'KP14', 4, '2022-05-25 14:47:51');
INSERT INTO `t_kuesioner` VALUES (99, 'G8', 'KP01', 4, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (100, 'G8', 'KP02', 4, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (101, 'G8', 'KP03', 5, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (102, 'G8', 'KP04', 4, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (103, 'G8', 'KP05', 4, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (104, 'G8', 'KP06', 5, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (105, 'G8', 'KP07', 3, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (106, 'G8', 'KP08', 4, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (107, 'G8', 'KP09', 4, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (108, 'G8', 'KP10', 4, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (109, 'G8', 'KP11', 4, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (110, 'G8', 'KP12', 5, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (111, 'G8', 'KP13', 4, '2022-05-25 14:48:47');
INSERT INTO `t_kuesioner` VALUES (112, 'G8', 'KP14', 4, '2022-05-25 14:48:47');

-- ----------------------------
-- Table structure for t_opsi
-- ----------------------------
DROP TABLE IF EXISTS `t_opsi`;
CREATE TABLE `t_opsi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_opsi
-- ----------------------------
INSERT INTO `t_opsi` VALUES (1, 'Sangat Tidak Baik', 1);
INSERT INTO `t_opsi` VALUES (2, 'Tidak Baik', 2);
INSERT INTO `t_opsi` VALUES (3, 'Cukup Baik', 3);
INSERT INTO `t_opsi` VALUES (4, 'Baik', 4);
INSERT INTO `t_opsi` VALUES (5, 'Sangat Baik', 5);

-- ----------------------------
-- Table structure for t_pengguna
-- ----------------------------
DROP TABLE IF EXISTS `t_pengguna`;
CREATE TABLE `t_pengguna`  (
  `nip` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_lengkap` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jabatan` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `role` int(1) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 1,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT current_timestamp(0),
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`nip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pengguna
-- ----------------------------
INSERT INTO `t_pengguna` VALUES ('196103161986031001', 'Admin', 'Kepala TU', 1, 1, '$2y$10$XcQledQ4ovCMMMOBNgvc7ehUoRV1Q./NsS9QtTL4oFuTd1t3Rr.6m', '2022-05-23 11:57:40', '2022-05-23 16:42:44');
INSERT INTO `t_pengguna` VALUES ('196405051988031006', 'Drs. Wawan C. H., M.Pd.', 'Kepala Sekolah', 2, 1, '$2y$10$0dOcwvlCYEMctdFMehM1HuDmjXoYwzgiDybZIaCMtTy9e5RPc5eMi', '2022-05-23 16:42:15', '2022-05-23 20:34:30');

-- ----------------------------
-- Table structure for t_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `t_penilaian`;
CREATE TABLE `t_penilaian`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_alternatif` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_kriteria` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai` float NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` datetime(0) NULL DEFAULT current_timestamp(0),
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_ktr`(`kode_kriteria`) USING BTREE,
  INDEX `fk_alt`(`kode_alternatif`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_penilaian
-- ----------------------------
INSERT INTO `t_penilaian` VALUES (1, 'G1', 'K2', 4.29, 1, '2022-05-24 22:13:06', '2022-05-25 16:14:19');
INSERT INTO `t_penilaian` VALUES (2, 'G2', 'K2', 4.07, 1, '2022-05-24 22:14:17', NULL);
INSERT INTO `t_penilaian` VALUES (15, 'G1', 'K3', 6, 1, '2022-05-25 11:37:02', NULL);
INSERT INTO `t_penilaian` VALUES (16, 'G1', 'K4', 4, 1, '2022-05-25 11:37:02', NULL);
INSERT INTO `t_penilaian` VALUES (21, 'G1', 'K1', 297, 1, '2022-05-25 14:39:16', NULL);
INSERT INTO `t_penilaian` VALUES (22, 'G1', 'K5', 4, 1, '2022-05-25 14:39:16', NULL);
INSERT INTO `t_penilaian` VALUES (23, 'G2', 'K1', 280, 1, '2022-05-25 14:40:57', NULL);
INSERT INTO `t_penilaian` VALUES (24, 'G2', 'K5', 4, 1, '2022-05-25 14:40:57', NULL);
INSERT INTO `t_penilaian` VALUES (25, 'G2', 'K3', 11, 1, '2022-05-25 14:41:15', NULL);
INSERT INTO `t_penilaian` VALUES (26, 'G2', 'K4', 3, 1, '2022-05-25 14:41:15', NULL);
INSERT INTO `t_penilaian` VALUES (27, 'G3', 'K3', 3, 1, '2022-05-25 14:44:56', NULL);
INSERT INTO `t_penilaian` VALUES (28, 'G3', 'K4', 3, 1, '2022-05-25 14:44:56', NULL);
INSERT INTO `t_penilaian` VALUES (29, 'G4', 'K3', 3, 1, '2022-05-25 14:45:03', NULL);
INSERT INTO `t_penilaian` VALUES (30, 'G4', 'K4', 3, 1, '2022-05-25 14:45:03', NULL);
INSERT INTO `t_penilaian` VALUES (31, 'G5', 'K3', 5, 1, '2022-05-25 14:45:10', NULL);
INSERT INTO `t_penilaian` VALUES (32, 'G5', 'K4', 3, 1, '2022-05-25 14:45:10', NULL);
INSERT INTO `t_penilaian` VALUES (33, 'G6', 'K3', 5, 1, '2022-05-25 14:45:17', NULL);
INSERT INTO `t_penilaian` VALUES (34, 'G6', 'K4', 3, 1, '2022-05-25 14:45:17', NULL);
INSERT INTO `t_penilaian` VALUES (35, 'G7', 'K3', 5, 1, '2022-05-25 14:45:23', NULL);
INSERT INTO `t_penilaian` VALUES (36, 'G7', 'K4', 3, 1, '2022-05-25 14:45:23', NULL);
INSERT INTO `t_penilaian` VALUES (37, 'G8', 'K3', 8, 1, '2022-05-25 14:45:30', NULL);
INSERT INTO `t_penilaian` VALUES (38, 'G8', 'K4', 3, 1, '2022-05-25 14:45:30', NULL);
INSERT INTO `t_penilaian` VALUES (39, 'G3', 'K2', 4.43, 1, '2022-05-25 14:46:34', NULL);
INSERT INTO `t_penilaian` VALUES (40, 'G4', 'K2', 4.14, 1, '2022-05-25 14:46:51', NULL);
INSERT INTO `t_penilaian` VALUES (41, 'G5', 'K2', 4.07, 1, '2022-05-25 14:47:09', NULL);
INSERT INTO `t_penilaian` VALUES (42, 'G6', 'K2', 4.14, 1, '2022-05-25 14:47:33', NULL);
INSERT INTO `t_penilaian` VALUES (43, 'G7', 'K2', 4.21, 1, '2022-05-25 14:47:51', NULL);
INSERT INTO `t_penilaian` VALUES (44, 'G8', 'K2', 4.14, 1, '2022-05-25 14:48:47', NULL);
INSERT INTO `t_penilaian` VALUES (45, 'G3', 'K1', 298, 1, '2022-05-25 14:49:10', NULL);
INSERT INTO `t_penilaian` VALUES (46, 'G3', 'K5', 3, 1, '2022-05-25 14:49:10', NULL);
INSERT INTO `t_penilaian` VALUES (47, 'G4', 'K1', 300, 1, '2022-05-25 14:49:20', NULL);
INSERT INTO `t_penilaian` VALUES (48, 'G4', 'K5', 4, 1, '2022-05-25 14:49:20', NULL);
INSERT INTO `t_penilaian` VALUES (49, 'G5', 'K1', 299, 1, '2022-05-25 14:54:05', NULL);
INSERT INTO `t_penilaian` VALUES (50, 'G5', 'K5', 4, 1, '2022-05-25 14:54:05', NULL);
INSERT INTO `t_penilaian` VALUES (51, 'G6', 'K1', 298, 1, '2022-05-25 14:54:18', NULL);
INSERT INTO `t_penilaian` VALUES (52, 'G6', 'K5', 4, 1, '2022-05-25 14:54:18', NULL);
INSERT INTO `t_penilaian` VALUES (53, 'G7', 'K1', 297, 1, '2022-05-25 14:54:32', NULL);
INSERT INTO `t_penilaian` VALUES (54, 'G7', 'K5', 4, 1, '2022-05-25 14:54:32', NULL);
INSERT INTO `t_penilaian` VALUES (55, 'G8', 'K1', 300, 1, '2022-05-25 14:54:46', '2022-05-25 15:03:15');
INSERT INTO `t_penilaian` VALUES (56, 'G8', 'K5', 4, 1, '2022-05-25 14:54:46', '2022-05-25 15:03:15');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'Admin', '2022-05-23 11:45:17');
INSERT INTO `t_role` VALUES (2, 'Kepala Sekolah', '2022-05-23 11:54:53');

-- ----------------------------
-- View structure for v_kompetensi
-- ----------------------------
DROP VIEW IF EXISTS `v_kompetensi`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_kompetensi` AS SELECT
t_kuesioner.id,
t_kuesioner.kode_alternatif,
t_kuesioner.kode_kompetensi,
t_kuesioner.nilai,
t_kompetensi.kompetensi
FROM
t_kuesioner
LEFT JOIN t_kompetensi ON t_kuesioner.kode_kompetensi = t_kompetensi.kode_kompetensi ;

-- ----------------------------
-- View structure for v_kuesioner
-- ----------------------------
DROP VIEW IF EXISTS `v_kuesioner`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_kuesioner` AS SELECT
	t_guru.kode_alternatif,
	t_guru.nip,
	t_guru.nama_lengkap,
	t_guru.pendidikan,
	t_guru.pangkat_golongan,
	t_kuesioner.nilai
FROM
	t_guru
	LEFT JOIN t_kuesioner ON t_guru.kode_alternatif = t_kuesioner.kode_alternatif
	GROUP BY t_guru.kode_alternatif ;

-- ----------------------------
-- View structure for v_penilaian
-- ----------------------------
DROP VIEW IF EXISTS `v_penilaian`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_penilaian` AS SELECT
	t_guru.kode_alternatif kd_alternatif,
	t_guru.nip,
	t_guru.nama_lengkap,
	t_guru.pangkat_golongan,
	( SELECT p.nilai FROM t_penilaian p WHERE p.kode_alternatif = kd_alternatif AND p.kode_kriteria = 'K1' ) AS K1,
	( SELECT p.nilai FROM t_penilaian p WHERE p.kode_alternatif = kd_alternatif AND p.kode_kriteria = 'K2' ) AS K2,
	( SELECT p.nilai FROM t_penilaian p WHERE p.kode_alternatif = kd_alternatif AND p.kode_kriteria = 'K3' ) AS K3,
	( SELECT p.nilai FROM t_penilaian p WHERE p.kode_alternatif = kd_alternatif AND p.kode_kriteria = 'K4' ) AS K4,
	( SELECT p.nilai FROM t_penilaian p WHERE p.kode_alternatif = kd_alternatif AND p.kode_kriteria = 'K5' ) AS K5 
FROM
	t_guru
	LEFT JOIN t_penilaian ON t_penilaian.kode_alternatif = t_guru.kode_alternatif
	LEFT JOIN t_kriteria ON t_penilaian.kode_kriteria = t_kriteria.kode_kriteria
	GROUP BY kd_alternatif ;

SET FOREIGN_KEY_CHECKS = 1;
