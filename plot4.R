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

png(filename = "plot4.png", width = 480, height = 480,units = "px", bg = "white")

par(mfrow = c(2, 2))

plot(data$Timestamp, data$Global_active_power, type ="l", xlab="", ylab= "Global Active Power")
plot(data$Timestamp, data$Voltage, type ="l", xlab="datetime", ylab= "Voltage")
plot(data$Timestamp, data$Sub_metering_1, type ="l", col = "black", xlab="", ylab= "Energy sub metering")
lines(data$Timestamp, data$Sub_metering_2, col="red")
lines(data$Timestamp, data$Sub_metering_3, col="blue")
plot(data$Timestamp, data$Global_reactive_power, type ="l", col="black", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()