# Pizza Sales Analysis with SQL

A relational-data analysis project that uses SQL to explore pizza orders, product mix, order timing, and revenue contribution.

## Project overview

The project combines four CSV tables with SQL views to answer questions about order volume, popular sizes and pizza types, category mix, hourly demand, and revenue trends.

## Repository contents

| File | Purpose |
|---|---|
| `orders.csv` | Order identifiers and order date/time |
| `order_details.csv` | Order line items and quantities |
| `pizzas.csv` | Pizza SKU, size, and price |
| `pizza_types.csv` | Pizza names, categories, and ingredient descriptions |
| `pizzahut.sql` | SQL views for sales and product analysis |

## Dataset checks

| File | Verified rows | Verified columns |
|---|---:|---:|
| `orders.csv` | 21,350 | 3 |
| `pizzas.csv` | 96 | 4 |
| `pizza_types.csv` | 32 | 4 |
| `order_details.csv` | Not confirmed in this review | Not confirmed |

The source and reuse license should be documented before redistribution.

## Analysis included in the SQL file

The SQL script defines views for:
- Total order count and estimated sales revenue.
- Highest-priced pizza and most frequently ordered size.
- Top five pizza types by quantity and category-level quantity totals.
- Order counts by hour and average pizzas ordered per day.
- Top pizza types by revenue and category revenue contribution.
- Cumulative daily revenue and top three pizzas by revenue within each category.

These are **analysis definitions**, not reported business outcomes. No numerical SQL result values are claimed here because the queries have not been successfully executed against a confirmed schema in this review.

## Tech stack

- SQL (script uses MySQL-style functions such as `HOUR()` and `LIMIT`)
- CSV data sources
- Relational joins, grouping, aggregation, window functions, and views

## Run the project

1. Create a database in a MySQL-compatible environment.
2. Import the four CSV files, confirming their actual headers and data types.
3. Update the script's table and column identifiers to match the imported schema.
4. Execute `pizzahut.sql` and inspect each view's output.
5. Reconcile order totals and revenue calculations against the source data.

## Validation issues to resolve

The current script uses names such as `orders_details`, `order_date`, `order_time`, and `quatity`. These may not match the CSV filename/header names, so confirm the exact imported table and column schema before execution. Also verify that revenue is computed from the intended unit price and quantity and that joins do not multiply order lines.

## Evidence and limitations

No screenshots or saved query-result exports were present in the repository file inventory. Consequently, total revenue, peak order hour, most popular pizza, and category rankings are not asserted as verified findings.

## Skills demonstrated

SQL joins, aggregation, views, ranking/window functions, relational data modeling, and business-question framing.

## Author

Sahil Gaikwad · [GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
