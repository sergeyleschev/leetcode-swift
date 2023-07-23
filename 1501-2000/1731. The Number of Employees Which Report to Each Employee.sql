# MySQL query statement below
# Solution by Sergey Leschev
SELECT
    e.reports_to AS employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM
    Employees e
    JOIN Employees m ON (e.reports_to = m.employee_id)
GROUP BY
    e.reports_to
HAVING
    COUNT(e.employee_id) > 0
ORDER BY
    employee_id;