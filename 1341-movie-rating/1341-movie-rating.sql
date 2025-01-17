# Write your MySQL query statement below
(
SELECT
    u.name AS results
FROM
    Users AS u
JOIN
    MovieRating AS mr ON u.user_id = mr.user_id
GROUP BY
    u.user_id
ORDER BY
    COUNT(mr.rating) DESC, u.name
LIMIT 1
)

UNION

(
SELECT
    m.title AS results
FROM
    Movies AS m
JOIN 
    MovieRating AS mr ON m.movie_id = mr.movie_id
WHERE
    mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY
    m.movie_id
ORDER BY
    AVG(rating) DESC, m.title
LIMIT 1
)