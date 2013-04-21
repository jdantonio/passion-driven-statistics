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
#install.packages('gmodels', dep=T)
#install.packages('pastecs', dep=T)
library(descr)
#library(fBasics)
#library(gmodels)
library(pastecs)

# load the data
marscrater <- read.csv("data/marscrater_pds.csv")

# extract the categorical variables
ejecta_1 = table(marscrater$MORPHOLOGY_EJECTA_1)
ejecta_2 = table(marscrater$MORPHOLOGY_EJECTA_2)
ejecta_3 = table(marscrater$MORPHOLOGY_EJECTA_3)
#barplot(ejecta_1, col=rainbow(10))
#barplot(ejecta_2, col=rainbow(10))
#barplot(ejecta_3, col=rainbow(10))

# specify variables to keep
var.keep <- c("CRATER_ID", "LATITUDE_CIRCLE_IMAGE", "DIAM_CIRCLE_IMAGE", "DEPTH_RIMFLOOR_TOPOG")

# create a new frame with just the values I want to keep
craters <- marscrater[,var.keep]

# attache the remaining columns for easier reference
attach(craters)

# sort the data
craters <- craters[order(CRATER_ID,decreasing=F),]

# view some data
#View(craters)

# sort each of my variables
nearest_latitude <- floor(LATITUDE_CIRCLE_IMAGE)
latitude_group <- floor(LATITUDE_CIRCLE_IMAGE / 10)
approx_diameter <- floor(DIAM_CIRCLE_IMAGE)
depth_meters <- DEPTH_RIMFLOOR_TOPOG * 1000

## display the frequencies of my selected variables
#freq(LATITUDE_CIRCLE_IMAGE)
#freq(DIAM_CIRCLE_IMAGE)
#freq(DEPTH_RIMFLOOR_TOPOG)
#freq(nearest_latitude)
#freq(latitude_group)
#freq(approx_diameter)
#freq(depth_meters)

## display boxplots for my selected variables
#boxplot(LATITUDE_CIRCLE_IMAGE, range=0, ylab="Latitude of Crater Center")
#boxplot(DIAM_CIRCLE_IMAGE, range=0, ylab="Crater Diameter (in km)")
#boxplot(DEPTH_RIMFLOOR_TOPOG, range=0, ylab="Average Elevation of Crater Rim (in km)")
#boxplot(nearest_latitude, range=0, ylab="Relative Distance from Equator (nearest 1 degree latitude)")
#boxplot(latitude_group, range=0, ylab="Relative Distance from Equator (nearest 10 degrees latitude)")
#boxplot(approx_diameter, range=0, ylab="Crater Diameter (nearest 1 km)")
#boxplot(depth_meters, range=0, ylab="Average Elevation of Crater Rim (in meters)")

# get basic descriptive statistics

summary(LATITUDE_CIRCLE_IMAGE)
summary(DIAM_CIRCLE_IMAGE)
summary(DEPTH_RIMFLOOR_TOPOG)
summary(nearest_latitude)
summary(latitude_group)
summary(approx_diameter)
summary(depth_meters)

options(scipen=100)
options(digits=4)

stat.desc(LATITUDE_CIRCLE_IMAGE)
stat.desc(DIAM_CIRCLE_IMAGE)
stat.desc(DEPTH_RIMFLOOR_TOPOG)
stat.desc(nearest_latitude)
stat.desc(latitude_group)
stat.desc(approx_diameter)
stat.desc(depth_meters)

# calculate some other descriptive stats

range(LATITUDE_CIRCLE_IMAGE)
range(DIAM_CIRCLE_IMAGE)
range(DEPTH_RIMFLOOR_TOPOG)

IQR(LATITUDE_CIRCLE_IMAGE)
IQR(DIAM_CIRCLE_IMAGE)
IQR(DEPTH_RIMFLOOR_TOPOG)

var(LATITUDE_CIRCLE_IMAGE)
var(DIAM_CIRCLE_IMAGE)
var(DEPTH_RIMFLOOR_TOPOG)

sd(LATITUDE_CIRCLE_IMAGE)
sd(DIAM_CIRCLE_IMAGE)
sd(DEPTH_RIMFLOOR_TOPOG)

# calculate the correlation between my variables
cor(LATITUDE_CIRCLE_IMAGE, DIAM_CIRCLE_IMAGE)
# [1] -0.05794
cor(LATITUDE_CIRCLE_IMAGE, DEPTH_RIMFLOOR_TOPOG)
# [1] -0.04288

## create scatterplots of the explanatory variable (latitude)
## and the two two response variables (diameter and depth)
## with fit lines for regression (y~x) and lowess (x,y)
#plot(LATITUDE_CIRCLE_IMAGE, DIAM_CIRCLE_IMAGE,
     #xlab="latitude from the derived center (decimal degrees North)",
     #ylab="diameter (units are km)")
#abline(lm(DIAM_CIRCLE_IMAGE~LATITUDE_CIRCLE_IMAGE), col="red")
#lines(lowess(LATITUDE_CIRCLE_IMAGE,DIAM_CIRCLE_IMAGE), col="blue")

#plot(LATITUDE_CIRCLE_IMAGE, DEPTH_RIMFLOOR_TOPOG,
     #xlab="latitude from the derived center (decimal degrees North)",
     #ylab="average elevation (units are km)")
#abline(lm(DEPTH_RIMFLOOR_TOPOG ~ LATITUDE_CIRCLE_IMAGE), col="red")
#lines(lowess(LATITUDE_CIRCLE_IMAGE, DEPTH_RIMFLOOR_TOPOG), col="blue")

#hist(LATITUDE_CIRCLE_IMAGE, breaks = 18,
     #xlab = "Relative Distance from Equator (nearest 10 degress latitude)",
     #ylab = "Frequency",
     #main = "Frequency of Craters by Crater Group\naccording to the Mars Crater Study")
