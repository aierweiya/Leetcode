# Write your MySQL query statement below
SELECT
    student_id,
    subject,
    first_score,
    latest_score
FROM
    (SELECT
        *,
        FIRST_VALUE(score) OVER(PARTITION BY student_id, subject ORDER BY exam_date) AS first_score,
        LAST_VALUE(score) OVER(PARTITION BY student_id, subject ORDER BY exam_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS latest_score
    FROM
        Scores
    ) AS s
WHERE
    first_score < latest_score
GROUP BY
    student_id, subject