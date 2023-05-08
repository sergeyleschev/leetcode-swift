# Write your MySQL query statement below
# Solution @ Sergey Leschev

SELECT id, COUNT(*) as num FROM 
(SELECT requester_id AS id FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id FROM RequestAccepted) AS friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;