# Pizza Sales Analysis with SQL

> SQL analysis of pizza orders and product data to answer sales and product-performance questions.

![Status](https://img.shields.io/badge/Status-Portfolio--Project-blue)

## 📌 Table of Contents

- [Overview](#overview)
- [Problem Statement](#problem-statement)
- [Objectives](#objectives)
- [Features](#features)
- [Dataset](#dataset)
- [Tech Stack](#tech-stack)
- [Project Workflow](#project-workflow)
- [Repository Structure](#repository-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Results and Insights](#results-and-insights)
- [Screenshots](#screenshots)
- [Challenges and Solutions](#challenges-and-solutions)
- [Limitations](#limitations)
- [Future Improvements](#future-improvements)
- [What I Learned](#what-i-learned)
- [Author](#author)
- [License](#license)

## 📖 Overview

SQL analysis of pizza orders and product data to answer sales and product-performance questions. This README documents the intended workflow and the files available in the repository. Verify all outputs against the current code and data before using them as evidence.

## 🎯 Problem Statement

Raw order records are difficult to interpret without joining orders, order lines, prices, sizes, and pizza categories.

## 🎯 Objectives

- Relate order, order-line, pizza, and category data correctly.
- Use SQL aggregations to answer sales questions represented in the query file.
- Validate totals and communicate reproducible findings.

## ✨ Features

- Multi-table SQL analysis using the provided CSV files.
- Sales and product summaries where implemented in the SQL script.
- Separate source data files for orders, pizzas, and pizza types.

## 📂 Dataset

Source files are included in the repository: orders.csv, order_details.csv, pizzas.csv, and pizza_types.csv. Row counts and field definitions should be derived from those files.

- **Privacy and licensing:** Check source terms and avoid publishing personal, sensitive, or restricted data.
- **Preprocessing:** Follow the actual SQL/notebook/report implementation; do not assume cleaning steps or row counts that have not been verified.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| SQL | Joins, filters, aggregation, and business queries |
| CSV | Input tables |

## 🔄 Project Workflow

1. Inspect all four CSV files, columns, keys, and data types.
2. Import the CSV files into a SQL database and align table names with pizzahut.sql.
3. Check missing values, duplicate keys, prices, quantities, and date formats.
4. Run each query in pizzahut.sql and note the business question it answers.
5. Reconcile key totals with source data and inspect joins for duplicate multiplication.
6. Write findings only after query outputs have been checked.

## 🗂️ Repository Structure

```text
pizza-sales-report/
├── pizzahut.sql
├── orders.csv
├── order_details.csv
├── pizzas.csv
└── pizza_types.csv
└── README.md
```

The list above highlights known project files and folders; inspect the repository for the complete current structure.

## ⚙️ Installation

### Prerequisites

- Install the tools listed in the Tech Stack that apply to this project.
- For Python projects, use a Python version compatible with the dependencies actually imported by the code.
- For Power BI projects, use Power BI Desktop.

### Setup

No Python environment is required for the SQL analysis. Import the four CSV files into a database compatible with the SQL dialect used in pizzahut.sql.

Do not run generic commands that do not match the files in this repository. Confirm the data paths, database dialect, and package versions before execution.

## ▶️ Usage

Open pizzahut.sql in your SQL client, select the database containing the imported tables, and run the queries in order where dependencies exist.

## 📊 Results and Insights

### Key Findings

Add verified results from actual query output. No numerical findings are asserted in this README.

### Evaluation

For analytics projects, reconcile key totals and document metric definitions. For ML projects, report the baseline, split strategy, relevant metrics, and held-out evaluation results. Do not include unverified scores or business impact claims.

## 🖼️ Screenshots

No image files were confirmed for this repository during this update. If you have screenshots, upload them into an `images/` folder, then embed each real path here with a short caption. Do not use placeholder image paths.

## 🧩 Challenges and Solutions

| Challenge | Solution / validation approach |
|---|---|
| Joining multiple tables | Validate key relationships and compare totals before and after joins. |

## ⚠️ Limitations

- Results depend on correct table imports and join keys.
- Only questions implemented in the SQL file should be described as completed.

## 🚀 Future Improvements

- [ ] Document the database engine and import commands.
- [ ] Add query-output screenshots and a verified findings table.
- [ ] Explain each query's business purpose.

## 📚 What I Learned

- Relational joins and aggregation.
- Validating sales calculations against source data.

## 👤 Author

**Sahil Gaikwad**

- GitHub: [sahil2003-ai](https://github.com/sahil2003-ai)
- LinkedIn: [Sahil Gaikwad](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)

## 📄 License

No license information was verified; check the repository before reusing the data.
