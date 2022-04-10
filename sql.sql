-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.4.17-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour adv
CREATE DATABASE IF NOT EXISTS `adv` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `adv`;

-- Listage de la structure de la table adv. adv_players
CREATE TABLE IF NOT EXISTS `adv_players` (
  `license` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `accounts` text DEFAULT NULL,
  `job` text DEFAULT NULL,
  `org` text DEFAULT NULL,
  `group` varchar(50) DEFAULT 'Utilisateur',
  `inventory` longtext DEFAULT NULL,
  `pos` text DEFAULT NULL,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table adv.adv_players : ~1 rows (environ)
/*!40000 ALTER TABLE `adv_players` DISABLE KEYS */;
INSERT INTO `adv_players` (`license`, `name`, `accounts`, `job`, `org`, `group`, `inventory`, `pos`) VALUES
	('license:1d5591181278673b68b3d603a21df06d4d9fe53b', 'A.D.E.M.O', '{"money":1000,"bank":1000,"black":1000}', '{"grade":0,"job":"unemployed"}', '{"org":"unemployed2","grade":0}', 'Utilisateur', '{"weight":5.5,"inv":{"bread":{"name":"bread","count":11.0}}}', '{"x":-1771.147216796875,"y":432.6197814941406,"z":127.2109375}');
/*!40000 ALTER TABLE `adv_players` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
