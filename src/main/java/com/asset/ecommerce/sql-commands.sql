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


CREATE TABLE `ecommerce_db`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `total` DOUBLE NOT NULL,
  `ordered_date` DATE NOT NULL,
  `shipped_date` DATE NOT NULL,
  `customer_id` INT NOT NULL,
  `shipper_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_customer_idx` (`customer_id` ASC),
  INDEX `fk_order_shipper_idx` (`shipper_id` ASC),
  CONSTRAINT `fk_order_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ecommerce_db`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_shipper`
    FOREIGN KEY (`shipper_id`)
    REFERENCES `ecommerce_db`.`shipper` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


CREATE TABLE `ecommerce_db`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `ecommerce_db`.`product_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `ecommerce_db`.`computer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpu` VARCHAR(45) NOT NULL,
  `ram` INT NOT NULL,
  `product_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_computer_type_idx` (`product_type_id` ASC),
  CONSTRAINT `fk_computer_type`
    FOREIGN KEY (`product_type_id`)
    REFERENCES `ecommerce_db`.`product_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


CREATE TABLE `ecommerce_db`.`shoe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size` DOUBLE NOT NULL,
  `running` TINYINT NOT NULL,
  `product_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shoe_type_idx` (`product_type_id` ASC),
  CONSTRAINT `fk_shoe_type`
    FOREIGN KEY (`product_type_id`)
    REFERENCES `ecommerce_db`.`product_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


CREATE TABLE `ecommerce_db`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `category_id` INT NOT NULL,
  `product_type_id` INT NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_category_idx` (`category_id` ASC),
  INDEX `fk_product_type_idx` (`product_type_id` ASC),
  INDEX `fk_product_image_idx` (`image_id` ASC),
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `ecommerce_db`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_type`
    FOREIGN KEY (`product_type_id`)
    REFERENCES `ecommerce_db`.`product_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_image`
    FOREIGN KEY (`image_id`)
    REFERENCES `ecommerce_db`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


CREATE TABLE `ecommerce_db`.`order_product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `quantity` INT NOT NULL,
  `discount` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_idx` (`order_id` ASC),
  INDEX `fk_product_idx` (`product_id` ASC),
  CONSTRAINT `fk_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `ecommerce_db`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `ecommerce_db`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);






