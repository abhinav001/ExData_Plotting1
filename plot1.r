## Project 1 Plot 1

# Given access to codebook define column classes
colClasses = rep(c("character", "numeric"),c(2,7))

## read data, specify strings (?) used for NA values
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows =2075259, na.strings="?", colClasses=colClasses)

## convert date column to Date format and use it to subset for dates of interest
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[(data$Date>"2007-01-31" & data$Date<"2007-02-03") , ]

## Plotting starts here
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

## saving to png
dev.copy(png,"plot1.png", width=480, height=480, units="px")
dev.off()