-- Create three new tables and populate them with columns relevent to our analysis

-- Floodwalls

-- create empty table with same (or new if desired) column names from the source table
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

-- populate the new table with columns
INSERT INTO floodwalls_clean_vector(gid, wall_heigh, wall_width, flood_sour, survey_dat, length_met, length_mil, bank, name, primary_ma, walltype, miles, lsac_ratin, constructi, geom)
SELECT gid, wall_heigh, wall_width, flood_sour, survey_dat, length_met, length_mil, bank, name, primary_ma, walltype, miles, lsac_ratin, constructi, geom
FROM floodwalls_vector;

--------------------------------------

-- Boreholes
-- create empty table with same (or new if desired) column names from the source table
CREATE TABLE boreholes_clean_vector(
    gid int PRIMARY KEY,
    borehole_i numeric,
    start_date date,
    completion date,
    ground_sur numeric,
    total_dept numeric,
    type varchar(255),
    boring_met varchar(100),
    geom GEOMETRY
);

-- populate the new table with columns
INSERT INTO boreholes_clean_vector(gid, borehole_i, start_date, completion, ground_sur, total_dept, type, boring_met, geom)
SELECT gid, borehole_i, start_date, completion, ground_sur, total_dept, type, boring_met, geom
FROM Boreholes_vector;

---------------------

-- Leveestations
-- create empty table with same (or new if desired) column names from the source table
CREATE TABLE leveestations_clean_vector(
    gid int PRIMARY KEY,
    station_el numeric,
    geom GEOMETRY
);

-- populate the new table with columns
INSERT INTO leveestations_clean_vector (gid, station_el, geom)
SELECT gid, station_el, geom
FROM leveestations_vector;