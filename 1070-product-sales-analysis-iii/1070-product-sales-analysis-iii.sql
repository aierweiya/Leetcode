# Write your MySQL query statement below
SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM
    Sales
GROUP BY product_id
HAVING MIN(year)