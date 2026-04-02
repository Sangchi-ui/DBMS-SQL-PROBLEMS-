# Write your MySQL query statement below
SELECT 
    visited_on, 
    amount, 
    ROUND(amount / 7, 2) AS average_amount
FROM (
    SELECT 
        visited_on, 
        SUM(SUM(amount)) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        DENSE_RANK() OVER (ORDER BY visited_on) AS day_rank
    FROM Customer
    GROUP BY visited_on
) AS daily_stats
WHERE day_rank >= 7;