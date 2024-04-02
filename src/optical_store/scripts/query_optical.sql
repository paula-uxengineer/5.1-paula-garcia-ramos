USE optica;

-- Total purchases per customer ---------------
SELECT customers.customer_id,
    customers.name,
    COUNT(sales.sale_id) AS total_sales
FROM customers
    LEFT JOIN sales ON customers.customer_id = sales.customer_id
GROUP BY customers.customer_id,
    customers.name
ORDER BY total_sales DESC;

-- Total sales per employee/year ---------------
SELECT employees.employee_id,
    employees.name AS Name,
    COUNT(sales.sale_id) AS total_sales
FROM employees
    JOIN sales ON employees.employee_id = sales.employee_id
    JOIN glasses ON sales.glasses_id = glasses.glasses_id
WHERE YEAR(sales.sale_date) = 2023
GROUP BY employees.employee_id,
    employees.name
ORDER BY total_sales DESC;

-- Total sales per supplier ---------------
SELECT suppliers.supplier_id,
    suppliers.name AS supplier,
    COUNT(sales.sale_id) AS total_sales
FROM suppliers
    JOIN glasses ON suppliers.supplier_id = glasses.supplier_id
    JOIN sales ON glasses.glasses_id = sales.glasses_id
GROUP BY suppliers.supplier_id,
    suppliers.name
ORDER BY total_sales DESC;