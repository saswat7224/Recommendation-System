echo "Fetching the data from RDBMS for Recommendations"
cd $SQOOP_HOME
## This is for MovieLens
#bin/sqoop import --connect jdbc:mysql://localhost/movie_recommend --table users
#bin/sqoop import --connect jdbc:mysql://localhost/movie_recommend --table movies
#bin/sqoop import --connect jdbc:mysql://localhost/movie_recommend --table ratings



echo "Creating Hive External Tables "
cd $HIVE_HOME
#bin/hive -f /home/vm4learning/Desktop/Oct_batch/Recommendations/hql/create_tables.sql

echo "Preprocessing Hive tables and getting good_data"
#bin/hive -f /home/vm4learning/Desktop/Oct_batch/Recommendations/hql/preprocess.sql

echo "Recommendations "
bin/hive -f /home/vm4learning/Desktop/Oct_batch/Recommendations/hql/recommendations.sql

