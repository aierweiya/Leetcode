# Write your MySQL query statement below
SELECT
    l.employee_id,
    l.name,
    COUNT(r.name) AS reports_count,
    ROUND(AVG(r.age), 0) AS average_age
FROM
    Employees AS l
LEFT JOIN 
    Employees AS r ON r.reports_to = l.employee_id
GROUP BY l.employee_id
HAVING reports_count > 0
ORDER BY l.employee_id ASC
