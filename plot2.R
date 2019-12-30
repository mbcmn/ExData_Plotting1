# Read txt file into R
powercons <- read.csv("household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?")

# Convert date and time columns into date and time format
powercons$datetime <- strptime(paste(powercons$Date, powercons$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset for two first days of February 2007
powercons <- powercons[powercons$Date == "1/2/2007" | powercons$Date == "2/2/2007", ]

# Create Plot 2 and save as png
png("plot2.png", width = 480, height = 480, units = "px")
plot(powercons$datetime,powercons$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type = "l")
lines(powercons$Global_active_power)
axis(side=1,at=c(0,1441,2881),labels=c('Thu','Fri','Sat'), tick=TRUE)
dev.off()