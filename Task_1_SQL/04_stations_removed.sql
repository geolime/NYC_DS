SELECT station_id, name, last_reported, is_installed
FROM `bigquery-public-data.new_york.citibike_stations` 
WHERE EXTRACT(YEAR FROM last_reported) != 2022
ORDER BY last_reported DESC, station_id;

# is_installed does not appear to indicate actually if a station is installed or not, no TRUE values at all
# highly likely that stations without a current timestamp or default timestamp of this year are most likely removed