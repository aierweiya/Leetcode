# Write your MySQL query statement below
SELECT
    DISTINCT product_id,
    10 AS price
FROM
    Products
GROUP BY
    product_id
HAVING
    MIN(change_date) > '2019-08-16' 

#UNION 操作符用于将两个或多个 SELECT 语句的结果集合并成一个新的结果集。换句话说，它可以将多个查询的结果堆叠在一起。
UNION

SELECT
    product_id,
    new_price
FROM
    Products
WHERE (product_id, change_date) IN
    (
        SELECT
            product_id,
            MAX(change_date) AS last_change
        FROM
            Products
        WHERE
            change_date <= '2019-08-16'
        GROUP BY 
            product_id
    )