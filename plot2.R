
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
png(filename = "plot2.png")


## create line graph of Global_active_power
## by datetime
plot(powerData$Datetime, powerData$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")


## close the png file
dev.off()