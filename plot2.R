## Read the data
test = read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")

## Format data as necessary and extract
test$Date = as.Date(test$Date, format = "%d/%m/%Y")
project1 = subset(test, Date == "2007-02-01" | Date == "2007-02-02")
project1$DT = strptime(paste(project1$Date, project1$Time), "%Y-%m-%d %H:%M:%S")

## Plot the data to PNG
png(file = "plot2.png")
plot(project1$DT, project1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()