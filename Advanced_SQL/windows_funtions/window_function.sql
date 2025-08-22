
-- GROUP BY
SELECT gender, 
AVG(salary) AS 'avg_salary'
FROM employees2
GROUP BY gender
;
-- Groups rows by gender.
-- Returns one row per gender with its average salary.
-- Downside: you lose the detail of each individual employee.

-- OVER()
SELECT gender, 
AVG(salary) OVER(PARTITION BY gender)
FROM employees2
;
-- Uses a window function instead of GROUP BY.
-- PARTITION BY gender means: calculate the average salary for each gender but keep all rows.
-- More flexible, because details remain in the result.


SELECT id,name,gender, 
AVG(salary) OVER(PARTITION BY gender)
FROM employees2
;
-- Same as above, but also shows each employee’s details alongside their gender’s average salary.


-- ROLLING TOTAL
SELECT id,name,gender,salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY id) AS Rolling_Total
FROM employees2
;
-- SUM() OVER() calculates a running total.
-- PARTITION BY gender: reset the sum for each gender.
-- ORDER BY id: salaries are added up in ascending order of employee id.


-- ROW_NUMBER
SELECT id,name,gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num
FROM employees2
;
-- ROW_NUMBER() assigns a unique sequential number to each row.
-- Partitioned by gender.
-- Ordered by salary highest first.

-- RANK()
SELECT id,name,gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employees2
;
-- ROW_NUMBER() → assigns unique numbers (no ties).
-- RANK() → gives the same rank to ties, but skips numbers.
-- Example: salaries 5000, 5000, 4000 → ranks 1, 1, 3.

-- DENSE_RANK()
SELECT id,name,gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employees2
;
