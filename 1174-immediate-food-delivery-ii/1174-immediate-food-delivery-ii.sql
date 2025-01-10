# Write your MySQL query statement below
SELECT
    ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(DISTINCT customer_id) * 100, 2) AS immediate_percentage
FROM
    (SELECT 
        customer_id, 
        MIN(order_date) AS order_date, 
        MIN(customer_pref_delivery_date) AS customer_pref_delivery_date 
    FROM 
        Delivery
    GROUP BY 
        customer_id) AS d
