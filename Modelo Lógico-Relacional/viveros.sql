-- MySQL Script generated by MySQL Workbench
-- mié 11 nov 2020 12:42:24 WET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zona` (
  `Código de zona` INT NOT NULL,
  `Nombre` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`Código de zona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `DNI empleado` VARCHAR(30) NOT NULL,
  `Nombre` VARCHAR(60) NOT NULL,
  `Sueldo` FLOAT NOT NULL,
  `Seguridad Social` INT NOT NULL,
  `Código de zona` INT NOT NULL,
  `Fecha inicio` VARCHAR(45) NOT NULL,
  `Fecha fin` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI empleado`),
  CONSTRAINT `Código de zona`
    FOREIGN KEY (`Código de zona`)
    REFERENCES `mydb`.`Zona` (`Código de zona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vivero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vivero` (
  `Localización` FLOAT NOT NULL,
  `Nombre` VARCHAR(60) NOT NULL,
  `Código de zona` INT NOT NULL,
  PRIMARY KEY (`Localización`),
  CONSTRAINT `Cód de zona`
    FOREIGN KEY (`Código de zona`)
    REFERENCES `mydb`.`Zona` (`Código de zona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `Código de barras` INT NOT NULL,
  `Nombre` VARCHAR(60) NOT NULL,
  `Tipo` VARCHAR(60) NOT NULL,
  `Precio` FLOAT NOT NULL,
  `Stock` INT NULL,
  `Código de zona` INT NOT NULL,
  PRIMARY KEY (`Código de barras`),
  CONSTRAINT `Código zona`
    FOREIGN KEY (`Código de zona`)
    REFERENCES `mydb`.`Zona` (`Código de zona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `DNI cliente` VARCHAR(30) NOT NULL,
  `Nombre` VARCHAR(60) NOT NULL,
  `Bonificación` FLOAT NULL,
  `Gasto mensual` FLOAT NULL,
  `Código de pedido` INT NOT NULL,
  PRIMARY KEY (`DNI cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `Código de pedido` INT NOT NULL,
  `Fecha` VARCHAR(45) NULL,
  `Importe` FLOAT NOT NULL,
  `Cantidad` INT NOT NULL,
  `Código de barras` INT NOT NULL,
  `DNI empleado` VARCHAR(30) NOT NULL,
  `DNI cliente` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Código de pedido`),
  CONSTRAINT `Código de barras`
    FOREIGN KEY (`Código de barras`)
    REFERENCES `mydb`.`Producto` (`Código de barras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DNI empleado`
    FOREIGN KEY (`DNI empleado`)
    REFERENCES `mydb`.`Empleado` (`DNI empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DNI cliente`
    FOREIGN KEY (`DNI cliente`)
    REFERENCES `mydb`.`Cliente` (`DNI cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
