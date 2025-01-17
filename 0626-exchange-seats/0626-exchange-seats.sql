# Write your MySQL query statement below
SELECT 
    CASE WHEN id = (SELECT MAX(id) FROM Seat) THEN id
    WHEN id % 2 = 0 THEN id - 1
    ELSE id + 1 END AS id,
    student
FROM 
    Seat
ORDER BY 
    id

