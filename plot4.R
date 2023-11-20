library(data.table)
library(lubridate)

#getting the data for 1/2/2007 and 2/2/2007
zippedData <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electricPower.zip")
unzippedData <- unzip("electricPower.zip")
totalPower <- fread(unzippedData, header = TRUE)
febPower <- subset(totalPower, Date == "1/2/2007"|Date == "2/2/2007")

#making plot 4 - combined line plots
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
febPower$CombinedTime <- with(febPower, paste(Date, Time, sep = " "))
#plot a
plot(dmy_hms(febPower$CombinedTime), febPower$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#plot b
plot(dmy_hms(febPower$CombinedTime), febPower$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot c
plot(dmy_hms(febPower$CombinedTime), febPower$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dmy_hms(febPower$CombinedTime), febPower$Sub_metering_2, type = "l", col = "red")
lines(dmy_hms(febPower$CombinedTime), febPower$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot d
plot(dmy_hms(febPower$CombinedTime), febPower$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
