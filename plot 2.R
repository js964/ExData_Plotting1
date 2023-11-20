library(data.table)
library(lubridate)

#getting the data for 1/2/2007 and 2/2/2007
zippedData <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electricPower.zip")
unzippedData <- unzip("electricPower.zip")
totalPower <- fread(unzippedData, header = TRUE)
febPower <- subset(totalPower, Date == "1/2/2007"|Date == "2/2/2007")

#making plot 2 - line plot
png("plot2.png", width = 480, height = 480)
febPower$CombinedTime <- with(febPower, paste(Date, Time, sep = " "))
plot(dmy_hms(febPower$CombinedTime), febPower$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
