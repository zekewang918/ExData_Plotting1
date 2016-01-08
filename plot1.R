data <- read.table("./Exploratory Data Analysis with R/Course Project 1/household_power_consumption.txt", header = TRUE, sep = ";")
subdata <- subset(data, Date == c("1/2/2007","2/2/2007"))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

