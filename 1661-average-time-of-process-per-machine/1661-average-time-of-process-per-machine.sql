# Write your MySQL query statement below
SELECT 
 l.machine_id,
 ROUND(
    AVG(
        r.timestamp - l.timestamp
    ), 3
 ) AS processing_time
FROM Activity AS l
LEFT JOIN (
    SELECT *
    FROM Activity
    WHERE activity_type = 'end'
) AS r 
 ON l.machine_id = r.machine_id 
 AND l.process_id = r.process_id
 AND l.timestamp < r.timestamp
GROUP BY l.machine_id