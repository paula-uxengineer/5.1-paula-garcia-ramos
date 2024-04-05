USE optical_store;

-- Total purchases for customer ---------------
SELECT customers.id,
    customers.name,
    COUNT(sales.id) AS total_sales
FROM customers
    LEFT JOIN sales ON customers.id = sales.id
GROUP BY customers.id,
    customers.name
ORDER BY total_sales DESC;

-- Total sales for employee/year ---------------
SELECT employees.id,
    employees.name AS Name,
    COUNT(sales.id) AS total_sales
FROM employees
    JOIN sales ON employees.id = sales.id
    JOIN glasses ON sales.id = glasses.id
WHERE YEAR(sales.sale_date) = 2024
GROUP BY employees.id,
    employees.name
ORDER BY total_sales DESC;

-- Total sales for supplier ---------------
SELECT suppliers.id,
    suppliers.name AS supplier,
    COUNT(sales.id) AS total_sales
FROM suppliers
    JOIN glasses ON suppliers.id = glasses.id
    JOIN sales ON glasses.id = sales.id
GROUP BY suppliers.id,
    suppliers.name
ORDER BY total_sales DESC;