# Write your MySQL query statement below
# Solution @ Sergey Leschev
# 1978. Employees Whose Manager Left the Company

select e1.employee_id from Employees e1
 where e1.salary < 30000 
   and manager_id is not null
   and not exists(select e2.employee_id from employees e2 where e2.employee_id = e1.manager_id)
 order by employee_id
