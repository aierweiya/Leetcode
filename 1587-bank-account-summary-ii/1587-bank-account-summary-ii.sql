# Write your MySQL query statement below
SELECT
    u.name,
    SUM(amount) AS balance
FROM
    Users AS u
LEFT JOIN
    Transactions AS t ON u.account = t.account
GROUP BY u.account
HAVING SUM(amount) >= 10000