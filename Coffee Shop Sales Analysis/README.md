# ☕ Coffee Shop Sales Analysis – SQL Project

Welcome to the **Coffee Shop Sales Analysis** project — a deep-dive SQL analysis into transaction-level retail sales data from a chain of coffee shops.  
Using advanced SQL techniques, this project answers critical business questions to uncover insights around **product performance**, **store efficiency**, **seasonality**, and **sales trends**.

---

## 📦 Dataset Overview

- 🧾 **Data**: Transactional sales data for products sold at various store locations
- 📅 **Fields**: `transaction_id`, `transaction_date`, `transaction_time`, `store_id`, `store_location`, `product_id`, `product_type`, `product_category`, `transaction_qty`, `unit_price`
- 🛒 **Source**: Simulated or anonymized dataset modeled after real-world POS (Point of Sale) systems

---

## 🧹 Data Cleaning Steps

- ✅ Converted `transaction_date` to `DATE` type using `STR_TO_DATE()`
- ✅ Standardized column names (e.g., fixed encoding issues in `transaction_id`)
- ✅ Converted `transaction_time` to `TIME` datatype
- ✅ Cleaned and normalized data for consistent querying

---

## ❓ Business Questions Answered

| Business Question                                                                 | SQL Technique(s) Used                  |
|-----------------------------------------------------------------------------------|----------------------------------------|
| 🏆 Top 5 best-selling products by quantity                                        | `SUM`, `GROUP BY`, `ORDER BY`, `LIMIT` |
| 💰 Store location with the highest revenue                                        | Aggregations, `GROUP BY`, revenue calc |
| 📈 Monthly revenue trends                                                         | `MONTHNAME()`, `ORDER BY`, case sort   |
| 🥇 Top 3 best-selling product categories in each store                            | CTE + `ROW_NUMBER()`                   |
| 💵 Average transaction size per store                                             | `AVG`, `GROUP BY`                      |
| ⏰ Hour of day with highest sales                                                 | `HOUR()`, `GROUP BY`                   |
| 🧮 Product category revenue contribution (%)                                      | Revenue share calculation              |
| 🛍️ Store with most diverse product sales                                          | `COUNT(DISTINCT)`                      |
| 💎 Products with highest revenue per unit sold                                    | `DENSE_RANK()` + arithmetic            |
| 🔁 Week-over-week, month-over-month, and quarter-over-quarter growth              | Lag functions + `GROUP BY`             |
| 📦 Slowest-selling products (by revenue)                                          | `HAVING`, `ORDER BY`                   |
| 📅 Day of week with highest and lowest sales                                      | `RANK()` with CTE                      |
| ☕ Seasonal sales patterns (e.g., Summer vs Winter)                               | `CASE`, `GROUP BY`                     |
| 💸 Distribution of unit prices across product types + quartile analysis           | `NTILE(4)`, `STDDEV`, `VARIANCE`       |
| 🧠 80/20 Pareto: Products contributing 80% revenue                                | CTE + window + cumulative percentage   |
| 📊 Compare weekday vs weekend sales across store locations                        | `CASE`, `GROUP BY`, filtering          |

---

## 💡 Insights & Observations

- **Product Sales**: A small number of products account for over **80% of total revenue**.
- **Top Categories**: Coffee, Bakery, and Tea are the **top-selling product categories** in most stores.
- **Best Time to Sell**: The **afternoon and early evening hours** drive the highest sales volume.
- **Revenue Trends**: There is noticeable **MOM and QOQ growth** in revenue, indicating healthy seasonal patterns.
- **Seasonality**: **Summer months** show a boost in cold beverages and overall sales, while **winter** peaks in warm beverages.
- **Slow-Moving SKUs**: Certain products underperform consistently and should be evaluated for discontinuation.
- **Store Efficiency**: Some stores manage a **higher average transaction value**, suggesting better upselling or pricing strategy.
- **Price Distribution**: Most product types fall within a stable price range, though some show high variance.

---

## 🧠 Advanced SQL Concepts Used

- CTEs and Subqueries  
- Window Functions (`ROW_NUMBER`, `DENSE_RANK`, `LAG`, `NTILE`)  
- Aggregations and Joins  
- Conditional Logic (`CASE`, `IFNULL`)  
- Date/Time Functions (`MONTHNAME`, `HOUR`, `WEEKDAY`, `DATE_FORMAT`)  
- Pareto Analysis using cumulative sums and percent contribution  
- Statistical calculations (`STDDEV`, `VARIANCE`)

---

## 📁 Folder Structure

```bash
coffee_shop_sales_analysis/
├── coffee_shop_sales_analysis.sql   # All SQL queries
├── dataset.csv                      # Sample dataset (if provided)
└── README.md                        # This file
