-- Connect to database
\c Flooding

CREATE EXTENSION IF NOT EXISTS postgis_raster;
------------------------------------------------------------------------

-- Acer Swift X Windows X PostGis 16

--in command prompt set your path to the folder that contains the data
cd C:\Users\cvale\DatabaseFlooding\DatabasesFlooding\Data2

-- save the shp as a sql document called parks.sql in the same folder
-- explain what -s and -I do 
-- repeate this for each shapefile you have

--  shapefiles
-- LeveeStationsWGS84.shp
-- BoreholesWGS84.shp
-- FloodwallsWGS84.shp

-- in wsl

shp2pgsql -s 4326 -I LeveeStationsWGS84.shp public.LeveeStations_vector > LeveeStations.sql

shp2pgsql -s 4326 -I BoreholesWGS84.shp public.Boreholes_vector > Boreholes.sql

shp2pgsql -s 4326 -I FloodwallsWGS84.shp public.Floodwalls_vector > Floodwalls.sql



-- do the same with the raster
-- three raster, 
-- Katrina_floods_without_perm_water_clip.tif 
-- Katrina_Perm_water_clip.tif
-- duration_clip.tif

-- explain what -I , -C, -M does
raster2pgsql -s 4326 -I -C -M Katrina_floods_without_perm_water_clip.tif public.katflood_rast > katflood.sql 

raster2pgsql -s 4326 -I -C -M Katrina_Perm_water_clip.tif public.permwater_rast > permwater.sql 

raster2pgsql -s 4326 -I -C -M katrina_duration_clip.tif public.duration_rast > duration.sql 

-- clio has had had success with above code!

-- This extension postgis_raster is needed for the below code.

-- go back to command propt WITHOUT wsl


C:\Users\cvale\DatabaseFlooding\DatabasesFlooding\Data2> "c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f LeveeStations.sql
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f Boreholes.sql
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f Floodwalls.sql

--rasters import but the column is emptyy.......
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f katflood.sql
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f permwater.sql
"c:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -d Flooding -f duration.sql

