-- Daily order volume
SELECT
date1,
COUNT(*) AS orders
FROM coffee1
GROUP BY date1
ORDER BY orders DESC
LIMIT 10;

-- Monthly sales volume
SELECT
YEAR(date1) AS year,
MONTH(date1) AS month,
COUNT(*) AS total_orders
FROM coffee1
GROUP BY year, month
ORDER BY total_orders DESC;

-- Orders by coffee type
SELECT
coffee_name,
COUNT(*) AS order_count
FROM coffee1
GROUP BY coffee_name
ORDER BY order_count DESC;

-- Payment method usage
SELECT
cash_type,
COUNT(*) AS orders
FROM coffee1
GROUP BY cash_type;
