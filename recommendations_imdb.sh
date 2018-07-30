echo "Fetching the data from RDBMS for Recommendations"
cd $SQOOP_HOME
## This is from IMDB
#bin/sqoop import --connect jdbc:mysql://192.168.2.7/test_movies --query 'select user,movie_id,rating from user_info_review_imdb where $CONDITIONS' --target-dir /user/vm4learning/user_info_review_imdb --split-by movie_id --username srinu --password srinu

cd $HIVE_HOME
#bin/hive -f /home/vm4learning/Desktop/Oct_batch/Recommendations/hql/create_table_imdb.sql
bin/hive -f /home/vm4learning/Desktop/Oct_batch/Recommendations/hql/recommendations_imdb.sql

