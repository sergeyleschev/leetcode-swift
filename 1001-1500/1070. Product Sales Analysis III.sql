# Write your MySQL query statement below
# Solution @ Sergey Leschev

WITH min_sales AS (
  SELECT product_id, MIN(year) AS min_year
  FROM Sales
  GROUP BY product_id
)
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s 
JOIN Product p ON s.product_id = p.product_id
JOIN min_sales ms ON s.product_id = ms.product_id AND s.year = ms.min_year;