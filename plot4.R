data <- read.table("./Exploratory Data Analysis with R/Course Project 1/household_power_consumption.txt", header = TRUE, sep = ";")
subdata <- subset(data, Date == c("1/2/2007","2/2/2007"))

date_time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power)
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(date_time, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subdata$Sub_metering_2, type="l",col = "red")
lines(date_time, subdata$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

plot(date_time, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()