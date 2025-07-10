-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema unidad-1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema unidad-1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `unidad-1` DEFAULT CHARACTER SET utf8 ;
USE `unidad-1` ;

-- -----------------------------------------------------
-- Table `unidad-1`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `unidad-1`.`country` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `capital` VARCHAR(45) NULL,
  `language` VARCHAR(45) NULL,
  `area` VARCHAR(45) NULL,
  `population` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `country` (`id`, `name`, `capital`, `language`, `area`, `population`) 
VALUES (1, 'Argentina', 'Buenos Aires', 'Spanish', '2780400', '46000000');

INSERT INTO `country` (`id`, `name`, `capital`, `language`, `area`, `population`) 
VALUES (2, 'France', 'Paris', 'French', '643801', '67000000');

INSERT INTO `country` (`id`, `name`, `capital`, `language`, `area`, `population`) 
VALUES (3, 'Japan', 'Tokyo', 'Japanese', '377975', '125800000');

INSERT INTO `country` (`id`, `name`, `capital`, `language`, `area`, `population`) 
VALUES (4, 'Australia', 'Canberra', 'English', '7692024', '26000000');

INSERT INTO `country` (`id`, `name`, `capital`, `language`, `area`, `population`) 
VALUES (5, 'Germany', 'Berlin', 'German', '357386', '83000000');

INSERT INTO `country` (`id`, `name`, `capital`, `language`, `area`, `population`) 
VALUES (6, 'Brazil', 'Brasília', 'Portuguese', '8515767', '213000000');

INSERT INTO `country` (`id`, `name`, `capital`, `language`, `area`, `population`) 
VALUES (7, 'Italy', 'Rome', 'Italian', '301340', '59000000');

DELETE FROM `country` WHERE `id` = 2;

UPDATE `country` 
SET `population` = '47000000' 
WHERE `id` = 1;

SELECT * FROM `country`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

