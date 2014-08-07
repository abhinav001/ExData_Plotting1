## Project 1 Plot 3
## Given access to codebook define column classes
cols <- rep(c("character", "numeric"),c(2,7))

## data1<- fread("household_power_consumption.txt",na.strings="?")
## read data, specify strings (?) used for NA values
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows =2075259, na.strings="?", colClasses=cols)

## convert date column to Date format and use it to subset for dates of interest
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[(data$Date>"2007-01-31" & data$Date<"2007-02-03") , ]

t <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
## Plotting starts here

yrange <- range(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))
plot(t, data$Sub_metering_2, xlab = "", ylab = "", axes=F, ylim = yrange, col = "2", type ="l")
par(new=T)
plot(t, data$Sub_metering_3, xlab = "", ylab = "", axes=F, ylim = yrange,col = "4", type ="l")
par(new = T)
plot(t, data$Sub_metering_1, ylim = yrange, xlab = "", ylab = "Energy sub metering", col = 1, type ="l")
par(new=F)

## saving to png
dev.copy(png,"plot3.png", width=480, height=480, units="px")
dev.off()