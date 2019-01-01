##Load data table package
library("data.table")
setwd("C:/Users/hp/Desktop/Coursera/Online Coursera/Exploratory Data Analysis/Project 1")

## Reads in data from file then subsets data for specified dates
usagetable <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

## Prevents Scientific Notation
usagetable[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

## Making a POSIXct date capable of being filtered and graphed by time of day
usagetable[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

## Filter Dates for 2007-02-01 and 2007-02-02
usagetable <- usagetable[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-02")]

## Set plot dimensions
png("plot2.png", width=480, height=480)

## Plot 2
plot(x = usagetable[, dateTime]
     , y = usagetable[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Close file
dev.off()
