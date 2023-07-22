-- Solution by Sergey Leschev
-- 0550. Game Play Analysis IV
-- MySQL
SELECT
    ROUND(COUNT(t2.player_id) / COUNT(t1.player_id), 2) AS fraction
FROM
    (
        SELECT
            player_id,
            MIN(event_date) AS first_login
        FROM
            Activity
        GROUP BY
            player_id
    ) t1
    LEFT JOIN Activity t2 ON t1.player_id = t2.player_id
    AND t1.first_login = t2.event_date - INTERVAL 1 DAY;