use movies_hive;
create table good_imdb as 
select u.user as user_id,u.movie_id from user_rating_imdb u join (
select user,count(*) as cnt from user_rating_imdb
group by user having count(*) > 5 ) gu 
on u.user = gu.user;

use movies_hive;

create table movies_recommendations_pre_imdb as 
select movie_id,pairMovieId,count(*) as cnt from (
select x.movie_id as movie_id,z.movie_id as pairMovieId from good_imdb x join good_ratings y
on x.movie_id = y.movie_id join good_ratings z
on y.user_id = z.user_id ) res
where movie_id <> pairMovieId
group by movie_id,pairMovieId;

create table movies_recommendations_imdb as
select movie_id,collect_set(pairMovieId) as listofMovies from (
select movie_id,pairMovieId from (
select movie_id,pairMovieId,cnt,
row_number() OVER (PARTITION BY movie_id ORDER BY cnt desc) as numb
from movies_recommendations_pre_imdb ) res
where numb < 5 ) res2
group by movie_id;
