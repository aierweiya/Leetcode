# Write your MySQL query statement below
SELECT
    student_id,
    subject,
    first_score,
    score AS latest_score
FROM
    (SELECT
        *,
        FIRST_VALUE(score) OVER(PARTITION BY student_id, subject ORDER BY exam_date) AS first_score
    FROM
        Scores
    ) AS s
WHERE
    first_score < score
GROUP BY
    student_id
