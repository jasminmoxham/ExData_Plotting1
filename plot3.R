#Call necessary libararys
library(ggplot2)

# Clean up workspace
rm(list=ls())

#Set Working Director
setwd('/Users/jazz7/Documents/R/exdata-data-household_power_consumption')

#Read File
data = read.csv("FilteredData.csv", header = TRUE)
#Create Timestamp for plots
data$Timestamp <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480,units = "px", bg = "white")

plot(data$Timestamp, data$Sub_metering_1, type ="l", col = "black", xlab="", ylab= "Energy sub metering")
lines(data$Timestamp, data$Sub_metering_2, col="red")
lines(data$Timestamp, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Submetering_3"), lwd = 1)
dev.off()
