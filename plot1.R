library(data.table)

#getting the data for 1/2/2007 and 2/2/2007
zippedData <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electricPower.zip")
unzippedData <- unzip("electricPower.zip")
totalPower <- fread(unzippedData, header = TRUE)
febPower <- subset(totalPower, Date == "1/2/2007"|Date == "2/2/2007")

#making plot 1 - histogram
png("plot1.png", width = 480, height = 480)
hist(as.numeric(febPower$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

