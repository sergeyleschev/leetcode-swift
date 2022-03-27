-- Solution @ Sergey Leschev, Belarusian State University

-- 626. Exchange Seats
-- Mary is a teacher in a middle school and she has a table seat storing students' names and their corresponding seat ids.
-- The column id is continuous increment.
-- Mary wants to change seats for the adjacent students.
-- Can you write a SQL query to output the result for Mary?
-- +---------+---------+
-- |    id   | student |
-- +---------+---------+
-- |    1    | Abbot   |
-- |    2    | Doris   |
-- |    3    | Emerson |
-- |    4    | Green   |
-- |    5    | Jeames  |
-- +---------+---------+

-- For the sample input, the output is:
-- +---------+---------+
-- |    id   | student |
-- +---------+---------+
-- |    1    | Doris   |
-- |    2    | Abbot   |
-- |    3    | Green   |
-- |    4    | Emerson |
-- |    5    | Jeames  |
-- +---------+---------+
-- Note:
-- If the number of students is odd, there is no need to change the last one's seat.

-- Write your MySQL query statement below

select case
         when (id % 2 = 0) then (id - 1)
         when (id % 2 = 1) and id != (select count(id) from seat) then (id + 1)
         else id
       end id,
       student
  from seat
 order by id