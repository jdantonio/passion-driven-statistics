libname mydata "/courses/u_coursera.org1/i_1006328/c_5333" access=readonly;

data new; set mydata.marscrater_pds;

proc sort; by CRATER_ID;

proc freq; tables LATITUDE_CIRCLE_IMAGE DIAM_CIRCLE_IMAGE DEPTH_RIMFLOOR_TOPOG;

run;
