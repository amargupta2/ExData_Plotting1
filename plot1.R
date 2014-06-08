## Read the data
test = read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")

## Format data as necessary and extract
test$Date = as.Date(test$Date, format = "%d/%m/%Y")
project1 = subset(test, Date == "2007-02-01" | Date == "2007-02-02")

## Plot the results to PNG file
png(file = "plot1.png")
hist(project1$Global_active_power, xlab="Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()