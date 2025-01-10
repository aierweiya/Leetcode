# Write your MySQL query statement below
SELECT
    ROUND(COUNT(a.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
    Activity AS a
LEFT JOIN (
    SELECT player_id, MIN(event_date) AS next_date
    FROM Activity
    GROUP BY player_id
) AS a2 ON a.player_id = a2.player_id
WHERE DATEDIFF(a.event_date, a2.next_date) = 1
