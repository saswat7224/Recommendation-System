
use movies_hive;
CREATE table IF NOT EXISTS good_movies as 
select movie_id,count(*) as votes,avg(rating) as avg_rating from 
(select * from ratings where rating > 3 ) sub 
group by movie_id
having count(*) > 5;

CREATE table IF NOT EXISTS good_ratings as 
select r.user_id,r.movie_id from good_movies g join ratings r 
on g.movie_id = r.movie_id
where rating > 3
