# Read txt file into R
powercons <- read.csv("household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?")

# Convert date and time columns into date and time format
powercons$datetime <- strptime(paste(powercons$Date, powercons$Time), format = "%d/%m/%Y %H:%M:%S")


# Subset for two first days of February 2007
powercons <- powercons[powercons$Date == "1/2/2007" | powercons$Date == "2/2/2007", ]

# Create Plot 3 and save as png
png("plot3.png", width = 480, height = 480, units = "px")
plot(powercons$datetime, powercons$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(powercons$datetime, powercons$Sub_metering_1, col = "grey")
lines(powercons$datetime, powercons$Sub_metering_2, col = "red")
lines(powercons$datetime, powercons$Sub_metering_3, col = "blue")
axis(side=1,at=c(0,1441,2881),labels=c('Thu','Fri','Sat'), tick=TRUE)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("grey", "red", "blue"), lty=1)
dev.off()
