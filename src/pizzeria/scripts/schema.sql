CREATE DATABASE IF NOT EXISTS pizzeria;ç

USE pizzeria;

-- Customers table ---------------
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(150),
    postal_code VARCHAR(10),
    city VARCHAR(30),
    province VARCHAR(30),
    phone_number VARCHAR(14)
);

-- Orders table ---------------
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_datetime DATETIME,
    delivery_type ENUM('home_delivery', 'pickup_in_store'),
    total_price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order_items table ---------------
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Products table ---------------
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120),
    description TEXT,
    image_url VARCHAR(280),
    price DECIMAL(10, 2)
);

-- Categories table ---------------
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

-- Pizza_categories table ---------------
CREATE TABLE pizza_categories (
    pizza_id INT,
    category_id INT,
    FOREIGN KEY (pizza_id) REFERENCES products(product_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
 
-- Stores table ---------------
CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(100),
    postal_code VARCHAR(10),
    city VARCHAR(50),
    province VARCHAR(50)
);

-- Employees table ---------------
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    nif VARCHAR(18),
    phone_number VARCHAR(14),
    job_title ENUM('cook', 'delivery_person'),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

-- Deliveries table
CREATE TABLE deliveries (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    employee_id INT,
    delivery_datetime DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
