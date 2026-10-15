# Pizza Sales Analysis with SQL

> A relational SQL project for analyzing pizza orders, product mix, order timing, and revenue contribution for sales reporting.

![SQL](https://img.shields.io/badge/SQL-MySQL--style-blue)
![Data](https://img.shields.io/badge/Data-CSV-lightgrey)
![Status](https://img.shields.io/badge/Status-Analysis%20documented-yellow)

## 📌 Table of Contents

- [Overview](#-overview)
- [Problem Statement](#-problem-statement)
- [Objectives](#-objectives)
- [Features](#-features)
- [Dataset](#-dataset)
- [Tech Stack](#-tech-stack)
- [Project Workflow](#-project-workflow)
- [Repository Structure](#-repository-structure)
- [Installation](#-installation)
- [Usage](#-usage)
- [Results and Insights](#-results-and-insights)
- [Screenshots](#-screenshots)
- [Challenges and Solutions](#-challenges-and-solutions)
- [Limitations](#-limitations)
- [Future Improvements](#-future-improvements)
- [What I Learned](#-what-i-learned)
- [Author](#-author)
- [License](#-license)

## 📖 Overview

This project uses relational CSV tables and SQL views to analyze pizza orders, order-line quantities, product sizes, categories, and prices. It is intended for practicing practical SQL analysis and converting business questions into repeatable queries.

## 🎯 Problem Statement

A pizza business needs to understand order volume, product demand, peak ordering times, and revenue contribution to support menu and operational decisions. These questions require joining order-level and product-level data without double-counting records.

## 🎯 Objectives

- Analyze orders by date and hour.
- Identify popular sizes, pizza types, and categories.
- Calculate sales revenue and cumulative revenue using consistent formulas.
- Practice joins, aggregations, views, and ranking/window functions.

## ✨ Features

- SQL views for overall order and revenue summaries.
- Product and category rankings by quantity and revenue.
- Hourly and daily order analysis.
- Cumulative daily revenue and top-three pizza rankings within categories.

## 📂 Dataset

| File | Verified records | Columns | Key fields |
|---|---:|---:|---|
| `orders.csv` | 21,350 | 3 | `order_id`, `date`, `time` |
| `pizzas.csv` | 96 | 4 | `pizza_id`, `pizza_type_id`, `size`, `price` |
| `pizza_types.csv` | 32 | 4 | `pizza_type_id`, `name`, `category`, `ingredients` |
| `order_details.csv` | Not verified | Not verified | Order-line data expected by the SQL |

The `orders.csv` records cover 2015-01-01 through 2015-12-31. The source URL and dataset reuse terms are not documented in the repository. The order-details file could not be profiled in this audit, so total line-item count and sales results are not claimed.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| SQL (MySQL-style syntax) | Querying, joining, aggregation, views and ranking |
| CSV | Source tables |
| Window functions | Cumulative totals and category rankings |

## 🔄 Project Workflow

1. Inspect each CSV header and data type.
2. Import the four tables into a SQL database.
3. Validate primary/foreign-key relationships and order-line grain.
4. Run the SQL views for order, product, category, and time analysis.
5. Reconcile revenue calculations against line-item quantities and pizza prices.
6. Record query outputs before publishing business findings.

## 🗂️ Repository Structure

```text
pizza-sales-report/
├── orders.csv
├── order_details.csv
├── pizzas.csv
├── pizza_types.csv
├── pizzahut.sql
└── README.md
```

## ⚙️ Installation

### Prerequisites

- MySQL or another engine compatible with the script after syntax adjustments
- Git
- A CSV import method supported by the chosen database

### Setup

```bash
git clone https://github.com/sahil2003-ai/pizza-sales-report.git
cd pizza-sales-report
```

Create a database and import the CSVs using your database client. No Python dependency file is required for the SQL workflow.

## ▶️ Usage

1. Inspect `pizzahut.sql`.
2. Import the CSVs and confirm actual table/column names.
3. Adjust identifiers in the script to match the imported schema.
4. Execute the SQL and inspect each view.
5. Export query outputs if you want reproducible result tables.

## 📊 Results and Insights

### Verified dataset metrics

- 21,350 order records.
- 96 pizza SKU/size records.
- 32 pizza-type records.
- Order dates span one calendar year, 2015.

### Analysis implemented

The SQL script defines analyses for order count, estimated revenue, highest-priced pizza, popular size, top pizza types by quantity, hourly order counts, average pizzas per day, category revenue, cumulative daily revenue, and top-three pizza types per category.

**Numerical query outcomes are not reported as verified** because the order-details data and exact imported schema were not confirmed and the SQL was not executed successfully against a validated database.

## 🖼️ Screenshots

No verified query-result screenshots or exported result tables were found in the reviewed repository inventory. Add genuine screenshots after running the SQL.

## 🧩 Challenges and Solutions

| Challenge | Approach |
|---|---|
| CSV table names and SQL identifiers may differ | Confirm schema and update identifiers before execution |
| Revenue can be double-counted by incorrect joins | Validate join keys and compare line-level calculations |
| Query definitions alone do not prove findings | Save query outputs and document calculation definitions |

## ⚠️ Limitations

- `order_details.csv` row count and schema were not verified in this review.
- SQL contains identifiers such as `orders_details`, `order_date`, `order_time`, and `quatity` that may not match the CSV headers.
- Source provenance and license are not documented.
- No revenue or product ranking is claimed without executed query results.

## 🚀 Future Improvements

- [ ] Correct and validate all SQL table/column identifiers.
- [ ] Add a schema or database setup script.
- [ ] Export verified KPI and ranking tables.
- [ ] Add screenshots of actual query results and explain business implications.

## 📚 What I Learned

- Translating business questions into SQL queries.
- Joining order and product tables at the correct grain.
- Using aggregations, views, and window functions.
- Why data validation is essential before presenting revenue claims.

## 👤 Author

**Sahil Gaikwad**

- GitHub: [sahil2003-ai](https://github.com/sahil2003-ai)
- LinkedIn: [Sahil Gaikwad](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)

## 📄 License

A project-specific license and source-dataset license were not verified in this review. Confirm both before redistributing the data.
