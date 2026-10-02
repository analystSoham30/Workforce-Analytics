# Workforce-Analytics

An end-to-end workforce analytics pipeline engineered using Python (EDA and data normalization), MySQL (relational views and business queries), and Power BI (3-page executive dashboard) across 100,000 employee records. The primary objective is to evaluate key organizational dynamics by diagnosing frontline attrition spikes (~42% in Sales, Marketing, and Support vs. ~12–13% in back-office roles), auditing compensation equity—highlighting a ~₹20.3K/month exit salary gap and a pay-for-performance disconnect—and evaluating overall workforce satisfaction alongside strong company-wide gender pay parity.

## Dashboard preview - 

1. Overview and attrition analysis

<img width="1327" height="749" alt="HR analytics - 1" src="https://github.com/user-attachments/assets/d0ed96cf-69b1-4569-9615-61645839c4ef" />

2. Compensation and performance analysis

<img width="1326" height="749" alt="HR analytics - 2" src="https://github.com/user-attachments/assets/b5411cb7-d3f5-471c-9852-7c488b791307" />

3. Workload and satisfaction analysis

<img width="1324" height="749" alt="HR analytics - 3" src="https://github.com/user-attachments/assets/6ee8ede0-3ee8-40aa-b07d-f0ec501846de" />

## Tech stack -
* Excel – Data source and initial data preparation
* Python - Data cleaning, handling missing values and necessary data imputation
* MySQL – Analysis queries and view creation
* Power BI – Data modeling, DAX measure creation, and interactive 3-page executive dashboard

## Repository Architecture - 
-**/Raw and normalised data/**: original database used for the analysis.

-**/SQL scripts/**: MySQL scripts used for analysis, view creation.

-**/Python scripts/**: Python scripts used for data cleaning, data imputation.

-**/PowerBI Dashboard/**: Data visualization and dashboard creation.

## Key business insights - 

#### 1. Departmental & Demographic Attrition Hotspots
* **Frontline Department Churn Spike:** Attrition is heavily concentrated in Marketing (42.1%), Sales (41.6%), and Customer Support (41.4%)—nearly 3x higher than back-office functions like Legal (12.5%) and Finance (13.4%), signaling severe operational strain in customer-facing roles.
* **PhD Demographic Flight Risk:** While overall gender attrition is balanced across the company (~28.3% Female vs. 28.1% Male), PhD Males exhibit the highest demographic attrition rate at 30.0% (vs. 25.9% for PhD Females), pointing toward potential role underutilization or skill mismatch for highly educated male staff.
* **Mid-Tier Tech/Ops Baseline:** Core operational and technical departments—Engineering (23.1%), IT (22.9%), and Operations (22.7%)—show consistent, mid-level turnover (~23%), reflecting industry-standard talent poaching rather than acute departmental issues.

#### 2. Compensation & Performance
* **The Retention Salary Gap:** Resigned employees earned a significantly lower average salary prior to leaving (₹1,25,468/month) compared to active employees (₹1,45,795/month)—a ~₹20,300/month pay gap indicating below-market compensation as a key exit driver.
* **Pay-for-Performance Disconnect:** Monthly salary shows zero positive correlation with annual performance ratings. Top performers (Rating 5) average ₹1,39,859/month, virtually identical to low performers (Rating 1) at ₹1,44,085/month, proving base pay is governed strictly by job title hierarchy rather than merit.
* **Promotion Cadence Cuts Attrition:** Employees with zero promotions experience a 36.2% attrition rate, which drops steeply to 25.1% with 1 promotion and 20.1% with 2 promotions (active staff average 1.27 promotions vs. 0.77 for departed staff).

#### 3. Workload, Satisfaction & Workforce Diversity
* **Strong Gender Pay Parity Across Roles:** Monthly compensation shows near-perfect gender pay equity across the organization (₹1,40,587/month for Females vs. ₹1,39,628/month for Males), with pay parity maintained within a tight ~1% variance across all job title tiers (e.g., Female Sr. Managers at ₹3,96,242 vs. Male Sr. Managers at ₹3,92,307).
* **Engagement Score Exit Inelasticity:** Self-reported employee satisfaction scores remain overall uniform between active (3.49 / 5.0) and resigned (3.48 / 5.0) cohorts, proving that survey engagement metrics are a poor standalone predictor of exit intent compared to tangible drivers like salary gaps and promotion delays.
* **Equitable Diversity & Flexible Work Baselines:** The workforce maintains a consistent 55% Male / 45% Female ratio across departments and education tiers. Furthermore, working arrangements (70% On-site, 15% Hybrid, 15% Fully Remote) show equal satisfaction (~3.48/5.0) and attrition (~28.2%), indicating fair policy implementation across work locations.


## Strategic recommendations - 

#### Attrition Interventions
* **Targeted Frontline Retention Programs:** Implement departmental retention interventions (such as stay-interviews, mid-year check-ins, and performance incentives) specifically for Marketing, Sales, and Customer Support to address their ~42% attrition rate compared to back-office functions (~12–13%).
* **Structured 18–24 Month Promotion Pathways:** Institute clear, time-bound career progression benchmarks to transition unpromoted employees into structured promotion tracks, targeting a reduction in their 36.2% attrition rate down toward the ~20% range seen among multi-promoted staff.

#### Compensation Optimization
* **Proactive Market Salary Alignments:** Conduct bi-annual market salary benchmarks to eliminate the ~₹20,300/month pay gap between active (₹1.46L/month) and departing (₹1.25L/month) employees before below-market pay triggers exit decisions.
* **Pay-for-Performance Merit Structure:** Uncouple salary bands strictly from job title hierarchies and introduce performance-tiered merit increases, ensuring top performers (Ratings 4 & 5) are financially incentivized over low performers (Rating 1).

#### Workload & Satisfaction
* **Operational Rebalancing & Risk Tracking:** Cap parallel project assignments for heavy operational roles (Technicians and Analysts) while shifting primary attrition-risk modeling away from static satisfaction scores (which show near-zero exit variance) toward operational metrics like project overload and promotion delays.
