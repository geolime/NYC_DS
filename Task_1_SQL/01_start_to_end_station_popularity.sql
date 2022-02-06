SELECT
  CONCAT(start_station_name, " to ", end_station_name) AS start_to_end_station,
  COUNT(*) AS trips
FROM `bigquery-public-data.new_york.citibike_trips`
GROUP BY start_station_name, end_station_name
ORDER BY trips DESC
LIMIT 1;