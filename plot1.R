library(grDevices)

##Read data
u <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- download.file(u,"ds4.zip")
z <- unzip("ds4.zip")
data_full <- read.table(z, header=TRUE, sep = ";", na.strings = "?")

##Limit to required dates
dates <- c("2/1/2007","2/2/2007") ## Define date range for analysis
data <- data_full[data_full$Date == "2/1/2007" | data_full$Date == "2/2/2007",]

##Generate PNG file
png(file = "plot1.png", bg = "transparent",width = 480, height = 480,units = "px")
hist(data$Global_active_power,col="red",breaks= 15, xlim=c(0,6), xlab="Global Active Power (kilowatts)",ylim=c(0,1200), main="Global Active Power")
dev.off()

