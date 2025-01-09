# Write your MySQL query statement below
SELECT 
    r.contest_id,
    ROUND(COUNT(r.user_id) / (SELECT COUNT(user_id) FROM Users) * 100, 2) AS percentage
FROM
    Register AS r
JOIN Users AS u ON r.user_id = u.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC

