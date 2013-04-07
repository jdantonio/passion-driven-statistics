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
NEAREST_LATITUDE = FLOOR(ABS(LATITUDE_CIRCLE_IMAGE));
LATITUDE_BAND = FLOOR(ABS(LATITUDE_CIRCLE_IMAGE) / 10);
DEPTH_METERS = DEPTH_RIMFLOOR_TOPOG * 1000;

/* give friendly labels to the columns I want to work with */
LABEL LATITUDE_CIRCLE_IMAGE = "Latitude of Crater Center"
      DIAM_CIRCLE_IMAGE     = "Crater Diameter (in km)"
      DEPTH_RIMFLOOR_TOPOG  = "Average Elevation of Crater Rim (in km)";

LABEL LATITUDE_BAND    = "Relative Distance from Equator (latitude absolute value, nearest 10 degrees)"
      DEPTH_METERS     = "Average Elevation of Crater Rim (in meters)";

/* sort the data by crater_id, asc */
PROC SORT; by CRATER_ID;

/* big data set, will take a lot of time */
/*PROC PRINT; VAR latitude_band;*/

/* calculate frequency data */
PROC FREQ; TABLES latitude_band nearest_latitude depth_meters;

PROC UNIVARIATE; VAR latitude_band nearest_latitude depth_meters;

/* run the program - always required */
run;
