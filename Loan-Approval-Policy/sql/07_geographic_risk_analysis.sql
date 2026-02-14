-- Approval Rate by Property Area
SELECT
property_area,
COUNT(*) AS total_applicants,
ROUND(100 * SUM(CASE WHEN loan_status='Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate
FROM customer_loan
GROUP BY property_area;

-- Approval Rate by Property Area (Credit Controlled)
SELECT
property_area,
ROUND(100 * SUM(CASE WHEN loan_status='Y' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate
FROM customer_loan
WHERE credit_history=1
GROUP BY property_area;

-- Segment with Highest Rejection Risk
SELECT
property_area,
dependents,
ROUND(100 * SUM(CASE WHEN loan_status='N' THEN 1 ELSE 0 END) / COUNT(*), 2) AS rejection_rate
FROM customer_loan
GROUP BY property_area, dependents
ORDER BY rejection_rate DESC
LIMIT 5;