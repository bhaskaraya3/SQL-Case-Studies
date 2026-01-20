-- Total revenue by coffee
SELECT
coffee_name,
ROUND(SUM(money),0) AS total_revenue,
COUNT(*) AS orders
FROM coffee1
GROUP BY coffee_name
ORDER BY total_revenue DESC;

-- Revenue contribution percentage
SELECT
coffee_name,
ROUND(SUM(money),0) AS total_revenue,
ROUND(SUM(money) * 100 / SUM(SUM(money)) OVER (),2) AS revenue_pct
FROM coffee1
GROUP BY coffee_name
ORDER BY total_revenue DESC;

-- Average order value
SELECT
ROUND(AVG(money),2) AS avg_order_value
FROM coffee1;

-- Average order value by payment type
SELECT
cash_type,
ROUND(AVG(money),2) AS avg_order_value
FROM coffee1
GROUP BY cash_type;

-- Best & worst performing days
SELECT
DAYNAME(date1) AS day_name,
COUNT(*) AS orders,
ROUND(SUM(money),0) AS revenue
FROM coffee1
GROUP BY day_name
ORDER BY orders DESC;

