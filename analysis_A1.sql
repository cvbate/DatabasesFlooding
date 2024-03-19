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
    elevation datatype,
    column2 datatype,
    column3 datatype,
   ....
);
-- create table for flood events/flood risks
CREATE TABLE  flood_risk(

);

-- create table for flood defenses
CREATE TABLE flood_defenses(


);