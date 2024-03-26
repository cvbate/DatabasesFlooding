-- Connect to database
\c Flooding
-- depending on your system it may also be
\c "Flooding"


--in command prompt set your path to the folder that contian the data
cd <path>
-- clio cd C:\Users\cvale\DatabaseFlooding\DatabasesFlooding\file name

-- save the shp as a sql document called parks.sql in the same folder
-- explain what -s and -I do 
-- repeate this however 
shp2pgsql -s 4326 -I open_space.shp public.parks_vector > kat_flood.sql