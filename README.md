# Pizza Sales Analysis with SQL

An SQL analytics project exploring pizza orders, order-line quantities, pizza sizes, product categories, and revenue contribution. The repository includes CSV source tables and SQL scripts for relational analysis.

![SQL](https://img.shields.io/badge/SQL-Analytics-blue)
![Dataset](https://img.shields.io/badge/Data-CSV-lightgrey)
![Focus](https://img.shields.io/badge/Focus-Sales%20Analytics-orange)

## Contents
- [Project Overview](#project-overview)
- [Business Questions](#business-questions)
- [Dataset](#dataset)
- [Analysis Workflow](#analysis-workflow)
- [Results and Metrics](#results-and-metrics)
- [Technology Stack](#technology-stack)
- [Repository Structure](#repository-structure)
- [Run the SQL](#run-the-sql)
- [Limitations and Next Steps](#limitations-and-next-steps)
- [Skills Demonstrated](#skills-demonstrated)

## Project Overview
The goal is to turn pizza order and product data into repeatable sales analysis using relational joins, aggregations, views, and ranking/window functions.

## Business Questions
- How does order activity vary by date and time?
- Which pizza sizes, types, and categories are represented in the catalog?
- How should revenue be calculated from order-line quantities and pizza prices?
- Which products contribute most to sales once the order and product tables are joined at the correct grain?

## Dataset

| File | Verified records | Columns | Key fields |
|---|---:|---:|---|
| `orders.csv` | 21,350 | 3 | `order_id`, `date`, `time` |
| `pizzas.csv` | 96 | 4 | `pizza_id`, `pizza_type_id`, `size`, `price` |
| `pizza_types.csv` | 32 | 4 | `pizza_type_id`, `name`, `category`, `ingredients` |
| `order_details.csv` | Not verified | Not verified | Order-line data used by the SQL |

The orders cover **2015-01-01 through 2015-12-31**. The order-line table should be profiled before publishing total sales or item counts.

## Analysis Workflow
1. Inspect source tables, field types, and key uniqueness.
2. Load the CSV tables into a SQL database.
3. Validate joins and foreign-key relationships.
4. Run order, product, category, and time-based queries.
5. Reconcile revenue using order-line quantity × pizza price.
6. Save query outputs before adding numerical business conclusions.

## Results and Metrics

Verified repository-level dataset facts:
- **21,350** order records.
- **96** pizza SKU/size records.
- **32** pizza-type records.
- **One calendar year** of orders (2015).

Revenue, top-selling pizzas, category shares, and peak order times are not reported here because the order-line file and query outputs were not independently validated in this review. These results should be added after running the SQL and reconciling the joins.

## Technology Stack
- SQL (MySQL-style syntax): joins, aggregations, views, rankings, and window functions.
- CSV: relational source tables.

## Repository Structure
```text
pizza-sales-report/
├── orders.csv
├── order_details.csv
├── pizzas.csv
├── pizza_types.csv
├── pizzahut.sql
└── README.md
```

## Run the SQL
1. Create a database in a compatible SQL engine.
2. Import the four CSV files using their headers.
3. Review `pizzahut.sql` and update table names or import paths for your environment.
4. Execute the queries and validate row counts and revenue formulas before interpreting results.

## Limitations and Next Steps
- Document the dataset's original source and reuse terms.
- Validate the row count and key fields in `order_details.csv`.
- Add query-result exports and screenshots from actual SQL execution.
- Confirm whether revenue uses list price, quantity, discounts, or refunds.
- Add reproducible database setup instructions.

## Skills Demonstrated
Relational data modeling, SQL joins and aggregations, window functions, metric definitions, data validation, and business-focused sales analysis.
