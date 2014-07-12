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
## set the display margins
par(mfrow=c(1,1),mar=c(4,4,1,1))
## create graph with appropriate axis labels and main title
hist(powerdata$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     main="Global Active Power")
## create the approriate png file
dev.copy(png,file="plot1.png")  
dev.off()