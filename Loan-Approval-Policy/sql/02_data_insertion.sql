-- INSERT INTO CUSTOMERS
INSERT INTO customers (customer_id, gender, married, dependents, education, self_employed)
SELECT 
    customer_id,
    gender,
    married,
    dependents,
    education,
    self_employed
FROM customer_loan;

-- INSERT INTO INCOME DETAILS
INSERT INTO income_details (customer_id, applicant_income, coapplicant_income)
SELECT 
    customer_id,
    applicant_income,
    coapplicant_income
FROM customer_loan;

-- INSERT INTO LOAN DETAILS
INSERT INTO loan_details (customer_id, loan_amount, loan_amount_term, credit_history, loan_status)
SELECT 
    customer_id,
    loan_amount,
    loan_amount_term,
    credit_history,
    loan_status
FROM customer_loan;

-- INSERT INTO PROPERTY DETAILS
INSERT INTO property_details (customer_id, property_area)
SELECT 
    customer_id,
    property_area
FROM customer_loan;
