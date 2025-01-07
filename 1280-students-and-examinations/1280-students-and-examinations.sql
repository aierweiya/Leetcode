# Write your MySQL query statement below
SELECT 
    l.student_id,
    l.student_name,
    r.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students AS l
INNER JOIN Subjects AS r
LEFT JOIN Examinations AS e ON l.student_id = e.student_id AND r.subject_name = e.subject_name
GROUP BY l.student_id, r.subject_name
ORDER BY l.student_id, r.subject_name