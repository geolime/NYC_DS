SELECT seconds, COUNT(*) AS trip_distribution
                FROM 
                (
                  SELECT CASE WHEN tripduration BETWEEN 0 AND 100 THEN '0 to 100'
                              WHEN tripduration BETWEEN 100 AND 1000 THEN '100 to 1000'
                              WHEN tripduration BETWEEN 1000 AND 10000 THEN '1000 to 10000'
                              WHEN tripduration BETWEEN 10000 AND 100000 THEN '10000 to 100000'
                              WHEN tripduration BETWEEN 100000 AND 1000000 THEN '100000 to 1000000'
                              WHEN tripduration BETWEEN 1000000 AND 10000000 THEN '1000000 to 10000000' 
                              WHEN tripduration BETWEEN 10000000 AND 100000000 THEN '10000000 to 100000000'END AS seconds
                  FROM `bigquery-public-data.new_york.citibike_trips`
                  )
                  GROUP BY seconds
                  ORDER BY seconds;