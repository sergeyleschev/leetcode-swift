# Write your MySQL query statement below
# Solution @ Sergey Leschev

SELECT e.name
FROM Employee e
JOIN (
    SELECT managerId, COUNT(*) AS numEmployees
    FROM Employee
    GROUP BY managerId
) AS empCount
ON e.id = empCount.managerId
WHERE empCount.numEmployees >= 5 OR e.managerId IS NULL;