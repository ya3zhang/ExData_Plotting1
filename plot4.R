###Read data in to R
household_power_consumption <- read.table("./household_power_consumption.txt", 
                                          header = TRUE, 
                                          sep = ";", 
                                          colClasses = c("character", "character", rep("numeric",7)),
                                          na="?")
### Convert the Date and Time variables to Date/Time classes
household_power_consumption$Time <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time), "%d/%m/%Y %H:%M:%S")
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

###Subset data from 2007-02-01 to 2007-02-02
Subdata <- subset(household_power_consumption,Date >= "2007-02-01" & Date <="2007-02-02" )

###Plot4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

with(Subdata, plot(Time, Global_active_power, type = "l", ylab= "Global Active Power (kilowatts)", xlab = ""))

with(Subdata, plot(Time, Voltage, type = "l", ylab= "Voltage", xlab = "datetime"))

with(Subdata, plot(Time, Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab = ""))
lines(Subdata$Time, Subdata$Sub_metering_2,type="l",col= "red")
lines(Subdata$Time, Subdata$Sub_metering_3,type="l",col= "blue")
legend("topright", bty = "n",lty = 1, lwd = 2, col = c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(Subdata, plot(Time, Global_reactive_power, type = "l", ylab= "Global_reactive_power", xlab = "datetime"))

dev.off()
