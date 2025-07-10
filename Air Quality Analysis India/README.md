# 🌫️ Air Quality in India – SQL Analysis Project

This project explores **air quality trends and pollution patterns across Indian cities** using structured SQL queries. The dataset contains information on pollutant levels (PM10, PM2.5, NO₂, SO₂, Ozone), air quality index classifications, and time-based data (date, time period, city, etc.).

> 🔍 This project was developed to answer business-critical and environmentally important questions using **pure SQL** — without any third-party analytical tools.

---

## 📦 Dataset Details

- 📍 **Source:** Assumed real-world air quality monitoring dataset (public/government source or simulated)
- 🏙️ **Coverage:** Multiple Indian cities
- 📅 **Time Span:** Multi-year period, suitable for trend analysis
- 🌡️ **Pollutants Tracked:** PM10, PM2.5, NO₂, SO₂, Ozone
- 📊 **Metrics Available:** Raw pollutant data, city, time, air quality label, etc.

---

## 🧹 Data Cleaning Steps

Performed within SQL before analysis:
- Reformatted date using `STR_TO_DATE()`
- Standardized column names (`air_quality`, `data_value`, `city`, etc.)
- Converted date column to `DATE` datatype
- Renamed ambiguous headers (e.g., `Unique ID` → `unique_id`, `Time Period` → `time_period`)

---

## ❓ Key Business Questions Answered

### 🏆 Top-Level Insights:

| Question                                                                 | Method |
|--------------------------------------------------------------------------|--------|
| What are the top 5 most polluted cities by PM10 levels?                 | `AVG + GROUP BY + ORDER` |
| Yearly trend of NO₂ levels in Delhi?                                    | `YEAR(), WHERE, ORDER` |
| Which city improved air quality most over time?                         | `GROUP BY city, year, air_quality` |
| Which cities exceed safe limits most often?                             | `CASE + COUNT + GROUP BY` |
| Correlation between NO₂ and PM10?                                       | `VIEWS + AGGREGATION + CORRELATION` |
| How do pollution levels vary by weekday vs weekend?                     | `DAYOFWEEK(), CASE` |
| Monthly PM10 trends in the most polluted city?                          | `WITH + HAVING + MONTHNAME()` |
| Year with the worst pollution per city?                                 | `AVG + ORDER BY` |
| Percentage increase in pollution over the years?                        | `WITH + JOIN + ARITHMETIC` |

---

## 📌 Interesting SQL Concepts Used

- ✅ Views (`CREATE VIEW`)
- ✅ Common Table Expressions (CTEs)
- ✅ Window Functions (`RANK`, `ROW_NUMBER`)
- ✅ Aggregations & Grouping
- ✅ String Filtering with `LIKE`
- ✅ Date and Time manipulation
- ✅ Correlation Calculation using SQL math
- ✅ Conditional logic (`CASE`, `IF`, `HAVING`)

---

## 💡 Key Insights

- **Delhi, Kanpur, and Varanasi** repeatedly rank among the most polluted cities based on PM10 averages.
- **NO₂ levels in Delhi** show clear seasonal patterns and annual fluctuation.
- **Weekend vs Weekday pollution** reveals slight differences, especially in urban areas.
- **Cities like Pune** have shown measurable improvement in air quality over the years.
- **PM10 and NO₂** are moderately correlated, suggesting they often spike together.
- Some cities show a **50–80% rise in pollution** over the last decade.
- **“Very Poor” and “Severe”** conditions are mostly linked to PM10 and NO₂ levels.
- The **most frequent pollutant recorded** across all cities is PM10.

---

## 📁 Project Structure

```bash
air_quality_analysis_india/
├── air_quality_analysis.sql      # Contains all queries listed above
├── dataset.csv                   # Raw dataset used for analysis
└── README.md                     # You're here!
