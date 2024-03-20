--create database
CREATE DATABASE "Flooding";

-- Connect to RealEstateDB
\c Flooding

-- Enable PostGIS
CREATE EXTENSION IF NOT EXISTS postgis;

------- everything above will go in README.md 

-------- setup
-- create table for topography which will be point data
CREATE TABLE topography(
elevation varchar(255),
GeoLocation GEOMETRY(Point, 4326)
);

-- create table for hurrican katrina flood event
CREATE TABLE  katrina(
katrina_ID int PRIMARY KEY,
Severity varchar(255),
Duration varchar (255),
GeoLocation GEOMETRY(Polygon, 4326) -- this should be polygon? check syntax
);

-- create table for flood defenses
CREATE TABLE flood_defenses(
defense_ID int PRIMARY KEY,
defense_type varchar(255),
GeoLocation GEOMETRY(Point, 4326)
);