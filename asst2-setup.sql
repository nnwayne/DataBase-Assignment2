-- INFO90002 Assignment 2, 2018 sem1, setup script

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- uncomment and run these 3 SCHEMA commands if you are using your own computer
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `subway` ;
-- CREATE SCHEMA IF NOT EXISTS `subway` DEFAULT CHARACTER SET utf8 ;
-- USE `subway` ;

-- -----------------------------------------------------
-- Table `subway`.`customer`
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `id` INT UNSIGNED NOT NULL,
  `username` CHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `line`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `line` ;

CREATE TABLE IF NOT EXISTS `line` (
  `id` TINYINT UNSIGNED NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `station` ;

CREATE TABLE IF NOT EXISTS `station` (
  `id` TINYINT UNSIGNED NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `line` TINYINT UNSIGNED NOT NULL,
  `sequence` TINYINT UNSIGNED NOT NULL,
  `zone` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Station_Line1_idx` (`line` ASC),
  CONSTRAINT `fk_Station_Line1`
    FOREIGN KEY (`line`)
    REFERENCES `line` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `journey`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `journey` ;

CREATE TABLE IF NOT EXISTS `journey` (
  `id` BIGINT UNSIGNED NOT NULL,
  `customer` INT UNSIGNED NOT NULL,
  `startStation` TINYINT UNSIGNED NOT NULL,
  `startTime` TIMESTAMP NOT NULL,
  `endStation` TINYINT UNSIGNED NULL,
  `endTime` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Journey_Station2_idx` (`startStation` ASC),
  INDEX `fk_journey_station1_idx` (`endStation` ASC),
  CONSTRAINT `fk_journey_Customer1`
    FOREIGN KEY (`customer`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Journey_Station2`
    FOREIGN KEY (`startStation`)
    REFERENCES `station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_journey_station1`
    FOREIGN KEY (`endStation`)
    REFERENCES `station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




/* insert data */

INSERT INTO line VALUES(1,'Northern');
INSERT INTO line VALUES(2,'Western');
INSERT INTO line VALUES(3,'Eastern');

INSERT INTO station VALUES(1,'City',0,0,1);
INSERT INTO station VALUES(2,'First st',1,1,1);
INSERT INTO station VALUES(3,'Second st',1,2,2);
INSERT INTO station VALUES(4,'Third st',1,3,2);
INSERT INTO station VALUES(5,'Cafe',2,1,1);
INSERT INTO station VALUES(6,'House',2,2,1);
INSERT INTO station VALUES(7,'Farm',2,3,2);
INSERT INTO station VALUES(8,'Beach',2,4,2);
INSERT INTO station VALUES(9,'Gallery',3,1,1);
INSERT INTO station VALUES(10,'Library',3,2,1);
INSERT INTO station VALUES(11,'Shops',3,3,2);

INSERT INTO customer VALUES(1,'alice');
INSERT INTO customer VALUES(2,'bob');
INSERT INTO customer VALUES(3,'carol');
INSERT INTO customer VALUES(4,'dan');
INSERT INTO customer VALUES(5,'eve');

INSERT INTO journey VALUES(1,1,4,'2018/02/01 01:01:00',3,'2018/02/01 01:03:00');
INSERT INTO journey VALUES(2,2,4,'2018/02/01 02:02:00',2,'2018/02/01 02:06:00');
INSERT INTO journey VALUES(3,3,4,'2018/02/01 03:03:00',1,'2018/02/01 03:08:00');
INSERT INTO journey VALUES(4,4,3,'2018/02/01 04:04:00',2,'2018/02/01 04:05:00');
INSERT INTO journey VALUES(5,5,3,'2018/02/01 05:05:00',1,'2018/02/01 05:09:00');
INSERT INTO journey VALUES(6,1,2,'2018/02/01 06:06:00',1,'2018/02/01 06:08:00');
INSERT INTO journey VALUES(7,2,1,'2018/02/01 07:07:00',11,'2018/02/01 07:14:00');
INSERT INTO journey VALUES(8,3,4,'2018/02/01 08:08:00',9,'2018/02/01 08:14:00');
INSERT INTO journey VALUES(9,4,4,'2018/02/01 09:09:00',10,'2018/02/01 09:17:00');
INSERT INTO journey VALUES(10,5,4,'2018/02/02 10:10:00',11,'2018/02/02 10:22:00');
INSERT INTO journey VALUES(11,1,8,'2018/02/02 11:11:00',7,'2018/02/02 11:13:00');
INSERT INTO journey VALUES(12,2,8,'2018/02/02 12:12:00',7,'2018/02/02 12:14:00');
INSERT INTO journey VALUES(13,3,8,'2018/02/02 13:13:00',7,'2018/02/02 13:16:00');
INSERT INTO journey VALUES(14,4,7,'2018/02/02 14:14:00',8,'2018/02/02 14:16:00');
INSERT INTO journey VALUES(15,1,7,'2018/02/02 15:15:00',8,'2018/02/02 15:16:00');
INSERT INTO journey VALUES(16,2,8,'2018/02/02 16:16:00',5,'2018/02/02 16:20:00');
INSERT INTO journey VALUES(17,3,8,'2018/02/03 17:17:00',1,'2018/02/03 17:23:00');
INSERT INTO journey VALUES(18,1,8,'2018/02/03 18:18:00',10,'2018/02/03 18:31:00');
INSERT INTO journey VALUES(19,2,8,'2018/02/03 19:19:00',11,'2018/02/03 19:33:00');
INSERT INTO journey VALUES(20,1,1,'2018/02/03 20:20:00',11,'2018/02/03 20:26:00');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
