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
png("plot3.png",width = 480, height = 480)
with(data,plot(x=Timestamp
                    ,y=Sub_metering_1
                    ,xlab=""
                    ,ylab="Energy sub metering"
                    ,type="l"))
with(data,lines(x=Timestamp
                    ,y=Sub_metering_2
                    ,col="red"))
with(data,lines(x=Timestamp
                    ,y=Sub_metering_3
                    ,col="blue"))
with(data,legend("topright"
                 ,lty=c(1,1,1)
                 ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
                 ,col=c("black","red","blue")))
dev.off()
