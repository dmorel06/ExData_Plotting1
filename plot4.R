## library needed -- if not already loaded
library(datasets)
library(xlsx)
## The assignment did not specify a file format for the graph data.
## This code assumes that the required data for the plots has already been extracted 
## from the original dataset and available in the working directory in the xlsx format. 
## The R code below would work for a file in the csv format with only minor edit.

## read the data into a data frame
powerdata<-read.xlsx("household_power_consumption2.xlsx",
                     sheetName="household_power_consumption2",header=TRUE)
## set the display margins and the number of graphs
par(mfrow=c(2,2),mar=c(3,4,1,1))
## create the GAP graph with appropriate axis labels
## x-axis tickmarks and labels are supressed to allow for the day labels
plot(powerdata$Global_active_power,type="l",xlab="",ylab="Global Active Power",xaxt="n")
axis(1, at=c(1,nrow(powerdata)/2,nrow(powerdata)),labels=c("Thu","Fri","Sat"))
## create the voltage graph with appropriate axis labels
## x-axis tickmarks and labels are supressed to allow for the day labels
## text below the graph is added
plot(powerdata$Voltage,type="l",xlab="",ylab="Voltage",xaxt="n")
axis(1, at=c(1,nrow(powerdata)/2,nrow(powerdata)),labels=c("Thu","Fri","Sat"))
mtext("datetime",side=1,line=2)
## create ESM graph with appropriate axis labels
## x-axis tickmarks and labels are supressed to allow for the day labels
## each data set is added seperately using 'points'
## a legend is created in the upper right hand corner of the graph
plot(powerdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt="n")
points(powerdata$Sub_metering_2, col="red",type="l")
points(powerdata$Sub_metering_3, col="blue",type="l")
legend(600,39,lty=c(1,1,1),bty="n",col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.65)
axis(1, at=c(1,nrow(powerdata)/2,nrow(powerdata)),labels=c("Thu","Fri","Sat"))
## create the GRP graph with appropriate axis labels
## x-axis tickmarks and labels are supressed to allow for the day labels
## text below the graph is added
plot(powerdata$Global_reactive_power,type="l",xlab="",ylab="Global Reactive Power",xaxt="n")
axis(1, at=c(1,nrow(powerdata)/2,nrow(powerdata)),labels=c("Thu","Fri","Sat"))
mtext("datetime",side=1,line=2)
## create the approriate png file
dev.copy(png,file="plot4.png")
dev.off()