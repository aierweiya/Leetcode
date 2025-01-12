# Write your MySQL query statement below
# WHY UPDATE function doesn't work?
# Cuz when you udpate, it just changes the system but not having any output, so you must use select to get output for leetcode to compare the results
SELECT
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM
    Users
ORDER BY user_id