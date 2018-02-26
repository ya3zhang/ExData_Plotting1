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

###Plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
par(mfrow=c(1,1))
hist(Subdata$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()
