-- Create three new tables and populate them with columns relevent to our analysis

-- BoreholesWGS84.shp
-- LeveeStationsWGS84.shp
-- FloodwallsWGS84.shp
DROP TABLE floodwalls_clean_vector;

CREATE TABLE floodwalls_clean_vector(
gid int PRIMARY KEY,
wall_heigh numeric,
wall_width numeric,
flood_sour varchar(255),
survey_dat date,
length_met numeric,
length_mil numeric,
bank varchar(255),
name varchar(255),
primary_ma varchar(255),
walltype varchar(255),
miles numeric,
lsac_ratin varchar(25),
constructi varchar(255),
geom GEOMETRY
);

INSERT INTO floodwalls_clean_vector(gid, wall_heigh, wall_width, flood_sour, survey_dat, length_met, length_mil, bank, name, primary_ma, walltype, miles, lsac_ratin, constructi, geom)
SELECT gid, wall_heigh, wall_width, flood_sour, survey_dat, length_met, length_mil, bank, name, primary_ma, walltype, miles, lsac_ratin, constructi, geom
FROM floodwalls_vector;

--------------------------------------

CREATE TABLE boreholes_clean_vector(
    column1 datatype,
    column2 datatype,
    column3 datatype,
    
);

INSERT INTO table2 (CustomerName, City, Country)
FROM table1;


---------------------

CREATE TABLE leveestations_vector(
    column1 datatype,
    column2 datatype,
    column3 datatype,
    
);

INSERT INTO table2 (CustomerName, City, Country)
FROM table1;