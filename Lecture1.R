#################################
#Week 1
#################################



###############################################
#Exploratory Graphs (part 1)
##############################################

#Annual Average pm2.5 averaged over the period 2008 through 2010
#setwd("H:/coursera/ExploreData")
setwd("/Users/Croninio/GitHub/Exploratory-Data-Analysis")

pollution = read.table("./data/avgpm25.csv",header = TRUE, sep = ",",
                       colClasses = c("numeric","character","factor","numeric","numeric"))
head(pollution)

#How many exceed 12 
exceed12 = pollution$pm25 > 12
table(exceed12)
pollution[exceed12,]

#Five Number summary
summary(pollution$pm25)

#Boxplot
boxplot(pollution$pm25,col="blue")

#Histogram
hist(pollution$pm25,col="green")
rug(pollution$pm25)

hist(pollution$pm25,col="green",breaks=100) #Add breaks
rug(pollution$pm25)

#Overlay feature in boxplot
boxplot(pollution$pm25,col="blue")
abline(h=12)

#Overlaying features
hist(pollution$pm25,col="green")
abline(v=12,lwd=4)
abline(v=median(pollution$pm25),col="magenta",lwd=4)

#Barplot
barplot(table(pollution$region),col="wheat",main = "Number of Counties in Each Region")

##############################################
#Exploratory Graphs (part 2)
##############################################

#Multiple Boxplots
boxplot(pm25 ~ region, data = pollution, col = "red")

#Multiple Histograms
par(mfrow = c(2,1),mar=c(4,4,2,1))
hist(subset(pollution,region == "east")$pm25,col="green")
hist(subset(pollution,region == "west")$pm25,col="green")

#Scatterplot
par(mfrow = c(1,1))
with(pollution,plot(latitude,pm25))
abline(h=12,lwd=2,lty=2)

#Scatterplots with color
with(pollution,plot(latitude,pm25,col=region))
abline(h=12,lwd=2,lty=2)

#Multiple Scatterplots
par(mfrow=c(1,2),mar=c(5,4,2,1))
with(subset(pollution,region=="west"),plot(latitude,pm25,main="West"))
with(subset(pollution,region=="east"),plot(latitude,pm25,main="east"))

##############################################
#Plotting systems in R
##############################################

#Base plotting system
    #No way to take back stuff
    #Translate difficult
    
#BasePlot
library(dattasets)
data(cars)
with(cars,plot(speed,dist))


#The Lattice System
    #Created with single function
    #specify a lot of information
    #Good for relationships

    #Lattice can be akward with single call
    #Difficult to annotate
    #Cannot add once created

library(lattice)
state = data.frame(state.x77,region = state.region)
xyplot(Life.Exp ~ Income | region, data=state,layout=c(4,1))


#ggplot2 System
    #splits the difference between base and lattice
    #allows annotating
    #similar to lattice easier to use
    #default but can customize

library(ggplot2)
data(mpg)
qplot(displ,hwy,data=mpg)

#Summary Plots
    #Base: Artist pallete
    #Lattice: Enite plot 1 function
    #ggplot2: Mixes elements of base and Lattice


##############################################
#Base Plotting System (part 1)
##############################################


library(datasets)


hist(airquality$Ozone) #draw new plot for histogram

with(airquality,plot(Wind,Ozone))

#BoxPlot
airquality = transform(airquality,Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month",ylab = "Ozone (ppd)")

#key paramaters
    #pch: plotting symbol
    #lty: line type
    #lwd: line width
    #col: plottin gcolor
    #xlab: character string for x-axis label
    #ylab: character string for y-axis label
    #las: orientation of axis labels
    #bg: background color
    #mar: margin size
    #oma: outer margine size
    #mfrow: number of plots per row
    #mfcol: number of plots per row


#get defaut values
par("lty")
par("mar")
par("mfrow")
par("mfcol")


##############################################
#Base Plotting System (part 2)
##############################################

library(datasets)
with(airquality,plot(Wind,Ozone))
title(main ="Ozone and Wind in New York City") ##add title

with(airquality,plot(Wind,Ozone,main="Ozone and Wind in New York City"))
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))

#Set up plot without putting data into it
with(airquality,plot(Wind,Ozone,main="Ozone and Wind in New York City",type = "n"))
with(subset(airquality,Month == 5),points(Wind,Ozone,col="blue"))
with(subset(airquality,Month != 5),points(Wind,Ozone,col="red"))
legend("topright",pch=1,col= c("blue","red"),legend = c("May","Other Months"))

#Plot a regression line on a plot
with(airquality,plot(Wind,Ozone,main = "Winde and Ozone in NYC",pch=20))
model <- lm(Ozone ~ Wind, airquality)
abline(model,lwd2)


#Multible base plots

par(mfrow=c(1,2))
with(airquality,{
    plot(Wind,Ozone,main="Ozone and Wind")
    plot(Solar.R,Ozone, main = "Ozone and Solar Radiation")
    
})

par(mfrow = c(1,3), #1 row 3 columns for the plot
    mar = c(4,4,2,1), #Smaller margins on each side
    oma = c(0,0,4,0) #Larger outside margin on top to make clearer
    )
with(airquality,{
    plot(Wind,Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone,main = "Ozone and Solar Radiation")
    plot(Temp,Ozone,main = "Ozone and Temperature")
    mtext("Ozone and Weather in New York City",outer = TRUE)
    
})

##############################################
#Base Plotting Demonstration
##############################################
par(mfrow = c(1,1))
x <- rnorm(100)
hist(x)

y<- rnorm(100)
plot(x,y)

z <- rnorm(100)
plot(x,z)
 
#bottom, left, top right
par(mar = c(4,4,2,2))
z <- rnorm(100)
plot(x,z)

plot(x,y,pch=20)
plot(x,y,pch=19)


#See all plots
#example(points)

plot(x,y,pch=4)
title("Scatterplot")
text(-2,2,"Label")
legend("topleft",legend="Data")
legend("topleft",legend="Data",pch=20)
fit <- lm(y~x)
abline(fit)
abline(fit,lwd=3,col="blue")

plot(x,y,xlab="Weight",ylab="Height",main = "Scatterplot",pch=20)
legend("topright",legend="Data",pch=20)
fit = lm(y~x)
abline(fit,lwd=3,col="red")

z<- rpois(100,2)
par(mfrow=c(2,1))
plot(x,y,pch=20)
plot(x,z,pch=19)

par("mar") #get margin

par(mar=c(2,2,1,1))
plot(x,y,pch=20)
plot(x,z,pch=19)


#Men and women example
par(mfrow = c(1,1))
x <- rnorm(100)
y <- x + rnorm(100)

g = gl(2,50)
g = gl(2,50,labels =c("Male","Female"))

str(g)
plot(x,y, type = "n") #plot with no data
points(x[g=="Male"],y[g=="Male"],col="blue",pch=19)
points(x[g=="Female"],y[g=="Female"],col="pink",pch=19)
