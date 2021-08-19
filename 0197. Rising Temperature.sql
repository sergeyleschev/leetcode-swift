-- Solution @ Sergey Leschev, Belarusian State University

-- 197. Rising Temperature
-- Table: Weather
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the primary key for this table.
-- This table contains information about the temperature in a certain day.
--  Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).
-- Return the result table in any order.
-- The query result format is in the following example:
-- Weather
-- +----+------------+-------------+
-- | id | recordDate | Temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |
-- +----+------------+-------------+
-- Result table:
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+
-- In 2015-01-02, temperature was higher than the previous day (10 -> 25).
-- In 2015-01-04, temperature was higher than the previous day (20 -> 30).

-- Write your MySQL query statement below

select wt1.Id
from Weather wt1, Weather wt2
where wt1.Temperature > wt2.Temperature and
      to_days(wt1.RecordDate) - to_days(wt2.RecordDate) = 1;