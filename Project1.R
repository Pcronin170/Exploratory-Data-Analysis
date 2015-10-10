################################
#Coursera 
#Exploratory Data Analysis 
#Course Project 1
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

#Plot 1
hist(house$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col="red")


#Plot 2

house[,weekday := weekdays(as.Date(house$Date,"%d/%m/%Y"))]

plot(house$Global_active_power,
     type ="l",
     col="black",
     ylab = "Global Active Power (kilowatts)",
     xlab = '',
     xaxt = 'n')

axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))

#Plot 3
plot(house$Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab='',xaxt='n')

with(house,points(Sub_metering_1,col="black",type = "l"))
with(house,points(Sub_metering_2,col="red",type = "l"))
with(house,points(Sub_metering_3,col="blue",type = "l"))
axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))
legend("topright",lwd = 2,col= c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Plot 4
par(mfrow = c(2,2), #1 row 3 columns for the plot
    mar = c(4,4,2,1), #Smaller margins on each side
    oma = c(0,0,4,0) #Larger outside margin on top to make clearer
)

#Upper left
plot(house$Global_active_power,
     type ="l",
     col="black",
     ylab = "Global Active Power",
     xlab = '',
     xaxt = 'n')

axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))

#Upper right
plot(house$Voltage,
     type ="l",
     col="black",
     ylab = "Voltage",
     xlab = 'datetime')

axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))

#Lower left
plot(house$Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab='',xaxt='n')

with(house,points(Sub_metering_1,col="black",type = "l"))
with(house,points(Sub_metering_2,col="red",type = "l"))
with(house,points(Sub_metering_3,col="blue",type = "l"))
axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))
legend("topright",lwd = 2,col= c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Lower right
plot(house$Global_reactive_power,
     type ="l",
     col="black",
     ylab = "Global_reactive_power",
     xlab = 'datetime',
     xaxt = 'n')

axis(1,at=c(1,1441,2880),labels = c("Thu","Fri","Sat"))


#Concatenate date and time
house[,dateTime := paste(house$Date,house$Time,sep=" ")]

x <- lapply(house$dateTime,strptime,format = "%d/%m/%Y %H:%M:%S")

house$dateTime = 

house$dateTime <- sapply(house$dateTime,strptime,format = "%d/%m/%Y %H:%M:%S")

class(x)
#Add time back to graph





#Convert to date time
house[,dateTime2 := as.Date(dateTime,"%d/%m/%Y %H:%M:%S")]

house[,dateTime3 := strptime(dateTime,"%d/%m/%Y %H:%M:%S")]

house[1,4]

