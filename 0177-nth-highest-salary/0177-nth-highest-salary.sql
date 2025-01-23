CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
    SELECT
        DISTINCT e.salary
    FROM
        (
        SELECT
            id,
            salary,
            DENSE_RANK() over(ORDER BY salary DESC) AS salary_rank
        FROM
            Employee
        ) AS e
    WHERE
        salary_rank = N
  );
END