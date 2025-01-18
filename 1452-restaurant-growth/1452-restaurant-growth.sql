# Write your MySQL query statement below
SELECT
    DISTINCT c1.seven_day AS visited_on,
    (SELECT SUM(amount)
     FROM Customer
     WHERE visited_on BETWEEN c1.visited_on AND c1.seven_day
    ) AS amount,
    ROUND((SELECT SUM(amount) / 7
     FROM Customer
     WHERE visited_on BETWEEN c1.visited_on AND c1.seven_day
    ), 2) AS average_amount
FROM
    (SELECT 
        *, 
        DATE_ADD(visited_on, INTERVAL 6 DAY) AS seven_day
    FROM 
        Customer) AS c1
WHERE
    c1.seven_day IN (SELECT visited_on FROM Customer)
