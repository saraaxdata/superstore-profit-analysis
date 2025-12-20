--Q1. Which products and sub-categories are least profitable or losing money?

-- Least profitable products
SELECT 
    product_name,
    category,
    sub_category,
    SUM(quantity) AS total_units_sold,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),2) AS profit_margin
FROM orders
GROUP BY product_name, category, sub_category
HAVING SUM(sales) > 100
ORDER BY total_profit ASC, profit_margin ASC
LIMIT 10;


-- Least profitable sub-categories
SELECT 
    sub_category,
    category,
    SUM(quantity) AS total_units_sold,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),2) AS profit_margin
FROM orders
GROUP BY sub_category, category
HAVING SUM(sales) > 500
ORDER BY total_profit ASC, profit_margin ASC
LIMIT 10;


--Q2. How does discount affect profit?

-- Impact of discount levels on profit and profitability
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount > 0 AND discount <= 0.10 THEN '0–10%'
        WHEN discount > 0.10 AND discount <= 0.20 THEN '10–20%'
        WHEN discount > 0.20 AND discount <= 0.30 THEN '20–30%'
        ELSE '30%+'
    END AS discount_range,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales), 2) AS profit_margin
FROM orders
GROUP BY discount_range
HAVING SUM(sales) > 500
ORDER BY total_profit ASC, profit_margin ASC;


--Q3.Which products are losing the most profit due to high discounts, and how much revenue is affected?

-- Products least profitable due to high discounts
SELECT
    product_name,
    category,
    sub_category,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),2) AS profit_margin,
    ROUND(AVG(discount)*100,2) AS avg_discount_percent
FROM orders
WHERE discount >= 0.2
GROUP BY product_name, category, sub_category
HAVING SUM(sales) > 100
ORDER BY total_profit ASC
LIMIT 10;


-- Q4. Which customer segments are least profitable?

-- Least profitable customer segments
SELECT
    segment,
    COUNT(DISTINCT order_id) AS total_orders,       
    SUM(quantity) AS total_units_sold,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),2) AS profit_margin
FROM orders
GROUP BY segment
HAVING SUM(sales) > 500                      
ORDER BY total_profit ASC, profit_margin ASC;  


--Q5. Which regions are underperforming?

-- Underperforming regions
SELECT
    region,
    COUNT(DISTINCT order_id) AS total_orders,           
    SUM(quantity) AS total_units_sold,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),2) AS profit_margin
FROM orders
GROUP BY region
HAVING SUM(sales) > 500                       
ORDER BY total_profit ASC, profit_margin ASC;  


--Q6.  Which months have the lowest profit, indicating periods that need attention?

-- Quartly profitability analysis
SELECT
    CASE
        WHEN EXTRACT(MONTH FROM order_date) IN (1,2,3) THEN 'Q1'
        WHEN EXTRACT(MONTH FROM order_date) IN (4,5,6) THEN 'Q2'
        WHEN EXTRACT(MONTH FROM order_date) IN (7,8,9) THEN 'Q3'
        ELSE 'Q4'
    END AS quarter,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit)/SUM(sales),2) AS profit_margin
FROM orders
GROUP BY quarter
HAVING SUM(sales) > 500 
ORDER BY total_profit ASC, profit_margin ASC;
