# Write your MySQL query statement below
SELECT sp.name
FROM SalesPerson AS sp
WHERE sp.sales_id NOT IN (
 SELECT o.sales_id 
 FROM Orders AS o 
 LEFT JOIN Company AS c ON o.com_id = c.com_id
 WHERE c.name = "RED"
)