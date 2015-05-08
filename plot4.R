
## read in the dataset
powerData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


## create a datetime column
powerData$Datetime <- as.POSIXct(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")


## convert the Date column to a date object
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")


## subset the data to get the dates
## 2007-02-01 and 2007-02-02
powerData <- subset(powerData, Date == "2007-02-01" | Date ==  "2007-02-02")


## convert numeric columns to numeric
powerData$Global_active_power   <- as.numeric(powerData$Global_active_power)
powerData$Voltage               <- as.numeric(powerData$Voltage)
powerData$Global_reactive_power <- as.numeric(powerData$Global_reactive_power)


## create the png file
png(filename = "plot4.png")


## create the multi-plot frame
par(mfrow = c(2,2))


##
## create the first plot
## Global_active_power by datetime
########################################################
plot(powerData$Datetime, powerData$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")


##
## create the second plot
## Voltage by datetime
########################################################
plot(powerData$Datetime, powerData$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")


##
## create the third plot
## Sub_metering by type
########################################################

## create empty line graph for Sub_metering_1
plot(powerData$Datetime, powerData$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")


## add the line graph for Sub_metering_2
lines(powerData$Datetime, powerData$Sub_metering_2, 
      type = "l",
      col = "red")


## add the line graph for Sub_metering_3
lines(powerData$Datetime, powerData$Sub_metering_3, 
      type = "l",
      col = "blue")

## create the legend for the graph
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 1,
       bty = "n",
       cex = 0.7)


##
## create the fourth plot
## Global_reactive_power by datetime
########################################################
plot(powerData$Datetime, powerData$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")


## close the png file
dev.off()


