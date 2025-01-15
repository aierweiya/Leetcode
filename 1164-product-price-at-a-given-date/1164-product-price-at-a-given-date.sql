# Write your MySQL query statement below
SELECT
    product_id,
    CASE WHEN change_date > '2019-08-16' THEN 10 ELSE new_price END AS price
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
    ) OR product_id IN (
        SELECT product_id 
        FROM Products 
        WHERE change_date > '2019-08-16'
        )
GROUP BY product_id