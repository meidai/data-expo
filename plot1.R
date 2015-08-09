#download and unzip file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile="data.zip", mode ="wb")
unzip ("data.zip")

#read data
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]
head(data)
## Plot 1
hist(data$Global_active_power, 
     xlab = "Global Active Power(kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

## Plot2
plot(data$Global_active_power~data$Date)





hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()