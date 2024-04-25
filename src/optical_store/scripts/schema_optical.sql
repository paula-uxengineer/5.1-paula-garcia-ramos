CREATE DATABASE IF NOT EXISTS optical_store;

USE optical_store;

-- suppliers_table ---------------
CREATE TABLE suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40),
    street_address VARCHAR(100),
    street_number INT,
    floor_number INT,
    door_number VARCHAR(10),
    city VARCHAR(40),
    postal_code VARCHAR(10), 
    country VARCHAR(20),
    phone VARCHAR(30), 
    fax VARCHAR(30), 
    nif VARCHAR(20)
);

-- brands_table ---------------
CREATE TABLE brands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);

-- glasses_table ---------------
CREATE TABLE glasses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT,
    supplier_id INT,
    graduation VARCHAR(10),
    frame_type VARCHAR(20),
    frame_color VARCHAR(20),
    lens_color VARCHAR(20),
    price FLOAT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    FOREIGN KEY (brand_id) REFERENCES brands(id)
);

-- customers_table ---------------
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) UNIQUE,
    postal_code VARCHAR(10), 
    phone VARCHAR(20), 
    email VARCHAR(60),
    registration_date DATE,
    referred_by INT,
    FOREIGN KEY (referred_by) REFERENCES customers(id)
);

-- employees_table ---------------
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60)
);

-- sales_table ---------------
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fk_employee_id INT,
    fk_customer_id INT,
    fk_glasses_id INT,
    sale_date DATE,
    FOREIGN KEY (fk_employee_id) REFERENCES employees(id),
    FOREIGN KEY (fk_customer_id) REFERENCES customers(id),
    FOREIGN KEY (fk_glasses_id) REFERENCES glasses(id)
);
