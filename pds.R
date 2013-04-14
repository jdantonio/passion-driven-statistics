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
#install.packages('descr', dep=T)
#install.packages('fBasics', dep=T)
#install.packages('pastecs', dep=T)
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
nearest_latitude <- floor(craters$LATITUDE_CIRCLE_IMAGE)
latitude_group <- floor(craters$LATITUDE_CIRCLE_IMAGE / 10)
approx_diameter <- floor(craters$DIAM_CIRCLE_IMAGE)
depth_meters <- craters$DEPTH_RIMFLOOR_TOPOG * 1000

## display the frequencies of my selected variables
#freq(craters$LATITUDE_CIRCLE_IMAGE)
#freq(craters$DIAM_CIRCLE_IMAGE)
#freq(craters$DEPTH_RIMFLOOR_TOPOG)
#freq(nearest_latitude)
#freq(latitude_group)
#freq(approx_diameter)
#freq(depth_meters)

## display boxplots for my selected variables
#boxplot(craters$LATITUDE_CIRCLE_IMAGE)
#boxplot(craters$DIAM_CIRCLE_IMAGE)
#boxplot(craters$DEPTH_RIMFLOOR_TOPOG)
#boxplot(nearest_latitude)
#boxplot(latitude_group)
#boxplot(approx_diameter)
#boxplot(depth_meters)

# get basic descriptive statistics
options(scipen=100)
options(digits=4)

print('Descriptive stats for LATITUDE_CIRCLE_IMAGE: Latitude of Crater Center')
print(stat.desc(craters$LATITUDE_CIRCLE_IMAGE))

print('Descriptive stats for DIAM_CIRCLE_IMAGE: Crater Diameter (in km)')
print(stat.desc(craters$DIAM_CIRCLE_IMAGE))

print('Descriptive stats for DEPTH_RIMFLOOR_TOPOG: Average Elevation of Crater Rim (in km)')
print(stat.desc(craters$DEPTH_RIMFLOOR_TOPOG))

print('Descriptive stats for derived data')
print('nearest_latitude:')
print(stat.desc(nearest_latitude))

print('latitude_group:')
print(stat.desc(latitude_group))

print('approx_diameter:')
print(stat.desc(approx_diameter))

print('depth_meters:')
print(stat.desc(depth_meters))

# create scatterplots of the explanatory variable (latitude)
# and the two two response variables (diameter and depth)
# with fit lines for regression (y~x) and lowess (x,y)
plot(craters$LATITUDE_CIRCLE_IMAGE, craters$DIAM_CIRCLE_IMAGE,
     xlab="latitude from the derived center (decimal degrees North)",
     ylab="diameter (units are km)")
abline(lm(craters$DIAM_CIRCLE_IMAGE~craters$LATITUDE_CIRCLE_IMAGE), col="red")
lines(lowess(craters$LATITUDE_CIRCLE_IMAGE,craters$DIAM_CIRCLE_IMAGE), col="blue")

plot(craters$LATITUDE_CIRCLE_IMAGE, craters$DEPTH_RIMFLOOR_TOPOG,
     xlab="latitude from the derived center (decimal degrees North)",
     ylab="average elevation (units are km)")
abline(lm(craters$DEPTH_RIMFLOOR_TOPOG ~ craters$LATITUDE_CIRCLE_IMAGE), col="red")
lines(lowess(craters$LATITUDE_CIRCLE_IMAGE, craters$DEPTH_RIMFLOOR_TOPOG), col="blue")
