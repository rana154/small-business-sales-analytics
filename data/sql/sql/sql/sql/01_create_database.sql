
-- ==========================================
-- SMALL BUSINESS SALES ANALYTICS
-- DATABASE SETUP
-- ==========================================

CREATE DATABASE IF NOT EXISTS small_business_analytics;

USE small_business_analytics;

CREATE TABLE IF NOT EXISTS sales (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100),
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50),
    customer_id INT
);
