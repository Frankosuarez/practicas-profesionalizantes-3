-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema unidad-2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema unidad-2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `unidad-2` DEFAULT CHARACTER SET utf8 ;
USE `unidad-2` ;

-- -----------------------------------------------------
-- Table `unidad-2`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `unidad-2`.`country` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `capital` VARCHAR(45) NULL,
  `language` VARCHAR(45) NULL,
  `area` VARCHAR(45) NULL,
  `population` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unidad-2`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `unidad-2`.`city` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `language` VARCHAR(45) NULL,
  `area` VARCHAR(45) NULL,
  `population` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `is_a_coastal_city` TINYINT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_city_country_idx` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_city_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `unidad-2`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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

INSERT INTO `unidad-2`.`city` 
(`id`, `name`, `language`, `area`, `population`, `postal_code`, `is_a_coastal_city`, `country_id`) 
VALUES (1, 'Mar del Plata', 'Spanish', '79', '618989', '7600', 1, 1);

INSERT INTO `unidad-2`.`city` 
(`id`, `name`, `language`, `area`, `population`, `postal_code`, `is_a_coastal_city`, `country_id`) 
VALUES (2, 'Nice', 'French', '71', '340017', '06000', 1, 2);

INSERT INTO `unidad-2`.`city` 
(`id`, `name`, `language`, `area`, `population`, `postal_code`, `is_a_coastal_city`, `country_id`) 
VALUES (3, 'Kyoto', 'Japanese', '827.9', '1475000', '600-0000', 0, 3);

INSERT INTO `unidad-2`.`city` 
(`id`, `name`, `language`, `area`, `population`, `postal_code`, `is_a_coastal_city`, `country_id`) 
VALUES (4, 'Sydney', 'English', '12367.7', '5312000', '2000', 1, 4);

DELETE FROM `unidad-2`.`city`
WHERE `id` = 2;

UPDATE `unidad-2`.`city`
SET `population` = '650000'
WHERE `id` = 1;

SELECT * FROM `city`;

SELECT c.name AS country_name
FROM `unidad-2`.country c
JOIN `unidad-2`.city ci ON c.id = ci.country_id
ORDER BY CAST(ci.population AS UNSIGNED) DESC
LIMIT 1;

SELECT DISTINCT c.name AS country_name
FROM `unidad-2`.country c
JOIN `unidad-2`.city ci ON c.id = ci.country_id
WHERE ci.is_a_coastal_city = 1
  AND CAST(ci.population AS UNSIGNED) > 1000000;

SELECT 
  c.name AS country_name,
  ci.name AS city_name,
  (CAST(ci.population AS UNSIGNED) / CAST(ci.area AS DECIMAL(10,2))) AS density
FROM `unidad-2`.country c
JOIN `unidad-2`.city ci ON c.id = ci.country_id
ORDER BY density DESC
LIMIT 1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
