# Write your MySQL query statement below
SELECT l.name, r.bonus
FROM Employee AS l
LEFT JOIN Bonus AS r ON l.empId = r.empId
WHERE r.bonus < 1000 OR r.bonus IS NULL