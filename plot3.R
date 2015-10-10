################################
#Coursera 
#Exploratory Data Analysis 
#Course Project 1
#Plot 3
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


#Plot 3
png(filename = "plot3.png")

plot(house$Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab='',xaxt='n')
with(house,points(Sub_metering_1,col="black",type = "l"))
with(house,points(Sub_metering_2,col="red",type = "l"))
with(house,points(Sub_metering_3,col="blue",type = "l"))
axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))
legend("topright",lwd = 2,col= c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
