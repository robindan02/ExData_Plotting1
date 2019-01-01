##Load data table package
library("data.table")
setwd("C:/Users/hp/Desktop/Coursera/Online Coursera/Exploratory Data Analysis/Project 1")

##Reads in data from file then subsets data for specified dates
usagetable <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

## Prevents histogram from printing in scientific notation
usagetable[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

## Change Date Column to Date Type
usagetable[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

## Filter Dates for 2007-02-01 and 2007-02-02
usagetable <- usagetable[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

## Set plot dimensions
png("plot1.png", width=480, height=480)

## Plot 1
hist(usagetable[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Close file
dev.off()
