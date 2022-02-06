SELECT start_station_name, COUNT(*) AS trips
FROM `bigquery-public-data.new_york.citibike_trips`
GROUP BY start_station_name
ORDER BY trips DESC
LIMIT 1;