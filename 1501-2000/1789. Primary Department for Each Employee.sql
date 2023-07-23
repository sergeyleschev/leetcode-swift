# MySQL query statement below
# Solution by Sergey Leschev
SELECT
    employee_id,
    department_id
FROM
    Employee
WHERE
    primary_flag = 'Y'
UNION
SELECT
    employee_id,
    department_id
FROM
    Employee
WHERE
    employee_id NOT IN (
        SELECT
            employee_id
        FROM
            Employee
        WHERE
            primary_flag = 'Y'
    )