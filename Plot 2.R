#Call necessary libararys
library(ggplot2)

# Clean up workspace
rm(list=ls())

#Set Working Director
setwd('/Users/jazz7/Documents/R/exdata-data-household_power_consumption')

#Check to see file exists and give error message

#Read File
data = read.csv("FilteredData.csv", header = TRUE)

#Create Timestamp for plots
data$Timestamp <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")
plot(data$Timestamp, data$Global_active_power, 
     type ="l",
     xlab = "",
     ylab="Global Active Power (kilowatts)")

dev.off()