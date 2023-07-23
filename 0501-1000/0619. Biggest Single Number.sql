# MySQL query statement below
# Solution by Sergey Leschev
SELECT
    MAX(num) AS num
FROM
    (
        SELECT
            num
        FROM
            MyNumbers
        GROUP BY
            num
        HAVING
            COUNT(*) = 1
    ) AS single_numbers;