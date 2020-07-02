
#Plot2

#read the data
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#select two days of february 2007
power <- subset(data, data$Date== "1/2/2007" | data$Date== "2/2/2007")

#Transform date/time vars
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- strptime(power$Time, format="%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plot graph
plot(power$Time,as.numeric(as.character(power$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#in the graph the days of the week are in Portuguese
#quin -> Thursday
#sex -> friday
#sáb -> Saturday

#Export to png
dev.copy(png, file="plot2.png")
dev.off()