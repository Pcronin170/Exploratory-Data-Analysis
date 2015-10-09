#################################
#Week 1
#################################



###############################################
#Exploratory Graphs (part 1)
##############################################

#Annual Average pm2.5 averaged over the period 2008 through 2010
setwd("H:/coursera/ExploreData")
pollution = read.table("./data/avgpm25.csv",header = TRUE, sep = "\t",
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


