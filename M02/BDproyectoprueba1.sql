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
-- Table `mydb`.`HISTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HISTORY` (
  `id_history` INT NOT NULL COMMENT '		',
  `data_for_each_item` DATETIME NOT NULL,
  `decision_making` VARCHAR(45) NOT NULL,
  `creation _date` DATETIME NOT NULL,
  `creation_user` VARCHAR(45) NOT NULL,
  `date_modification` DATETIME NOT NULL,
  `user_modification` VARCHAR(45) NOT NULL,
  `id_adventure` INT NOT NULL,
  PRIMARY KEY (`id_history`, `id_adventure`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GAME`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GAME` (
  `id_game` INT NOT NULL COMMENT '				',
  `save_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_game`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USER` (
  `id_user` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `id_game` INT NOT NULL,
  PRIMARY KEY (`id_user`, `id_game`),
  INDEX `fk_USER_1_idx` (`id_game` ASC) VISIBLE,
  CONSTRAINT `fk_USER_1`
    FOREIGN KEY (`id_game`)
    REFERENCES `mydb`.`GAME` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ADVENTURE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ADVENTURE` (
  `id_adventure` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `get_replayadventures` VARCHAR(45) NOT NULL,
  `id_game` INT NOT NULL,
  `creation _date` DATETIME NOT NULL,
  `date_modification` DATETIME NOT NULL,
  `user_modification` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_adventure`, `id_game`),
  INDEX `fk_ADVENTURE_1_idx` (`id_game` ASC) VISIBLE,
  CONSTRAINT `fk_ADVENTURE_1`
    FOREIGN KEY (`id_game`)
    REFERENCES `mydb`.`GAME` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CHARACTER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CHARACTER` (
  `id_character` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `id_adventure` INT NOT NULL,
  PRIMARY KEY (`id_adventure`, `id_character`),
  INDEX `fk_CHARACTER_1_idx` (`id_adventure` ASC) VISIBLE,
  CONSTRAINT `fk_CHARACTER_1`
    FOREIGN KEY (`id_adventure`)
    REFERENCES `mydb`.`ADVENTURE` (`id_adventure`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CHARACTER_2`
    FOREIGN KEY ()
    REFERENCES `mydb`.`ADVENTURE` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`STEP_AVENTURE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`STEP_AVENTURE` (
  `id_step_aventure` INT NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `finalstep` VARCHAR(45) NOT NULL,
  `id_adventure` INT NOT NULL,
  PRIMARY KEY (`id_step_aventure`, `id_adventure`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OPTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OPTION` (
  `id_option` INT NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `nextstep` VARCHAR(45) NOT NULL,
  `answer` VARCHAR(45) NOT NULL,
  `id_step_aventure` INT NOT NULL,
  `id_history` INT NOT NULL,
  PRIMARY KEY (`id_option`, `id_step_aventure`, `id_history`),
  INDEX `fk_OPTION_1_idx` (`id_step_aventure` ASC) VISIBLE,
  INDEX `fk_OPTION_2_idx` (`id_history` ASC) VISIBLE,
  CONSTRAINT `fk_OPTION_1`
    FOREIGN KEY (`id_step_aventure`)
    REFERENCES `mydb`.`STEP_AVENTURE` (`id_step_aventure`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OPTION_2`
    FOREIGN KEY (`id_history`)
    REFERENCES `mydb`.`HISTORY` (`id_history`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ADVENTURE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ADVENTURE` (
  `id_adventure` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `get_replayadventures` VARCHAR(45) NOT NULL,
  `id_game` INT NOT NULL,
  `creation _date` DATETIME NOT NULL,
  `date_modification` DATETIME NOT NULL,
  `user_modification` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_adventure`, `id_game`),
  INDEX `fk_ADVENTURE_1_idx` (`id_game` ASC) VISIBLE,
  CONSTRAINT `fk_ADVENTURE_1`
    FOREIGN KEY (`id_game`)
    REFERENCES `mydb`.`GAME` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ADVENTURE_has_CHARACTER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ADVENTURE_has_CHARACTER` (
  `ADVENTURE_id_adventure` INT NOT NULL,
  `ADVENTURE_id_game` INT NOT NULL,
  `ADVENTURE_id_step_aventure` INT NOT NULL,
  `CHARACTER_id_adventure` INT NOT NULL,
  `CHARACTER_id_character` INT NOT NULL,
  PRIMARY KEY (`ADVENTURE_id_adventure`, `ADVENTURE_id_game`, `ADVENTURE_id_step_aventure`, `CHARACTER_id_adventure`, `CHARACTER_id_character`),
  INDEX `fk_ADVENTURE_has_CHARACTER_CHARACTER1_idx` (`CHARACTER_id_adventure` ASC, `CHARACTER_id_character` ASC) VISIBLE,
  INDEX `fk_ADVENTURE_has_CHARACTER_ADVENTURE1_idx` (`ADVENTURE_id_adventure` ASC, `ADVENTURE_id_game` ASC, `ADVENTURE_id_step_aventure` ASC) VISIBLE,
  CONSTRAINT `fk_ADVENTURE_has_CHARACTER_ADVENTURE1`
    FOREIGN KEY (`ADVENTURE_id_adventure` , `ADVENTURE_id_game`)
    REFERENCES `mydb`.`ADVENTURE` (`id_adventure` , `id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ADVENTURE_has_CHARACTER_CHARACTER1`
    FOREIGN KEY (`CHARACTER_id_adventure` , `CHARACTER_id_character`)
    REFERENCES `mydb`.`CHARACTER` (`id_adventure` , `id_character`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ADVENTURE_has_STEP_AVENTURE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ADVENTURE_has_STEP_AVENTURE` (
  `ADVENTURE_id_adventure` INT NOT NULL,
  `ADVENTURE_id_game` INT NOT NULL,
  `ADVENTURE_id_step_aventure` INT NOT NULL,
  `STEP_AVENTURE_id_step_aventure` INT NOT NULL,
  `STEP_AVENTURE_id_adventure` INT NOT NULL,
  PRIMARY KEY (`ADVENTURE_id_adventure`, `ADVENTURE_id_game`, `ADVENTURE_id_step_aventure`, `STEP_AVENTURE_id_step_aventure`, `STEP_AVENTURE_id_adventure`),
  INDEX `fk_ADVENTURE_has_STEP_AVENTURE_STEP_AVENTURE1_idx` (`STEP_AVENTURE_id_step_aventure` ASC, `STEP_AVENTURE_id_adventure` ASC) VISIBLE,
  INDEX `fk_ADVENTURE_has_STEP_AVENTURE_ADVENTURE1_idx` (`ADVENTURE_id_adventure` ASC, `ADVENTURE_id_game` ASC, `ADVENTURE_id_step_aventure` ASC) VISIBLE,
  CONSTRAINT `fk_ADVENTURE_has_STEP_AVENTURE_ADVENTURE1`
    FOREIGN KEY (`ADVENTURE_id_adventure` , `ADVENTURE_id_game`)
    REFERENCES `mydb`.`ADVENTURE` (`id_adventure` , `id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ADVENTURE_has_STEP_AVENTURE_STEP_AVENTURE1`
    FOREIGN KEY (`STEP_AVENTURE_id_step_aventure` , `STEP_AVENTURE_id_adventure`)
    REFERENCES `mydb`.`STEP_AVENTURE` (`id_step_aventure` , `id_adventure`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HISTORY_has_ADVENTURE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HISTORY_has_ADVENTURE` (
  `HISTORY_id_history` INT NOT NULL,
  `HISTORY_id_adventure` INT NOT NULL,
  `ADVENTURE_id_adventure` INT NOT NULL,
  `ADVENTURE_id_game` INT NOT NULL,
  PRIMARY KEY (`HISTORY_id_history`, `HISTORY_id_adventure`, `ADVENTURE_id_adventure`, `ADVENTURE_id_game`),
  INDEX `fk_HISTORY_has_ADVENTURE_ADVENTURE1_idx` (`ADVENTURE_id_adventure` ASC, `ADVENTURE_id_game` ASC) VISIBLE,
  INDEX `fk_HISTORY_has_ADVENTURE_HISTORY1_idx` (`HISTORY_id_history` ASC, `HISTORY_id_adventure` ASC) VISIBLE,
  CONSTRAINT `fk_HISTORY_has_ADVENTURE_HISTORY1`
    FOREIGN KEY (`HISTORY_id_history` , `HISTORY_id_adventure`)
    REFERENCES `mydb`.`HISTORY` (`id_history` , `id_adventure`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HISTORY_has_ADVENTURE_ADVENTURE1`
    FOREIGN KEY (`ADVENTURE_id_adventure` , `ADVENTURE_id_game`)
    REFERENCES `mydb`.`ADVENTURE` (`id_adventure` , `id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

