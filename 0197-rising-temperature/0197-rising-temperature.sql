# Write your MySQL query statement below
SELECT l.id
FROM Weather AS l
LEFT JOIN Weather AS r ON l.recordDate = DATE_ADD(r.recordDate, INTERVAL 1 DAY)
WHERE l.temperature > r.temperature
ORDER BY l.recordDate ASC;