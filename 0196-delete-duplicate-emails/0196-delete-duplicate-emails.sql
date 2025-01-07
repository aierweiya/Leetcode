# Write your MySQL query statement below
DELETE del_p FROM Person AS del_p
LEFT JOIN
 (
    SELECT MIN(id) AS min_id
    FROM Person 
    GROUP BY email
 ) AS min_ids ON del_p.id = min_ids.min_id
WHERE min_ids.min_id IS NULL;
