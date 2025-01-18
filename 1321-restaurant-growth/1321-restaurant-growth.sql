# Write your MySQL query statement below
SELECT
    c1.seven_day AS visited_on,
    (SELECT SUM(c2.amount)
     FROM Customer c2
     WHERE c2.visited_on BETWEEN c1.visited_on AND c1.seven_day
    ) AS amount,
    ROUND((SELECT SUM(c3.amount) / 7
     FROM Customer c3
     WHERE c3.visited_on BETWEEN c1.visited_on AND c1.seven_day
    ), 2) AS average_amount
FROM
    (SELECT 
        *, 
        DATE_ADD(visited_on, INTERVAL 6 DAY) AS seven_day
    FROM 
        Customer) AS c1
WHERE
    c1.seven_day IN (SELECT visited_on FROM Customer)
