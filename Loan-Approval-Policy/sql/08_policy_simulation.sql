-- High-Income Applicants Rejected
SELECT
COUNT(*) AS high_income_rejected
FROM customer_loan
WHERE loan_status='N'
AND (applicant_income+coapplicant_income) >
    (SELECT AVG(applicant_income+coapplicant_income) FROM customer_loan);

-- Potential Approvals if Credit-Based Rejection Relaxed
SELECT
property_area,
COUNT(*) AS potential_approvals
FROM customer_loan
WHERE loan_status='N'
AND credit_history=1
GROUP BY property_area
ORDER BY potential_approvals DESC;

-- Highest Approval but Lower Avg Loan (Under-Monetized Segment)
SELECT
property_area,
ROUND(AVG(loan_amount), 2) AS avg_loan_amount,
ROUND(100 * SUM(CASE WHEN loan_status='Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate
FROM customer_loan
GROUP BY property_area
ORDER BY approval_rate DESC;