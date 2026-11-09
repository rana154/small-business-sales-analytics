
-- ==========================================
-- SMALL BUSINESS SALES ANALYTICS
-- SQL Business Analysis
-- ==========================================

-- 1. Total Revenue
SELECT
    SUM(total_amount) AS total_revenue
FROM sales;


-- 2. Total Number of Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM sales;


-- 3. Total Products Sold
SELECT
    SUM(quantity) AS total_items_sold
FROM sales;


-- 4. Revenue by Product
SELECT
    product_name,
    SUM(total_amount) AS revenue
FROM sales
GROUP BY product_name
ORDER BY revenue DESC;


-- 5. Revenue by Category
SELECT
    category,
    SUM(total_amount) AS category_revenue
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;


-- 6. Monthly Revenue
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(total_amount) AS monthly_revenue
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;


-- 7. Most Popular Payment Method
SELECT
    payment_method,
    COUNT(*) AS transactions
FROM sales
GROUP BY payment_method
ORDER BY transactions DESC;


-- 8. Average Order Value
SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM sales;


-- 9. Best Selling Products by Quantity
SELECT
    product_name,
    SUM(quantity) AS units_sold
FROM sales
GROUP BY product_name
ORDER BY units_sold DESC;


-- 10. Daily Revenue
SELECT
    order_date,
    SUM(total_amount) AS daily_revenue
FROM sales
GROUP BY order_date
ORDER BY order_date;
