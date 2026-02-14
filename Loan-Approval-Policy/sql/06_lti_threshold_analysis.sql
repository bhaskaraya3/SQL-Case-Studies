-- LTI Bucket Approval Rates
SELECT
CASE
	WHEN (loan_amount/(applicant_income+coapplicant_income)) < 0.2 THEN 'Low_Risk'
	WHEN (loan_amount/(applicant_income+coapplicant_income)) BETWEEN 0.2 AND 0.4 THEN 'Moderate_Risk'
	ELSE 'High_Risk'
END AS lti_bucket,
COUNT(*) AS total_applicants,
ROUND(100 * SUM(CASE WHEN loan_status='Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate
FROM customer_loan
GROUP BY lti_bucket;

-- % of Rejected Applicants with Strong Financials
SELECT
ROUND(100 * COUNT(*)/(SELECT COUNT(*) FROM customer_loan WHERE loan_status='N'),2) AS percent_strong_financial_rejected
FROM customer_loan
WHERE loan_status='N'
AND (loan_amount/(applicant_income+coapplicant_income)) < 0.3
AND credit_history=1;

-- % of Applicants Qualifying if LTI < 0.35
SELECT
ROUND(100 * COUNT(*) /(SELECT COUNT(*) FROM customer_loan),2) AS percent_safe_applicants
FROM customer_loan
WHERE (loan_amount/(applicant_income+coapplicant_income)) < 0.35;