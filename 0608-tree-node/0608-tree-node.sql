# Write your MySQL query statement below
SELECT
    id,
    CASE 
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT p_id FROM Tree GROUP BY p_id) THEN 'Inner'
        ELSE 'Leaf' END AS type
FROM
    Tree