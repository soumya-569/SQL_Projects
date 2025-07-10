# 🚀 Global Space Missions Analysis – SQL Project

This project presents a comprehensive analysis of **global space missions** using SQL.  
It explores trends across companies, countries, rockets, and decades—covering everything from mission success rates to rocket retirements and cost analysis.

> 🌍 From NASA to SpaceX, this dataset helps uncover key patterns in the space race era to the commercial space exploration age.

---

## 📦 Dataset Overview

- 🎯 **Domain**: Aerospace / Space Technology  
- 🧾 **Data Source**: Curated global mission logs  
- 📅 **Time Range**: 1950s – Present  
- 🧪 **Fields**: Company, Date, Time, Rocket, Location, Price, Rocket Status, Mission Status

---

## 🧹 Data Preparation

Key cleaning steps:
- Converted `Date` and `Time` to proper formats using `STR_TO_DATE()`
- Renamed columns for standardization (`Company`, `Price`, etc.)
- Cleaned and imputed missing values in `Price` column
- Casted `Price` to `DECIMAL(5,2)` for analysis
- Applied `TRIM()` to clean string values

---

## ❓ Business Questions Answered

| Question                                                                                     | SQL Concepts Used                      |
|----------------------------------------------------------------------------------------------|----------------------------------------|
| 🛰️ How many missions has each company launched?                                              | `GROUP BY`, `COUNT()`                 |
| 📆 Which year had the most launches?                                                         | `YEAR()`, `GROUP BY`, `ORDER BY`       |
| ✅ What’s the success rate per company?                                                      | `WHERE`, `% calculation`, `GROUP BY`   |
| 💰 What are the average and most expensive mission costs?                                    | `AVG()`, `MAX()`, subqueries           |
| 🚀 Which rockets are used the most, and which are retired?                                   | `GROUP BY`, `COUNT()`, `WHERE`         |
| 📍 Which location has the most launches or highest success rate?                             | `GROUP BY`, `ORDER BY`                 |
| ❌ Which company had the highest failure rate?                                                | `WHERE`, `GROUP BY`, failure ratio     |
| 🧾 What are the monthly trends and mission counts by decade?                                 | `MONTHNAME()`, `CASE`, `GROUP BY`      |
| 🌗 How do day vs night missions differ in volume?                                            | `HOUR()`, `CASE`, `GROUP BY`           |
| 🔄 What's the success/failure ratio for **retired** rockets?                                 | `CASE`, `HAVING`, `GROUP BY`           |
| 🥇 Top 5 most expensive missions and their details                                            | `CTEs`, `ORDER BY`, `LIMIT`            |

---

## 📊 Sample Analysis Insights

- 🚀 **SpaceX, NASA, and Roscosmos** are among the top contributors in mission volume
- 📍 **Cape Canaveral (USA)** and **Baikonur Cosmodrome (Kazakhstan)** are major launchpads
- ✅ **Success rate** for most leading companies is above **85%**
- 💸 The **most expensive mission** exceeds all others in cost by a large margin (insert value here)
- 🕗 Most missions are launched **during the day** (useful for visibility & logistics)
- 📉 A small number of rockets labeled **“Retired”** contributed significantly to early space efforts

---

## 🗃️ Folder Structure

```bash
space_missions_analysis/
├── space_missions_analysis.sql   # All SQL queries for analysis
├── space_missions.csv            # Source dataset (if included)
└── README.md                     # Project documentation
