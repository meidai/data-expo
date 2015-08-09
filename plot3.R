#download and unzip file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile="data.zip", mode ="wb")
unzip ("data.zip")

#read data
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]
head(data)


#format date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
Sys.setlocale("LC_TIME", "C")
data$DateTime <- as.POSIXct(dateTime, "EST")

# plot3
plot(data$Sub_metering_1~data$DateTime, type="l",cex = 0.8, 
     ylab="Energy sub metering")
lines(data$Sub_metering_2~data$DateTime, col="red")
lines(data$Sub_metering_3~data$DateTime, col="Blue")
legend("topright", lty = 1, lwd=1, 
      legend  =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
      col = c("black", "red", "blue", cex = 0.8))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
