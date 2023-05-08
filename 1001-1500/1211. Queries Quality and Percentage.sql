# Write your MySQL query statement below
# Solution @ Sergey Leschev

SELECT query_name, 
ROUND(AVG(1.0 * rating / position), 2) AS quality,
ROUND((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*) * 100), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
