# MySQL query statement below
# Solution by Sergey Leschev
SELECT
    tweet_id
FROM
    Tweets
WHERE
    CHAR_LENGTH(content) > 15;