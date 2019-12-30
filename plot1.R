# Read txt file into R
powercons <- read.csv("household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?")

# Convert date and time columns into date and time format
powercons$Date <- strptime(powercons$Date, "%d/%m/%Y")
powercons$Time <- strptime(powercons$Time, "%H:%M:%S")

# Subset for two first days of February 2007
powercons <- powercons[powercons$Date == "2007-02-01 GMT" | powercons$Date == "2007-02-02 GMT", ]

# Create Plot 1 and save as png
png("plot1.png", width = 480, height = 480, units = "px")
hist(powercons$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim = c(0,1200))
dev.off()