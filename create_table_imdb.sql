use movies_hive;
create external table IF NOT EXISTS user_rating_imdb(user string,movie_id string,rating int) row format delimited fields terminated by ',' LOCATION '/user/vm4learning/user_info_review_imdb'
