
-- Simple stored procedure without BEGIN...END
-- Returns employees with salary >= 50,000
CREATE PROCEDURE salaries()
SELECT * FROM employees2
WHERE salary >= 50000;

-- Call the procedure
CALL salaries();


DELIMITER $$
-- Stored procedure with multiple SELECT statements
CREATE PROCEDURE salaries2()
BEGIN
    -- First query: employees with salary >= 50,000
	SELECT * FROM employees2
	WHERE salary >= 50000;
    
    -- Second query: employees with salary >= 10,000
	SELECT * FROM employees2
	WHERE salary >= 10000;
END $$
DELIMITER ;

-- Call the procedure
CALL salaries2();


DELIMITER $$
-- Stored procedure with input parameter
-- Takes an employee id and returns only that employee's salary
CREATE PROCEDURE salaries3(p_employee_id INT)
BEGIN
	SELECT salary 
    FROM employees2
    WHERE id = p_employee_id;
END $$
DELIMITER ;

-- Call the procedure with parameter = 1
CALL salaries3(1);

