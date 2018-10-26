-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.1.35-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных shop
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shop`;

-- Дамп структуры для процедура shop.Процедура1
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Процедура1`(IN `КодКонтрагента` INT)
BEGIN
SELECT *
FROM `ттн`
WHERE `ттн`.`КодКонтрагента` = КодКонтрагента;
END//
DELIMITER ;

-- Дамп структуры для процедура shop.Процедура2
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Процедура2`(IN `КодСклада` INT, IN `КодКонтрагента` INT, IN `КодИзделия` INT, IN `ЦенаЗакупки` FLOAT, IN `Количество` FLOAT)
BEGIN
DECLARE n, i int;
start transaction;
INSERT INTO `ттн`(`ттн`.`КодСклада`, `ттн`.`КодКонтрагента`) VALUES (КодСклада, КодКонтрагента);
SET n = last_insert_id();
INSERT INTO `тчттн` VALUES (n, КодИзделия, ЦенаЗакупки, Количество);
SET i = (SELECT count(*) FROM `тчттн` WHERE (`тчттн`.`КодТТН` = n));
if i = 0
then
	rollback;
else
	commit;
end if;
END//
DELIMITER ;

-- Дамп структуры для таблица shop.единицыизмерения
CREATE TABLE IF NOT EXISTS `единицыизмерения` (
  `КодЕдиницы` int(11) NOT NULL AUTO_INCREMENT,
  `Единица` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`КодЕдиницы`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.
-- Дамп структуры для таблица shop.изделия
CREATE TABLE IF NOT EXISTS `изделия` (
  `КодИзделия` int(11) NOT NULL AUTO_INCREMENT,
  `ЦенаПродажи` float DEFAULT NULL,
  `Изделие` varchar(100) DEFAULT NULL,
  `КодЕдиницыИзмерения` int(11) DEFAULT NULL,
  `КодПоставщика` int(11) DEFAULT NULL,
  PRIMARY KEY (`КодИзделия`),
  KEY `FK_изделия_единицыизмерения` (`КодЕдиницыИзмерения`),
  KEY `FK_изделия_контрагенты` (`КодПоставщика`),
  CONSTRAINT `FK_изделия_единицыизмерения` FOREIGN KEY (`КодЕдиницыИзмерения`) REFERENCES `единицыизмерения` (`КодЕдиницы`),
  CONSTRAINT `FK_изделия_контрагенты` FOREIGN KEY (`КодПоставщика`) REFERENCES `контрагенты` (`КодКонтрагента`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.
-- Дамп структуры для представление shop.изделия3
-- Создание временной таблицы для обработки ошибок зависимостей представлений
CREATE TABLE `изделия3` (
	`КодИзделия` INT(11) NOT NULL,
	`ЦенаПродажи` FLOAT NULL,
	`Изделие` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`КодЕдиницыИзмерения` INT(11) NULL,
	`КодПоставщика` INT(11) NULL
) ENGINE=MyISAM;

-- Дамп структуры для таблица shop.изделия_copy
CREATE TABLE IF NOT EXISTS `изделия_copy` (
  `КодИзделия` int(11) NOT NULL AUTO_INCREMENT,
  `ЦенаПродажи` float DEFAULT NULL,
  `Изделие` varchar(100) DEFAULT NULL,
  `КодЕдиницыИзмерения` int(11) DEFAULT NULL,
  `КодПоставщика` int(11) DEFAULT NULL,
  PRIMARY KEY (`КодИзделия`),
  KEY `FK_изделия_единицыизмерения` (`КодЕдиницыИзмерения`),
  KEY `FK_изделия_контрагенты` (`КодПоставщика`),
  CONSTRAINT `изделия_copy_ibfk_1` FOREIGN KEY (`КодЕдиницыИзмерения`) REFERENCES `единицыизмерения` (`КодЕдиницы`),
  CONSTRAINT `изделия_copy_ibfk_2` FOREIGN KEY (`КодПоставщика`) REFERENCES `контрагенты` (`КодКонтрагента`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.
-- Дамп структуры для таблица shop.контрагенты
CREATE TABLE IF NOT EXISTS `контрагенты` (
  `КодКонтрагента` int(11) NOT NULL AUTO_INCREMENT,
  `Название` varchar(150) NOT NULL DEFAULT '0',
  `ЮрАдрес` varchar(150) DEFAULT NULL,
  `ИНН` varchar(15) NOT NULL DEFAULT '0',
  `КПП` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`КодКонтрагента`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.
-- Дамп структуры для таблица shop.склады
CREATE TABLE IF NOT EXISTS `склады` (
  `КодСклада` int(11) NOT NULL AUTO_INCREMENT,
  `Склад` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`КодСклада`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.
-- Дамп структуры для представление shop.третийпоставщик
-- Создание временной таблицы для обработки ошибок зависимостей представлений
CREATE TABLE `третийпоставщик` (
	`Изделие` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`ЦенаПродажи` FLOAT NULL
) ENGINE=MyISAM;

-- Дамп структуры для таблица shop.ттн
CREATE TABLE IF NOT EXISTS `ттн` (
  `КодТТН` int(11) NOT NULL AUTO_INCREMENT,
  `Дата` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `КодСклада` int(11) NOT NULL,
  `КодКонтрагента` int(11) NOT NULL,
  PRIMARY KEY (`КодТТН`),
  KEY `FK__склады` (`КодСклада`),
  KEY `FK__контрагенты` (`КодКонтрагента`),
  CONSTRAINT `FK__контрагенты` FOREIGN KEY (`КодКонтрагента`) REFERENCES `контрагенты` (`КодКонтрагента`),
  CONSTRAINT `FK__склады` FOREIGN KEY (`КодСклада`) REFERENCES `склады` (`КодСклада`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.
-- Дамп структуры для таблица shop.тчттн
CREATE TABLE IF NOT EXISTS `тчттн` (
  `КодТТН` int(11) NOT NULL,
  `КодИзделия` int(11) NOT NULL,
  `ЦенаЗакупки` float DEFAULT NULL,
  `Количество` float NOT NULL,
  PRIMARY KEY (`КодТТН`,`КодИзделия`),
  KEY `FK__изделия` (`КодИзделия`),
  CONSTRAINT `FK__изделия` FOREIGN KEY (`КодИзделия`) REFERENCES `изделия` (`КодИзделия`),
  CONSTRAINT `FK__ттн` FOREIGN KEY (`КодТТН`) REFERENCES `ттн` (`КодТТН`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.
-- Дамп структуры для представление shop.изделия3
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `изделия3`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `изделия3` AS select `изделия`.`КодИзделия` AS `КодИзделия`,`изделия`.`ЦенаПродажи` AS `ЦенаПродажи`,`изделия`.`Изделие` AS `Изделие`,`изделия`.`КодЕдиницыИзмерения` AS `КодЕдиницыИзмерения`,`изделия`.`КодПоставщика` AS `КодПоставщика` from `изделия` where (`изделия`.`КодПоставщика` = 3) WITH CASCADED CHECK OPTION;

-- Дамп структуры для представление shop.третийпоставщик
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `третийпоставщик`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `третийпоставщик` AS select `изделия`.`Изделие` AS `Изделие`,`изделия`.`ЦенаПродажи` AS `ЦенаПродажи` from `изделия` where (`изделия`.`КодПоставщика` = 3);

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
