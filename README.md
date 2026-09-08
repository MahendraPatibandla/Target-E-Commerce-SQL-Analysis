# 📊 Target E-Commerce SQL Data Analysis

A SQL Server–based e-commerce data analysis project focused on extracting business insights from customer, order, order-item, and payment data.

The project analyzes customer distribution, order trends, purchasing time patterns, state-wise sales and freight values, delivery performance, and payment behavior.

---

## 📌 Project Overview

This project was developed as a data analysis case study based on an e-commerce dataset from Brazil.

The objective is to use SQL Server to explore the dataset, answer business questions, measure operational performance, and derive actionable business insights.

The analysis follows the problem statement provided for the project, covering exploratory analysis, e-commerce order evolution, economic impact, sales/freight/delivery analysis, and payment behavior.

---

## 🎯 Business Objective

The primary objective is to analyze e-commerce activity and extract valuable insights that can support business decision-making.

The analysis focuses on:

- Understanding customer distribution across Brazilian states
- Studying order trends over time
- Identifying monthly order patterns
- Understanding the time of day when customers place orders
- Measuring order price and freight values by state
- Evaluating delivery time and delivery performance
- Comparing actual delivery dates with estimated delivery dates
- Understanding payment-method and installment behavior

The project requirements specifically ask for exploratory analysis, order evolution, economic impact, delivery performance, and payment analysis. fileciteturn0file0L3-L5 fileciteturn0file0L7-L12

---

## 🛠️ Technologies Used

- **SQL Server** — database creation, querying, aggregation, joins, CTEs, date functions, and window functions
- **SQL** — data exploration and business analysis
- **GitHub** — project version control and documentation

---

## 📋 Business Questions Answered

### 1. 🔍 Exploratory Data Analysis

- What are the columns and sample records in the `customers` table?
- What is the time range between which orders were placed?
- Which cities and states are represented among customers who ordered during the selected period?

### 2. 📈 Order Trends & Customer Behavior

- Is there a growing trend in the number of orders over time?
- Is there monthly seasonality in the number of orders?
- During which time of day do Brazilian customers mostly place orders?
  - **0–6 hrs:** Dawn
  - **7–12 hrs:** Morning
  - **13–18 hrs:** Afternoon
  - **19–23 hrs:** Night

The day-part classification follows the project problem statement. fileciteturn0file0L14-L22

### 3. 🇧🇷 Evolution of E-Commerce Orders in Brazil

- What is the month-on-month number of orders?
- How are customers distributed across Brazilian states?
- How does order activity vary across states and months?

### 4. 💰 Economic Impact

- What is the percentage increase in order cost from 2017 to 2018 for January–August?
- What are the total and average order-price values for each state?
- What are the total and average freight values for each state?

The project uses `payment_value` from the payments table for the year-over-year order-cost comparison. fileciteturn0file0L26-L33

### 5. 🚚 Sales, Freight & Delivery Analysis

- How many days does each order take to be delivered?
- What is the difference between the actual and estimated delivery dates?
- Which 5 states have the highest average freight value?
- Which 5 states have the lowest average freight value?
- Which 5 states have the highest average delivery time?
- Which 5 states have the lowest average delivery time?
- Which 5 states have the fastest delivery compared with the estimated delivery date?

Delivery time is calculated using the purchase and actual delivery dates, while delivery performance is compared against the estimated delivery date. fileciteturn0file0L34-L55

### 6. 💳 Payment Analysis

- What is the month-on-month number of orders for each payment type?
- How many orders were placed for each number of payment installments?

These payment questions are part of the final section of the project problem statement. fileciteturn0file0L56-L60

---

## 📈 Key Business Insights

The SQL queries in this project are designed to identify insights in the following areas:

| Area | Insight Focus |
|---|---|
| 📦 Orders | Order growth and monthly patterns |
| 👥 Customers | Customer distribution across states |
| 🕐 Customer Behavior | Most active order-placement time |
| 💰 Payments | Payment value and year-over-year growth |
| 🛍️ Sales | State-wise order-price performance |
| 🚚 Freight | State-wise freight cost differences |
| ⏱️ Delivery | Actual delivery time by state |
| 📅 Delivery Accuracy | Actual vs. estimated delivery |
| 💳 Payment Methods | Monthly usage of different payment types |
| 💰 Installments | Order distribution by payment installments |

> **Note:** Specific numerical findings are intentionally not hard-coded here because they should come directly from the SQL query results rather than being estimated or assumed.

---

## 💡 Potential Business Recommendations

Based on the analysis results, the findings can be used to evaluate:

- States with high customer concentration and order activity
- States with unusually high freight costs
- States with longer delivery times
- States where delivery consistently beats the estimated date
- Monthly periods with higher or lower order activity
- Customer purchasing patterns throughout the day
- Payment methods with stronger customer adoption
- Installment patterns that may influence purchasing behavior

These findings can help identify opportunities for improving logistics, delivery performance, customer experience, and payment strategies.

---

## 🧠 SQL Concepts Demonstrated

This project demonstrates practical SQL Server concepts including:

- `SELECT`
- `TOP`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `JOIN`
- `INNER JOIN`
- Aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`
- `DISTINCT`
- `YEAR()`
- `MONTH()`
- `DATEPART()`
- `DATEDIFF()`
- `CAST()`
- Common Table Expressions (`WITH`)
- Window functions such as `LEAD()`
- Conditional filtering
- Date-based analysis
- State-wise aggregation
- Month-on-month analysis

---

## 🗂️ Project Structure

```text
Target-E-Commerce-SQL-Analysis/
│
├── 📁 Data/
│   └── E-commerce dataset files
│
├── 📄 Target_SQLQuery.sql
│
├── 📄 Target - Problem Statement.pdf
│
└── 📄 README.md
```

---

## 🚀 How to Run the Project

### Step 1: Install SQL Server

Install and configure **Microsoft SQL Server** and a compatible SQL client such as SQL Server Management Studio.

### Step 2: Create the Database

Run the database creation statements from:

```text
Target_SQLQuery.sql
```

The project creates and uses the database:

```text
Target_SQL
```

### Step 3: Import the Dataset

Import the required e-commerce CSV/data files into the database.

The SQL queries expect tables including:

- `customers`
- `orders`
- `order_items`
- `payments`
- `geolocation`

### Step 4: Execute the SQL Queries

Run the queries in `Target_SQLQuery.sql` section by section.

Review the returned results to answer the business questions and identify insights.

---

## 📊 Analysis Workflow

```text
Raw E-Commerce Data
        ↓
Database Creation
        ↓
Data Import
        ↓
Exploratory Analysis
        ↓
Order & Customer Analysis
        ↓
Sales & Freight Analysis
        ↓
Delivery Performance Analysis
        ↓
Payment Analysis
        ↓
Business Insights
        ↓
Recommendations
```

---

## 📚 Learning Outcomes

Through this project, I practiced:

- Translating business questions into SQL queries
- Working with relational e-commerce datasets
- Joining multiple tables
- Performing aggregations and grouped analysis
- Working with dates and timestamps
- Calculating delivery durations
- Comparing actual and estimated delivery dates
- Using CTEs for multi-step analysis
- Using window functions for year-over-year comparison
- Extracting business insights from raw data

---

## 🔮 Future Improvements

Potential improvements for this project include:

- Creating an interactive **Power BI dashboard**
- Adding visualizations for sales, customers, freight, and delivery performance
- Adding more advanced customer segmentation
- Performing product-level analysis
- Building KPI dashboards for business monitoring
- Adding deeper profitability and logistics analysis

---

## 📌 Project Highlights

- 🛒 E-commerce business analysis
- 🇧🇷 Brazil-focused customer and order analysis
- 🗄️ SQL Server database analysis
- 📈 Time-series and monthly order analysis
- 💰 Sales and payment analysis
- 🚚 Freight and delivery performance analysis
- 🧠 Business-question-driven SQL analysis
- 📊 Practical data analytics portfolio project

---

## 🎓 Resume Description

**Target E-Commerce SQL Data Analysis** — Analyzed a Brazilian e-commerce dataset using SQL Server to investigate customer distribution, order trends, sales, freight costs, delivery performance, and payment behavior. Applied joins, aggregations, date functions, CTEs, and window functions to answer business questions and derive actionable insights.

---

## 👨‍💻 Skills Demonstrated

**SQL • SQL Server • Data Analysis • Exploratory Data Analysis • Business Analysis • Data Cleaning & Transformation • Aggregation • Joins • CTEs • Window Functions • Date & Time Analysis • E-Commerce Analytics**

---

## 🙏 Acknowledgement

This project was completed as a practical SQL data-analysis case study based on the provided Target e-commerce problem statement.
