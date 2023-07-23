# MySQL query statement below
# Solution by Sergey Leschev
SELECT
    s.user_id,
    IFNULL(
        ROUND(
            CAST(
                SUM(
                    CASE
                        WHEN c.action = 'confirmed' THEN 1
                        ELSE 0
                    END
                ) AS FLOAT
            ) / COUNT(c.user_id),
            2
        ),
        0
    ) AS confirmation_rate
FROM
    Signups s
    LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY
    s.user_id;