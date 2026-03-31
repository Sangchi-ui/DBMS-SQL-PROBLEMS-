# Write your MySQL query statement below
SELECT 
    CASE 
        -- If ID is odd and it's the last record, keep it the same
        WHEN id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id
        -- If ID is odd (and not the last), move it to the next even number
        WHEN id % 2 = 1 THEN id + 1
        -- If ID is even, move it to the previous odd number
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id ASC;