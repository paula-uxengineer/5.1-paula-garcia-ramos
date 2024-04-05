USE optical_store;

-- suppliers_table ---------------
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
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
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);

-- glasses_table ---------------
CREATE TABLE glasses (
    glasses_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT,
    supplier_id INT,
    graduation VARCHAR(10),
    frame_type VARCHAR(20),
    frame_color VARCHAR(20),
    lens_color VARCHAR(20),
    price FLOAT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);

-- customers_table ---------------
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60),
    postal_code VARCHAR(10), 
    phone VARCHAR(20), 
    email VARCHAR(60),
    registration_date DATE,
    referred_by INT,
    FOREIGN KEY (referred_by) REFERENCES customers(customer_id)
);

-- employees_table ---------------
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60)
);

-- sales_table ---------------
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    customer_id INT,
    glasses_id INT,
    sale_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (glasses_id) REFERENCES glasses(glasses_id)
);
