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
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NULL,
  `create_time` TIMESTAMP NULL,
  `last_login` TIMESTAMP NULL,
  `role` ENUM('SELLER', 'BUYER', 'DRIVER') NULL,
  `first_name` VARCHAR(50) NULL,
  `last_name` VARCHAR(50) NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `buyer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `buyer` ;

CREATE TABLE IF NOT EXISTS `buyer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `credit_card_num` VARCHAR(16) NULL,
  `credit_card_exp_date` DATE NULL,
  `credit_card_ccv` VARCHAR(3) NULL,
  `active` TINYINT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_buyer_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_buyer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
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
-- Table `commodity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commodity` ;

CREATE TABLE IF NOT EXISTS `commodity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unit` ;

CREATE TABLE IF NOT EXISTS `unit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `variety`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `variety` ;

CREATE TABLE IF NOT EXISTS `variety` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seller`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `seller` ;

CREATE TABLE IF NOT EXISTS `seller` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bank_routing` VARCHAR(15) NULL,
  `bank_name` VARCHAR(45) NULL,
  `bank_acct_num` VARCHAR(20) NULL,
  `active` TINYINT NULL,
  `user_id` INT NULL,
  `store_name` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seller_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_seller_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `description` VARCHAR(100) NULL,
  `price` DECIMAL(6,2) NULL,
  `best_by` DATE NULL,
  `picked` DATE NULL,
  `last_updated` TIMESTAMP NULL,
  `active` TINYINT NULL,
  `category_id` INT NULL,
  `commodity_id` INT NULL,
  `unit_id` INT NULL,
  `variety_id` INT NULL,
  `img_url` VARCHAR(1000) NULL,
  `seller_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_category1_idx` (`category_id` ASC),
  INDEX `fk_item_commodity1_idx` (`commodity_id` ASC),
  INDEX `fk_item_unit1_idx` (`unit_id` ASC),
  INDEX `fk_item_variety1_idx` (`variety_id` ASC),
  INDEX `fk_item_seller1_idx` (`seller_id` ASC),
  CONSTRAINT `fk_item_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_commodity1`
    FOREIGN KEY (`commodity_id`)
    REFERENCES `commodity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_unit1`
    FOREIGN KEY (`unit_id`)
    REFERENCES `unit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_variety1`
    FOREIGN KEY (`variety_id`)
    REFERENCES `variety` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_seller1`
    FOREIGN KEY (`seller_id`)
    REFERENCES `seller` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `driver` ;

CREATE TABLE IF NOT EXISTS `driver` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bank_routing` VARCHAR(15) NULL,
  `bank_name` VARCHAR(50) NULL,
  `bank_acct_num` VARCHAR(20) NULL,
  `active` TINYINT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_driver_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_driver_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase_status` ;

CREATE TABLE IF NOT EXISTS `purchase_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NULL,
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
  `date_time_sched_begin` DATETIME NULL,
  `date_time_sched_end` DATETIME NULL,
  `driver_id` INT NULL,
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
  `buyer_id` INT NULL,
  `purchase_status_id` INT NULL,
  `delivery_details_id` INT NULL,
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
-- Table `inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory` ;

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_id` INT NULL,
  `seller_id` INT NULL,
  `purchase_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inventory_item1_idx` (`item_id` ASC),
  INDEX `fk_inventory_seller1_idx` (`seller_id` ASC),
  INDEX `fk_inventory_purchase1_idx` (`purchase_id` ASC),
  CONSTRAINT `fk_inventory_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_seller1`
    FOREIGN KEY (`seller_id`)
    REFERENCES `seller` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_purchase1`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `purchase` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payment` ;

CREATE TABLE IF NOT EXISTS `payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `purchase_id` INT NULL,
  `amount` DECIMAL(6,2) NULL,
  `payment_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_to_purchase_idx` (`purchase_id` ASC),
  CONSTRAINT `fk_payment_to_purchase`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `purchase` (`id`)
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

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (1, '6195 S Ivanhoe St', '', 'Centennial', 'CO', '80111');
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (2, '14348 E Villanova Pl', '', 'Aurora', 'CO', '80014');
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (3, '13120 E Kentucky Ave', '', 'Aurora', 'CO', '80012');
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (4, '2798 Glencoe St', '', 'Denver', 'CO', '80207');
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (5, '3398 Adams St', '', 'Denver', 'CO', '80205');
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (6, '3134 W 20th Ave', '', 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (7, '2318 Julian St', '', 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (8, '1935 Julian Way', '', 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (9, '3548 W 42nd Ave', '', 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `address`, `address_2`, `city`, `state`, `zip_code`) VALUES (10, '4553 Irving St', '', 'Denver', 'CO', '80211');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_time`, `last_login`, `role`, `first_name`, `last_name`, `address_id`) VALUES (1, 'farmerjohn', 'famerjohn@email.com', 'pwd', '2019-05-17 12:00:00', '2019-05-17 12:00:00', 'SELLER', 'John', 'Farmer', 1);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_time`, `last_login`, `role`, `first_name`, `last_name`, `address_id`) VALUES (2, 'urbanjane', 'urbanjane@email.com', 'pwd', '2019-05-17 12:00:00', '2019-05-17 12:00:00', 'SELLER', 'Jane', 'Urban', 2);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_time`, `last_login`, `role`, `first_name`, `last_name`, `address_id`) VALUES (3, 'carriecooks', 'carriecooks@email.com', 'pwd', '2019-05-17 12:00:00', '2019-05-17 12:00:00', 'BUYER', 'Carrie', 'Cooks', 5);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_time`, `last_login`, `role`, `first_name`, `last_name`, `address_id`) VALUES (4, 'cheframsey', 'cheframsey@email.com', 'pwd', '2019-05-17 12:00:00', '2019-05-17 12:00:00', 'BUYER', 'Chef', 'Ramsey', 6);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_time`, `last_login`, `role`, `first_name`, `last_name`, `address_id`) VALUES (5, 'dandriver', 'dandriver@email.com', 'pwd', '2019-05-17 12:00:00', '2019-05-17 12:00:00', 'DRIVER', 'Dan', 'Driver', 3);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_time`, `last_login`, `role`, `first_name`, `last_name`, `address_id`) VALUES (6, 'denverdelivers', 'denverdelivers@email.com', 'pwd', '2019-05-17 12:00:00', '2019-05-17 12:00:00', 'DRIVER', 'Denver', 'Delivers', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `buyer`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `buyer` (`id`, `credit_card_num`, `credit_card_exp_date`, `credit_card_ccv`, `active`, `user_id`) VALUES (1, '1234765434560987', '2022-11-30', '123', 1, 5);
INSERT INTO `buyer` (`id`, `credit_card_num`, `credit_card_exp_date`, `credit_card_ccv`, `active`, `user_id`) VALUES (2, '5434876534560987', '2023-03-31', '456', 1, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'Dried Fruits');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'Fruits');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'Herbs');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'Nuts');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'Vegetables');

COMMIT;


-- -----------------------------------------------------
-- Data for table `commodity`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `commodity` (`id`, `name`) VALUES (1, 'ALFALFA SPROUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (2, 'ALMONDS');
INSERT INTO `commodity` (`id`, `name`) VALUES (3, 'ALOE VERA LEAVES');
INSERT INTO `commodity` (`id`, `name`) VALUES (4, 'Amaranth/Callaloo/Een Choy');
INSERT INTO `commodity` (`id`, `name`) VALUES (5, 'ANISE');
INSERT INTO `commodity` (`id`, `name`) VALUES (6, 'APPLE SLICES');
INSERT INTO `commodity` (`id`, `name`) VALUES (7, 'APPLES');
INSERT INTO `commodity` (`id`, `name`) VALUES (8, 'APRICOTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (9, 'ARRACACH');
INSERT INTO `commodity` (`id`, `name`) VALUES (10, 'ARTICHOKES');
INSERT INTO `commodity` (`id`, `name`) VALUES (11, 'ARUGULA/ROCKET');
INSERT INTO `commodity` (`id`, `name`) VALUES (12, 'ASPARAGUS');
INSERT INTO `commodity` (`id`, `name`) VALUES (13, 'ATEMOYAS');
INSERT INTO `commodity` (`id`, `name`) VALUES (14, 'AVOCADOS');
INSERT INTO `commodity` (`id`, `name`) VALUES (15, 'BABACO');
INSERT INTO `commodity` (`id`, `name`) VALUES (16, 'BANANAS');
INSERT INTO `commodity` (`id`, `name`) VALUES (17, 'BASIL');
INSERT INTO `commodity` (`id`, `name`) VALUES (18, 'BAY LEAVES');
INSERT INTO `commodity` (`id`, `name`) VALUES (19, 'BEAN SPROUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (20, 'BEANS');
INSERT INTO `commodity` (`id`, `name`) VALUES (21, 'BEET GREENS');
INSERT INTO `commodity` (`id`, `name`) VALUES (22, 'BEETS');
INSERT INTO `commodity` (`id`, `name`) VALUES (23, 'BELGIAN ENDIVE (WITLOOF CHICORY)');
INSERT INTO `commodity` (`id`, `name`) VALUES (24, 'BERRIES');
INSERT INTO `commodity` (`id`, `name`) VALUES (25, 'BITTER MELON/BITTER GOURD, Foo Qua');
INSERT INTO `commodity` (`id`, `name`) VALUES (26, 'BOK CHOY (PAK CHOI)');
INSERT INTO `commodity` (`id`, `name`) VALUES (27, 'BONIATO');
INSERT INTO `commodity` (`id`, `name`) VALUES (28, 'BORAGE');
INSERT INTO `commodity` (`id`, `name`) VALUES (29, 'BRAZILNUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (30, 'BREADFRUIT');
INSERT INTO `commodity` (`id`, `name`) VALUES (31, 'BROCCOLI');
INSERT INTO `commodity` (`id`, `name`) VALUES (32, 'BRUSSELS SPROUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (33, 'CABBAGE');
INSERT INTO `commodity` (`id`, `name`) VALUES (34, 'CACTUS LEAVES (Nopales/Cactus Pads)');
INSERT INTO `commodity` (`id`, `name`) VALUES (35, 'CACTUS PEAR (PRICKLY PEAR)');
INSERT INTO `commodity` (`id`, `name`) VALUES (36, 'CARAMBOLA (STARFRUIT)');
INSERT INTO `commodity` (`id`, `name`) VALUES (37, 'CARDOON (CARDONI)');
INSERT INTO `commodity` (`id`, `name`) VALUES (38, 'CARROTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (39, 'CASHEWS');
INSERT INTO `commodity` (`id`, `name`) VALUES (40, 'CAULIFLOWER');
INSERT INTO `commodity` (`id`, `name`) VALUES (41, 'CELERY');
INSERT INTO `commodity` (`id`, `name`) VALUES (42, 'CELERY ROOT/CELERIAC');
INSERT INTO `commodity` (`id`, `name`) VALUES (43, 'CHARD (SWISS CHARD)/SILVERBEET');
INSERT INTO `commodity` (`id`, `name`) VALUES (44, 'CHERIMOYA');
INSERT INTO `commodity` (`id`, `name`) VALUES (45, 'CHERRIES');
INSERT INTO `commodity` (`id`, `name`) VALUES (46, 'CHERVIL');
INSERT INTO `commodity` (`id`, `name`) VALUES (47, 'CHESTNUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (48, 'CHICKPEAS');
INSERT INTO `commodity` (`id`, `name`) VALUES (49, 'CHIPILIN LEAF');
INSERT INTO `commodity` (`id`, `name`) VALUES (50, 'CHIVES');
INSERT INTO `commodity` (`id`, `name`) VALUES (51, 'CHOY SUM/PAK CHOI SUM');
INSERT INTO `commodity` (`id`, `name`) VALUES (52, 'CILANTRO (CHINESE PARSLEY/CORIANDER)');
INSERT INTO `commodity` (`id`, `name`) VALUES (53, 'COCONUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (54, 'CORN');
INSERT INTO `commodity` (`id`, `name`) VALUES (55, 'CUCUMBER');
INSERT INTO `commodity` (`id`, `name`) VALUES (56, 'CURRANTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (57, 'DAIKON');
INSERT INTO `commodity` (`id`, `name`) VALUES (58, 'DATES');
INSERT INTO `commodity` (`id`, `name`) VALUES (59, 'DILL');
INSERT INTO `commodity` (`id`, `name`) VALUES (60, 'EGGPLANT (AUBERGINE)');
INSERT INTO `commodity` (`id`, `name`) VALUES (61, 'ENDIVE/CHICORY');
INSERT INTO `commodity` (`id`, `name`) VALUES (62, 'EPAZOTE');
INSERT INTO `commodity` (`id`, `name`) VALUES (63, 'ESCAROLE/BATAVIAN CHICORY');
INSERT INTO `commodity` (`id`, `name`) VALUES (64, 'FEIJOA');
INSERT INTO `commodity` (`id`, `name`) VALUES (65, 'FENNEL');
INSERT INTO `commodity` (`id`, `name`) VALUES (66, 'FENNEL LEAVES');
INSERT INTO `commodity` (`id`, `name`) VALUES (67, 'FIDDLEHEAD FERNS');
INSERT INTO `commodity` (`id`, `name`) VALUES (68, 'FIGS');
INSERT INTO `commodity` (`id`, `name`) VALUES (69, 'FILBERTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (70, 'FOR USE WITH ALL COMMODITIES');
INSERT INTO `commodity` (`id`, `name`) VALUES (71, 'FRISEE');
INSERT INTO `commodity` (`id`, `name`) VALUES (72, 'GAI (GUI) CHOY (CHINESE or INDIAN MUSTARD)');
INSERT INTO `commodity` (`id`, `name`) VALUES (73, 'GAI LAN');
INSERT INTO `commodity` (`id`, `name`) VALUES (74, 'GALANGAL ROOT');
INSERT INTO `commodity` (`id`, `name`) VALUES (75, 'GARLIC');
INSERT INTO `commodity` (`id`, `name`) VALUES (76, 'GINGER ROOT');
INSERT INTO `commodity` (`id`, `name`) VALUES (77, 'GOBO ROOT/BURDOCK');
INSERT INTO `commodity` (`id`, `name`) VALUES (78, 'GOURD');
INSERT INTO `commodity` (`id`, `name`) VALUES (79, 'GRAPEFRUIT');
INSERT INTO `commodity` (`id`, `name`) VALUES (80, 'GRAPES');
INSERT INTO `commodity` (`id`, `name`) VALUES (81, 'GREENS');
INSERT INTO `commodity` (`id`, `name`) VALUES (82, 'GUAVA');
INSERT INTO `commodity` (`id`, `name`) VALUES (83, 'HOMLI FRUIT');
INSERT INTO `commodity` (`id`, `name`) VALUES (84, 'HORSERADISH ROOT');
INSERT INTO `commodity` (`id`, `name`) VALUES (85, 'JACKFRUIT');
INSERT INTO `commodity` (`id`, `name`) VALUES (86, 'JICAMA/YAM BEAN');
INSERT INTO `commodity` (`id`, `name`) VALUES (87, 'KALE');
INSERT INTO `commodity` (`id`, `name`) VALUES (88, 'KALE SPROUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (89, 'KIWANO (HORNED MELON)');
INSERT INTO `commodity` (`id`, `name`) VALUES (90, 'KIWIFRUIT');
INSERT INTO `commodity` (`id`, `name`) VALUES (91, 'KOHLRABI');
INSERT INTO `commodity` (`id`, `name`) VALUES (92, 'KUMQUAT');
INSERT INTO `commodity` (`id`, `name`) VALUES (93, 'LEEKS');
INSERT INTO `commodity` (`id`, `name`) VALUES (94, 'LEMONGRASS');
INSERT INTO `commodity` (`id`, `name`) VALUES (95, 'LEMONS');
INSERT INTO `commodity` (`id`, `name`) VALUES (96, 'LETTUCE');
INSERT INTO `commodity` (`id`, `name`) VALUES (97, 'LIMEQUATS');
INSERT INTO `commodity` (`id`, `name`) VALUES (98, 'LIMES');
INSERT INTO `commodity` (`id`, `name`) VALUES (99, 'LONGAN');
INSERT INTO `commodity` (`id`, `name`) VALUES (100, 'LOQUATS');
INSERT INTO `commodity` (`id`, `name`) VALUES (101, 'LOTUS ROOT');
INSERT INTO `commodity` (`id`, `name`) VALUES (102, 'LYCHEES');
INSERT INTO `commodity` (`id`, `name`) VALUES (103, 'MACADAMIA');
INSERT INTO `commodity` (`id`, `name`) VALUES (104, 'MADROÑA');
INSERT INTO `commodity` (`id`, `name`) VALUES (105, 'MALANGA');
INSERT INTO `commodity` (`id`, `name`) VALUES (106, 'MAMEY');
INSERT INTO `commodity` (`id`, `name`) VALUES (107, 'MANGO');
INSERT INTO `commodity` (`id`, `name`) VALUES (108, 'MANGOSTEEN');
INSERT INTO `commodity` (`id`, `name`) VALUES (109, 'MARJORAM');
INSERT INTO `commodity` (`id`, `name`) VALUES (110, 'MELON');
INSERT INTO `commodity` (`id`, `name`) VALUES (111, 'MINT');
INSERT INTO `commodity` (`id`, `name`) VALUES (112, 'MIXED NUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (113, 'MUSHROOMS');
INSERT INTO `commodity` (`id`, `name`) VALUES (114, 'NAME');
INSERT INTO `commodity` (`id`, `name`) VALUES (115, 'NECTARINE');
INSERT INTO `commodity` (`id`, `name`) VALUES (116, 'OKRA');
INSERT INTO `commodity` (`id`, `name`) VALUES (117, 'ONG CHOY');
INSERT INTO `commodity` (`id`, `name`) VALUES (118, 'ONIONS');
INSERT INTO `commodity` (`id`, `name`) VALUES (119, 'ORANGE TREE LEAF');
INSERT INTO `commodity` (`id`, `name`) VALUES (120, 'ORANGES');
INSERT INTO `commodity` (`id`, `name`) VALUES (121, 'OREGANO');
INSERT INTO `commodity` (`id`, `name`) VALUES (122, 'OTHER DRIED FRUITS');
INSERT INTO `commodity` (`id`, `name`) VALUES (123, 'OTHER FRUITS');
INSERT INTO `commodity` (`id`, `name`) VALUES (124, 'OTHER HERBS');
INSERT INTO `commodity` (`id`, `name`) VALUES (125, 'OTHER NUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (126, 'OTHER VEGETABLES');
INSERT INTO `commodity` (`id`, `name`) VALUES (127, 'OYSTER PLANT/SALSIFY');
INSERT INTO `commodity` (`id`, `name`) VALUES (128, 'PAPALO');
INSERT INTO `commodity` (`id`, `name`) VALUES (129, 'PAPAYA/PAWPAW');
INSERT INTO `commodity` (`id`, `name`) VALUES (130, 'PARSLEY');
INSERT INTO `commodity` (`id`, `name`) VALUES (131, 'PARSLEY ROOT(HAMBURG PARSLEY)');
INSERT INTO `commodity` (`id`, `name`) VALUES (132, 'PARSNIP');
INSERT INTO `commodity` (`id`, `name`) VALUES (133, 'PASSION FRUIT');
INSERT INTO `commodity` (`id`, `name`) VALUES (134, 'PEACHES');
INSERT INTO `commodity` (`id`, `name`) VALUES (135, 'PEANUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (136, 'PEARS');
INSERT INTO `commodity` (`id`, `name`) VALUES (137, 'PEAS');
INSERT INTO `commodity` (`id`, `name`) VALUES (138, 'PECANS');
INSERT INTO `commodity` (`id`, `name`) VALUES (139, 'PEPPERS (CAPSICUMS)');
INSERT INTO `commodity` (`id`, `name`) VALUES (140, 'PERSIMMON');
INSERT INTO `commodity` (`id`, `name`) VALUES (141, 'PHYSALIS/CAPE GOOSEBERRY/GROUND CHERRY');
INSERT INTO `commodity` (`id`, `name`) VALUES (142, 'PINE NUTS (PIGNOLI)');
INSERT INTO `commodity` (`id`, `name`) VALUES (143, 'PINEAPPLE');
INSERT INTO `commodity` (`id`, `name`) VALUES (144, 'PISTACHIO');
INSERT INTO `commodity` (`id`, `name`) VALUES (145, 'PITAHAYA');
INSERT INTO `commodity` (`id`, `name`) VALUES (146, 'PLUMCOT (INTERSPECIFIC PLUM)');
INSERT INTO `commodity` (`id`, `name`) VALUES (147, 'PLUMS');
INSERT INTO `commodity` (`id`, `name`) VALUES (148, 'POMEGRANATE');
INSERT INTO `commodity` (`id`, `name`) VALUES (149, 'POTATO');
INSERT INTO `commodity` (`id`, `name`) VALUES (150, 'PRUNES');
INSERT INTO `commodity` (`id`, `name`) VALUES (151, 'PUMPKIN');
INSERT INTO `commodity` (`id`, `name`) VALUES (152, 'PUMPKIN VINE');
INSERT INTO `commodity` (`id`, `name`) VALUES (153, 'PURPLE HERB');
INSERT INTO `commodity` (`id`, `name`) VALUES (154, 'QUELITES');
INSERT INTO `commodity` (`id`, `name`) VALUES (155, 'QUINCE');
INSERT INTO `commodity` (`id`, `name`) VALUES (156, 'RABBIT HERB');
INSERT INTO `commodity` (`id`, `name`) VALUES (157, 'RADICCHIO');
INSERT INTO `commodity` (`id`, `name`) VALUES (158, 'RADISH');
INSERT INTO `commodity` (`id`, `name`) VALUES (159, 'RAISINS');
INSERT INTO `commodity` (`id`, `name`) VALUES (160, 'RAMBUTAN');
INSERT INTO `commodity` (`id`, `name`) VALUES (161, 'RHUBARB');
INSERT INTO `commodity` (`id`, `name`) VALUES (162, 'ROSEMARY');
INSERT INTO `commodity` (`id`, `name`) VALUES (163, 'RUTABAGAS (SWEDE)');
INSERT INTO `commodity` (`id`, `name`) VALUES (164, 'SACRED PEPPER');
INSERT INTO `commodity` (`id`, `name`) VALUES (165, 'SAGE');
INSERT INTO `commodity` (`id`, `name`) VALUES (166, 'SALAD BAR');
INSERT INTO `commodity` (`id`, `name`) VALUES (167, 'SAPODILLO/NISPERO');
INSERT INTO `commodity` (`id`, `name`) VALUES (168, 'SAPOTE');
INSERT INTO `commodity` (`id`, `name`) VALUES (169, 'SAVORY');
INSERT INTO `commodity` (`id`, `name`) VALUES (170, 'SORREL');
INSERT INTO `commodity` (`id`, `name`) VALUES (171, 'SOURSOP');
INSERT INTO `commodity` (`id`, `name`) VALUES (172, 'SPINACH');
INSERT INTO `commodity` (`id`, `name`) VALUES (173, 'SQUASH');
INSERT INTO `commodity` (`id`, `name`) VALUES (174, 'SUGAR APPLE');
INSERT INTO `commodity` (`id`, `name`) VALUES (175, 'SUGAR CANE');
INSERT INTO `commodity` (`id`, `name`) VALUES (176, 'SUNCHOKES (JERUSALEM ARTICHOKES)');
INSERT INTO `commodity` (`id`, `name`) VALUES (177, 'SUNFLOWER SEEDS');
INSERT INTO `commodity` (`id`, `name`) VALUES (178, 'SWEET POTATO/YAM/KUMARA');
INSERT INTO `commodity` (`id`, `name`) VALUES (179, 'TAMARILLO');
INSERT INTO `commodity` (`id`, `name`) VALUES (180, 'TAMARINDO');
INSERT INTO `commodity` (`id`, `name`) VALUES (181, 'TANGELO');
INSERT INTO `commodity` (`id`, `name`) VALUES (182, 'TANGERINES/MANDARINS');
INSERT INTO `commodity` (`id`, `name`) VALUES (183, 'TARO ROOT (DASHEEN)');
INSERT INTO `commodity` (`id`, `name`) VALUES (184, 'TARRAGON');
INSERT INTO `commodity` (`id`, `name`) VALUES (185, 'THYME');
INSERT INTO `commodity` (`id`, `name`) VALUES (186, 'TOMATOES');
INSERT INTO `commodity` (`id`, `name`) VALUES (187, 'TURNIP');
INSERT INTO `commodity` (`id`, `name`) VALUES (188, 'VANILLA BEAN');
INSERT INTO `commodity` (`id`, `name`) VALUES (189, 'WALNUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (190, 'WATER CHESTNUTS');
INSERT INTO `commodity` (`id`, `name`) VALUES (191, 'WATERCRESS');
INSERT INTO `commodity` (`id`, `name`) VALUES (192, 'XPELON');
INSERT INTO `commodity` (`id`, `name`) VALUES (193, 'YU CHOY');
INSERT INTO `commodity` (`id`, `name`) VALUES (194, 'YUCA ROOT/CASSAVA/MANIOC');

COMMIT;


-- -----------------------------------------------------
-- Data for table `unit`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `unit` (`id`, `name`) VALUES (1, 'each');
INSERT INTO `unit` (`id`, `name`) VALUES (2, 'lb');
INSERT INTO `unit` (`id`, `name`) VALUES (4, 'bushel');
INSERT INTO `unit` (`id`, `name`) VALUES (5, 'pint');
INSERT INTO `unit` (`id`, `name`) VALUES (6, 'quart');

COMMIT;


-- -----------------------------------------------------
-- Data for table `variety`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `variety` (`id`, `name`) VALUES (1, '(Dried Fruit)');
INSERT INTO `variety` (`id`, `name`) VALUES (2, '(See also RADISH)');
INSERT INTO `variety` (`id`, `name`) VALUES (3, '(Sweet) Dumpling');
INSERT INTO `variety` (`id`, `name`) VALUES (4, 'Abate Fetel');
INSERT INTO `variety` (`id`, `name`) VALUES (5, 'Acorn');
INSERT INTO `variety` (`id`, `name`) VALUES (6, 'Acorn/Table Queen');
INSERT INTO `variety` (`id`, `name`) VALUES (7, 'Akane');
INSERT INTO `variety` (`id`, `name`) VALUES (8, 'Alexander Lucas');
INSERT INTO `variety` (`id`, `name`) VALUES (9, 'Alkmene');
INSERT INTO `variety` (`id`, `name`) VALUES (10, 'Ambrosia');
INSERT INTO `variety` (`id`, `name`) VALUES (11, 'Anaheim (Green and Red)');
INSERT INTO `variety` (`id`, `name`) VALUES (12, 'Angelys');
INSERT INTO `variety` (`id`, `name`) VALUES (13, 'Anjou');
INSERT INTO `variety` (`id`, `name`) VALUES (14, 'Antares');
INSERT INTO `variety` (`id`, `name`) VALUES (15, 'Apple/Manzano');
INSERT INTO `variety` (`id`, `name`) VALUES (16, 'Armenian');
INSERT INTO `variety` (`id`, `name`) VALUES (17, 'ARRA FIFTEEN');
INSERT INTO `variety` (`id`, `name`) VALUES (18, 'ARRA THIRTY');
INSERT INTO `variety` (`id`, `name`) VALUES (19, 'ARRA THIRTYTWO');
INSERT INTO `variety` (`id`, `name`) VALUES (20, 'ARRA TWENTYEIGHT');
INSERT INTO `variety` (`id`, `name`) VALUES (21, 'ARRA TWENTYNINE');
INSERT INTO `variety` (`id`, `name`) VALUES (22, 'ARRA TWENTYSEVEN');
INSERT INTO `variety` (`id`, `name`) VALUES (23, 'Asian/Nashi');
INSERT INTO `variety` (`id`, `name`) VALUES (24, 'Aurora/Southern Rose');
INSERT INTO `variety` (`id`, `name`) VALUES (25, 'Australian Blue');
INSERT INTO `variety` (`id`, `name`) VALUES (26, 'B-74');
INSERT INTO `variety` (`id`, `name`) VALUES (27, 'Baby');
INSERT INTO `variety` (`id`, `name`) VALUES (28, 'Baby Golden');
INSERT INTO `variety` (`id`, `name`) VALUES (29, 'Baby Green Zucchini/Courgette');
INSERT INTO `variety` (`id`, `name`) VALUES (30, 'Baby Red');
INSERT INTO `variety` (`id`, `name`) VALUES (31, 'Baby Scallopini');
INSERT INTO `variety` (`id`, `name`) VALUES (32, 'Baby Summer (Green)');
INSERT INTO `variety` (`id`, `name`) VALUES (33, 'Baby White');
INSERT INTO `variety` (`id`, `name`) VALUES (34, 'Baby/Cocktail');
INSERT INTO `variety` (`id`, `name`) VALUES (35, 'baby/Nino');
INSERT INTO `variety` (`id`, `name`) VALUES (36, 'Baking');
INSERT INTO `variety` (`id`, `name`) VALUES (37, 'Baldwin');
INSERT INTO `variety` (`id`, `name`) VALUES (38, 'Banana');
INSERT INTO `variety` (`id`, `name`) VALUES (39, 'Banana (Yellow Long)');
INSERT INTO `variety` (`id`, `name`) VALUES (40, 'Bartlett');
INSERT INTO `variety` (`id`, `name`) VALUES (41, 'Bartlett/Williams/WBC');
INSERT INTO `variety` (`id`, `name`) VALUES (42, 'Beef/Beefsteak');
INSERT INTO `variety` (`id`, `name`) VALUES (43, 'Belchard');
INSERT INTO `variety` (`id`, `name`) VALUES (44, 'Belgica');
INSERT INTO `variety` (`id`, `name`) VALUES (45, 'Bell, Field Grown');
INSERT INTO `variety` (`id`, `name`) VALUES (46, 'Bell, Greenhouse');
INSERT INTO `variety` (`id`, `name`) VALUES (47, 'Belle du Jumet');
INSERT INTO `variety` (`id`, `name`) VALUES (48, 'Bertanne/Golden Russet');
INSERT INTO `variety` (`id`, `name`) VALUES (49, 'Beurre Hardy');
INSERT INTO `variety` (`id`, `name`) VALUES (50, 'Bibb/Flat/Round');
INSERT INTO `variety` (`id`, `name`) VALUES (51, 'Black');
INSERT INTO `variety` (`id`, `name`) VALUES (52, 'Black Forest');
INSERT INTO `variety` (`id`, `name`) VALUES (53, 'Blackberries');
INSERT INTO `variety` (`id`, `name`) VALUES (54, 'Blackeyed');
INSERT INTO `variety` (`id`, `name`) VALUES (55, 'Blood');
INSERT INTO `variety` (`id`, `name`) VALUES (56, 'Blue/Black Seeded');
INSERT INTO `variety` (`id`, `name`) VALUES (57, 'Blue/Black Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (58, 'Blueberries');
INSERT INTO `variety` (`id`, `name`) VALUES (59, 'Boiling');
INSERT INTO `variety` (`id`, `name`) VALUES (60, 'Bon Rouge');
INSERT INTO `variety` (`id`, `name`) VALUES (61, 'Bosc/Beurre Bosc');
INSERT INTO `variety` (`id`, `name`) VALUES (62, 'Boskoop/Belle de Boskoop');
INSERT INTO `variety` (`id`, `name`) VALUES (63, 'Boston');
INSERT INTO `variety` (`id`, `name`) VALUES (64, 'Boston/Butter');
INSERT INTO `variety` (`id`, `name`) VALUES (65, 'Bowen & Kensington Pride');
INSERT INTO `variety` (`id`, `name`) VALUES (66, 'Boysenberries');
INSERT INTO `variety` (`id`, `name`) VALUES (67, 'Braeburn');
INSERT INTO `variety` (`id`, `name`) VALUES (68, 'Broccoli Rabe (Italian Rapini)/ Chinese Broccoli (GAI LAN)');
INSERT INTO `variety` (`id`, `name`) VALUES (69, 'Brown');
INSERT INTO `variety` (`id`, `name`) VALUES (70, 'Bulb');
INSERT INTO `variety` (`id`, `name`) VALUES (71, 'Bunch');
INSERT INTO `variety` (`id`, `name`) VALUES (72, 'Bunch/Banded');
INSERT INTO `variety` (`id`, `name`) VALUES (73, 'Bunched Red');
INSERT INTO `variety` (`id`, `name`) VALUES (74, 'Bunched White');
INSERT INTO `variety` (`id`, `name`) VALUES (75, 'Burro');
INSERT INTO `variety` (`id`, `name`) VALUES (76, 'Buttercup');
INSERT INTO `variety` (`id`, `name`) VALUES (77, 'Butterkin');
INSERT INTO `variety` (`id`, `name`) VALUES (78, 'Butternut');
INSERT INTO `variety` (`id`, `name`) VALUES (79, 'Calabaza');
INSERT INTO `variety` (`id`, `name`) VALUES (80, 'California Sweet');
INSERT INTO `variety` (`id`, `name`) VALUES (81, 'Cameo');
INSERT INTO `variety` (`id`, `name`) VALUES (82, 'Canary/Yellow Honeydew');
INSERT INTO `variety` (`id`, `name`) VALUES (83, 'Cantaloupe/Muskmelon');
INSERT INTO `variety` (`id`, `name`) VALUES (84, 'Cantaloupe/Rockmelon');
INSERT INTO `variety` (`id`, `name`) VALUES (85, 'Cantared');
INSERT INTO `variety` (`id`, `name`) VALUES (86, 'Cape Rose');
INSERT INTO `variety` (`id`, `name`) VALUES (87, 'Carmen');
INSERT INTO `variety` (`id`, `name`) VALUES (88, 'Carnival');
INSERT INTO `variety` (`id`, `name`) VALUES (89, 'Carrot Sticks');
INSERT INTO `variety` (`id`, `name`) VALUES (90, 'Casaba');
INSERT INTO `variety` (`id`, `name`) VALUES (91, 'Castlefranco');
INSERT INTO `variety` (`id`, `name`) VALUES (92, 'Catalogna');
INSERT INTO `variety` (`id`, `name`) VALUES (93, 'Celery Sticks');
INSERT INTO `variety` (`id`, `name`) VALUES (94, 'Celina');
INSERT INTO `variety` (`id`, `name`) VALUES (95, 'Cep');
INSERT INTO `variety` (`id`, `name`) VALUES (96, 'Cepuna');
INSERT INTO `variety` (`id`, `name`) VALUES (97, 'Champagne');
INSERT INTO `variety` (`id`, `name`) VALUES (98, 'Chanterelle');
INSERT INTO `variety` (`id`, `name`) VALUES (99, 'Charentais');
INSERT INTO `variety` (`id`, `name`) VALUES (100, 'Charles Ross');
INSERT INTO `variety` (`id`, `name`) VALUES (101, 'Chasselas');
INSERT INTO `variety` (`id`, `name`) VALUES (102, 'Chayote/Choko');
INSERT INTO `variety` (`id`, `name`) VALUES (103, 'Cherry');
INSERT INTO `variety` (`id`, `name`) VALUES (104, 'Chickpeas/Garbanzo');
INSERT INTO `variety` (`id`, `name`) VALUES (105, 'Chili');
INSERT INTO `variety` (`id`, `name`) VALUES (106, 'Chinese');
INSERT INTO `variety` (`id`, `name`) VALUES (107, 'Chinese Long/Snake');
INSERT INTO `variety` (`id`, `name`) VALUES (108, 'Chinese Snow Pea/Pea Pod/Mange Tout');
INSERT INTO `variety` (`id`, `name`) VALUES (109, 'Chinese Yali');
INSERT INTO `variety` (`id`, `name`) VALUES (110, 'Chinese/Napa/Wong Bok');
INSERT INTO `variety` (`id`, `name`) VALUES (111, 'Cinnabar');
INSERT INTO `variety` (`id`, `name`) VALUES (112, 'CIVG198');
INSERT INTO `variety` (`id`, `name`) VALUES (113, 'Civni');
INSERT INTO `variety` (`id`, `name`) VALUES (114, 'Clara Friis');
INSERT INTO `variety` (`id`, `name`) VALUES (115, 'Clementine');
INSERT INTO `variety` (`id`, `name`) VALUES (116, 'Clementine (includes Fortune)');
INSERT INTO `variety` (`id`, `name`) VALUES (117, 'CN121');
INSERT INTO `variety` (`id`, `name`) VALUES (118, 'Cobnut/Hazelnut');
INSERT INTO `variety` (`id`, `name`) VALUES (119, 'Cocktail/Intermediate');
INSERT INTO `variety` (`id`, `name`) VALUES (120, 'Cocktail/Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (121, 'Collard');
INSERT INTO `variety` (`id`, `name`) VALUES (122, 'Comice/ Doyenne du Comice');
INSERT INTO `variety` (`id`, `name`) VALUES (123, 'Concord');
INSERT INTO `variety` (`id`, `name`) VALUES (124, 'Concorde');
INSERT INTO `variety` (`id`, `name`) VALUES (125, 'Conference');
INSERT INTO `variety` (`id`, `name`) VALUES (126, 'Cooking/Mexican');
INSERT INTO `variety` (`id`, `name`) VALUES (127, 'Co-op 43');
INSERT INTO `variety` (`id`, `name`) VALUES (128, 'Cortland');
INSERT INTO `variety` (`id`, `name`) VALUES (129, 'Cox Orange Pippin');
INSERT INTO `variety` (`id`, `name`) VALUES (130, 'Crab');
INSERT INTO `variety` (`id`, `name`) VALUES (131, 'Cranberries');
INSERT INTO `variety` (`id`, `name`) VALUES (132, 'Creamer');
INSERT INTO `variety` (`id`, `name`) VALUES (133, 'Cremini/Brown/Swiss Brown');
INSERT INTO `variety` (`id`, `name`) VALUES (134, 'Crenshaw');
INSERT INTO `variety` (`id`, `name`) VALUES (135, 'Crimson/Majestic');
INSERT INTO `variety` (`id`, `name`) VALUES (136, 'Cripps Pink');
INSERT INTO `variety` (`id`, `name`) VALUES (137, 'Cripps Red');
INSERT INTO `variety` (`id`, `name`) VALUES (138, 'Crispin/Mutsu');
INSERT INTO `variety` (`id`, `name`) VALUES (139, 'Criterion');
INSERT INTO `variety` (`id`, `name`) VALUES (140, 'Crown Prince');
INSERT INTO `variety` (`id`, `name`) VALUES (141, 'Crowns');
INSERT INTO `variety` (`id`, `name`) VALUES (142, 'Cubanelle');
INSERT INTO `variety` (`id`, `name`) VALUES (143, 'Cucuzza');
INSERT INTO `variety` (`id`, `name`) VALUES (144, 'Curuba/Banana');
INSERT INTO `variety` (`id`, `name`) VALUES (145, 'DALINETTE');
INSERT INTO `variety` (`id`, `name`) VALUES (146, 'Dancy');
INSERT INTO `variety` (`id`, `name`) VALUES (147, 'Dandelion');
INSERT INTO `variety` (`id`, `name`) VALUES (148, 'de Vigne & Sanguine (Red Flesh)');
INSERT INTO `variety` (`id`, `name`) VALUES (149, 'Decorative (Painted)');
INSERT INTO `variety` (`id`, `name`) VALUES (150, 'Deep Red');
INSERT INTO `variety` (`id`, `name`) VALUES (151, 'Dekopon');
INSERT INTO `variety` (`id`, `name`) VALUES (152, 'Delblush');
INSERT INTO `variety` (`id`, `name`) VALUES (153, 'Delicata/Sweet Potato');
INSERT INTO `variety` (`id`, `name`) VALUES (154, 'Delta Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (155, 'Dessert');
INSERT INTO `variety` (`id`, `name`) VALUES (156, 'D\'Estivale');
INSERT INTO `variety` (`id`, `name`) VALUES (157, 'Discovery');
INSERT INTO `variety` (`id`, `name`) VALUES (158, 'Dominique');
INSERT INTO `variety` (`id`, `name`) VALUES (159, 'Dried');
INSERT INTO `variety` (`id`, `name`) VALUES (160, 'DS 22');
INSERT INTO `variety` (`id`, `name`) VALUES (161, 'DS 3');
INSERT INTO `variety` (`id`, `name`) VALUES (162, 'Durondeau');
INSERT INTO `variety` (`id`, `name`) VALUES (163, 'Dutch White/Winter White');
INSERT INTO `variety` (`id`, `name`) VALUES (164, 'Early');
INSERT INTO `variety` (`id`, `name`) VALUES (165, 'Elephant');
INSERT INTO `variety` (`id`, `name`) VALUES (166, 'Ellendale');
INSERT INTO `variety` (`id`, `name`) VALUES (167, 'Elongated');
INSERT INTO `variety` (`id`, `name`) VALUES (168, 'Elstar');
INSERT INTO `variety` (`id`, `name`) VALUES (169, 'Emmons');
INSERT INTO `variety` (`id`, `name`) VALUES (170, 'Empire');
INSERT INTO `variety` (`id`, `name`) VALUES (171, 'English/Hot House/Long Seedless/Telegraph/Continental');
INSERT INTO `variety` (`id`, `name`) VALUES (172, 'Enoki');
INSERT INTO `variety` (`id`, `name`) VALUES (173, 'Fairchild');
INSERT INTO `variety` (`id`, `name`) VALUES (174, 'Fairy Ring Champignon');
INSERT INTO `variety` (`id`, `name`) VALUES (175, 'Fall Glo');
INSERT INTO `variety` (`id`, `name`) VALUES (176, 'Fantasy/Marroo');
INSERT INTO `variety` (`id`, `name`) VALUES (177, 'Fava/Broad');
INSERT INTO `variety` (`id`, `name`) VALUES (178, 'Fiesta');
INSERT INTO `variety` (`id`, `name`) VALUES (179, 'Fine');
INSERT INTO `variety` (`id`, `name`) VALUES (180, 'Fireside');
INSERT INTO `variety` (`id`, `name`) VALUES (181, 'Flamingo');
INSERT INTO `variety` (`id`, `name`) VALUES (182, 'Flat White Flesh (Saturn type)');
INSERT INTO `variety` (`id`, `name`) VALUES (183, 'Flat Yellow');
INSERT INTO `variety` (`id`, `name`) VALUES (184, 'Flat Yellow Flesh');
INSERT INTO `variety` (`id`, `name`) VALUES (185, 'Florence/Sweet Fennel/Fennel Bulb');
INSERT INTO `variety` (`id`, `name`) VALUES (186, 'Florettes');
INSERT INTO `variety` (`id`, `name`) VALUES (187, 'Foo Qua');
INSERT INTO `variety` (`id`, `name`) VALUES (188, 'Forelle/Corella');
INSERT INTO `variety` (`id`, `name`) VALUES (189, 'Fragrant');
INSERT INTO `variety` (`id`, `name`) VALUES (190, 'Francis');
INSERT INTO `variety` (`id`, `name`) VALUES (191, 'French');
INSERT INTO `variety` (`id`, `name`) VALUES (192, 'French Afternoon');
INSERT INTO `variety` (`id`, `name`) VALUES (193, 'French Breakfast');
INSERT INTO `variety` (`id`, `name`) VALUES (194, 'Fresh');
INSERT INTO `variety` (`id`, `name`) VALUES (195, 'Fuji');
INSERT INTO `variety` (`id`, `name`) VALUES (196, 'Fuji Brak');
INSERT INTO `variety` (`id`, `name`) VALUES (197, 'Gala');
INSERT INTO `variety` (`id`, `name`) VALUES (198, 'Galia');
INSERT INTO `variety` (`id`, `name`) VALUES (199, 'Garlic/Chinese');
INSERT INTO `variety` (`id`, `name`) VALUES (200, 'GEM');
INSERT INTO `variety` (`id`, `name`) VALUES (201, 'General Leclerc');
INSERT INTO `variety` (`id`, `name`) VALUES (202, 'Ginger Gold');
INSERT INTO `variety` (`id`, `name`) VALUES (203, 'Glasshouse - Netted varieties');
INSERT INTO `variety` (`id`, `name`) VALUES (204, 'Gloster');
INSERT INTO `variety` (`id`, `name`) VALUES (205, 'Gold Honeydew');
INSERT INTO `variety` (`id`, `name`) VALUES (206, 'Golden');
INSERT INTO `variety` (`id`, `name`) VALUES (207, 'Golden Delicious');
INSERT INTO `variety` (`id`, `name`) VALUES (208, 'Golden Delicious Blush');
INSERT INTO `variety` (`id`, `name`) VALUES (209, 'Golden Nugget');
INSERT INTO `variety` (`id`, `name`) VALUES (210, 'Golden/Rainier/White');
INSERT INTO `variety` (`id`, `name`) VALUES (211, 'Golden/Yellow');
INSERT INTO `variety` (`id`, `name`) VALUES (212, 'Gooseberries');
INSERT INTO `variety` (`id`, `name`) VALUES (213, 'Granadilla');
INSERT INTO `variety` (`id`, `name`) VALUES (214, 'Granny Smith');
INSERT INTO `variety` (`id`, `name`) VALUES (215, 'Gravenstein');
INSERT INTO `variety` (`id`, `name`) VALUES (216, 'Green');
INSERT INTO `variety` (`id`, `name`) VALUES (217, 'Green (Scallions)/Spring');
INSERT INTO `variety` (`id`, `name`) VALUES (218, 'Green Dragon');
INSERT INTO `variety` (`id`, `name`) VALUES (219, 'Green Leaf');
INSERT INTO `variety` (`id`, `name`) VALUES (220, 'Green/French');
INSERT INTO `variety` (`id`, `name`) VALUES (221, 'Green/Ridge/Short');
INSERT INTO `variety` (`id`, `name`) VALUES (222, 'Greenhouse/Hydroponic/Regular');
INSERT INTO `variety` (`id`, `name`) VALUES (223, 'Greening (RI)');
INSERT INTO `variety` (`id`, `name`) VALUES (224, 'Grey');
INSERT INTO `variety` (`id`, `name`) VALUES (225, 'Grisette');
INSERT INTO `variety` (`id`, `name`) VALUES (226, 'Guyot');
INSERT INTO `variety` (`id`, `name`) VALUES (227, 'Habanero');
INSERT INTO `variety` (`id`, `name`) VALUES (228, 'Hami');
INSERT INTO `variety` (`id`, `name`) VALUES (229, 'Haralson');
INSERT INTO `variety` (`id`, `name`) VALUES (230, 'HAROVIN SUNDOWN PEAR');
INSERT INTO `variety` (`id`, `name`) VALUES (231, 'Hass');
INSERT INTO `variety` (`id`, `name`) VALUES (232, 'Hawaiian plantain');
INSERT INTO `variety` (`id`, `name`) VALUES (233, 'Hearts');
INSERT INTO `variety` (`id`, `name`) VALUES (234, 'Heirloom');
INSERT INTO `variety` (`id`, `name`) VALUES (235, 'Helda/Flat');
INSERT INTO `variety` (`id`, `name`) VALUES (236, 'Holstein');
INSERT INTO `variety` (`id`, `name`) VALUES (237, 'Honey Green');
INSERT INTO `variety` (`id`, `name`) VALUES (238, 'Honey/Murcott');
INSERT INTO `variety` (`id`, `name`) VALUES (239, 'Honeycrisp');
INSERT INTO `variety` (`id`, `name`) VALUES (240, 'Honeydew/White Honeydew');
INSERT INTO `variety` (`id`, `name`) VALUES (241, 'Horn of Plenty/Black Trumpet');
INSERT INTO `variety` (`id`, `name`) VALUES (242, 'Hot (Hungarian Hot)');
INSERT INTO `variety` (`id`, `name`) VALUES (243, 'Hot Mixed');
INSERT INTO `variety` (`id`, `name`) VALUES (244, 'Huaguan');
INSERT INTO `variety` (`id`, `name`) VALUES (245, 'Hubbard');
INSERT INTO `variety` (`id`, `name`) VALUES (246, 'Hungarian Wax');
INSERT INTO `variety` (`id`, `name`) VALUES (247, 'Husked');
INSERT INTO `variety` (`id`, `name`) VALUES (248, 'Hydroponic');
INSERT INTO `variety` (`id`, `name`) VALUES (249, 'Iceberg');
INSERT INTO `variety` (`id`, `name`) VALUES (250, 'Idared');
INSERT INTO `variety` (`id`, `name`) VALUES (251, 'IFG Core Black Seedless ');
INSERT INTO `variety` (`id`, `name`) VALUES (252, 'IFG Core Green Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (253, 'IFG Core Red Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (254, 'IFG Novelty Black Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (255, 'IFG Novelty Green Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (256, 'IFG Novelty Red Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (257, 'Imperial');
INSERT INTO `variety` (`id`, `name`) VALUES (258, 'In Husk/Waternut');
INSERT INTO `variety` (`id`, `name`) VALUES (259, 'Indian');
INSERT INTO `variety` (`id`, `name`) VALUES (260, 'Ingrid Marie');
INSERT INTO `variety` (`id`, `name`) VALUES (261, 'InterSpecific');
INSERT INTO `variety` (`id`, `name`) VALUES (262, 'Italia');
INSERT INTO `variety` (`id`, `name`) VALUES (263, 'Italian Prune/Sugar');
INSERT INTO `variety` (`id`, `name`) VALUES (264, 'Italian Red');
INSERT INTO `variety` (`id`, `name`) VALUES (265, 'Italian/Continental/French');
INSERT INTO `variety` (`id`, `name`) VALUES (266, 'Jalapeno');
INSERT INTO `variety` (`id`, `name`) VALUES (267, 'Jamaican');
INSERT INTO `variety` (`id`, `name`) VALUES (268, 'Jamaican Tangor');
INSERT INTO `variety` (`id`, `name`) VALUES (269, 'Japanese');
INSERT INTO `variety` (`id`, `name`) VALUES (270, 'Japanese/Sharonfruit (Kaki)');
INSERT INTO `variety` (`id`, `name`) VALUES (271, 'Japanese/White');
INSERT INTO `variety` (`id`, `name`) VALUES (272, 'Jet Fresh');
INSERT INTO `variety` (`id`, `name`) VALUES (273, 'Jonagold');
INSERT INTO `variety` (`id`, `name`) VALUES (274, 'Jonamac');
INSERT INTO `variety` (`id`, `name`) VALUES (275, 'Jonathan');
INSERT INTO `variety` (`id`, `name`) VALUES (276, 'Josephine');
INSERT INTO `variety` (`id`, `name`) VALUES (277, 'Juice');
INSERT INTO `variety` (`id`, `name`) VALUES (278, 'Jumbo');
INSERT INTO `variety` (`id`, `name`) VALUES (279, 'Kabocha');
INSERT INTO `variety` (`id`, `name`) VALUES (280, 'Key (incl. Mexican & West Indian)');
INSERT INTO `variety` (`id`, `name`) VALUES (281, 'King Royal');
INSERT INTO `variety` (`id`, `name`) VALUES (282, 'Kinnow');
INSERT INTO `variety` (`id`, `name`) VALUES (283, 'Korean');
INSERT INTO `variety` (`id`, `name`) VALUES (284, 'Lady');
INSERT INTO `variety` (`id`, `name`) VALUES (285, 'Lady Williams');
INSERT INTO `variety` (`id`, `name`) VALUES (286, 'Laxtons Fortune');
INSERT INTO `variety` (`id`, `name`) VALUES (287, 'Leaves');
INSERT INTO `variety` (`id`, `name`) VALUES (288, 'Lemon');
INSERT INTO `variety` (`id`, `name`) VALUES (289, 'Liberty');
INSERT INTO `variety` (`id`, `name`) VALUES (290, 'Lima');
INSERT INTO `variety` (`id`, `name`) VALUES (291, 'Lochbuie');
INSERT INTO `variety` (`id`, `name`) VALUES (292, 'Loganberries');
INSERT INTO `variety` (`id`, `name`) VALUES (293, 'Lollo Bionda/Coral');
INSERT INTO `variety` (`id`, `name`) VALUES (294, 'Lollo Rossa/Coral');
INSERT INTO `variety` (`id`, `name`) VALUES (295, 'Long');
INSERT INTO `variety` (`id`, `name`) VALUES (296, 'Long Hot');
INSERT INTO `variety` (`id`, `name`) VALUES (297, 'Long-stemmed Strawberries');
INSERT INTO `variety` (`id`, `name`) VALUES (298, 'Loose');
INSERT INTO `variety` (`id`, `name`) VALUES (299, 'Lord Lambourne');
INSERT INTO `variety` (`id`, `name`) VALUES (300, 'Louise Bonne');
INSERT INTO `variety` (`id`, `name`) VALUES (301, 'Mache');
INSERT INTO `variety` (`id`, `name`) VALUES (302, 'Macoun');
INSERT INTO `variety` (`id`, `name`) VALUES (303, 'MAIA 1');
INSERT INTO `variety` (`id`, `name`) VALUES (304, 'Maltaise');
INSERT INTO `variety` (`id`, `name`) VALUES (305, 'Mandarin/Royal');
INSERT INTO `variety` (`id`, `name`) VALUES (306, 'Mariri Red');
INSERT INTO `variety` (`id`, `name`) VALUES (307, 'Maui');
INSERT INTO `variety` (`id`, `name`) VALUES (308, 'Mayan');
INSERT INTO `variety` (`id`, `name`) VALUES (309, 'McIntosh');
INSERT INTO `variety` (`id`, `name`) VALUES (310, 'Medjool');
INSERT INTO `variety` (`id`, `name`) VALUES (311, 'Melogold');
INSERT INTO `variety` (`id`, `name`) VALUES (312, 'Melrose');
INSERT INTO `variety` (`id`, `name`) VALUES (313, 'Meridol');
INSERT INTO `variety` (`id`, `name`) VALUES (314, 'Meyer');
INSERT INTO `variety` (`id`, `name`) VALUES (315, 'Michaelmas Red');
INSERT INTO `variety` (`id`, `name`) VALUES (316, 'Mickey Lee Watermelon/Sugarbaby');
INSERT INTO `variety` (`id`, `name`) VALUES (317, 'Midknight');
INSERT INTO `variety` (`id`, `name`) VALUES (318, 'Mignonette (Compact red-tinged butterhead varieties)');
INSERT INTO `variety` (`id`, `name`) VALUES (319, 'Milwa');
INSERT INTO `variety` (`id`, `name`) VALUES (320, 'Mini');
INSERT INTO `variety` (`id`, `name`) VALUES (321, 'Minneiska');
INSERT INTO `variety` (`id`, `name`) VALUES (322, 'Minneola');
INSERT INTO `variety` (`id`, `name`) VALUES (323, 'Minnewashta');
INSERT INTO `variety` (`id`, `name`) VALUES (324, 'Mixed small-leaf salad (eg Sucrine, Mesclun, Rocket/Arugula)');
INSERT INTO `variety` (`id`, `name`) VALUES (325, 'MN 55');
INSERT INTO `variety` (`id`, `name`) VALUES (326, 'Morel');
INSERT INTO `variety` (`id`, `name`) VALUES (327, 'Morita Chili');
INSERT INTO `variety` (`id`, `name`) VALUES (328, 'Multicolor');
INSERT INTO `variety` (`id`, `name`) VALUES (329, 'Mung Bean Sprouts');
INSERT INTO `variety` (`id`, `name`) VALUES (330, 'Muscat de Hambourg');
INSERT INTO `variety` (`id`, `name`) VALUES (331, 'Muskmelon');
INSERT INTO `variety` (`id`, `name`) VALUES (332, 'Mustard');
INSERT INTO `variety` (`id`, `name`) VALUES (333, 'Native/Home Grown');
INSERT INTO `variety` (`id`, `name`) VALUES (334, 'Natural');
INSERT INTO `variety` (`id`, `name`) VALUES (335, 'Navel');
INSERT INTO `variety` (`id`, `name`) VALUES (336, 'Navelate (and other late Navel varieties)');
INSERT INTO `variety` (`id`, `name`) VALUES (337, 'Navelina (incl. Newhall)');
INSERT INTO `variety` (`id`, `name`) VALUES (338, 'Nectavigne (Red Flesh)');
INSERT INTO `variety` (`id`, `name`) VALUES (339, 'Negro');
INSERT INTO `variety` (`id`, `name`) VALUES (340, 'New Mexico');
INSERT INTO `variety` (`id`, `name`) VALUES (341, 'New York 1');
INSERT INTO `variety` (`id`, `name`) VALUES (342, 'New York 2');
INSERT INTO `variety` (`id`, `name`) VALUES (343, 'New Zealand Spinach');
INSERT INTO `variety` (`id`, `name`) VALUES (344, 'Nicogreen');
INSERT INTO `variety` (`id`, `name`) VALUES (345, 'Nicoter');
INSERT INTO `variety` (`id`, `name`) VALUES (346, 'Northern Spy');
INSERT INTO `variety` (`id`, `name`) VALUES (347, 'Nova');
INSERT INTO `variety` (`id`, `name`) VALUES (348, 'Oak Leaf');
INSERT INTO `variety` (`id`, `name`) VALUES (349, 'Ogen');
INSERT INTO `variety` (`id`, `name`) VALUES (350, 'One-clove types');
INSERT INTO `variety` (`id`, `name`) VALUES (351, 'Opal');
INSERT INTO `variety` (`id`, `name`) VALUES (352, 'Opo');
INSERT INTO `variety` (`id`, `name`) VALUES (353, 'Orange');
INSERT INTO `variety` (`id`, `name`) VALUES (354, 'Orange Flesh/Cantaline');
INSERT INTO `variety` (`id`, `name`) VALUES (355, 'Ornamental');
INSERT INTO `variety` (`id`, `name`) VALUES (356, 'OroBlanco/Sweetie');
INSERT INTO `variety` (`id`, `name`) VALUES (357, 'Other Sweet');
INSERT INTO `variety` (`id`, `name`) VALUES (358, 'Oyster');
INSERT INTO `variety` (`id`, `name`) VALUES (359, 'Packham/Packhams Triumph');
INSERT INTO `variety` (`id`, `name`) VALUES (360, 'Pasilla');
INSERT INTO `variety` (`id`, `name`) VALUES (361, 'Pasilla Pod');
INSERT INTO `variety` (`id`, `name`) VALUES (362, 'Passe Crassane');
INSERT INTO `variety` (`id`, `name`) VALUES (363, 'Patty Pan/Summer');
INSERT INTO `variety` (`id`, `name`) VALUES (364, 'Paulared');
INSERT INTO `variety` (`id`, `name`) VALUES (365, 'Pearl');
INSERT INTO `variety` (`id`, `name`) VALUES (366, 'Pepino');
INSERT INTO `variety` (`id`, `name`) VALUES (367, 'Peppermint');
INSERT INTO `variety` (`id`, `name`) VALUES (368, 'Pera');
INSERT INTO `variety` (`id`, `name`) VALUES (369, 'Perola');
INSERT INTO `variety` (`id`, `name`) VALUES (370, 'Persian');
INSERT INTO `variety` (`id`, `name`) VALUES (371, 'Pickling');
INSERT INTO `variety` (`id`, `name`) VALUES (372, 'Pickling, White');
INSERT INTO `variety` (`id`, `name`) VALUES (373, 'Pickling/Gherkin');
INSERT INTO `variety` (`id`, `name`) VALUES (374, 'Pie Pumpkin');
INSERT INTO `variety` (`id`, `name`) VALUES (375, 'Piel de Sapo');
INSERT INTO `variety` (`id`, `name`) VALUES (376, 'Pink');
INSERT INTO `variety` (`id`, `name`) VALUES (377, 'Pinkerton');
INSERT INTO `variety` (`id`, `name`) VALUES (378, 'Pinole');
INSERT INTO `variety` (`id`, `name`) VALUES (379, 'Pinova');
INSERT INTO `variety` (`id`, `name`) VALUES (380, 'Pioppino');
INSERT INTO `variety` (`id`, `name`) VALUES (381, 'Pippin');
INSERT INTO `variety` (`id`, `name`) VALUES (382, 'Pitted');
INSERT INTO `variety` (`id`, `name`) VALUES (383, 'Plantain/Macho');
INSERT INTO `variety` (`id`, `name`) VALUES (384, 'Plum/Italian/Saladette/Roma');
INSERT INTO `variety` (`id`, `name`) VALUES (385, 'Plum/Italian/Saladette/Roma on the vine');
INSERT INTO `variety` (`id`, `name`) VALUES (386, 'Plumac');
INSERT INTO `variety` (`id`, `name`) VALUES (387, 'Poblano');
INSERT INTO `variety` (`id`, `name`) VALUES (388, 'Pole/Runner/Stick');
INSERT INTO `variety` (`id`, `name`) VALUES (389, 'Polk Greens');
INSERT INTO `variety` (`id`, `name`) VALUES (390, 'Portabella');
INSERT INTO `variety` (`id`, `name`) VALUES (391, 'PremA17');
INSERT INTO `variety` (`id`, `name`) VALUES (392, 'PremA280');
INSERT INTO `variety` (`id`, `name`) VALUES (393, 'President');
INSERT INTO `variety` (`id`, `name`) VALUES (394, 'Prince');
INSERT INTO `variety` (`id`, `name`) VALUES (395, 'Pummelo');
INSERT INTO `variety` (`id`, `name`) VALUES (396, 'Purple');
INSERT INTO `variety` (`id`, `name`) VALUES (397, 'Purple Hull');
INSERT INTO `variety` (`id`, `name`) VALUES (398, 'Purple Top');
INSERT INTO `variety` (`id`, `name`) VALUES (399, 'Purple/Red');
INSERT INTO `variety` (`id`, `name`) VALUES (400, 'Purple/Red/All Other Colors');
INSERT INTO `variety` (`id`, `name`) VALUES (401, 'Queen');
INSERT INTO `variety` (`id`, `name`) VALUES (402, 'R2E2 (ArtwoEetwo)');
INSERT INTO `variety` (`id`, `name`) VALUES (403, 'Raspberries');
INSERT INTO `variety` (`id`, `name`) VALUES (404, 'Raw');
INSERT INTO `variety` (`id`, `name`) VALUES (405, 'Red');
INSERT INTO `variety` (`id`, `name`) VALUES (406, 'Red (skin color)');
INSERT INTO `variety` (`id`, `name`) VALUES (407, 'Red Cheese');
INSERT INTO `variety` (`id`, `name`) VALUES (408, 'Red Delicious');
INSERT INTO `variety` (`id`, `name`) VALUES (409, 'Red Finger');
INSERT INTO `variety` (`id`, `name`) VALUES (410, 'Red Fresh');
INSERT INTO `variety` (`id`, `name`) VALUES (411, 'Red Globe');
INSERT INTO `variety` (`id`, `name`) VALUES (412, 'Red Jonaprince');
INSERT INTO `variety` (`id`, `name`) VALUES (413, 'Red Kuri');
INSERT INTO `variety` (`id`, `name`) VALUES (414, 'Red Leaf');
INSERT INTO `variety` (`id`, `name`) VALUES (415, 'Red Pimiento/ Red Sweet Long');
INSERT INTO `variety` (`id`, `name`) VALUES (416, 'Red Seeded');
INSERT INTO `variety` (`id`, `name`) VALUES (417, 'Red Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (418, 'Red/Orangy Red Flesh');
INSERT INTO `variety` (`id`, `name`) VALUES (419, 'Red/Orangy White Flesh');
INSERT INTO `variety` (`id`, `name`) VALUES (420, 'Redfield');
INSERT INTO `variety` (`id`, `name`) VALUES (421, 'Red-Fleshed (Solo Sunrise)');
INSERT INTO `variety` (`id`, `name`) VALUES (422, 'Regal 13-82');
INSERT INTO `variety` (`id`, `name`) VALUES (423, 'Regent');
INSERT INTO `variety` (`id`, `name`) VALUES (424, 'Regular');
INSERT INTO `variety` (`id`, `name`) VALUES (425, 'Regular (American Persimmon)');
INSERT INTO `variety` (`id`, `name`) VALUES (426, 'Regular (Green)');
INSERT INTO `variety` (`id`, `name`) VALUES (427, 'Regular (incl. Persian, Tahiti & Bearss)');
INSERT INTO `variety` (`id`, `name`) VALUES (428, 'Regular, Button');
INSERT INTO `variety` (`id`, `name`) VALUES (429, 'Regular/Bunched');
INSERT INTO `variety` (`id`, `name`) VALUES (430, 'Regular/Curly');
INSERT INTO `variety` (`id`, `name`) VALUES (431, 'Regular/Red/Black');
INSERT INTO `variety` (`id`, `name`) VALUES (432, 'Reine des Reinettes/King of the Pippins');
INSERT INTO `variety` (`id`, `name`) VALUES (433, 'Reinettes and Heritage varieties');
INSERT INTO `variety` (`id`, `name`) VALUES (434, 'Retailer Assigned');
INSERT INTO `variety` (`id`, `name`) VALUES (435, 'Retailer Assigned (includes pre-cut melons)');
INSERT INTO `variety` (`id`, `name`) VALUES (436, 'Ripe/Ready-to-Eat');
INSERT INTO `variety` (`id`, `name`) VALUES (437, 'Roasted');
INSERT INTO `variety` (`id`, `name`) VALUES (438, 'Rocha');
INSERT INTO `variety` (`id`, `name`) VALUES (439, 'RoHo 3615');
INSERT INTO `variety` (`id`, `name`) VALUES (440, 'Romaine');
INSERT INTO `variety` (`id`, `name`) VALUES (441, 'Romaine/Cos');
INSERT INTO `variety` (`id`, `name`) VALUES (442, 'Romanesco/Broccoflower/Caulibroc');
INSERT INTO `variety` (`id`, `name`) VALUES (443, 'Rome');
INSERT INTO `variety` (`id`, `name`) VALUES (444, 'Rosemarie');
INSERT INTO `variety` (`id`, `name`) VALUES (445, 'Rouge Salambo (Red)');
INSERT INTO `variety` (`id`, `name`) VALUES (446, 'Round');
INSERT INTO `variety` (`id`, `name`) VALUES (447, 'Royal Gala');
INSERT INTO `variety` (`id`, `name`) VALUES (448, 'Rubinette');
INSERT INTO `variety` (`id`, `name`) VALUES (449, 'Ruby/Red/Pink');
INSERT INTO `variety` (`id`, `name`) VALUES (450, 'Russet');
INSERT INTO `variety` (`id`, `name`) VALUES (451, 'Saffron');
INSERT INTO `variety` (`id`, `name`) VALUES (452, 'Saffron Milk-Cap');
INSERT INTO `variety` (`id`, `name`) VALUES (453, 'Salustiana');
INSERT INTO `variety` (`id`, `name`) VALUES (454, 'Santa Claus');
INSERT INTO `variety` (`id`, `name`) VALUES (455, 'Santa Maria');
INSERT INTO `variety` (`id`, `name`) VALUES (456, 'Saskatoon');
INSERT INTO `variety` (`id`, `name`) VALUES (457, 'Saticoy');
INSERT INTO `variety` (`id`, `name`) VALUES (458, 'Satsuma');
INSERT INTO `variety` (`id`, `name`) VALUES (459, 'Savoy, Green');
INSERT INTO `variety` (`id`, `name`) VALUES (460, 'Savoy, Red');
INSERT INTO `variety` (`id`, `name`) VALUES (461, 'Scallopini');
INSERT INTO `variety` (`id`, `name`) VALUES (462, 'Sciearly');
INSERT INTO `variety` (`id`, `name`) VALUES (463, 'Scifresh');
INSERT INTO `variety` (`id`, `name`) VALUES (464, 'Scilate');
INSERT INTO `variety` (`id`, `name`) VALUES (465, 'Scired');
INSERT INTO `variety` (`id`, `name`) VALUES (466, 'Sciros');
INSERT INTO `variety` (`id`, `name`) VALUES (467, 'Seckel');
INSERT INTO `variety` (`id`, `name`) VALUES (468, 'See also SWEET POTATO');
INSERT INTO `variety` (`id`, `name`) VALUES (469, 'Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (470, 'Serrano');
INSERT INTO `variety` (`id`, `name`) VALUES (471, 'Seville (Marmalade type)');
INSERT INTO `variety` (`id`, `name`) VALUES (472, 'Shallots');
INSERT INTO `variety` (`id`, `name`) VALUES (473, 'Shamouti');
INSERT INTO `variety` (`id`, `name`) VALUES (474, 'Shanghai');
INSERT INTO `variety` (`id`, `name`) VALUES (475, 'Sharlin');
INSERT INTO `variety` (`id`, `name`) VALUES (476, 'Sheep Polypore');
INSERT INTO `variety` (`id`, `name`) VALUES (477, 'Shell');
INSERT INTO `variety` (`id`, `name`) VALUES (478, 'Shiitake');
INSERT INTO `variety` (`id`, `name`) VALUES (479, 'Shiny Red');
INSERT INTO `variety` (`id`, `name`) VALUES (480, 'Small/Baby');
INSERT INTO `variety` (`id`, `name`) VALUES (481, 'Sommerfeld');
INSERT INTO `variety` (`id`, `name`) VALUES (482, 'Sonya');
INSERT INTO `variety` (`id`, `name`) VALUES (483, 'Southern Snap');
INSERT INTO `variety` (`id`, `name`) VALUES (484, 'Spaghetti/Vegetable Spaghetti');
INSERT INTO `variety` (`id`, `name`) VALUES (485, 'Spanish/Tendral');
INSERT INTO `variety` (`id`, `name`) VALUES (486, 'Spartan');
INSERT INTO `variety` (`id`, `name`) VALUES (487, 'Spring Cabbage/Spring Greens');
INSERT INTO `variety` (`id`, `name`) VALUES (488, 'Sprite');
INSERT INTO `variety` (`id`, `name`) VALUES (489, 'St Edmunds Pippin');
INSERT INTO `variety` (`id`, `name`) VALUES (490, 'Stalk');
INSERT INTO `variety` (`id`, `name`) VALUES (491, 'Starkrimson');
INSERT INTO `variety` (`id`, `name`) VALUES (492, 'Stayman');
INSERT INTO `variety` (`id`, `name`) VALUES (493, 'Strawberries');
INSERT INTO `variety` (`id`, `name`) VALUES (494, 'String');
INSERT INTO `variety` (`id`, `name`) VALUES (495, 'Stripy Bell');
INSERT INTO `variety` (`id`, `name`) VALUES (496, 'Sturmer Pippin');
INSERT INTO `variety` (`id`, `name`) VALUES (497, 'Sugar Snap');
INSERT INTO `variety` (`id`, `name`) VALUES (498, 'Sugranineteen');
INSERT INTO `variety` (`id`, `name`) VALUES (499, 'Sugraone/Autumn Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (500, 'Sugrasixteen');
INSERT INTO `variety` (`id`, `name`) VALUES (501, 'Sugrathirteen');
INSERT INTO `variety` (`id`, `name`) VALUES (502, 'Sugrathirtyfive');
INSERT INTO `variety` (`id`, `name`) VALUES (503, 'Sugrathirtyfour');
INSERT INTO `variety` (`id`, `name`) VALUES (504, 'Summer Cabbage');
INSERT INTO `variety` (`id`, `name`) VALUES (505, 'Sunburst');
INSERT INTO `variety` (`id`, `name`) VALUES (506, 'Sunburst (Yellow)');
INSERT INTO `variety` (`id`, `name`) VALUES (507, 'Sweet');
INSERT INTO `variety` (`id`, `name`) VALUES (508, 'Sweet Corn, Baby');
INSERT INTO `variety` (`id`, `name`) VALUES (509, 'Sweet Corn, Bi-Color');
INSERT INTO `variety` (`id`, `name`) VALUES (510, 'Sweet Corn, White');
INSERT INTO `variety` (`id`, `name`) VALUES (511, 'Sweet Corn, Yellow');
INSERT INTO `variety` (`id`, `name`) VALUES (512, 'Sweet Mama');
INSERT INTO `variety` (`id`, `name`) VALUES (513, 'Sweet red Italian');
INSERT INTO `variety` (`id`, `name`) VALUES (514, 'Sweet Scarlet');
INSERT INTO `variety` (`id`, `name`) VALUES (515, 'Sweet Sensation');
INSERT INTO `variety` (`id`, `name`) VALUES (516, 'Swiss Gourmet');
INSERT INTO `variety` (`id`, `name`) VALUES (517, 'Synonymous with Chinese Broccoli');
INSERT INTO `variety` (`id`, `name`) VALUES (518, 'Synonymous with Water Spinach');
INSERT INTO `variety` (`id`, `name`) VALUES (519, 'Tabasco');
INSERT INTO `variety` (`id`, `name`) VALUES (520, 'Taylors Gold');
INSERT INTO `variety` (`id`, `name`) VALUES (521, 'Teardrop/Pear');
INSERT INTO `variety` (`id`, `name`) VALUES (522, 'Tearless Sweet');
INSERT INTO `variety` (`id`, `name`) VALUES (523, 'Temple');
INSERT INTO `variety` (`id`, `name`) VALUES (524, 'Texas Mustard');
INSERT INTO `variety` (`id`, `name`) VALUES (525, 'Texas Sweet');
INSERT INTO `variety` (`id`, `name`) VALUES (526, 'Thai');
INSERT INTO `variety` (`id`, `name`) VALUES (527, 'Thomcord');
INSERT INTO `variety` (`id`, `name`) VALUES (528, 'Tip Top');
INSERT INTO `variety` (`id`, `name`) VALUES (529, 'Tips');
INSERT INTO `variety` (`id`, `name`) VALUES (530, 'Tomatillos/Husk Tomatoes');
INSERT INTO `variety` (`id`, `name`) VALUES (531, 'Tosca');
INSERT INTO `variety` (`id`, `name`) VALUES (532, 'Tree Ripened');
INSERT INTO `variety` (`id`, `name`) VALUES (533, 'Treviso');
INSERT INTO `variety` (`id`, `name`) VALUES (534, 'Triumph de Vienne');
INSERT INTO `variety` (`id`, `name`) VALUES (535, 'Turban');
INSERT INTO `variety` (`id`, `name`) VALUES (536, 'Turnip');
INSERT INTO `variety` (`id`, `name`) VALUES (537, 'Tuscan');
INSERT INTO `variety` (`id`, `name`) VALUES (538, 'Valencia');
INSERT INTO `variety` (`id`, `name`) VALUES (539, 'Vegetable Marrow');
INSERT INTO `variety` (`id`, `name`) VALUES (540, 'Vidalia');
INSERT INTO `variety` (`id`, `name`) VALUES (541, 'Vine Ripe, Regular');
INSERT INTO `variety` (`id`, `name`) VALUES (542, 'Virginia Gold');
INSERT INTO `variety` (`id`, `name`) VALUES (543, 'WA 2');
INSERT INTO `variety` (`id`, `name`) VALUES (544, 'WA 38');
INSERT INTO `variety` (`id`, `name`) VALUES (545, 'Walla Walla');
INSERT INTO `variety` (`id`, `name`) VALUES (546, 'Watermelon');
INSERT INTO `variety` (`id`, `name`) VALUES (547, 'Watermelon - Yellow Mini Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (548, 'Wax/Yellow');
INSERT INTO `variety` (`id`, `name`) VALUES (549, 'White');
INSERT INTO `variety` (`id`, `name`) VALUES (550, 'White (nyAH-may)');
INSERT INTO `variety` (`id`, `name`) VALUES (551, 'White Flesh');
INSERT INTO `variety` (`id`, `name`) VALUES (552, 'White Flesh Flat');
INSERT INTO `variety` (`id`, `name`) VALUES (553, 'White Flesh, Tree Ripened, Ready-to-eat');
INSERT INTO `variety` (`id`, `name`) VALUES (554, 'White/Green');
INSERT INTO `variety` (`id`, `name`) VALUES (555, 'White/Green Seeded');
INSERT INTO `variety` (`id`, `name`) VALUES (556, 'White/Green Seedless');
INSERT INTO `variety` (`id`, `name`) VALUES (557, 'White/Icicle');
INSERT INTO `variety` (`id`, `name`) VALUES (558, 'Winesap');
INSERT INTO `variety` (`id`, `name`) VALUES (559, 'Winged');
INSERT INTO `variety` (`id`, `name`) VALUES (560, 'Winter');
INSERT INTO `variety` (`id`, `name`) VALUES (561, 'Winter Nelis/Honey');
INSERT INTO `variety` (`id`, `name`) VALUES (562, 'With leaves attached');
INSERT INTO `variety` (`id`, `name`) VALUES (563, 'Without p/harvest treatment');
INSERT INTO `variety` (`id`, `name`) VALUES (564, 'Without postharvest treatment');
INSERT INTO `variety` (`id`, `name`) VALUES (565, 'Wood Ear');
INSERT INTO `variety` (`id`, `name`) VALUES (566, 'Worcester');
INSERT INTO `variety` (`id`, `name`) VALUES (567, 'Yellow');
INSERT INTO `variety` (`id`, `name`) VALUES (568, 'Yellow (nyAH-may)');
INSERT INTO `variety` (`id`, `name`) VALUES (569, 'Yellow (skin color)');
INSERT INTO `variety` (`id`, `name`) VALUES (570, 'Yellow Flesh');
INSERT INTO `variety` (`id`, `name`) VALUES (571, 'Yellow Flesh, Tree Ripened, Ready-to-eat');
INSERT INTO `variety` (`id`, `name`) VALUES (572, 'Yellow Zucchini/Gold Bar/Yellow Courgette');
INSERT INTO `variety` (`id`, `name`) VALUES (573, 'Yellow/Brown');
INSERT INTO `variety` (`id`, `name`) VALUES (574, 'Yellow/Brown Fresh');
INSERT INTO `variety` (`id`, `name`) VALUES (575, 'York');
INSERT INTO `variety` (`id`, `name`) VALUES (576, 'Zucchini/Courgette');

COMMIT;


-- -----------------------------------------------------
-- Data for table `seller`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `seller` (`id`, `bank_routing`, `bank_name`, `bank_acct_num`, `active`, `user_id`, `store_name`) VALUES (1, '123456789', 'US Bank', '58394586', 1, 1, 'Farmer John\'s Store');
INSERT INTO `seller` (`id`, `bank_routing`, `bank_name`, `bank_acct_num`, `active`, `user_id`, `store_name`) VALUES (2, '746295823', 'Chase', '84967563', 1, 2, 'Urban Jane\'s Store');

COMMIT;


-- -----------------------------------------------------
-- Data for table `item`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (1, 'SellerSupplied Name', 'Seller Supplied Description', 1.69, '2019-05-30', '2019-05-16', '2019-05-17 12:00:00', 1, 2, 7, 2, 284, 'https://image.shutterstock.com/z/stock-photo-pink-lady-apples-isolated-on-white-background-1122706196.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (2, 'SellerSupplied Name', 'Seller Supplied Description', 1.79, '2019-05-23', '2019-05-16', '2019-05-17 12:00:00', 1, 2, 56, 2, 405, 'https://image.shutterstock.com/z/stock-photo-isolated-berries-red-currant-fruits-isolated-on-white-background-137215997.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (3, 'SellerSupplied Name', 'Seller Supplied Description', 1.49, '2019-05-20', '2019-05-16', '2019-05-17 12:00:00', 1, 2, 110, 2, 205, 'https://image.shutterstock.com/z/stock-vector-honeydew-melon-whole-fresh-ripe-sweet-fruit-with-sliced-juicy-piece-of-cut-melon-realistic-fruits-1157387923.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (4, 'SellerSupplied Name', 'Seller Supplied Description', 1.99, '2019-05-21', '2019-04-10', '2019-05-17 12:00:00', 1, 2, 134, 2, 205, 'https://image.shutterstock.com/z/stock-photo-ripe-peaches-in-basket-on-wooden-background-297863489.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (5, 'SellerSupplied Name', 'Seller Supplied Description', 2.99, '2019-05-22', '2019-04-04', '2019-05-17 12:00:00', 1, 3, 111, 2, 376, 'https://image.shutterstock.com/z/stock-photo-ripe-peaches-in-basket-on-wooden-background-297863489.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (6, 'SellerSupplied Name', 'Seller Supplied Description', 2.89, '2019-05-30', '2019-04-24', '2019-05-17 12:00:00', 1, 3, 17, 2, 351, 'https://image.shutterstock.com/z/stock-photo-woman-in-style-apron-holding-pot-with-fresh-organic-basil-white-kitchen-interior-design-copy-737608135.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (7, 'SellerSupplied Name', 'Seller Supplied Description', 1.99, '2019-05-31', '2019-05-02', '2019-05-17 12:00:00', 1, 3, 59, 2, 27, 'https://image.shutterstock.com/z/stock-photo-chopped-fresh-dill-on-a-cutting-board-and-a-bunch-of-dill-on-a-wooden-table-top-view-673632799.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (8, 'SellerSupplied Name', 'Seller Supplied Description', 0.99, '2019-05-21', '2019-04-30', '2019-05-17 12:00:00', 1, 3, 94, 2, 183, 'https://image.shutterstock.com/z/stock-photo-lemongrass-plants-vegetables-and-herbs-of-thailand-have-medicinal-properties-1073949626.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (9, 'SellerSupplied Name', 'Seller Supplied Description', 3.99, '2019-05-24', '2019-05-06', '2019-05-17 12:00:00', 1, 4, 2, 2, 404, 'https://image.shutterstock.com/z/stock-photo-almond-on-branch-hull-split-almond-leaves-almond-tree-branch-1237846879.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (10, 'SellerSupplied Name', 'Seller Supplied Description', 1.99, '2019-05-24', '2019-04-28', '2019-05-17 12:00:00', 1, 4, 189, 2, 51, 'https://image.shutterstock.com/z/stock-photo-walnut-picking-season-walnut-tree-branches-of-walnuts-opened-the-shell-and-the-collected-walnuts-1142106452.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (11, 'SellerSupplied Name', 'Seller Supplied Description', 1.99, '2019-05-23', '2019-05-12', '2019-05-17 12:00:00', 1, 4, 135, 2, 405, 'https://image.shutterstock.com/z/stock-photo-dried-peanuts-in-closeup-peanuts-in-shells-on-wood-background-peanuts-peanuts-background-peanuts-613243670.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (12, 'SellerSupplied Name', 'Seller Supplied Description', 4.99, '2019-05-29', '2019-05-13', '2019-05-17 12:00:00', 1, 4, 144, 2, 405, 'https://image.shutterstock.com/z/stock-photo-pistachio-texture-nuts-green-fresh-pistachios-as-texture-590494409.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (13, 'SellerSupplied Name', 'Seller Supplied Description', 1.39, '2019-05-21', '2019-05-14', '2019-05-17 12:00:00', 1, 5, 173, 2, 539, 'https://image.shutterstock.com/z/stock-photo-butternut-squash-isolated-on-white-background-205302238.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (14, 'SellerSupplied Name', 'Seller Supplied Description', 1.99, '2019-05-23', '2019-05-21', '2019-05-17 12:00:00', 1, 5, 186, 2, 42, 'https://image.shutterstock.com/z/stock-photo-beautiful-red-ripe-heirloom-tomatoes-grown-in-a-greenhouse-gardening-tomato-photograph-with-copy-776379370.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (15, 'SellerSupplied Name', 'Seller Supplied Description', 3.99, '2019-05-24', '2019-05-21', '2019-05-17 12:00:00', 1, 5, 12, 2, 396, 'https://image.shutterstock.com/z/stock-photo-asparagus-fresh-asparagus-green-asparagus-in-basket-1045645381.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (16, 'SellerSupplied Name', 'Seller Supplied Description', 1.89, '2019-05-29', '2019-05-21', '2019-05-17 12:00:00', 1, 5, 31, 2, 141, 'https://image.shutterstock.com/z/stock-photo-fresh-broccoli-with-spinach-in-bowl-on-wooden-table-close-up-318831905.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (17, 'SellerSupplied Name', 'Seller Supplied Description', 1.79, '2019-05-23', '2019-05-22', '2019-05-17 12:00:00', 1, 1, 159, 2, 51, 'https://images.unsplash.com/photo-1556843824-256570ca21c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (18, 'SellerSupplied Name', 'Seller Supplied Description', 1.89, '2019-05-23', '2019-05-22', '2019-05-17 12:00:00', 1, 1, 159, 2, 211, 'https://image.shutterstock.com/z/stock-photo-yellow-golden-raisins-isolated-on-white-background-1064872322.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (19, 'SellerSupplied Name', 'Seller Supplied Description', 2.99, '2019-05-23', '2019-04-28', '2019-05-17 12:00:00', 1, 1, 68, 2, 1, 'https://image.shutterstock.com/z/stock-photo-dried-figs-fruit-isolated-on-white-background-1155666961.jpg', NULL);
INSERT INTO `item` (`id`, `name`, `description`, `price`, `best_by`, `picked`, `last_updated`, `active`, `category_id`, `commodity_id`, `unit_id`, `variety_id`, `img_url`, `seller_id`) VALUES (20, 'SellerSupplied Name', 'Seller Supplied Description', 1.99, '2019-05-23', '2019-04-30', '2019-05-17 12:00:00', 1, 1, 6, 2, 1, 'https://image.shutterstock.com/z/stock-photo-homemade-dried-organic-apple-sliced-on-wood-background-1324418675.jpg', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `driver`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `driver` (`id`, `bank_routing`, `bank_name`, `bank_acct_num`, `active`, `user_id`) VALUES (1, '123456789', 'US Bank', '4837265', 1, 3);
INSERT INTO `driver` (`id`, `bank_routing`, `bank_name`, `bank_acct_num`, `active`, `user_id`) VALUES (2, '746295823', 'Chase', '5048377', 1, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `purchase_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `purchase_status` (`id`, `status`) VALUES (1, 'Accepted');
INSERT INTO `purchase_status` (`id`, `status`) VALUES (2, 'Canelled');
INSERT INTO `purchase_status` (`id`, `status`) VALUES (3, 'Delivered');
INSERT INTO `purchase_status` (`id`, `status`) VALUES (4, 'Fulfilled');
INSERT INTO `purchase_status` (`id`, `status`) VALUES (5, 'Pending');
INSERT INTO `purchase_status` (`id`, `status`) VALUES (6, 'Picked up');
INSERT INTO `purchase_status` (`id`, `status`) VALUES (7, 'Rejected');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory`
-- -----------------------------------------------------
START TRANSACTION;
USE `citysproutsdb`;
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (1, 5, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (2, 5, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (3, 5, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (4, 1, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (5, 1, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (6, 1, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (7, 6, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (8, 6, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (9, 6, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (10, 8, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (11, 8, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (12, 8, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (13, 13, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (14, 13, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (15, 13, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (16, 18, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (17, 18, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (18, 18, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (19, 18, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (20, 11, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (21, 2, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (22, 2, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (23, 2, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (24, 5, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (25, 5, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (26, 6, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (27, 6, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (28, 14, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (29, 14, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (30, 14, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (31, 7, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (32, 7, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (33, 7, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (34, 7, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (35, 9, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (36, 9, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (37, 9, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (38, 2, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (39, 2, NULL, NULL);
INSERT INTO `inventory` (`id`, `item_id`, `seller_id`, `purchase_id`) VALUES (40, 2, NULL, NULL);

COMMIT;

