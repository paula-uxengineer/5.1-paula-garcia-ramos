-- Get all orders for a specific customer ---------------
SELECT * FROM orders WHERE customer_id = 1;

-- Get all orders made by a specific employee ---------------
SELECT * FROM orders WHERE employee_id = 1;

-- Get total sales by product category ---------------
SELECT c.name AS category, SUM(oi.price * oi.quantity) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN pizza_categories pc ON p.product_id = pc.pizza_id
JOIN categories c ON pc.category_id = c.category_id
GROUP BY c.name;

-- Get all orders with delivery details ---------------
SELECT o.order_id, o.order_datetime, o.delivery_type, o.total_price, e.first_name AS delivery_person, d.delivery_datetime
FROM orders o
LEFT JOIN deliveries d ON o.order_id = d.order_id
LEFT JOIN employees e ON d.employee_id = e.employee_id;
