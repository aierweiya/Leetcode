# Write your MySQL query statement below
WITH new_table AS (
    SELECT
        *,
        LAG(id) OVER(ORDER BY id) AS prev_con,
        LEAD(id) OVER(ORDER BY id) AS next_con
    FROM
        Stadium
    WHERE
        people >= 100
    ),

filtered_table AS(
    SELECT
        *
    FROM
        new_table
    WHERE
        next_con - prev_con <> id AND next_con - id = 1 OR next_con IS NULL
    )

SELECT
    id,
    visit_date,
    people
FROM
    filtered_table
WHERE
    (SELECT COUNT(*) FROM filtered_table) >= 3
