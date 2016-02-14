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
png(file = "plot2.png", bg = "transparent",width = 480, height = 480,units = "px")
with(data, plot(DateTime, Global_active_power, type='l',ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()



