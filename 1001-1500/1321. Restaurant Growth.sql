# Write your MySQL query statement below
# Solution @ Sergey Leschev
# 1321. Restaurant Growth.sql

select a.visited_on as visited_on, SUM(b.day_sum) as amount,
       ROUND(AVG(b.day_sum), 2) as average_amount
FROM
  (select visited_on, SUM(amount) as day_sum from Customer group by visited_on ) a,
  (select visited_on, SUM(amount) as day_sum from Customer group by visited_on ) b
where DATEDIFF(a.visited_on, b.visited_on) between 0 and 6
group by a.visited_on
having COUNT(b.visited_on) = 7