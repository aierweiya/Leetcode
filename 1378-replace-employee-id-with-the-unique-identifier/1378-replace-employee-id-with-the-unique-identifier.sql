# Write your MySQL query statement below
SELECT r.unique_id, l.name
FROM Employees AS l
LEFT JOIN EmployeeUNI AS r ON l.id = r.id