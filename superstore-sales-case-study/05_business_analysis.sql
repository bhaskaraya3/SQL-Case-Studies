-- Category-wise revenue
SELECT
category,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY category
ORDER BY revenue DESC;

-- Sub-category revenue
SELECT
sub_category,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY sub_category
ORDER BY revenue DESC;

-- Top 10 products by revenue
SELECT
product_id,
sub_category,
ROUND(SUM(sales),2) AS revenue
FROM superstore
GROUP BY product_id, sub_category
ORDER BY revenue DESC
LIMIT 10;

-- Segment-wise customers
SELECT
segment,
COUNT(DISTINCT customer_id) AS customers
FROM superstore
GROUP BY segment;

-- Segment-wise revenue & AOV
SELECT
segment,
ROUND(SUM(sales),2) AS revenue,
ROUND(SUM(sales)/COUNT(DISTINCT order_id),2) AS avg_order_value
FROM superstore
GROUP BY segment
ORDER BY revenue DESC;
