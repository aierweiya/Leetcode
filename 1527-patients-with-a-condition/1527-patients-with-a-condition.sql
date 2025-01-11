# Write your MySQL query statement below
SELECT
    *
FROM
    Patients
WHERE
    conditions REGEXP '.* DIAB1.*' OR conditions REGEXP '^DIAB1.*'