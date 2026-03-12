# Write your MySQL query statement below
SELECT 
    ROUND(
        COUNT(a2.player_id) / COUNT(a1.player_id), 
    2) AS fraction
FROM (
    -- Get the first login date for every player
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) AS a1
LEFT JOIN Activity AS a2 
    ON a1.player_id = a2.player_id 
    AND a2.event_date = DATE_ADD(a1.first_login, INTERVAL 1 DAY);