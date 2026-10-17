# Pizza Sales Analysis with SQL

An end-to-end sales analytics project using **SQL and relational CSV tables** to analyze pizza orders, order-line quantities, menu pricing, product categories, hourly demand and revenue contribution. The repository includes four source tables and SQL views that turn detailed order records into business-facing summaries.

<p align="left">
  <img src="https://img.shields.io/badge/SQL-MySQL%20style-4479A1?logo=mysql&logoColor=white" alt="SQL" />
  <img src="https://img.shields.io/badge/Data-CSV-lightgrey" alt="CSV data" />
  <img src="https://img.shields.io/badge/Focus-Sales%20Analytics-orange" alt="Sales analytics" />
  <img src="https://img.shields.io/badge/Analysis-Window%20Functions-6A5ACD" alt="Window functions" />
</p>

## Project overview

This project combines order headers, order details, pizza SKUs/prices and pizza-type metadata to answer operational and commercial questions. The SQL script uses joins, aggregation, views, ranking and window functions to explore order volume, top products, category mix, pricing and revenue trends.

The repository contains SQL and data tables, not a separate Power BI report or image folder. The analysis results below are based on the source-file profile and SQL definitions; revenue metrics should be regenerated from the SQL before being used for reporting.

## Business questions

- How many orders were placed over the period?
- What is the total pizza quantity sold and total modeled revenue?
- Which pizza sizes and pizza types are ordered most frequently?
- Which categories contribute most to ordered quantity and revenue?
- What are the highest-priced pizzas?
- How does order activity vary by hour of day?
- What are the top pizza types by revenue, overall and within each category?
- How does cumulative revenue evolve by order date?

## Dataset

The project uses four CSV tables.

| File | Rows including header | Data rows | Columns | Purpose |
|---|---:|---:|---:|---|
| [`orders.csv`](orders.csv) | 21,351 | **21,350** | 3 | Order date and time |
| [`order_details.csv`](order_details.csv) | 48,621 | **48,620** | 4 | Individual order-line items and quantities |
| [`pizzas.csv`](pizzas.csv) | 97 | **96** | 4 | Pizza SKU, type, size and price |
| [`pizza_types.csv`](pizza_types.csv) | 33 | **32** | 4 | Pizza names, categories and ingredients |

### Date coverage

The order table spans **January 1, 2015 through December 31, 2015**.

### Table fields

**`orders.csv`**
- `order_id`: order identifier
- `date`: calendar date
- `time`: order time

**`order_details.csv`**
- `order_details_id`: order-line identifier
- `order_id`: link to the order header
- `pizza_id`: link to a menu SKU/size
- `quantity`: number of pizzas on the line

**`pizzas.csv`**
- `pizza_id`: SKU/size identifier
- `pizza_type_id`: link to the pizza type
- `size`: size code
- `price`: listed price for that SKU

**`pizza_types.csv`**
- `pizza_type_id`: pizza-type identifier
- `name`: displayed pizza name
- `category`: product category
- `ingredients`: ingredient description

The repository does not document the original source/license or currency explicitly. Confirm those before redistributing the dataset or presenting monetary amounts with a currency symbol.

## SQL workflow

The script [`pizzahut.sql`](pizzahut.sql) builds views for:

1. Total orders
2. Total modeled revenue
3. Highest-priced pizza
4. Most common pizza size by order-line count
5. Top five pizza types by quantity
6. Total quantity by pizza category
7. Orders by hour of day
8. Count of pizza types per category
9. Average quantity ordered per day
10. Top three pizza types by revenue
11. Category contribution to total revenue
12. Cumulative revenue by date
13. Top three revenue-generating pizza types within each category using ranking/window functions

### Revenue definition

The SQL calculates modeled revenue using:

`Revenue = SUM(order_details.quantity × pizzas.price)`

This assumes the listed SKU price applies to each quantity ordered. It does not account for discounts, refunds, taxes, delivery charges or other adjustments because these fields are not present in the source tables.

## Verified data profile

From the repository CSV files:

| Metric | Value |
|---|---:|
| Orders | **21,350** |
| Order-line records | **48,620** |
| Menu SKU/size records | **96** |
| Pizza-type records | **32** |
| Calendar coverage | **2015 (one year)** |
| Average order-line quantity | To calculate from `order_details.csv` |
| Total units sold | To calculate with `SUM(quantity)` |
| Total revenue | To calculate from quantity × unit price |

The SQL script defines queries/views for the sales metrics, but the query outputs were not committed as result files. I am not publishing unverified total revenue, top-selling pizza or peak-hour numbers as if they were previously executed results. Run the SQL against the supplied CSV tables to generate those values.

## Example analytical views

| View | Business purpose |
|---|---|
| `total_placed_orders` | Total order count |
| `total_pizza_sales_revenue` | Revenue calculated from quantity × menu price |
| `highest_price_pizza` | Highest-priced pizza SKU/type |
| `most_comman_pizza_size_size_orderderd` | Most frequently appearing ordered size (view retains original name) |
| `top5_ordered_pizza` | Five top pizza types by quantity |
| `total_quantity_of_each_pizza` | Quantity by pizza category |
| `ordersby_hour_oftheday` | Order count by hour |
| `avg_pizza_ordered_per_day` | Average daily pizza quantity |
| `top3pizza_bassedon_revenue` | Top three types by modeled revenue |
| `prcentage_contribution_ofeach_pizzatype_tototalrevenue` | Category revenue contribution percentages |
| `cumulative_revenue` | Running revenue total by date |
| `top3_pizzatypes_foreach_pizzacategory` | Top three pizza types per category |

A few view names contain spelling errors from the original SQL. They are listed as implemented; consider renaming them to consistent, descriptive names in a future cleanup.

## Repository structure

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

The file uses **MySQL-style SQL** such as `CREATE VIEW` and `HOUR()`. The query syntax and the `order_details` table name must match your database setup.

### 1. Create a database

```sql
CREATE DATABASE pizza_sales;
USE pizza_sales;
```

### 2. Import the four CSV files

Import each CSV with its header into the expected tables:

- `orders`
- `orders_details` (the SQL script uses the pluralized table name)
- `pizzas`
- `pizza_types`

Ensure the CSV field names map to the SQL references: `order_id`, `date`, `time`, `order_details_id`, `pizza_id`, `quatity` or `quantity`, `price`, `pizza_type_id`, `name` and `category`.

**Important schema check:** the script uses the misspelled field `quatity` in several places, while the CSV header is `quantity`. Either correct those SQL references or rename the imported column consistently. Also check if your table is named `order_details` or `orders_details`; use one name throughout the import and script.

### 3. Run the analysis

Execute `pizzahut.sql` after importing the data and resolving the column/table-name consistency notes above. Inspect the results from each query/view and verify the row counts before interpreting the numbers.

## Visualizations and images

The repository contains the data tables and SQL script but no exported chart screenshots, dashboard images or `images/` folder. SQL views themselves are not visual images, so this README does not embed unrelated pictures or fabricated charts.

For a visual portfolio presentation, run the SQL, export genuine query results to charts (such as orders by hour, revenue by category and top pizza types), save them under an `images/` folder, and reference those files here.

## Limitations and next steps

- Document the source dataset and license.
- Profile nulls, duplicate keys and referential integrity across all four tables.
- Correct the `quatity`/ `quantity` typo and standardize the order-detail table name.
- Execute the script and record verified revenue, units sold, order count and category contribution values.
- Validate revenue calculations using a clearly defined price and quantity basis.
- Check daily averages carefully: the current nested query averages totals only for dates present in the order table.
- Add exports of real query results or charts to improve the README's visual evidence.
- Keep descriptive results distinct from operational recommendations.

## Skills demonstrated

SQL joins · aggregation · views · revenue calculation · product and category analytics · time-based analysis · ranking · window functions · data validation · relational table integration · business question framing

## Author

**Sahil Gaikwad**  
[GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
