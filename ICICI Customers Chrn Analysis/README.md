# 🏦 ICICI Bank Customer Churn Analysis – SQL Project

This project performs a deep-dive analysis of **customer churn behavior** at ICICI Bank using structured SQL queries.  
The goal is to understand **why customers leave the bank**, identify **key risk segments**, and explore relationships between churn and demographics, tenure, income, credit score, and more.

> 🔍 This analysis enables stakeholders to make data-driven decisions about retention strategies, credit risk policies, and customer engagement efforts.

---

## 📦 Dataset Overview

- 🧾 **Data Source**: Simulated ICICI Bank customer data  
- 👥 **Records**: 10,000+ customers  
- 📊 **Features**: Age, Gender, Geography, Credit Score, Tenure, Balance, Products, Estimated Salary, Exited Status, etc.

---

## 🧹 Data Preparation

- Converted columns like `Age` into age groups for segment analysis
- Calculated churn metrics using conditional aggregations
- Created views for correlation analysis
- Applied SQL transformations for demographic categorization and trend discovery

---

## ❓ Business Questions Answered

| Key Questions                                                                                 | SQL Techniques Used                      |
|-----------------------------------------------------------------------------------------------|-------------------------------------------|
| ✅ What is the overall churn rate?                                                             | `COUNT`, `WHERE`, percentage calculation |
| 👥 What is churn distribution by gender, age group, and geography?                             | `CASE`, `GROUP BY`, `WITH` CTE           |
| 💸 Who are the high-value customers based on balance?                                          | `ORDER BY`, `LIMIT`                      |
| 🕓 How does tenure influence churn?                                                            | `GROUP BY`, `ORDER BY`                   |
| 💳 What percentage of churned customers had a credit card?                                     | `CASE`, `GROUP BY`                       |
| 🌍 Which region has the highest churn?                                                         | `GROUP BY`, `ORDER BY`                   |
| 💰 What’s the average balance of churned vs non-churned customers?                             | `CASE`, `AVG`                            |
| 📦 How does the number of products relate to churn probability?                                | `GROUP BY`, `PERCENTAGE`                 |
| 🧾 What is the income profile of churned customers?                                             | `AVG`                                    |
| 📉 Is there a correlation between credit score and churn rate?                                 | `VIEW`, `STDDEV`, correlation formula    |
| 💵 Do high salary customers churn more or less?                                                | `CASE`, `GROUP BY`, salary ranges        |
| 🔁 How does product holding impact churn risk (cross-sell analysis)?                           | `GROUP BY`, `ORDER BY`                   |
| 🏆 Are loyal (tenured) customers less likely to churn?                                         | `GROUP BY`, trend calculation            |
| 👶 Which age group is most at risk for churn?                                                  | `AGE GROUP`, `PERCENTAGE`, `ORDER BY`    |

---

## 💡 Insights & Key Findings

- 🔻 **Overall Churn Rate**: X% (replace with your actual result)
- 🚺 **Females** churned at a higher rate than males
- 🌍 **Germany** had the **highest regional churn**, indicating location-based service dissatisfaction
- 💳 **Credit card holders** were *less likely* to churn compared to non-card holders
- 💰 **High balance customers** are valuable, but not immune to churn
- 🧾 Customers with **more than 2 products** have a higher churn risk, indicating poor cross-sell satisfaction
- 🎯 **Middle-aged groups (30–50)** churned the most, showing a key retention opportunity
- 📉 There is a *weak-to-moderate negative correlation* between **credit score and churn** (indicating financial risk)
- 💵 **Salary alone** is not a strong predictor — both low and high-income customers churned

---

## 📁 Project Structure

```bash
icici_churn_analysis/
├── icici_churn_analysis.sql   # SQL scripts containing queries
├── dataset.csv                # Source data (if included)
└── README.md                  # This documentation file
