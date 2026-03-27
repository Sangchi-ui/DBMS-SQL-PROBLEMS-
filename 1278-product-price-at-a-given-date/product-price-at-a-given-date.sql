# Write your MySQL query statement below
# 1. Get the latest price for products that have a change record on or before 2019-08-16
SELECT 
    product_id, 
    new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION

# 2. Get products whose first price change happens AFTER 2019-08-16 (default to 10)
SELECT 
    product_id, 
    10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';