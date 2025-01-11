# Write your MySQL query statement below
SELECT
    *
FROM
    Patients
WHERE
    #'(^|[^a-zA-Z])' 確保 'DIAB1' 前面是字串開始或非字母字符
    conditions REGEXP '(^|[^a-zA-Z])DIAB1'