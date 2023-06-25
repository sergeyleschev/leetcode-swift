# Write your MySQL query statement below
# Solution @ Sergey Leschev

SELECT name, bonus
FROM Employee e LEFT JOIN Bonus b ON e.empId = b.empId
WHERE bonus < 1000 OR bonus IS NULL;
