library(grDevices)

##Read data
u <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- download.file(u,"ds4.zip")
z <- unzip("ds4.zip")
data_full <- read.table(z, header=TRUE, sep = ";", na.strings = "?")

##Limit to required dates
dates <- c("2/1/2007","2/2/2007") ## Define date range for analysis
data <- data_full[data_full$Date == "2/1/2007" | data_full$Date == "2/2/2007",] ## subset data by date range

##Reformat date and time
dateTime <- paste(data$Date, data$Time, sep=' ')
dateTime <- strptime(dateTime, format="%m/%d/%Y %H:%M:%S")
data$DateTime <- dateTime

##Generate PNG file
png(file = "plot3.png", bg = "transparent",width = 480, height = 480,units = "px")
plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Energy Sub Metering", ylim=c(0,40), xlab="")
points(data$DateTime, data$Sub_metering_2, type="l", col= "red")
points(data$DateTime, data$Sub_metering_3, type="l", col= "blue")
points(data$DateTime, data$Sub_metering_1, type="l", col= "black")
legend("topright", lty=c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()