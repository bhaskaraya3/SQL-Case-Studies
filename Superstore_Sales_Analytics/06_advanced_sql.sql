-- Region-wise performance
SELECT
region,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY region
ORDER BY revenue DESC;

-- Top 10 states by revenue
SELECT
state,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY state
ORDER BY revenue DESC
LIMIT 10;

-- Delivery performance by ship mode
SELECT
ship_mode,
COUNT(*) AS orders,
ROUND(AVG(delievery_days),2) AS avg_delivery_days,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY ship_mode
ORDER BY revenue DESC;

-- High-revenue but slow-delivery orders
SELECT
order_id,
ROUND(sales,2) AS sales,
delievery_days
FROM superstore
WHERE delievery_days >
    (SELECT AVG(delievery_days) FROM superstore)
ORDER BY sales DESC
LIMIT 10;

-- Category performance by region
SELECT
region,
category,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY region, category
ORDER BY revenue DESC;

-- Top 10 customers by revenue (concentration risk)
SELECT
customer_name,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY customer_name
ORDER BY revenue DESC
LIMIT 10;
