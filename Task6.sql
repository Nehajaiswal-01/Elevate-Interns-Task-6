Create Database SalesAnalysis;
Use SalesAnalysis;

CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10, 2),
    customer_id INT,
    payment_method VARCHAR(50),
    category VARCHAR(50),
    city VARCHAR(50)
);
-- Monthly Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    year, month
ORDER BY 
    year, month;
   
-- Top 3 Months by Revenue--
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    year, month
ORDER BY 
    total_revenue DESC
LIMIT 3;
--  City-wise Revenue
SELECT 
    city,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    city
ORDER BY 
    total_revenue DESC;

-- Category-wise Revenue
SELECT 
    category,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    category
ORDER BY 
    total_revenue DESC;

-- Payment Method Distribution
SELECT 
    payment_method,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    payment_method
ORDER BY 
    total_revenue DESC;
    
--  Customer Repeat Count
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_spent
FROM 
    online_sales
GROUP BY 
    customer_id
ORDER BY 
    total_orders DESC
LIMIT 10;

