-- Using a CTE (Common Table Expression) for Aggregation
-- Creates a CTE with avg, max, min salary by gender, 
-- then calculates the average of these averages.
WITH CTE_EXAMPLE(Gender, AVG_SAL, MAX_SAL, MIN_SAL) AS (
    SELECT gender, AVG(salary), MAX(salary), MIN(salary)
    FROM employees2
    GROUP BY gender
)
SELECT AVG(avg_sal) FROM CTE_EXAMPLE;


-- Using a Subquery instead of a CTE
-- Same logic as above but written with an inline subquery.
SELECT AVG(avg_sal)  
FROM (
    SELECT gender, AVG(salary) AS 'avg_sal', MAX(salary) AS 'max_sal', MIN(salary) AS 'min_sal'
    FROM employees2
    GROUP BY gender
) example_subquery;


-- Joining Multiple CTEs
-- First CTE gets employees joined after 2020-01-01.
-- Second CTE gets employees with salary > 50,000.
-- Final result returns employees satisfying both conditions.
WITH CTE_EXAMPLE AS (
    SELECT id, gender, date_of_joining 
    FROM employees2
    WHERE date_of_joining > "2020-01-01"
),
CTE_EXAMPLE2 AS (
    SELECT id, salary
    FROM employees2
    WHERE salary > 50000
)
SELECT * 
FROM CTE_EXAMPLE
JOIN CTE_EXAMPLE2
ON CTE_EXAMPLE.id = CTE_EXAMPLE2.id;

