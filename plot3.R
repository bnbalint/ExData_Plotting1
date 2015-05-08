
## read in the dataset
powerData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


## create a datetime column
## by pasting together the date and time columns
## and casting to a POSIXct object
powerData$Datetime <- as.POSIXct(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")


## convert the Date column to a date object
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")


## subset the data to get the dates
## 2007-02-01 and 2007-02-02
powerData <- subset(powerData, Date == "2007-02-01" | Date ==  "2007-02-02")


## convert the Global_active_power column to numeric
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)


## create the png file
png(filename = "plot3.png")


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
       lwd = 1)

## close the png file
dev.off()