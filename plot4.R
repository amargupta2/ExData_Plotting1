## Read the data
test = read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")

## Format data as necessary and extract
test$Date = as.Date(test$Date, format = "%d/%m/%Y")
project1 = subset(test, Date == "2007-02-01" | Date == "2007-02-02")
project1$DT = strptime(paste(project1$Date, project1$Time), "%Y-%m-%d %H:%M:%S")

## Graph the data
png(file = "plot4.png")

## Configure to get a 2x2
par(mfrow = c(2, 2))

## Plot 1
plot(project1$DT, project1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## Plot 2
plot(project1$DT, project1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Plot 3
plot(project1$DT, project1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(project1$DT, project1$Sub_metering_2, type = "l", col = "red")
points(project1$DT, project1$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

## Plot 4
plot(project1$DT, project1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()