-- Total revenue
SELECT
ROUND(SUM(sales),2) AS total_revenue
FROM superstore;

-- Year-wise revenue trend
SELECT
YEAR(order_date) AS year,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY year
ORDER BY year DESC;

-- Monthly revenue trend
SELECT
YEAR(order_date) AS year,
MONTH(order_date) AS month,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY year, month
ORDER BY year DESC;
