# Write your MySQL query statement below
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM
    (
    SELECT
        *,
        DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS ranks
    FROM
        Employee
    ) AS e
LEFT JOIN
    Department AS d ON e.departmentId = d.id
WHERE
    e.ranks = 1
