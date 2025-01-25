# Write your MySQL query statement below
WITH new_table AS (
    SELECT
        *,
        id - ROW_NUMBER() OVER(ORDER BY id) AS ranks
    FROM
        Stadium
    WHERE
        people >= 100
    )

SELECT
    id,
    visit_date,
    people
FROM
    new_table
WHERE
    ranks IN (
        SELECT ranks 
        FROM new_table 
        GROUP BY ranks 
        HAVING COUNT(*) >= 3
        )
