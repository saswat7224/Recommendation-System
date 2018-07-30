

Recommendations Project.

---> Ingestion :

     1)Sqoop Import users,ratings,movies in to Hadoop.
     2)Created External Hive tables on Sqoop Result.

---> Association Rule Mining(MBA).

   Preprocessing:(Ip : Ratings ,Op : Good_Ratings)
   1) Remove all movies less than 3 ratings.
   2) Remove all movies whose votes < Threshold(5)

   Recommendations:(Ip :Good_Ratings,Op :movies_recommendations)
   1) Find out the Similar Users.
   2) Find out the movies which was watched by similar user which was not watched by base user.

