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
plot(datetime,Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab= "")
lines(datetime,Sub_metering_1, col= "black")
lines(datetime,Sub_metering_2, col= "red")
lines(datetime,Sub_metering_3, col= "blue")

legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),col=c("black","red","blue"))


dev.copy(png, file = "plot3.png")
dev.off()


