
# to load this file from the R console
#source('pds.R')

# load the data
marscrater <- read.csv("data/marscrater_pds.csv")

# specify variables to keep
var.keep <- c("CRATER_ID", "LATITUDE_CIRCLE_IMAGE", "DIAM_CIRCLE_IMAGE", "DEPTH_RIMFLOOR_TOPOG")

# create a new frame with just the values I want to keep
craters <- marscrater[,var.keep]

# sort the data
craters <- craters[order(craters$CRATER_ID,decreasing=F),]

# view some data
#View(craters)

# sort each of my variables
nearest_latitude <- as.ordered(floor(abs(craters$LATITUDE_CIRCLE_IMAGE)))
approx_diameter <- as.ordered(floor(craters$DIAM_CIRCLE_IMAGE))
depth_meters <- as.ordered(craters$DEPTH_RIMFLOOR_TOPOG * 1000)

## load the descriptive stats library
library(descr)

## display the frequencies of my selected variables
#freq(nearest_latitude)
#freq(approx_diameter)
#freq(depth_meters)
