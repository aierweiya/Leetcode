# Write your MySQL query statement below
WITH rank_salary AS (
    SELECT
        (SELECT name FROM Department AS d WHERE e.departmentId = d.id) AS Department,
        name AS Employee,
        salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS ranks_salary
    FROM
        Employee AS e
    )

SELECT
    Department,
    Employee,
    Salary
FROM
    rank_salary
WHERE
    ranks_salary BETWEEN 1 AND 3