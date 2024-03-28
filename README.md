
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

### What is included in this repository

1. README.md (this document)
1. INSTRUCTIONS.md: a document that lists the instructions for each assignment
1. analysis_A1: the sql code for assingment 1 this includes the creation of the database and initial tables
1. analysis_A2: the sql code for assignment 2
1. analysis_A3: the sql code for assignment 3

### Data

The data included in this repository are:  

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

- The Katrina flood datais from the [Global Defense Database by Cloudstreet.ai](https://global-flood-database.cloudtostreet.ai/).
- The levee data is from the [National Levee Database by the US Army Corps of Engineers](https://nld.usace.army.mil/).

## Methodology

### Assignment 1

1. Create Flooding databases and postgis extenstion
1. Create three tables,
    - the first table, topography which will be point data converted from a raster witht he columns: elevation, and geolocation
    - the second table to hold hurricane katrina flooding data with the columns:katrina_ID, severity, duration, and a geolocation
    - the third table to hold the levee data with three colomns: defense_ID, defense_type, and a geolocation

### Assignment 2

1.  First the shapefiles were converted to sql files by using the shp2pgsql function. An example of this code is:

```
shp2pgsql -s 4326 -I "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\Louisiana_boreholes.shp" public.boreholes >
 "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\LocalVersion\boreholes.sql"
```

2. Next the rasters were converted into .sql files using the raster2pgsql function. An example of this code is:

```
raster2pgsql -s 4326 -I -C -M "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\flooding.tif" public.Katrina_flooding >
 "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\LocalVersion\flooding.sql"
```

3. Next the newly created .sql files were added to the database by reading the file into the already created database "Flooding" An example of this code is:

```
pgsql -U postgres -d Flooding -f "C:\Users\rutha\OneDrive - Clark University\Documents\SpatialDatabase\FloodingProject\LocalVersion\boreholes.sql"
```

We ran into an issue with our rasters. The column that was supposed to contain the raster value was blank. We overcame this challenge by converting our rasters to polygon 
shapefiles and importing them to sql as shapefiles. This is a temporary fix until we figure out how to fix our raster error. 

4. Finally the tables were cleaned by dropping unncessary columns. These are columns that either include null values or are not usefull to the analysis. 


we will do normalization.... what is it normalization why did we need to normalize our data (or not) and how we did it!

### Assignment 3

#### Credits
