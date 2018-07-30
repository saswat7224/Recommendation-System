CREATE DATABASE IF NOT EXISTS movies_hive;
use movies_hive;

CREATE external TABLE IF NOT EXISTS users (
  id int,
  age int,
  gender string,
  occupation_id int,
  zip_code string
) row format delimited fields terminated by ',' location '/user/vm4learning/users/';

create external table IF NOT EXISTS movies(
id int,
title string,
release_date string
) row format delimited fields terminated by ',' location '/user/vm4learning/movies/';

create external table IF NOT EXISTS ratings(
id int,
user_id int,
movie_id int,
rating int,
timestamp string
) row format delimited fields terminated by ',' location '/user/vm4learning/ratings/';

