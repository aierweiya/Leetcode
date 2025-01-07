# Write your MySQL query statement below
SELECT p1.product_id
FROM Products AS p1
LEFT JOIN
 (
    SELECT
     p2.product_id,
     CASE WHEN p2.low_fats = 'Y' THEN 1 ELSE 0 END AS low_fats_num,
     CASE WHEN p2.recyclable = 'Y' THEN 1 ELSE 0 END AS recyclable_num
    FROM Products AS p2
 ) AS sum_tab ON p1.product_id = sum_tab.product_id
WHERE sum_tab.low_fats_num + sum_tab.recyclable_num > 1;