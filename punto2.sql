-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema notas_GS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema notas_GS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `notas_GS` DEFAULT CHARACTER SET utf8 ;
USE `notas_GS` ;

-- -----------------------------------------------------
-- Table `notas_GS`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_GS`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas_GS`.`nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_GS`.`nota` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NOT NULL,
  `FechadeCreación` VARCHAR(45) NOT NULL,
  `Descripción` TEXT NOT NULL,
  `Puede ser Eliminada` TINYINT NOT NULL,
  `usuarioId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nota_usuario_idx` (`usuarioId` ASC) VISIBLE,
  CONSTRAINT `fk_nota_usuario`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `notas_GS`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas_GS`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_GS`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas_GS`.`notas_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_GS`.`notas_categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria_id` INT NOT NULL,
  `notas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_note_categorias_idx` (`categoria_id` ASC) VISIBLE,
  INDEX `fk_categorias_nota_idx` (`notas_id` ASC) VISIBLE,
  CONSTRAINT `fk_note_categorias`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `notas_GS`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorias_nota`
    FOREIGN KEY (`notas_id`)
    REFERENCES `notas_GS`.`nota` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
