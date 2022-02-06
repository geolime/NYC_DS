SELECT gender, COUNT(*) AS trips, ROUND(COUNT(*) * 100.0 / 
    (SELECT COUNT(*) 
    FROM `bigquery-public-data.new_york.citibike_trips`
    )) AS percentage
FROM `bigquery-public-data.new_york.citibike_trips`
GROUP BY gender
ORDER BY percentage DESC;