-- Solution by Sergey Leschev
-- 1164. Product Price at a Given Date
-- MySQL
SELECT
    product_id,
    COALESCE(new_price, 10) AS price
FROM
    (
        SELECT
            product_id,
            new_price,
            change_date,
            ROW_NUMBER() OVER (
                PARTITION BY product_id
                ORDER BY
                    change_date DESC
            ) AS rn
        FROM
            Products
        WHERE
            change_date <= '2019-08-16'
    ) AS subquery
WHERE
    rn = 1
UNION
SELECT
    DISTINCT product_id,
    10 AS price
FROM
    Products
WHERE
    product_id NOT IN (
        SELECT
            DISTINCT product_id
        FROM
            Products
        WHERE
            change_date <= '2019-08-16'
    );