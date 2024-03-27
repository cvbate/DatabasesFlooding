-- simplification of tables in SQL Shell 
-- drop all irrelevant and null columns from our data.

-- BoreholesWGS84.shp
-- LeveeStationsWGS84.shp
-- FloodwallsWGS84.shp

\c Flooding

-- Boreholes, run no issues
ALTER TABLE beloworeholes_vector
DROP COLUMN levee_stat, -- irrelevent
DROP COLUMN reference_, -- irrelevent
DROP COLUMN reference1, -- null
DROP COLUMN feature_de, -- irrelevent
DROP COLUMN survey_dat, -- null
DROP COLUMN coordinate, -- irrelevent
DROP COLUMN segment_id; -- null

-- LeveeStations, run no issues
ALTER TABLE leveestations_vector
DROP COLUMN levee_stat, -- irrelevent
DROP COLUMN river_mile, -- irrelevent
DROP COLUMN levee_st_1, -- irrelevent
DROP COLUMN levee_mile, -- null/ all 0
DROP COLUMN water_surf, -- irrelevent
DROP COLUMN survey_dat, -- null
DROP COLUMN coordinate, -- irrelevent
DROP COLUMN segment_id, -- null
DROP COLUMN capture_st, -- null
DROP COLUMN status; -- null


-- Floodwalls not yet run 
ALTER TABLE floodwalls_vector
DROP COLUMN floodwall_, -- irrelevent
DROP COLUMN gage_code, -- null
DROP COLUMN foundation, -- null/ all 0s
DROP COLUMN river_basi, -- irrelevent
DROP COLUMN horiz_accu, -- irrelevent
DROP COLUMN vert_accur, -- irrelevent
DROP COLUMN gage_owner, -- irrelevent
DROP COLUMN coordinate, -- irrelevent
DROP COLUMN segment_id, -- irrelevent
DROP COLUMN status; -- irrelevent theyre all current
DROP COLUMN cutoff_typ, -- irrelevent
DROP COLUMN segment_na, -- irrelevent
DROP COLUMN system_nam, -- irrelevent