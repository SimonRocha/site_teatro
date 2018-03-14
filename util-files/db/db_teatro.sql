-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.1.30-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela db_teatro.bilhete
CREATE TABLE IF NOT EXISTS `bilhete` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo` int(10) unsigned NOT NULL,
  `id_horario` int(10) unsigned NOT NULL,
  `numero_cadeira` int(10) unsigned DEFAULT NULL,
  `is_pago` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Bilhete_FKIndex1` (`id_horario`),
  KEY `Bilhete_FKIndex2` (`id_tipo`),
  CONSTRAINT `bilhete_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bilhete_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela db_teatro.espetaculo
CREATE TABLE IF NOT EXISTS `espetaculo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Sala_id` int(10) unsigned NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `foto` blob,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Sala_id` (`Sala_id`),
  CONSTRAINT `espetaculo_ibfk_1` FOREIGN KEY (`Sala_id`) REFERENCES `sala` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela db_teatro.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_espetaculo` int(10) unsigned NOT NULL,
  `horario_inicial` varchar(100) DEFAULT NULL,
  `horario_final` varchar(100) DEFAULT NULL,
  `dia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Horario_FKIndex1` (`id_espetaculo`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_espetaculo`) REFERENCES `espetaculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela db_teatro.sala
CREATE TABLE IF NOT EXISTS `sala` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantidade_salas` int(10) unsigned DEFAULT NULL,
  `mapa` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela db_teatro.tipo
CREATE TABLE IF NOT EXISTS `tipo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
