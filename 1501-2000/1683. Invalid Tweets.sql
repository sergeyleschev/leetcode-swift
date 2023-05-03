# Write your MySQL query statement below
# Solution @ Sergey Leschev

SELECT tweet_id FROM Tweets WHERE CHAR_LENGTH(content) > 15;