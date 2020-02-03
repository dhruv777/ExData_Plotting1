## Read and Clean Data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ';', na = '?')
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Construct the plot and save it to a PNG file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
### Plot 1
plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

### Plot 2
plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

### Plot 3
plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

### Plot 4
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# dev.copy(png, filename = "Plot4.png", width = 480, height = 480)
dev.off()
