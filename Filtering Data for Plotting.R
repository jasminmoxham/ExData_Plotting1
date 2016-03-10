

# Clean up workspace
rm(list=ls())

#Set Working Director
setwd('/Users/jazz7/Documents/R/exdata-data-household_power_consumption')

#Read File and changing the classs the rep has the numeric class repeating 7 times
Power = read.csv("household_power_consumption.txt", header=TRUE,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", rep("numeric",7)))


#Formatting the Date in a seperate variable for filtering because strptime will HAAATE it, and in turn you will loath strptime
Power$Date2 <- as.Date(Power$Date,format = "%d/%m/%Y")


#Setting variables for the desired dates
date1 <- as.Date("01/02/2007", format = "%d/%m/%Y")
date2 <- as.Date("02/02/2007", format = "%d/%m/%Y")

                   
#A function to pull the dates required out of the dataset
filter_fun <- function(x,y){Power[Power$Date2 >= x & Power$Date2 <= y,]}


#Creating a new dataset with the desired dates
filtered <- filter_fun(date1,date2)

#Create Timestamp for plots
filtered$Timestamp <- strptime(paste(filtered$Date, filtered$Time), format = "%d/%m/%Y %H:%M:%S")


#write the file for plotting
write.csv(filtered, file="FilteredData.csv")





