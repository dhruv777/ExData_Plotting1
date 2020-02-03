## Read and Clean Data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ';', na = '?')
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Construct the plot and save it to a PNG file
png(filename = "Plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
# dev.copy(png, filename = "Plot2.png", width = 480, height = 480)
dev.off()
