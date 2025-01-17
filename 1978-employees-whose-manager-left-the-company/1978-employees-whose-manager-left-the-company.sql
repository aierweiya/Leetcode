# Write your MySQL query statement below
SELECT
    employee_id
FROM
    (
        SELECT
            *
        FROM
            Employees
        WHERE
            salary < 30000
    ) AS e
WHERE
    manager_id NOT IN (SELECT employee_id FROM Employees)