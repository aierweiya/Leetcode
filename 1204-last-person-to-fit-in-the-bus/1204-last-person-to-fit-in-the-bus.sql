# Write your MySQL query statement below
SELECT
    DISTINCT q1.person_name
FROM 
    QUEUE AS q1
JOIN 
    QUEUE AS q2 ON q1.turn >= q2.turn
GROUP BY 
    q1.turn
HAVING 
    SUM(q2.weight) <= 1000
ORDER BY 
    SUM(q2.weight) DESC
LIMIT 1