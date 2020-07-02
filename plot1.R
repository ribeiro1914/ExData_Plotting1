
#PLOT 1

#read the data
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#select two days of february 2007
power <- subset(data, data$Date== "1/2/2007" | data$Date== "2/2/2007")

#Histogram
hist(as.numeric(as.character(power$Global_active_power)),
     col = "red", main = "Global Active Power", xlab="Global Active Power(kilowatts)" )

#Export to png
dev.copy(png, file="plot1.png")
dev.off()