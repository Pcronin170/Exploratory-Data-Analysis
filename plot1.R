################################
#Coursera 
#Exploratory Data Analysis 
#Course Project 1
#Plot 1
################################

library(data.table)

#Import Data and subset 
setwd("/Users/Croninio/GitHub/Exploratory-Data-Analysis")
households = read.table("./data/household_power_consumption.txt",
                        header = TRUE,
                        sep = ";",
                        na.strings = "?",
                        colClasses = c("character","character","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric"))
#Subset out 2 days
house = households[households$Date %in% c('1/2/2007','2/2/2007'),]
house = data.table(house)
rm(households)

png(filename = "plot1.png")

#Plot 1
hist(house$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col="red")

dev.off()
