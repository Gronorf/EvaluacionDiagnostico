/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  mauri
 * Created: 11-04-2023
 */

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
-- -----------------------------------------------------
-- Schema ejemplo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ejemplo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ejemplo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`stocks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stocks` (
  `store_id` VARCHAR(16) NOT NULL,
  `product_id` VARCHAR(255) NULL,
  `quantity` VARCHAR(32) NULL,
  PRIMARY KEY (`store_id`));


-- -----------------------------------------------------
-- Table `mydb`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stores` (
  `store_id` VARCHAR(16) NOT NULL,
  `store_name` VARCHAR(255) NULL,
  `phone` VARCHAR(32) NULL,
  `email` VARCHAR(50) NULL DEFAULT CURRENT_TIMESTAMP,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  `stocks_store_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`store_id`, `stocks_store_id`),
  INDEX `fk_stores_stocks1_idx` (`stocks_store_id` ASC) VISIBLE,
  CONSTRAINT `fk_stores_stocks1`
    FOREIGN KEY (`stocks_store_id`)
    REFERENCES `mydb`.`stocks` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customers_id` VARCHAR(16) NOT NULL,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(32) NULL,
  `phone` VARCHAR(50) NULL DEFAULT CURRENT_TIMESTAMP,
  `email` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  PRIMARY KEY (`customers_id`));


-- -----------------------------------------------------
-- Table `mydb`.`staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`staffs` (
  `staff_id` VARCHAR(16) NOT NULL,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(32) NULL,
  `email` VARCHAR(50) NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` VARCHAR(45) NULL,
  `active` VARCHAR(45) NULL,
  `store_id` VARCHAR(45) NULL,
  `manager_id` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`));


-- -----------------------------------------------------
-- Table `mydb`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`brands` (
  `brand_id` VARCHAR(16) NOT NULL,
  `brand_name` VARCHAR(255) NULL,
  PRIMARY KEY (`brand_id`));


-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `category_id` VARCHAR(16) NOT NULL,
  `category_name` VARCHAR(255) NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `product_id` VARCHAR(16) NOT NULL,
  `product_name` VARCHAR(255) NULL,
  `brand_id` VARCHAR(32) NULL,
  `category_id` VARCHAR(50) NULL DEFAULT CURRENT_TIMESTAMP,
  `model_year` VARCHAR(45) NULL,
  `list_price` VARCHAR(45) NULL,
  `brands_brand_id` VARCHAR(16) NOT NULL,
  `categories_category_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`product_id`, `brands_brand_id`, `categories_category_id`),
  INDEX `fk_products_brands1_idx` (`brands_brand_id` ASC) VISIBLE,
  INDEX `fk_products_categories1_idx` (`categories_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_brands1`
    FOREIGN KEY (`brands_brand_id`)
    REFERENCES `mydb`.`brands` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_categories1`
    FOREIGN KEY (`categories_category_id`)
    REFERENCES `mydb`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_items` (
  `order_id` VARCHAR(16) NOT NULL,
  `item_id` VARCHAR(255) NULL,
  `product_id` VARCHAR(32) NULL,
  `quantity` VARCHAR(50) NULL DEFAULT CURRENT_TIMESTAMP,
  `list_price` VARCHAR(45) NULL,
  `discount` VARCHAR(45) NULL,
  `products_product_id` VARCHAR(16) NOT NULL,
  `products_brands_brand_id` VARCHAR(16) NOT NULL,
  `products_categories_category_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`order_id`, `products_product_id`, `products_brands_brand_id`, `products_categories_category_id`),
  INDEX `fk_order_items_products1_idx` (`products_product_id` ASC, `products_brands_brand_id` ASC, `products_categories_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_items_products1`
    FOREIGN KEY (`products_product_id` , `products_brands_brand_id` , `products_categories_category_id`)
    REFERENCES `mydb`.`products` (`product_id` , `brands_brand_id` , `categories_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `order_id` INT(50) NOT NULL,
  `customer_id` INT(50) NULL,
  `order_status` VARCHAR(32) NULL,
  `order_date` VARCHAR(40) NULL DEFAULT CURRENT_TIMESTAMP,
  `required_date` VARCHAR(45) NULL,
  `shipped_date` VARCHAR(45) NULL,
  `store_id` VARCHAR(45) NULL,
  `staff_id` VARCHAR(45) NULL,
  `stores_store_id` VARCHAR(16) NOT NULL,
  `customers_customers_id` VARCHAR(16) NOT NULL,
  `staffs_staff_id` VARCHAR(16) NOT NULL,
  `order_items_order_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`order_id`, `customers_customers_id`, `staffs_staff_id`, `order_items_order_id`),
  INDEX `fk_orders_stores1_idx` (`stores_store_id` ASC) VISIBLE,
  INDEX `fk_orders_customers1_idx` (`customers_customers_id` ASC) VISIBLE,
  INDEX `fk_orders_staffs1_idx` (`staffs_staff_id` ASC) VISIBLE,
  INDEX `fk_orders_order_items1_idx` (`order_items_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_stores1`
    FOREIGN KEY (`stores_store_id`)
    REFERENCES `mydb`.`stores` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customers_customers_id`)
    REFERENCES `mydb`.`customers` (`customers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_staffs1`
    FOREIGN KEY (`staffs_staff_id`)
    REFERENCES `mydb`.`staffs` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_order_items1`
    FOREIGN KEY (`order_items_order_id`)
    REFERENCES `mydb`.`order_items` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

USE `ejemplo` ;

-- -----------------------------------------------------
-- Table `ejemplo`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejemplo`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `rutCliente` INT NOT NULL,
  `nombreCliente` VARCHAR(30) NOT NULL,
  `apellidoCliente` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `rutCliente` (`rutCliente` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejemplo`.`compra` (
  `idCompra` INT NOT NULL AUTO_INCREMENT,
  `precioCompra` INT NOT NULL,
  `diaCompra` DATE NULL DEFAULT NULL,
  `horaCompra` TIME NULL DEFAULT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `compra_cliente_FK` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `compra_cliente_FK`
    FOREIGN KEY (`idCliente`)
    REFERENCES `ejemplo`.`cliente` (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
