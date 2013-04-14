/********************************************************************
 Gerald (Jerry) D'Antonio
 Passion Driven Statistics via Coursera
 Analysis of Mars Crater Data

 "Is there a relationship between the size of a crater and its
  distance from the equator?"
 *******************************************************************/

/* load the class data set */
libname mydata "/courses/u_coursera.org1/i_1006328/c_5333" access=readonly;

/* get the mars crater data from the data set */
DATA new; set mydata.marscrater_pds;

/* round latitude to nearest degree, nearest 10 degrees
   convert depth to meters */
NEAREST_LATITUDE = FLOOR(LATITUDE_CIRCLE_IMAGE);
LATITUDE_GROUP = FLOOR(LATITUDE_CIRCLE_IMAGE / 10);
APPROX_DIAMETER = FLOOR(DIAM_CIRCLE_IMAGE);
DEPTH_METERS = DEPTH_RIMFLOOR_TOPOG * 1000;

/* give friendly labels to the columns I want to work with */
LABEL LATITUDE_CIRCLE_IMAGE = "Latitude of Crater Center"
      DIAM_CIRCLE_IMAGE     = "Crater Diameter (in km)"
      DEPTH_RIMFLOOR_TOPOG  = "Average Elevation of Crater Rim (in km)";

LABEL NEAREST_LATITUDE = "Relative Distance from Equator (nearest 1 degree latitude)"
      LATITUDE_GROUP   = "Relative Distance from Equator (nearest 10 degrees latitude)"
	  APPROX_DIAMETER  = "Crater Diameter (nearest 1 km)"
      DEPTH_METERS     = "Average Elevation of Crater Rim (in meters)";

/* sort the data by crater_id, asc */
PROC SORT; by CRATER_ID;

/* big data set, will take a lot of time */
/*PROC PRINT; VAR latitude_group;*/

/* calculate frequency data */
PROC FREQ; TABLES latitude_group nearest_latitude depth_meters;

PROC UNIVARIATE; VAR latitude_group nearest_latitude approx_diameter;

/* run the program - always required */
run;
