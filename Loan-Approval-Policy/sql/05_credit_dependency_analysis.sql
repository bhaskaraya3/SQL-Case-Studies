-- Approval Rate by Credit History
SELECT
credit_history,
COUNT(*) AS total_applicants,
ROUND(100 * SUM(CASE WHEN loan_status='Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate
FROM customer_loan
GROUP BY credit_history;

-- % of Approved Applicants with Good Credit
SELECT
ROUND(100 * SUM(CASE WHEN credit_history=1 AND loan_status='Y' THEN 1 ELSE 0 END) /
	SUM(CASE WHEN loan_status='Y' THEN 1 ELSE 0 END),2) AS percent_approved_with_good_credit
FROM customer_loan;

-- % of Rejected Applicants with Good Credit
SELECT
ROUND(100 * SUM(CASE WHEN loan_status='N' AND credit_history=1 THEN 1 ELSE 0 END) /
	SUM(CASE WHEN loan_status='N' THEN 1 ELSE 0 END),2) AS percent_rejected_with_good_credit
FROM customer_loan;