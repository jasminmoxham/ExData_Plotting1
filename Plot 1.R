#Call necessary libararys
library(ggplot2)

# Clean up workspace
rm(list=ls())

#Set Working Director
setwd('/Users/jazz7/Documents/R/exdata-data-household_power_consumption')

#Read File
data = read.csv("FilteredData.csv", header = TRUE)

png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")
hist(data$Global_active_power, col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()