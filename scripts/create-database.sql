-- MySQL Script generated by MySQL Workbench
-- So 29 Nov 2020 12:26:29 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema whowolf
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema whowolf
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `whowolf` ;
USE `whowolf` ;

-- -----------------------------------------------------
-- Table `whowolf`.`lobby`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `whowolf`.`lobby` (
  `id` VARCHAR(5) NOT NULL,
  `host_id` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `time_left` INT NULL,
  `amount_werwolf_players` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_lobby_user_id_idx` (`host_id` ASC) VISIBLE,
  CONSTRAINT `fk_lobby_user_id`
    FOREIGN KEY (`host_id`)
    REFERENCES `whowolf`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `whowolf`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `whowolf`.`user` (
  `id` VARCHAR(45) NOT NULL,
  `lobby_id` VARCHAR(5) NULL,
  `target_player_id` VARCHAR(45) NULL,
  `alias` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `heal_left` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_lobby_id_idx` (`lobby_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_user_user_id_idx` (`target_player_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_lobby_id`
    FOREIGN KEY (`lobby_id`)
    REFERENCES `whowolf`.`lobby` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_id`
    FOREIGN KEY (`target_player_id`)
    REFERENCES `whowolf`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `whowolf`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `whowolf`.`game` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lobby_id` VARCHAR(5) NULL,
  `werwolf_target` VARCHAR(45) NULL,
  `witch_target` VARCHAR(45) NULL,
  `round` INT NULL,
  `phase` INT NULL,
  `time_left` INT NULL,
  `amount_werwolf_players` INT NULL,
  `amount_witch_players` INT NULL,
  `team_won` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_game_lobby_id_idx` (`lobby_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_game_user_id_idx` (`werwolf_target` ASC) VISIBLE,
  INDEX `fk_game_user_id_idx1` (`witch_target` ASC) VISIBLE,
  CONSTRAINT `fk_game_lobby_id`
    FOREIGN KEY (`lobby_id`)
    REFERENCES `whowolf`.`lobby` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_user_id_werwolf`
    FOREIGN KEY (`werwolf_target`)
    REFERENCES `whowolf`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_user_id_witch`
    FOREIGN KEY (`witch_target`)
    REFERENCES `whowolf`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
