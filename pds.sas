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

/* give friendly lanels to the columns I want to work with */
LABEL LATITUDE_CIRCLE_IMAGE = "Latitude of Crater Center"
      DIAM_CIRCLE_IMAGE     = "Crater Diameter (in km)"
      DEPTH_RIMFLOOR_TOPOG  = "Average Elevation of Crater Rim (in km)";

NEAREST_LATITUDE = FLOOR(LATITUDE_CIRCLE_IMAGE);
DIAMETER_METERS = DIAM_CIRCLE_IMAGE * 1000;
DEPTH_METERS = DEPTH_RIMFLOOR_TOPOG * 1000;

LABEL NEAREST_LATITUDE = "Latitude of Crater Center (nearest whole degree)"
      DIAMETER_METERS  = "Crater Diameter (in meters)"
      DEPTH_METERS     = "Average Elevation of Crater Rim (in meters)";

/*
 Missing data can be excluded like this:
 IF var=val THEN var=.;
 the 'dot' tells SAS to treat it as missing

 Skip data can be recoded like this:
 IF var=. THEN var=val

 IF statements can be followed by ELSE IF

 IF/ELSE can be used to create *new* variables, too

 IF age LE 20 THEN agegroup = 1;
 ELSE IF age LE 22 THEN agegroup = 2;
 ELSE agegroup = 3;
 */


/* sort the data by crater_id, asc */
PROC SORT; by CRATER_ID;

PROC PRINT; VAR nearest_latitude;


/* calculate frequency data for my chosen variables */
/* NOTE: I need to compute based on latitude bands (at least 1 degree)
         and convert sizes to something smaller than km
 */
/*PROC FREQ; TABLES LATITUDE_CIRCLE_IMAGE DIAM_CIRCLE_IMAGE DEPTH_RIMFLOOR_TOPOG;*/
PROC FREQ; TABLES nearest_latitude diameter_meters depth_meters;

/* run the program - always required */
run;
