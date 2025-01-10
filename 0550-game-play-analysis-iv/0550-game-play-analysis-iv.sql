# Write your MySQL query statement below
SELECT
    ROUND(COUNT(a.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
    Activity AS a
LEFT JOIN (
    SELECT player_id, MAX(event_date) AS next_date
    FROM Activity
    GROUP BY player_id
) AS a2 ON a.player_id = a2.player_id
WHERE DATEDIFF(a2.next_date, a.event_date) = 1
