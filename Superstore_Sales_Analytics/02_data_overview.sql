-- Preview data
SELECT * FROM superstore LIMIT 10;

-- Dataset size
SELECT COUNT(*) AS total_orders
FROM superstore;

-- Date range
SELECT
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date
FROM superstore;

-- Schema inspection
DESC superstore;
