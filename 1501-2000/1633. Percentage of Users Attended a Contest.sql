# MySQL query statement below
# Solution by Sergey Leschev
SELECT
    r.contest_id,
    ROUND(
        COUNT(DISTINCT r.user_id) * 100.0 / (
            SELECT
                COUNT(*)
            FROM
                Users
        ),
        2
    ) AS percentage
FROM
    Register r
WHERE
    r.user_id IN (
        SELECT
            user_id
        FROM
            Users
    )
GROUP BY
    r.contest_id
ORDER BY
    percentage DESC,
    r.contest_id ASC;