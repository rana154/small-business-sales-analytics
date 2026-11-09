
-- ==========================================
-- CUSTOMER BEHAVIOUR ANALYSIS
-- ==========================================

-- 1. Total unique customers
SELECT
    COUNT(DISTINCT customer_id) AS unique_customers
FROM sales;


-- 2. Customer spending analysis
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(total_amount) AS total_spending
FROM sales
GROUP BY customer_id
ORDER BY total_spending DESC;


-- 3. Top 5 customers by spending
SELECT
    customer_id,
    SUM(total_amount) AS total_spending
FROM sales
GROUP BY customer_id
ORDER BY total_spending DESC
LIMIT 5;


-- 4. Repeat customers
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1;


-- 5. Average spending per customer
SELECT
    ROUND(
        SUM(total_amount) /
        COUNT(DISTINCT customer_id), 2
    ) AS average_customer_spending
FROM sales;


-- 6. Customer purchase frequency
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS purchase_frequency
FROM sales
GROUP BY customer_id
ORDER BY purchase_frequency DESC;
