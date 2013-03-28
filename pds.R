
# to load this file from the R console
#source('pds.R')

# load the data
marscrater <- read.csv("data/marscrater_pds.csv")

# specify variables to keep
var.keep <- c("CRATER_ID")

# create a new frame with just the values I want to keep
crater.id <- marscrater[,var.keep]

# view some data
#View(crater.id)
