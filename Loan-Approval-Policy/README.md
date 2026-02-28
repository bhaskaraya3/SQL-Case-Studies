# 📊 Loan Approval Policy Risk & Growth Audit

---

## 📝 *Project Overview*

This project analyzes a bank’s loan approval dataset (**614 applications**) to evaluate:

1. *Underwriting policy strictness*
2. *Credit history dependency*
3. *Financial risk thresholds*
4. *Geographic approval bias*
5. *Missed revenue opportunities*

The objective was not just exploratory analysis —  
it was to **audit underwriting decisions** and **simulate policy improvements**.

---

## 🎯 *Business Objective*

> **Is the bank’s loan approval policy optimally balancing risk and growth?**

Specifically:

1. *Are we over-relying on credit history?*
2. *Are financially strong applicants being rejected?*
3. *Is there geographic bias?*
4. *Can approval thresholds be relaxed without significantly increasing risk?*

---

## 📊 *Dataset Structure*

The dataset was normalized into relational tables:

1. `customers`
2. `income_details`
3. `loan_details`
4. `property_details`
5. `customer_loan` *(consolidated analytical view)*

**Total Applications:** `614`

**Target Variable:**  
`loan_status → Approved (Y) / Rejected (N)`

---

## 🔍 *Key Analyses Performed*

### 1️⃣ Overall Approval Rate

Measured portfolio approval ratio to understand risk appetite.

**Insight:**  
The bank operates with a *moderate approval rate*, indicating a conservative but not restrictive risk posture.

---

### 2️⃣ Credit History Dependency Analysis

Evaluated approval rates grouped by credit history.

**Findings:**

1. Majority of approved applicants had *good credit history*.
2. Very low approval when `credit_history = 0`.
3. ~95% of approvals linked to positive credit history.

**Strategic Insight:**  
The underwriting system is heavily dependent on historical repayment behavior.

**Risk:**

1. First-time borrowers likely excluded.
2. Competitive vulnerability to lenders using alternative scoring models.

---

### 3️⃣ Loan-to-Income (LTI) Threshold Analysis

Calculated loan-to-income ratio buckets and approval rates.

**Findings:**

1. Rejection probability increases sharply beyond LTI ~0.30–0.40.
2. Indicates implicit policy cutoff.

**Strategic Insight:**  
The bank likely operates on an informal LTI risk boundary.

**Opportunity:**  
Recalibrating the threshold may increase approvals with limited incremental risk.

---

### 4️⃣ Strong Financial Applicants Rejected

Measured rejected applicants who had:

1. Good credit history
2. Low LTI ratio

**Finding:**  
A non-trivial percentage of financially strong applicants were rejected.

**Interpretation:**  
The approval system may be overly conservative due to rule stacking.

**Growth Opportunity:**  
Reassessing these cases could unlock incremental revenue.

---

### 5️⃣ High-Income Rejection Analysis

Identified rejected applicants with above-average income.

**Insight:**  
Income alone is not a dominant approval factor.

**Interpretation:**  
Credit history and financial ratios outweigh absolute income strength.

---

### 6️⃣ Geographic Approval Variation

Compared approval rates across:

1. Urban
2. Semiurban
3. Rural

Controlled for credit history to isolate geographic impact.

**Findings:**

1. Semiurban → Highest approval rate
2. Rural → Lower approval even after controlling for credit history

**Interpretation:**  
Approval differences may reflect structural risk differences or conservative geographic policy.

**Recommendation:**  
Conduct deeper rural risk analysis to determine if bias or true default risk exists.

---

### 7️⃣ Income Elasticity (Quartile Analysis)

Segmented applicants into income quartiles.

**Insight:**  
Approval does not scale linearly with income.  
Financial ratios matter more than absolute income.

---

### 8️⃣ Policy Simulation: LTI < 0.35 Qualification

Simulated scenario:

If approval restricted to applicants with `LTI < 0.35`.

**Result:**  
Identified percentage of total applicants qualifying as "financially safe".

**Strategic Use:**  
This threshold can be used to design a structured tier-based approval system.

---

## 🧠 *Key Strategic Conclusions*

1. **Credit-History Dominant System**
2. **Implicit LTI Threshold Drives Rejections**
3. **Possible Over-Conservatism**
4. **Semiurban Segment Shows Growth Strength**
5. **Rural Segment Requires Policy Audit**

---

## 💼 *Recommendations*

1. Reduce dependency on credit history by integrating alternative scoring metrics.
2. Re-evaluate LTI threshold using simulated portfolio impact analysis.
3. Introduce risk-tier-based underwriting instead of binary cutoff.
4. Audit rural rejection patterns for structural bias.
5. Create a dedicated scoring model for first-time borrowers.

---

## 📈 *Business Impact Potential*

If approval policy is optimized:

1. Increase approval rate without significant default increase.
2. Capture underserved borrower segments.
3. Improve competitive positioning.
4. Expand into Semiurban growth markets.

---

## 🛠 *Tools Used*

1. **MySQL** (Policy Analysis & Segmentation)
2. **SQL Window Functions**
3. **Conditional Aggregations**
4. **Financial Ratio Engineering (LTI Analysis)**

---

## 🚀 *Project Value*

This project demonstrates:

1. Policy auditing mindset
2. Threshold detection
3. Risk segmentation
4. Growth opportunity identification
5. Strategic decision simulation

> This is not just descriptive analysis —  
> it is a **Loan Underwriting Risk Audit Framework**.

---

## 👤 Author

**Bhaskar Arya**

---

## 🔖 Hashtags

#DataAnalytics  
#SQL  
#BankingAnalytics  
#RiskManagement  
#CreditRisk  
#FinancialModeling  
#Underwriting  
#BusinessAnalytics  
#PortfolioAnalysis  
#PolicyAudit  
#DataSciencePortfolio  
#MySQL  
#LoanApproval  
#GrowthStrategy  