# Load Data
data <- read.table(file="household_power_consumption.txt"
                   ,sep=";"
                   ,header=TRUE
                   ,stringsAsFactors=FALSE)

# Format and Filter Date column for observations during 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Format Remaining Data and add Timestamp
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Timestamp <- as.POSIXct(paste(data$Date,data$Time,format="%Y-%m-%d %H:%M:%S"))

# Construct Plot
png("plot1.png",width = 480, height = 480)
with(data,hist(x=Global_active_power
               ,main="Global Active Power"
               ,xlab="Global Active Power (kilowatts)"
               ,col="red"))
dev.off()