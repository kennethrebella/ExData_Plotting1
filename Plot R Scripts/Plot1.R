setwd("~/Documents/Coursera/Exploratory Data")
raw_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subset <- raw_data[(raw_data$Date == "1/2/2007"| raw_data$Date == "2/2/2007"),]

## add time and date
datetime <- as.POSIXct(paste(subset$Date, subset$Time), format="%d/%m/%Y %H:%M:%S")

## Convert factors to numeric
Global_active_power <- as.numeric(as.character(subset$Global_active_power))
Global_reactive_power <- as.numeric(as.character(subset$Global_reactive_power))
Voltage <-as.numeric(as.character(subset$Voltage))
Sub_metering_1 <- as.numeric(as.character(subset$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(subset$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(subset$Sub_metering_3))

## Plot 
quartz()
hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()






