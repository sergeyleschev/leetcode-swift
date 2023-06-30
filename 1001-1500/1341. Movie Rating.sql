# Write your MySQL query statement below
# Solution by Sergey Leschev
# 1341. Movie Rating

with movie_rating as (
    select mr.movie_id, 
           avg(rating) as avg_rate,
           title
    from MovieRating as mr
         left join Movies as m on mr.movie_id = m.movie_id
    where created_at between "2020-02-01" and "2020-02-28"
    group by movie_id
    order by avg_rate desc, title asc
    limit 1),

users_rating as (
   select u.user_id, u.name,
          count(mr.user_id) as rate_count
   from Users as u
        left join MovieRating as mr on u.user_id = mr.user_id
   group by mr.user_id
   order by rate_count desc, name
   limit 1
)

select name as "results" from users_rating
union all
select title from movie_rating;
