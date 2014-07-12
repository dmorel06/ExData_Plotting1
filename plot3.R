## library needed if not already loaded
library(datasets)
library(xlsx)
## The assignment did not specify a file format for the graph data.
## This code assumes that the required data for the plots has already been extracted 
## from the original dataset and available in the working directory in the xlsx format. 
## The R code below would work for a file in the csv format with only minor edit.

## read the data into a data frame
powerdata<-read.xlsx("household_power_consumption2.xlsx",
                     sheetName="household_power_consumption2",header=TRUE)
## set the display margins
par(mfrow=c(1,1),mar=c(4,4,1,1))
## create graph with appropriate axis labels
## x-axis tickmarks and labels are supressed to allow for the day labels
## each data set is added seperately using 'points'
## a legend is created in the upper right hand corner of the graph
plot(powerdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt="n")
points(powerdata$Sub_metering_2, col="red",type="l")
points(powerdata$Sub_metering_3, col="blue",type="l")
legend(1600,39,lty=c(1,1,1),bty="n",col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.75)
axis(1, at=c(1,nrow(powerdata)/2,nrow(powerdata)),labels=c("Thu","Fri","Sat"))
## create the approriate png file
dev.copy(png,file="plot3.png")
dev.off()