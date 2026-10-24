-- Superstore Sales Analysis
-- Database: SQLite (DB Browser for SQLite)
-- Table: superstore (9,994 orders, 2014-2017), imported from Superstore_Cleaned.csv

-- 0. Sanity check: row count (expected 9994)
SELECT COUNT(*) FROM superstore;

-- 1. Sales and profit trend by year
SELECT Year,
       ROUND(SUM(Sales), 2)  AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Year
ORDER BY Year;

-- 2. Regional performance with profit margin
SELECT Region,
       ROUND(SUM(Sales), 2)  AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit,
       ROUND(SUM(Profit) * 100.0 / SUM(Sales), 1) AS margin_pct
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;

-- 3. Top 10 products by sales
SELECT "Product Name",
       ROUND(SUM(Sales), 2)  AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY "Product Name"
ORDER BY total_sales DESC
LIMIT 10;

-- 4. Category and sub-category profitability (loss-makers first)
SELECT Category,
       "Sub-Category",
       ROUND(SUM(Sales), 2)  AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Category, "Sub-Category"
ORDER BY total_profit ASC;
