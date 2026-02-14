-- NULL CHECKING ON CUSTOMERS TABLE
SELECT 
SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
SUM(CASE WHEN married IS NULL THEN 1 ELSE 0 END) AS null_married,
SUM(CASE WHEN dependents IS NULL THEN 1 ELSE 0 END) AS null_dependents,
SUM(CASE WHEN education IS NULL THEN 1 ELSE 0 END) AS null_education,
SUM(CASE WHEN self_employed IS NULL THEN 1 ELSE 0 END) AS null_self_employed
FROM customers;

-- NULL CHECKING ON INCOME TABLE
SELECT
SUM(CASE WHEN applicant_income IS NULL THEN 1 ELSE 0 END) AS null_applicant_income,
SUM(CASE WHEN coapplicant_income IS NULL THEN 1 ELSE 0 END) AS null_coapplicant_income
FROM income_details;

-- NULL CHECKING ON LOAN TABLE
SELECT 
	SUM(CASE WHEN loan_amount IS NULL THEN 1 ELSE 0 END) AS null_loan_amount,
    SUM(CASE WHEN loan_amount_term IS NULL THEN 1 ELSE 0 END) AS null_loan_term,
    SUM(CASE WHEN credit_history IS NULL THEN 1 ELSE 0 END) AS null_credit_history,
    SUM(CASE WHEN loan_status IS NULL THEN 1 ELSE 0 END) AS null_loan_status
FROM loan_details;

-- NULL CHECKING ON PROPERTY TABLE
SELECT 
	SUM(CASE WHEN property_area IS NULL THEN 1 ELSE 0 END) AS null_property_area
FROM property_details;

-- CHECKING DUPLICATES FOR customer_id
SELECT customer_id, COUNT(*)
FROM customer_loan
GROUP BY customer_id
HAVING COUNT(*) >1;

-- CHECKING FULL DUPLICATES ROWS
SELECT *,
       COUNT(*) OVER (
           PARTITION BY customer_id, gender, married, dependents, education,
                        self_employed, applicant_income, coapplicant_income,
                        loan_amount, loan_amount_term, credit_history,
                        property_area, loan_status
       ) AS duplicate_count
FROM customer_loan;

-- Check negative income
SELECT *
FROM customer_loan
WHERE applicant_income < 0
   OR coapplicant_income < 0;

-- Check unrealistic loan amount
SELECT *
FROM customer_loan
WHERE loan_amount <= 0;

-- Check invalid credit history
SELECT DISTINCT credit_history
FROM customer_loan;

-- Check invalid categories
SELECT DISTINCT property_area FROM customer_loan;
SELECT DISTINCT education FROM customer_loan;
SELECT DISTINCT loan_status FROM customer_loan;
