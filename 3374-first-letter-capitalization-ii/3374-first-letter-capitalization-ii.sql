# Write your MySQL query statement below
WITH RECURSIVE split_string AS (
    -- 初始部分
    SELECT 
        1 AS start,
        content_id,
        REGEXP_SUBSTR(content_text, '[^ ]+', 1, 1) AS part,  -- 提取第一個部分
        SUBSTRING(content_text, LENGTH(REGEXP_SUBSTR(content_text, '[^ -]+', 1, 1)) + 1) AS remaining,  -- 剩餘部分（包括分隔符）
        CONCAT(
            UPPER(LEFT(REGEXP_SUBSTR(content_text, '[^ -]+', 1, 1), 1)),  -- 首字母大寫
            LOWER(SUBSTRING(REGEXP_SUBSTR(content_text, '[^ -]+', 1, 1), 2))  -- 其餘字母小寫
        ) AS converted_text  -- 初始合併字串
    FROM user_content
    UNION ALL
    -- 遞迴部分
    SELECT 
        start + 1,  -- 遞迴計數
        content_id,
        REGEXP_SUBSTR(remaining, '[^ -]+', 1, 1),  -- 提取下一個部分
        SUBSTRING(remaining, LENGTH(REGEXP_SUBSTR(remaining, '[^ -]+', 1, 1)) + 2),  -- 更新剩餘部分（包括分隔符）
        CONCAT(
            converted_text,  -- 累積的合併字串
            CASE 
                WHEN SUBSTRING(remaining, 1, 1) IN (' ', '-') THEN SUBSTRING(remaining, 1, 1)  -- 保留分隔符
                ELSE ''  -- 如果沒有分隔符，則不添加
            END,
            CONCAT(
                UPPER(LEFT(REGEXP_SUBSTR(remaining, '[^ -]+', 1, 1), 1)),  -- 首字母大寫
                LOWER(SUBSTRING(REGEXP_SUBSTR(remaining, '[^ -]+', 1, 1), 2))  -- 其餘字母小寫
            )
        )
    FROM split_string
    WHERE remaining IS NOT NULL AND remaining != ''  -- 終止條件
)
-- 最終查詢
SELECT 
    l.content_id,
    l.content_text AS original_text,
    r.converted_text
FROM user_content AS l
LEFT JOIN (SELECT content_id, converted_text FROM split_string WHERE remaining IS NULL OR remaining = '') AS r ON l.content_id = r.content_id
;  -- 只返回最終結果