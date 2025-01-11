# Write your MySQL query statement below
SELECT
    *
FROM
    Users
WHERE
    CASE 
        WHEN LEFT(mail, 1) REGEXP '^[a-zA-Z]' 
        AND mail REGEXP '^[a-zA-Z0-9./_-]+@leetcode.com$'
        THEN 1 ELSE 0 END