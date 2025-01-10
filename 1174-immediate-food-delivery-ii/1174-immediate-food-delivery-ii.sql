# Write your MySQL query statement below
SELECT
    ROUND(AVG(order_date = customer_pref_delivery_date) * 100, 2) AS immediate_percentage
FROM
    (SELECT 
        customer_id, 
        MIN(order_date) AS order_date, 
        MIN(customer_pref_delivery_date) AS customer_pref_delivery_date 
    FROM 
        Delivery
    GROUP BY 
        customer_id) AS d
