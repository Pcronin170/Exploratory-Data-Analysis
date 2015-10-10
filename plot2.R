################################
#Coursera 
#Exploratory Data Analysis 
#Course Project 1
#Plot 2
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


#Plot 2

house[,weekday := weekdays(as.Date(house$Date,"%d/%m/%Y"))]

png(filename = "plot2.png")
plot(house$Global_active_power,
     type ="l",
     col="black",
     ylab = "Global Active Power (kilowatts)",
     xlab = '',
     xaxt = 'n')

axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))

dev.off()