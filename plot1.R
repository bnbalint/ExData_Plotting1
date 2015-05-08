
## read in the dataset
powerData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


## convert the Date column to a date object
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")


## subset the data to get the dates
## 2007-02-01 and 2007-02-02
powerData <- subset(powerData, Date == "2007-02-01" | Date ==  "2007-02-02")



## convert the Global_active_power column to numeric
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)


## create the png file
png(filename = "plot1.png")


## create the histogram of Global_active_power
hist(powerData$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")


## close the png file
dev.off()



