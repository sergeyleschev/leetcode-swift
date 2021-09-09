-- Solution @ Sergey Leschev, Belarusian State University

-- 1179. Reformat Department Table
-- Table: Department
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | revenue       | int     |
-- | month         | varchar |
-- +---------------+---------+
-- (id, month) is the primary key of this table.
-- The table has information about the revenue of each department per month.
-- The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 
-- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

-- The query result format is in the following example:
-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+
-- Result table:
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+

-- Note that the result table has 13 columns (1 for the department id + 12 for the months).

select id, sum(case when month = 'Jan' then revenue else NULL end) as Jan_Revenue,
           sum(case when month = 'Feb' then revenue else NULL end) as Feb_Revenue,
           sum(case when month = 'Mar' then revenue else NULL end) as Mar_Revenue,
           sum(case when month = 'Apr' then revenue else NULL end) as Apr_Revenue,
           sum(case when month = 'May' then revenue else NULL end) as May_Revenue,
           sum(case when month = 'Jun' then revenue else NULL end) as Jun_Revenue,
           sum(case when month = 'Jul' then revenue else NULL end) as Jul_Revenue,
           sum(case when month = 'Aug' then revenue else NULL end) as Aug_Revenue,
           sum(case when month = 'Sep' then revenue else NULL end) as Sep_Revenue,
           sum(case when month = 'Oct' then revenue else NULL end) as Oct_Revenue,
           sum(case when month = 'Nov' then revenue else NULL end) as Nov_Revenue,
           sum(case when month = 'Dec' then revenue else NULL end) as Dec_Revenue 
from Department 
group by id