# Write your MySQL query statement below
SELECT 
    contest_id,
    ROUND(COUNT(user_id) / (SELECT COUNT(user_id) FROM Users) * 100, 2) AS percentage
FROM
    Register
GROUP BY 
    contest_id
ORDER BY 
    percentage DESC, contest_id ASC