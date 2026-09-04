CREATE DATABASE Target_SQL;

USE Target_SQL;

-- Import the dataset and do usual exploratory data analysis steps like checking the structure & characteristics of the dataset:


--  Data type of all columns in the "customers" table.
SELECT TOP 10 * FROM customers;

SELECT TOP 5 * FROM geolocation;


--Get the time range between which orders were placed.
SELECT min(order_purchase_timestamp) as start_time,
max(order_purchase_timestamp) as end_time
FROM orders;


-- Display the details of cities and states of customers who ordered during the given period.
SELECT 
c.customer_city, c.customer_state
FROM orders as o
JOIN customers as c ON o.customer_id = c.customer_id
WHERE YEAR(o.order_purchase_timestamp) = 2018
AND MONTH(order_purchase_timestamp) BETWEEN 1 AND 3


-- Is there a growing trend in the no.of orders placed over the past years?
SELECT
MONTH(order_purchase_timestamp) as month,
COUNT(order_id) as order_num
FROM orders
GROUP BY MONTH(order_purchase_timestamp) 
ORDER BY order_num DESC

-- During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night)
-- 0-6 hrs: Dawn
-- 7-12 hrs: Mornings
-- 13-18 hrs: Afternoon
-- 19-23 hrs: Night
SELECT
DATEPART(HOUR, order_purchase_timestamp) as time,
COUNT(order_id) as order_num
FROM orders
GROUP BY DATEPART(HOUR, order_purchase_timestamp) 
ORDER BY order_num DESC

-- Get month on month number of orders.
SELECT
MONTH(order_purchase_timestamp) as month,
YEAR(order_purchase_timestamp) as year,
COUNT(*) as num_orders
FROM orders
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY year, month 

-- Distribution of customers across the states of brazil
SELECT customer_state,
COUNT(DISTINCT customer_id) as customer_count
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC


-- Get the % increase in the cost of orders from year 2017 to 2018 (include moths between Jan to Aug only).
-- You can use the "payment_value" column in the payments table to get the cost of orders.

-- Step 1: Calculate total payments per year
WITH yearly_totals as(
SELECT
YEAR(o.order_purchase_timestamp) as year,
SUM(p.payment_value) as total_payment
FROM payments as p 
JOIN orders as o ON p.order_id = o.order_id
WHERE YEAR(o.order_purchase_timestamp) in (2017,2018)
AND MONTH(o.order_purchase_timestamp) between 1 and 8
GROUP BY YEAR(o.order_purchase_timestamp)
),
-- Step 2: Use LEAD window function to compare each year's payments with the previous year
yearly_comparison AS (
SELECT
year,
total_payment,
LEAD(total_payment) over(ORDER BY year DESC) as prev_year_payment
from yearly_totals
)
-- Step 3: Calculate % increase
SELECT round(((total_payment - prev_year_payment) / prev_year_payment)*100,2)
FROM yearly_comparison;




-- Mean & SUM of price and freight value by customer state
SELECT 
c.customer_state,
AVG(price) as avg_price,
SUM(price) as sum_price,
AVG(freight_value) as avg_freight,
SUM(freight_value) as sum_freight
FROM orders as o 
JOIN order_items as oi ON o.order_id = oi.order_id
JOIN customers as c ON o.customer_id = c.customer_id
GROUP BY c.customer_state


-- Calculate days between purchasing, delivering, and estimated delivery.
SELECT
DATEDIFF(
    DAY,
    CAST(order_purchase_timestamp AS DATE),
    CAST(order_delivered_customer_date AS DATE)
) AS days_to_delivery,
DATEDIFF(
    DAY,
    CAST(order_purchase_timestamp AS DATE),
    CAST(order_estimated_delivery_date AS DATE)
) as diff_estimated_delivery
FROM orders


-- Find out the top 5 states with the highest & lowest average freight value.
SELECT TOP 5 c.customer_state,
AVG(freight_value) as avg_freight_value
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c on o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY avg_freight_value DESC


-- Find out the top 5 states with the highest & lowest average delivery time.
SELECT TOP 5 c.customer_state,
AVG(
    DATEDIFF(
        DAY,
        CAST(o.order_purchase_timestamp AS DATE),
        CAST(o.order_delivered_customer_date AS DATE)
    )
) AS avg_time_to_delivery
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c on o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY avg_time_to_delivery DESC

-- Find the month on month no.of orders placed using different payment types.
SELECT
payment_type,
YEAR(order_purchase_timestamp) as year,
MONTH(order_purchase_timestamp) as month,
COUNT(DISTINCT o.order_id) as order_count
FROM orders o 
INNER JOIN payments p ON o.order_id = p.order_id
GROUP BY payment_type, YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY payment_type, year, month


-- Count of orders based on the number of payment installments.
SELECT payment_installments,
COUNT(DISTINCT order_id) as num_orders
FROM payments
GROUP BY payment_installments