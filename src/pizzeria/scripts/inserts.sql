-- Inserts for customers ---------------
INSERT INTO customers (first_name, last_name, address, postal_code, city, province, phone_number)
VALUES 
  ('Luke', 'Skywalker', '123 Tatooine Blvd', '10001', 'Mos Eisley', 'Outer Rim', '555-123-4567'),
  ('Leia', 'Organa', '456 Alderaan Ave', '90001', 'Alderaan', 'Core Worlds', '555-987-6543');

-- Inserts for orders ---------------
INSERT INTO orders (customer_id, order_datetime, delivery_type, total_price)
VALUES 
  (1, '2024-04-01 12:00:00', 'home_delivery', 25.99),
  (2, '2024-04-02 13:30:00', 'pickup_in_store', 19.99);

-- Inserts for order_items ---------------
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES 
  (1, 1, 1, 10.99),
  (1, 2, 1, 15.00),
  (2, 3, 2, 9.99);

-- Inserts for products ---------------
INSERT INTO products (name, description, image_url, price)
VALUES 
  ('Galactic Supreme Pizza', 'Our signature pizza with all the toppings from across the galaxy', 'supreme.jpg', 10.99),
  ('Cheeseburger Nebula Burger', 'A burger that is out of this world, topped with cheese and special sauce', 'cheeseburger.jpg', 15.00),
  ('Cosmic Cola', 'An interstellar drink that will refresh you like nothing else', 'cola.jpg', 4.99);

-- Inserts for categories ---------------
INSERT INTO categories (name)
VALUES 
  ('Pizza'),
  ('Burger'),
  ('Drink');

-- Inserts for pizza_categories ---------------
INSERT INTO pizza_categories (pizza_id, category_id)
VALUES 
  (1, 1);

-- Inserts for stores ---------------
INSERT INTO stores (address, postal_code, city, province)
VALUES 
  ('101 Galaxy Blvd', '10001', 'Coruscant', 'Core Worlds'),
  ('302 Asteroid Ave', '90001', 'Hoth', 'Outer Rim');

-- Inserts for employees ---------------
INSERT INTO employees (store_id, first_name, last_name, nif, phone_number, job_title)
VALUES 
  (1, 'Han', 'Solo', '123456789A', '555-111-2222', 'cook'),
  (2, 'Chewbacca', '', '987654321B', '555-222-3333', 'delivery_person');

-- Inserts for deliveries
INSERT INTO deliveries (order_id, employee_id, delivery_datetime)
VALUES 
  (1, 2, '2024-04-01 12:45:00');
