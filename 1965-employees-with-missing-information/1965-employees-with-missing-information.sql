# Write your MySQL query statement below
WITH e AS (
SELECT
    e.employee_id
FROM
    Employees AS e
JOIN
    Salaries AS s ON e.employee_id = s.employee_id
)

SELECT
    employee_id
FROM 
    Employees
WHERE
    employee_id NOT IN (SELECT * FROM e)
UNION
SELECT
    employee_id
FROM 
    Salaries
WHERE
    employee_id NOT IN (SELECT * FROM e)

ORDER BY
    employee_id ASC