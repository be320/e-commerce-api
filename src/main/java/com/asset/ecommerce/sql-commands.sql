CREATE SCHEMA `ecommerce_db` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `ecommerce_db`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE `ecommerce_db`.`image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `ecommerce_db`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `ecommerce_db`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


CREATE TABLE `ecommerce_db`.`staff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `department` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_staff_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_staff`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommerce_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


CREATE TABLE `ecommerce_db`.`shipper` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `license` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shipper_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_shipper_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommerce_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


CREATE TABLE `ecommerce_db`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vip` TINYINT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_customer_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommerce_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);





