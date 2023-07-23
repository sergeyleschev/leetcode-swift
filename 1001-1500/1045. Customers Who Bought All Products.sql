# MySQL query statement below
# Solution by Sergey Leschev
SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT product_key) = (
        SELECT
            COUNT(*)
        FROM
            Product
    )