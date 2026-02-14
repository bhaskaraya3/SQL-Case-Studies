Loan Approval Policy Risk & Growth Audit

# Project Overview
This project analyzes a bank’s loan approval dataset (614 applications) to evaluate:
-Underwriting policy strictness
-Credit history dependency
-Financial risk thresholds
-Geographic approval bias
-Missed revenue opportunities

The objective was not just to perform exploratory analysis, but to audit underwriting decisions and simulate policy improvements.

# 🎯 Business Objective
To answer:
Is the bank’s loan approval policy optimally balancing risk and growth?

Specifically:
Are we over-relying on credit history?
Are financially strong applicants being rejected?
Is there geographic bias?
Can approval thresholds be relaxed without significantly increasing risk?

📊 Dataset Structure
The dataset was normalized into relational tables:
customers
income_details
loan_details
property_details
customer_loan (consolidated view)

Total Applications: 614

Target Variable:
loan_status → Approved (Y) / Rejected (N)

🔍 Key Analyses Performed

1️⃣ Overall Approval Rate
Measured portfolio approval ratio to understand risk appetite.

📌 Insight:
The bank operates with a moderate approval rate, indicating a conservative but not restrictive risk approach.

2️⃣ Credit History Dependency Analysis
Evaluated approval rates grouped by credit history.

📌 Findings:
Majority of approved applicants had good credit history.
Very low approval when credit history = 0.
~95% of approvals linked to positive credit history.

📌 Strategic Insight:
The underwriting system is heavily dependent on credit history, suggesting limited flexibility in evaluating alternative borrower signals.

⚠️ Risk:
First-time borrowers likely excluded.
Competitive vulnerability to lenders using alternative scoring models.

3️⃣ Loan-to-Income (LTI) Threshold Analysis
Calculated loan-to-income ratio buckets and approval rates.

📌 Findings:
Rejection probability increases sharply beyond certain LTI threshold (~0.30–0.40).
Indicates implicit policy cutoff.

📌 Strategic Insight:
The bank likely operates on an informal LTI risk boundary.

💡 Opportunity:
Recalibrating the threshold may increase approvals with limited incremental risk.

4️⃣ Strong Financial Applicants Rejected
Measured percentage of rejected applicants who had:
Good credit history
Low LTI ratio

📌 Finding:
A non-trivial percentage of financially strong applicants were rejected.

📌 Interpretation:
The approval system may be overly conservative due to rule stacking.

💰 Growth Opportunity:
Reassessing these cases could unlock incremental revenue.

5️⃣ High-Income Rejection Analysis
Identified rejected applicants with above-average total income.

📌 Insight:
Income alone is not a dominant approval factor.

📌 Interpretation:
Credit history and ratio thresholds outweigh income strength.

6️⃣ Geographic Approval Variation
Compared approval rates across:
Urban
Semiurban
Rural

Controlled for credit history to isolate geographic impact.

📌 Findings:
Semiurban showed highest approval rate.
Rural showed lower approval even after controlling for credit history.

📌 Interpretation:
Approval differences may reflect either structural risk differences or conservative geographic policy.

📌 Recommendation:
Conduct deeper rural risk analysis to determine if bias or true default risk exists.

7️⃣ Income Elasticity (Quartile Analysis)
Segmented applicants into income quartiles.

📌 Insight:
Approval does not scale linearly with income.
Financial ratios matter more than absolute income.

8️⃣ Policy Simulation: LTI < 0.35 Qualification
Simulated scenario:
If approval restricted to applicants with LTI < 0.35.

📌 Result:
Identified % of total applicants qualifying as "financially safe".

📌 Strategic Use:
This threshold can be used to design structured tier-based approval system.

🧠 Key Strategic Conclusions
1️⃣ The Bank is Credit-History Dominant
The model heavily depends on past repayment behavior rather than adaptive financial indicators.

2️⃣ Implicit LTI Threshold Drives Rejections
Financial ratio appears to be a hidden approval boundary.

3️⃣ Possible Over-Conservatism
Financially strong applicants are being rejected, indicating room for recalibration.

4️⃣ Semiurban Segment Shows Growth Strength
Highest approval performance; potential expansion zone.

5️⃣ Rural Segment Requires Policy Audit
Lower approval even after credit control suggests structural caution.

💼 Recommendations

Reduce dependency on credit history by integrating alternative scoring metrics.
Re-evaluate LTI threshold using simulated portfolio impact analysis.
Introduce risk-tier-based underwriting instead of binary cutoff.
Audit rural rejection patterns for structural bias.
Create dedicated scoring model for first-time borrowers.

📈 Business Impact Potential

If approval policy is optimized:
Increase in approval rate without significant default increase.
Capture underserved borrower segments.
Improve competitive positioning.
Expand into Semiurban growth markets.

🛠 Tools Used

MySQL (Policy Analysis & Segmentation)
SQL Window Functions & Conditional Aggregations
Financial Ratio Engineering (LTI Analysis)

🚀 Project Value

This project demonstrates:
-Policy auditing mindset
-Threshold detection
-Risk segmentation
-Growth opportunity identification
-Strategic decision simulation

This is not just descriptive analysis —
it is a loan underwriting risk audit framework.

# Author
Bhaskar Arya