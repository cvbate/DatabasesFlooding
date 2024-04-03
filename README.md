
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
1. Katrina Duration of Flooding (TIF)
1. Levee Stations Louisiana (SHP)
1. Boreholes Louisiana (SHP)
1. Floodwalls Louisiana (SHP)
![Louisiana Data](https://github.com/cvbate/DatabasesFlooding/assets/98286245/1cc863b6-262f-4d83-b324-4be0cb3bd161)


Everything is projected to WGS 84.

#### Preprocessing in ArcPro

Before we could use the data, we had to preform some basic preprocessing of our data. We clipped all of our vecotor and raster data to the state boundary of Louisiana to reduce computational expenses during our analysis. We also double checked the projection and re-projected our data to WGS 1984 to ensure no errors related to projection were to occur.

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

1. Next the newly created .sql files were added to our PgAdmin database by reading the file into the already created database "Flooding" An example of this code is:

`
pgsql -U postgres -d Flooding -f "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\LocalVersion\boreholes.sql"
`

1. Finally we created empty tables for our vector files and populated them with only the columns from the original data that were relevent to our analysis.

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

### Floodwall_vector table

- This table also satisfies the requirements for 1NF, 2NF, 3NF and 4NF based on the various reasons given above on the previous tables.

### Uploading Images
![This is the screenshot of boleholes_table](Images/boleholes_table.JPG)

### Assignment 3

Analyze the data to identify:

In order to identify high-risk areas we chose to select areas where flood defenses and flooding polygons intersect. Areas where there was both previous flooding and no contact with flood defenses were deemed high risk for future flooding. This spatial querey was executed with the following code and visualized using QGIS. 

```
-- Create table of flooded areas that are protected by boreholes
CREATE TABLE protected_flooding_polygons AS
SELECT fv.*
FROM flooding_vector fv
JOIN boreholes_clean_vector bc ON ST_Intersects(fv.geom, bc.geom);

-- Create table of flooded areas that are protected by floodwalls
CREATE TABLE protected_flooding_polygons AS
SELECT fv.*
FROM flooding_vector fv
JOIN floodwalls_clean_vector fw ON ST_Intersects(fv.geom, fw.geom);
```

![Protected Flood Area](https://github.com/cvbate/DatabasesFlooding/assets/98286245/da03fae0-e7af-41c9-8d23-ff8d0e57b3a3)
![Protected Flooded Area with Defenses](https://github.com/cvbate/DatabasesFlooding/assets/98286245/6e399727-260b-482e-8aa5-bbec90d975ba)

We were unable to include elevation data due to the challenges listed in the next section. But, if we are able to dowload elevation data in the future we would use this spatial querey to determine areas with elevation below sea level: 

```
-- Select pixels from elevation raster that are below sea level. 
SELECT *
FROM elevation_neworleans
WHERE ST_Value(rast) < 0;

```
We determined that the effectiveness of the current flood defenses are far greater than those existing during Hurrican Katrina. Currently, the boreholes and floodwalls are most highly concentrated around New Orleans and down the eastern coastline of Louisiana. We determined that these were likely put into place post-Katrina due to the catostrophic loss of life during that event. We also determined that the areas in need of additional flood defenses are those with the lowest elevations, that have been previously flooded and don't intersect with currrent flood defenses. 


#### Challenges

We enountered a few challenges over the course of our project.

1. Data Aquisition:

    Historic Flooding data. We changed our study area from boston to Lousisna because we had difficulties finding historic flooding information in GIS data. We did eventually find flooding data for Katrina from a website, Cloudtostreedai. Intitially we thought it wasn't going to be sufficient because after downloading the raster data they appeared empty, however upon changing the symbology, we disovered that was not the case. Which is why we switched to Louisiana instead of Boston.

    Finding elevation data. We found a few sources, however due to practicality issues, we weren't able to use this data. FOr example, NOAA coastal Lidar dataset was not extensive enough for our study area. Aditionally, the Louisiana State Lidar Project did have elevation data, however the tiles available for download were very small and we would have had to individually download and then mosaic 20 + tiles for our study area. We weren't sure if this was feasable for us. After further digging we did eventually find elevation data from the US Geoelogical Survey which were were able to succesfully download for the city of New Orleans, although PgAdmin crashed any time the table was selected and the .sql file was too large to push to github.

1. Working with Raster Data
    We ran into an issue with our rasters after using raster2pgsql to import our rasters into the PGAdmin Database. The column that was supposed to contain the raster value was blank. We discovered, that uppon running the code in SQL Shell:

    `
    -- this will return columns and values  
    SELECT (ST_PixelAsPoints(rast)) FROM katflood_rast;
    `  

    It did return data so it was concluded that there was information in the raster, it was just too large for it to show u in PgAdmin.
    As back up we converting our rasters to polygon shapefiles in ArcGIS and imported them to SQL as vectors
    We did actually end up using the polygons instead of the rasters because when trying to perfom spatial queries in SQL with the rasters, it was too compuationally expensive and it was running for 20+ minutures with no results.

#### Data Sources

- The Katrina flood TIF data is from the [Global Defense Database by Cloudstreet.ai](https://global-flood-database.cloudtostreet.ai/).
- The levee SHP data is from the [National Levee Database by the US Army Corps of Engineers](https://nld.usace.army.mil/).
- The LA elevation data is from the [US Geological Survey Website](https://www.usgs.gov/the-national-map-data-delivery/gis-data-download).

#### Useful Resouces

[Raster Data Management, Queries, and Applications for PostGIS EXT](https://postgis.net/docs/using_raster_dataman.html)
[Class website](https://studyingplace.space/spatial-database/about.html)
