# Write your MySQL query statement below
SELECT
    l.num AS ConsecutiveNums
FROM 
    Logs AS l, Logs AS m, Logs AS r
WHERE 
    l.id = m.id+1 
    AND m.id = r.id+1 
    AND l.num = m.num 
    AND m.num = r.num