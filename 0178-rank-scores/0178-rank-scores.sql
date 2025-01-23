# Write your MySQL query statement below
SELECT
    s.score,
    s.ranks AS 'rank'
FROM
    (
        SELECT
            *,
            DENSE_RANK() OVER(ORDER BY score DESC) AS ranks
        FROM
            Scores
    ) AS s