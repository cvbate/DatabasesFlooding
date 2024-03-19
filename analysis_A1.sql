--create database
CREATE DATABASE "Flooding";

-- Connect to RealEstateDB
\c flooding

-- Enable PostGIS
CREATE EXTENSION IF NOT EXISTS postgis;

------- everything above will go in README.md 

-------- setup
-- create table for topography
CREATE TABLE topography(
    elevation varchar(255)
);
-- create table for flood events/flood risks
CREATE TABLE  flood_risk(
flood_area_ID int PRIMARY KEY,
Risk varchar(255)
);

-- create table for flood defenses
CREATE TABLE flood_defenses(
defense_ID int PRIMARY KEY,
defense_type varchar(255),
GeoLocation GEOMETRY(Point, 4326)
);