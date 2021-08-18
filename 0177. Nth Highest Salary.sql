-- Solution @ Sergey Leschev, Belarusian State University

-- 177. Nth Highest Salary
-- Write a SQL query to get the nth highest salary from the Employee table.
-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.
-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | 200                    |
-- +------------------------+

create function getNthHighestSalary(N int) returns int
begin
  declare M int;
  set M = N -1;
    return (
        # Write your MySQL query statement below.
        select distinct Salary from Employee order by Salary desc limit M, 1
    );
end