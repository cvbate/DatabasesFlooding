
# Flood Risk and Defenses in Coastal Louisiana

## Ruthanne Ward, Grace Nwachukwu, and Clio Bate | Spatial Databases IDCE376

## Introduction

The risk of flooding in coastal cities poses significant challenges to both infrastructure and communities. The devastation caused by Hurricane Katrina in 2005 remains engraved in the collective memory as one of the most catastrophic natural disasters in recent history. The hurricane's impact on the Gulf Coast region, particularly the city of New Orleans, underscored the urgent need for comprehensive assessment and mitigation of flood risk in vulnerable coastal areas. With climate change exacerbating the frequency and severity of extreme weather events, assessing flood risk becomes very important for effective urban planning and disaster management.

## Purpose

By employing a comprehensive approach that integrates topographical data, historical flood events, and current flood defenses, this assignment arises from the imperative to understand the complex interplay of natural and human factors that exacerbated the impacts of the Hurricane Katrina. Hurricane Katrina exposed the vulnerabilities of coastal cities to extreme weather events and highlighted the inadequacy of existing flood defenses in mitigating the catastrophic effects of storm surges and inundation. With the use of spatial analysis and GIS techniques, this assessment seeks to unravel the underlying causes of flood risk associated with Hurricane Katrina, provide insights into the vulnerability of the city to flooding, inform strategies for mitigation and adaptation, and identify opportunities for strengthening resilience to similar events in the future.

## Importance

- Provides valuable insights into the vulnerabilities and shortcomings of current flood management practices, facilitating learning from past mistakes and improving future disaster response strategies.
- Helps in the identification of high-risk areas and the development of targeted mitigation measures to reduce the vulnerability of coastal communities to future hurricanes and storm surges.
- This also enhances emergency preparedness and response capabilities, allowing for more efficient allocation of resources during crises.
- The findings of this assessment can inform policy decisions related to land use planning, infrastructure investment, and emergency preparedness, which is essential in enhancing resilience and adapting to the impacts of climate change.

### What included in this repository

#### Scripts

1. README.md (this document)
1. INSTRUCTIONS.md: a document that lists the instructions for each assignment
1. setup_A1: the sql code for assingment 1 this includes the creation of the database and initial tables that we potentially will use for normalizing our data
1. dataimport_A2.sql: the sql code for making sql files from our vector and raster files and importing them into PgAdmin for assignment 2
1. cleaned_tables_A2.sql: sql code that creates three empty tables and populates them with only the columns relevent to our analysis
1. analysis_A3: the sql code for our spatial queries for assignment 3

#### Data

The data in this repository are:  

1. Katrina Flood Extent (TIF)
1. Permanent Water in Louisiana (TIF)
1. Katrina Flood Extent not including Permanent Water (TIF)
![Katrina_Flooding](https://github.com/cvbate/DatabasesFlooding/assets/98286245/2c165e1f-4a4b-4d82-aae2-d6afae18b606)
1. Katrina Duration of Flooding (TIF)
![Katrina_duration](https://github.com/cvbate/DatabasesFlooding/assets/98286245/0cce2eac-4aa7-4e82-9397-51fe2e345ecd)
1. Levee Stations Louisiana (SHP)
1. Boreholes Louisiana (SHP)
1. Floodwalls Louisiana (SHP)
![Louisiana_FloodDefenses](https://github.com/cvbate/DatabasesFlooding/assets/98286245/7e022b3f-c10f-42fe-a340-a5b2a755f079)

Everything is projected to WGS 84.

## Methodology

### Assignment 1

1. Create Flooding databases and postgis extenstion
1. Create three tables that we may need for datanormalizat later on in the analysis,
    - the first table, topography which will be point data converted from a raster witht he columns: elevation, and geolocation
    - the second table to hold hurricane katrina flooding data with the columns:katrina_ID, severity, duration, and a geolocation
    - the third table to hold the levee data with three colomns: defense_ID, defense_type, and a geolocation

### Assignment 2

1. First the shapefiles were converted to sql files by using the shp2pgsql function. An example of this code is:

`
shp2pgsql -s 4326 -I "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\Louisiana_boreholes.shp" public.boreholes >
 "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\LocalVersion\boreholes.sql"
`

1. Next the rasters were converted into .sql files using the raster2pgsql function. An example of this code is:

`
raster2pgsql -s 4326 -I -C -M "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\flooding.tif" public.Katrina_flooding >
 "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\LocalVersion\flooding.sql"
`

1. Next the newly created .sql files were added to the database by reading the file into the already created database "Flooding" An example of this code is:

`
pgsql -U postgres -d Flooding -f "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\LocalVersion\boreholes.sql"
`

We ran into an issue with our rasters. The column that was supposed to contain the raster value was blank. We overcame this challenge by converting our rasters to polygon 
shapefiles and importing them to sql as shapefiles. This is a temporary fix until we figure out how to fix our raster error. 

1. Finally the tables were cleaned by dropping unncessary columns. These are columns that either include null values or are not usefull to the analysis. 

1. We will do normalization.... what is it normalization why did we need to normalize our data (or not) and how we did it!

## Normalization of Tables

Database normalization is a methodical strategy for structuring data within a database with the aim of minimizing duplication and enhancing the reliability of data.

### Reasons for Normalization

- To prevent redundancy in data.
- To simplify database structure.
- To maintain consistent relationships between tables.
- To facilitate easier database maintenance and updates.

### Checking for Normalization

### Borehole_vector Table

#### First Normal Form (1NF)

- This table satisfies INF since there are no multiple values stored in a single cell of the table, thereby reducing complexity.

#### Second Normal Form (2NF)

- Since the table is already in 1NF, and there are no partial dependencies (that is, all non-prime attributes are depending on the entire primary key), the given borehole vector table satisfies Second Normal Form (2NF).

#### Third Normal Form (3NF)

- The borehole vector meets the requirements of 3NF. It is already in 1NF and 2NF, and there are no transitive dependencies among non-prime attributes, each non-key attribute is directly dependent on the primary key (gid). Therefore, the table meets the requirements of the 3NF.

#### Fouth Normal Form (4NF)

- In the given table, there seems not to be any multi-valued dependencies. Each attribute seems to depend only on the primary key (gid) and not on combinations of other non-key attributes.
Based on the information on the borehole vector table, it does satisfy the requirements for Fourth Normal Form (4NF). It's already in 3NF, and there are no multi-valued dependencies present, . each attribute seems to depend only on the primary key (gid) and not on combinations of other non-key attributes.

### Leveestation Table

#### First Normal Form (1NF)

- This table appears to satisfy 1NF, since all are atomic, that is, each cell in the table contains a single value.

#### Second Normal Form (2NF)

- It also meets the requirements for 2NF because it is in 1NF, and none of the non-key attributes seem to depend on a subset of the primary key.

#### Third Normal Form (3NF)

- This table appears to satisfy 3NF, the table is in 2NF, and there are no transitive dependencies. All non-key attributes appear to directly depend on the primary key (gid).

#### Fourth Normal Form (4NF)

- Since the table already in 3NF, and there are no multi-valued dependencies present, the table meets the requirements of 4NF.

### Assignment 3

#### Data Sources

- The Katrina flood TIF data is from the [Global Defense Database by Cloudstreet.ai](https://global-flood-database.cloudtostreet.ai/).
- The levee SHP data is from the [National Levee Database by the US Army Corps of Engineers](https://nld.usace.army.mil/).

#### Useful Resouces

[Raster Data Management, Queries, and Applications for PostGIS EXT](https://postgis.net/docs/using_raster_dataman.html)
