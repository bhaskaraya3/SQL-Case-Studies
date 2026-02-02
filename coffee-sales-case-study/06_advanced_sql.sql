-- Best sales day within each month
SELECT
date1,
orders,
rank_in_month
FROM (
    SELECT
	date1,
	COUNT(*) AS orders,
	RANK() OVER (PARTITION BY YEAR(date1), MONTH(date1)
    ORDER BY COUNT(*) DESC) AS rank_in_month
    FROM coffee1
    GROUP BY date1
) t
WHERE rank_in_month = 1;

-- Month-over-Month growth
SELECT
year,
month,
total_orders,
total_orders -
LAG(total_orders) OVER (ORDER BY year, month) AS mom_growth
FROM (
    SELECT
	YEAR(date1) AS year,
	MONTH(date1) AS month,
	COUNT(*) AS total_orders
    FROM coffee1
    GROUP BY year, month
) t;

-- Pareto (80/20) Analysis
SELECT
coffee_name,
total_revenue,
ROUND(SUM(total_revenue) OVER (ORDER BY total_revenue DESC)/SUM(total_revenue) OVER () * 100,2) AS cumulative_pct
FROM (
    SELECT
	coffee_name,
	ROUND(SUM(money),0) AS total_revenue
    FROM coffee1
    GROUP BY coffee_name
) t;

-- Revenue volatility
SELECT
DATE_FORMAT(date1, '%Y-%m') AS `year_month`,
ROUND(AVG(money),2) AS avg_order_value,
ROUND(STDDEV(money),2) AS volatility
FROM coffee1
GROUP BY `year_month`;
