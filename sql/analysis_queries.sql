USE sql_sales_analysis

-- Total Sales, Profit & Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore

-- Average Order Value (AOV)
SELECT
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM superstore

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM superstore
GROUP BY month
ORDER BY month

-- Monthly Sales Trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(profit), 2) AS monthly_profit
FROM superstore
GROUP BY month
ORDER BY month

-- Sales & Profit by Category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC

-- Sales & Profit by Sub-Category
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit DESC

-- Profit by Customer Segment
SELECT
    segment,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC

-- Top 10 Most Profitable Customers
SELECT
    customer_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10

-- Profit by Shipping Mode
SELECT
    ship_mode,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY ship_mode
ORDER BY total_profit DESC

-- Average Shipping Delay (Days)
SELECT
    ship_mode,
    ROUND(AVG(DATEDIFF(ship_date, order_date)), 1) AS avg_shipping_days
FROM superstore
GROUP BY ship_mode
ORDER BY avg_shipping_days

-- Sales & Profit by Region
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC

-- Top 5 States by Profit
SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit DESC
LIMIT 5

-- Loss-making Products
SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
HAVING total_profit < 0
ORDER BY total_profit