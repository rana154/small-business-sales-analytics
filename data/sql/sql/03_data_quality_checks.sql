
-- ==========================================
-- DATA QUALITY CHECKS
-- Small Business Sales Analytics
-- ==========================================

-- 1. Check for duplicate order IDs
SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM sales
GROUP BY order_id
HAVING COUNT(*) > 1;


-- 2. Check for missing values
SELECT
    SUM(order_date IS NULL) AS missing_dates,
    SUM(product_name IS NULL) AS missing_products,
    SUM(category IS NULL) AS missing_categories,
    SUM(quantity IS NULL) AS missing_quantities,
    SUM(unit_price IS NULL) AS missing_prices,
    SUM(total_amount IS NULL) AS missing_amounts
FROM sales;


-- 3. Check for invalid quantities
SELECT *
FROM sales
WHERE quantity <= 0;


-- 4. Check for invalid prices
SELECT *
FROM sales
WHERE unit_price <= 0;


-- 5. Check incorrect total calculations
SELECT *
FROM sales
WHERE total_amount <> quantity * unit_price;


-- 6. Check for unusual future order dates
SELECT *
FROM sales
WHERE order_date > CURRENT_DATE();


-- 7. Overall data quality summary
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_id) AS unique_orders,
    SUM(total_amount) AS total_revenue,
    SUM(CASE WHEN quantity <= 0 THEN 1 ELSE 0 END)
        AS invalid_quantity_records,
    SUM(CASE WHEN unit_price <= 0 THEN 1 ELSE 0 END)
        AS invalid_price_records
FROM sales;
