-- Overall Loan Approval Rate
SELECT
COUNT(*) AS total_applications,
SUM(CASE WHEN loan_status = 'Y' THEN 1 ELSE 0 END) AS total_approved,
ROUND(100 * SUM(CASE WHEN loan_status = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_percent
FROM customer_loan;

-- Average Loan Amount (Approved vs Rejected)
SELECT
loan_status,
ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM customer_loan
GROUP BY loan_status;

-- Average Loan-to-Income Ratio by Approval Status
SELECT
loan_status,
ROUND(AVG(loan_amount / (applicant_income + coapplicant_income)), 4) AS avg_lti_ratio
FROM customer_loan
GROUP BY loan_status;

-- Approval Rate by Income Quartile
SELECT
    CASE
	WHEN applicant_income < 2500 THEN 'Q1_Low'
	WHEN applicant_income BETWEEN 2500 AND 4000 THEN 'Q2_MidLow'
	WHEN applicant_income BETWEEN 4000 AND 6000 THEN 'Q3_MidHigh'
	ELSE 'Q4_High'
END AS income_quartile,
ROUND(100 * SUM(CASE WHEN loan_status='Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate
FROM customer_loan
GROUP BY income_quartile;