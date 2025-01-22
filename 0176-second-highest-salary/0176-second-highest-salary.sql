# Write your MySQL query statement below
SELECT
    IF(ranks = 2, salary, NULL) AS SecondHighestSalary
FROM
    (SELECT
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS ranks
    FROM
        Employee
    ) AS e
ORDER BY SecondHighestSalary DESC
LIMIT 1