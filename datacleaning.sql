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


-- Floodwalls, run no issues
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
DROP COLUMN status, -- irrelevent theyre all current
DROP COLUMN cutoff_typ, -- irrelevent
DROP COLUMN segment_na, -- irrelevent
DROP COLUMN system_nam, -- irrelevent
DROP COLUMN system_typ, -- irrelevent theyre all levvee system
DROP COLUMN states, -- irrelevent all in New Orleans LO
DROP COLUMN counties, -- irrelevent to our analysis
DROP COLUMN community_, -- irrelevent to our analysis
DROP COLUMN divisions, -- irrelevent
DROP COLUMN districts, -- irrelevent
DROP COLUMN fema_regio, -- irrelevent
DROP COLUMN congressio, -- irrelevent
DROP COLUMN aiannh_nam, -- irrelevent
DROP COLUMN segment_is, -- irrelevent
DROP COLUMN system_is_, -- irrelevent
DROP COLUMN authorizat, -- irrelevent
DROP COLUMN non_projec, -- null
DROP COLUMN non_proj_1, -- irrelevent
DROP COLUMN rip_status, -- irrelevent
DROP COLUMN sponsors, -- irrelevent
DROP COLUMN organizati, -- irrelevent
DROP COLUMN organiza_1, -- irrelevent
DROP COLUMN flood_so_1, -- irrelevent
DROP COLUMN design_flo, -- irrelevent
DROP COLUMN freeboard, -- irrelevent
DROP COLUMN flood_redu, -- irrelevent
DROP COLUMN stewards, -- irrelevent
DROP COLUMN responsibl, -- irrelevent
DROP COLUMN interested, -- irrelevent
DROP COLUMN p2_numbers, -- irrelevent
DROP COLUMN primary_fl, -- irrelevent
DROP COLUMN organiza_1, -- irrelevent
DROP COLUMN length,
DROP COLUMN up_river_m,
DROP COLUMN down_river,
DROP COLUMN shape__len; -- irrelevent