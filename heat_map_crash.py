import folium
import pandas as pd
import geopandas as gpd

bike_stations = pd.read_csv('Data/bike_stations.csv')
bike_accident = pd.read_csv('Data/bike_accidents.csv')

# Bike station dataframe to geodataframe
station_gdf = gpd.GeoDataFrame(stations, geometry=gpd.points_from_xy(stations.longitude, stations.latitude))
station_gdf.crs = 'epsg:4326'
#station_gdf.head()

# Bike accident dataframe to geodataframe
bike_accident_gdf = gpd.GeoDataFrame(bike_accident, geometry=gpd.points_from_xy(bike_accident.longitude, bike_accident.latitude))
bike_accident_gdf.crs = 'epsg:4326'
#bike_accident_gdf.head()

# Project for distances
station_proj = station_gdf.to_crs(epsg=2263)
bike_acc_proj = bike_accident_gdf.to_crs(epsg=2263)

# 100 foot buffers
hundred_ft_buffer = station_proj.geometry.buffer(100)

# Ensure lat-long floats
bike_accident_gdf['latitude'] = bike_accident_gdf['latitude'].astype(float)
bike_accident_gdf['longitude'] = bike_accident_gdf['longitude'].astype(float)
# Filter heat_df
heat_df = bike_accident_gdf
heat_df = heat_df[['latitude', 'longitude']]
heat_df = heat_df.dropna(axis=0, subset=['latitude','longitude'])
heat_df = [[row['latitude'],row['longitude']] for index, row in heat_df.iterrows()]

# Create map bike station closeness to bike related accident frequency
accident_map = folium.Map(location=[ 40.725777,-73.986604], zoom_start=15)
HeatMap(heat_df).add_to(accident_map)
    
# Plot each polygon on the map
GeoJson(hundred_ft_buffer.to_crs(epsg=4326)).add_to(accident_map)

my_map.save('index.html')
