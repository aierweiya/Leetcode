# Write your MySQL query statement below
WITH same_2015 AS (SELECT
    tiv_2015
FROM
    Insurance
GROUP BY 
    tiv_2015
HAVING 
    COUNT(tiv_2015) > 1
),
u_location AS (SELECT
    CONCAT(lat, lon) AS location
FROM
    Insurance
GROUP BY
    location
HAVING
    COUNT(location) > 1
)

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM
    Insurance
WHERE
    tiv_2015 IN (SELECT tiv_2015 FROM same_2015)
    AND CONCAT(lat, lon) NOT IN (SELECT location FROM u_location)
