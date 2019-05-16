-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema citysproutsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `citysproutsdb` ;

-- -----------------------------------------------------
-- Schema citysproutsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `citysproutsdb` DEFAULT CHARACTER SET utf8 ;
USE `citysproutsdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` TIMESTAMP NULL,
  `role` ENUM('SELLER', 'BUYER', 'DRIVER') NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `lsat_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buyer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buyer` ;

CREATE TABLE IF NOT EXISTS `buyer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `credit_card_num` VARCHAR(16) NULL,
  `credit_card_exp_date` DATE NULL,
  `credit_card_ccv` VARCHAR(3) NULL,
  `user_id` INT NOT NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_buyer_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_buyer_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NULL,
  `address_2` VARCHAR(60) NULL,
  `city` VARCHAR(50) NULL,
  `state` VARCHAR(50) NULL,
  `zip_code` VARCHAR(5) NULL,
  `buyer_id` INT NOT NULL,
  PRIMARY KEY (`id`, `buyer_id`),
  INDEX `fk_address_buyer1_idx` (`buyer_id` ASC),
  CONSTRAINT `fk_address_buyer1`
    FOREIGN KEY (`buyer_id`)
    REFERENCES `buyer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL,
  `price` DECIMAL(6,2) NULL,
  `best_buy` DATE NULL,
  `picked` DATE NULL,
  `category_id` INT NOT NULL,
  `last_updated` VARCHAR(45) NULL DEFAULT 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_item_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `driver` ;

CREATE TABLE IF NOT EXISTS `driver` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `bank_routing` VARCHAR(15) NOT NULL,
  `bank_name` VARCHAR(50) NOT NULL,
  `bank_acct_num` VARCHAR(20) NOT NULL,
  `user_id` INT NOT NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_driver_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_driver_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seller`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `seller` ;

CREATE TABLE IF NOT EXISTS `seller` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bank_routing` VARCHAR(15) NOT NULL,
  `bank_name` VARCHAR(45) NOT NULL,
  `bank_acct_num` VARCHAR(20) NOT NULL,
  `user_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seller_user1_idx` (`user_id` ASC),
  INDEX `fk_seller_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_seller_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seller_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory` ;

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_id` INT NOT NULL,
  `seller_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inventory_item1_idx` (`item_id` ASC),
  INDEX `fk_inventory_seller1_idx` (`seller_id` ASC),
  CONSTRAINT `fk_inventory_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_seller1`
    FOREIGN KEY (`seller_id`)
    REFERENCES `seller` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase_status` ;

CREATE TABLE IF NOT EXISTS `purchase_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delivery_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `delivery_details` ;

CREATE TABLE IF NOT EXISTS `delivery_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_time_delivered` DATETIME NULL,
  `date_time_pickedup` DATETIME NULL,
  `date_time_sched_begin` DATETIME NOT NULL,
  `date_time_sched_end` DATETIME NULL,
  `driver_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_delivery_details_driver1_idx` (`driver_id` ASC),
  CONSTRAINT `fk_delivery_details_driver1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `driver` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase` ;

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `buyer_id` INT NOT NULL,
  `purchase_status_id` INT NOT NULL,
  `delivery_details_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchase_buyer1_idx` (`buyer_id` ASC),
  INDEX `fk_purchase_purchase_status1_idx` (`purchase_status_id` ASC),
  INDEX `fk_purchase_delivery_details1_idx` (`delivery_details_id` ASC),
  CONSTRAINT `fk_purchase_buyer1`
    FOREIGN KEY (`buyer_id`)
    REFERENCES `buyer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_purchase_status1`
    FOREIGN KEY (`purchase_status_id`)
    REFERENCES `purchase_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_delivery_details1`
    FOREIGN KEY (`delivery_details_id`)
    REFERENCES `delivery_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payment` ;

CREATE TABLE IF NOT EXISTS `payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `purchase_id` INT NOT NULL,
  `amount` DECIMAL(6,2) NOT NULL,
  `payment_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_to_purchase_idx` (`purchase_id` ASC),
  CONSTRAINT `fk_payment_to_purchase`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `purchase` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase_item` ;

CREATE TABLE IF NOT EXISTS `purchase_item` (
  `id` INT NOT NULL,
  `purchase_id` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  PRIMARY KEY (`id`, `purchase_id`, `inventory_id`),
  INDEX `fk_purchase_item_purchase1_idx` (`purchase_id` ASC),
  INDEX `fk_purchase_item_inventory1_idx` (`inventory_id` ASC),
  CONSTRAINT `fk_purchase_item_purchase1`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `purchase` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_item_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS citysproutsuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'citysproutsuser'@'localhost' IDENTIFIED BY 'citysproutsuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'citysproutsuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
