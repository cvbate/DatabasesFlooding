-- Connect to database in SQL Shell
\c Flooding

CREATE EXTENSION IF NOT EXISTS postgis_raster;
------------------------------------------------------------------------
-- Acer Swift X Windows X PostGis 16

--in command prompt set your path to the folder that contains the data
cd C:\Users\cvale\DatabaseFlooding\DatabasesFlooding\Data2

-- shapefiles used
-- LeveeStationsWGS84.shp
-- BoreholesWGS84.shp
-- FloodwallsWGS84.shp

---------------Step 1: use wsl from command prompt
-- make sure you are in the directory/folder where the shapefiles files live

-- use shp2pgsql and raster2pgsql to save vector shapefiles and raster tifs as sql scripts in your current directory
-- vectors
-- -s flag specifies the spatial reference of the source file
-- -I flag creates an index which speeds up sptial querying
shp2pgsql -s 4326 -I LeveeStationsWGS84.shp public.LeveeStations_vector > LeveeStations.sql

shp2pgsql -s 4326 -I BoreholesWGS84.shp public.Boreholes_vector > Boreholes.sql

shp2pgsql -s 4326 -I FloodwallsWGS84.shp public.Floodwalls_vector > Floodwalls.sql


-- rasters
-- -s flag specifies the spatial reference of the source file
-- -I flag creates an index on the raster column which speeds up spatial querying
-- -C flag adds raster contraints to use that the data is imported in the correct format
-- -M flag vacuum analyze the raster file after loading
raster2pgsql -s 4326 -I -C -M Katrina_floods_without_perm_water_clip.tif public.katflood_rast > katflood.sql 

raster2pgsql -s 4326 -I -C -M Katrina_Perm_water_clip.tif public.permwater_rast > permwater.sql 

raster2pgsql -s 4326 -I -C -M katrina_duration_clip.tif public.duration_rast > duration.sql 

---------------Step 2: import sql files using command prompt

-- -U connects to the database as a specific user
-- -d points to the destiniation database
-- -f points to the .sql file to be imported

-- make sure you are in the directory/folder where the .sql files live
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f LeveeStations.sql
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f Boreholes.sql
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f Floodwalls.sql

--rasters import but the column is emptyy....... this is okay, there is still data 
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f katflood.sql
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f permwater.sql
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f duration.sql

---------------Step 3: in SQL Shell
-- check that there is data, be sure you are working in your database
-- this will return columns and values
SELECT (ST_PixelAsPoints(rast)) FROM katflood_rast;