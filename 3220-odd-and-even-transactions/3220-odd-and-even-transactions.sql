# Write your MySQL query statement below
SELECT
    transaction_date,
    SUM(CASE WHEN odd_even = 'odd' THEN amount ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN odd_even = 'even' THEN amount ELSE 0 END) AS even_sum
FROM
    (
    SELECT
        *,
        CASE WHEN amount % 2 = 0 THEN 'even' ELSE 'odd' END AS odd_even
    FROM
        transactions
    ) AS t
GROUP BY 
    transaction_date