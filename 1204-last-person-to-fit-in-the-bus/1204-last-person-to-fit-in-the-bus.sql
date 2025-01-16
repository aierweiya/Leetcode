# Write your MySQL query statement below
#Using OVER fuction
SELECT
    person_name
FROM 
    #選取 person_name, turn 以及計算累積權重 cum。
    (SELECT
        person_name,
        turn,
        #根據 turn 欄位排序，並對 weight 欄位進行累積求和。
        sum(weight) over (order by turn) AS cum 
    FROM 
        Queue
    ) AS p1
WHERE
    cum <= 1000 
ORDER BY
    turn DESC 
LIMIT 1;

#------------------------------------------
#Using JOIN fuction
#SELECT
#    q1.person_name
#FROM 
#    QUEUE AS q1
#JOIN
    #這個聯結的目的是為了計算在 q1 的 turn 之前的所有人的 weight 總和。
#    QUEUE AS q2 ON q1.turn >= q2.turn
#GROUP BY 
#    q1.turn
#HAVING 
    #計算每個分組中 q2.weight 的總和，並篩選出總和小於等於 1000 的分組。
#    SUM(q2.weight) <= 1000
#LIMIT 1