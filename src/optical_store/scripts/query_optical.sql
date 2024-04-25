USE optical_store;

-- List the total purchases of a customer ---------------
SELECT customers.id,
       customers.name,
       SUM(glasses.price) AS total_purchases
FROM customers
LEFT JOIN sales ON customers.id = sales.fk_customer_id
LEFT JOIN glasses ON sales.fk_glasses_id = glasses.id
GROUP BY customers.id,
         customers.name
ORDER BY total_purchases DESC;


-- List the different glasses sold by an employee during a year ---------------
SELECT sales.fk_employee_id,
       employees.name AS Employee_Name,
       glasses.id AS Glasses_ID,
       glasses.brand_id,
       glasses.graduation,
       glasses.frame_type,
       glasses.frame_color,
       glasses.lens_color,
       glasses.price
FROM sales
JOIN employees ON sales.fk_employee_id = employees.id
JOIN glasses ON sales.fk_glasses_id = glasses.id
WHERE YEAR(sales.sale_date) = 2024
ORDER BY sales.fk_employee_id, glasses.id;


-- List the different suppliers who have supplied glasses sold successfully by the optics store ---------------
SELECT suppliers.id,
       suppliers.name AS supplier,
       COUNT(sales.id) AS total_successful_sales
FROM suppliers
JOIN glasses ON suppliers.id = glasses.supplier_id
JOIN sales ON glasses.id = sales.fk_glasses_id
WHERE sales.sale_date IS NOT NULL
GROUP BY suppliers.id,
         suppliers.name
ORDER BY total_successful_sales DESC;