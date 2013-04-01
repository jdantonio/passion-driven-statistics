#********************************************************************
# Gerald (Jerry) D'Antonio
# Passion Driven Statistics via Coursera
# Analysis of Mars Crater Data
#
# "Is there a relationship between the size of a crater and its
#  distance from the equator?"
#********************************************************************

# to load this file from the R console
#source('pds.R')

## load additional libraries
#install.packages('descr')
#install.packages('fBasics')
#install.packages('pastecs')
library(descr)
#library(fBasics)
library(pastecs)

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

## display the frequencies of my selected variables
#freq(nearest_latitude)
#freq(approx_diameter)
#freq(depth_meters)

# get basic descriptive statistics
options(scipen=100)
options(digits=4)

print('Descriptive stats for LATITUDE_CIRCLE_IMAGE: Latitude of Crater Center')
print(stat.desc(craters$LATITUDE_CIRCLE_IMAGE))

print('Descriptive stats for DIAM_CIRCLE_IMAGE: Crater Diameter (in km)')
print(stat.desc(craters$DIAM_CIRCLE_IMAGE))

print('Descriptive stats for DEPTH_RIMFLOOR_TOPOG: Average Elevation of Crater Rim (in km)')
print(stat.desc(craters$DEPTH_RIMFLOOR_TOPOG))
