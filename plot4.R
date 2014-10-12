# load data file
dt <- read.csv2("household_power_consumption.txt",header = T,sep = ";")

# get global reactive power

dates <- as.Date(dt$Date, "%d/%m/%Y")
range <- dates >= '2007-02-01' & dates <= '2007-02-02'
data <- subset(dt, range)
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M")

# display
par(mfrow = c(2,2))
plot(x = datetime, y = as.numeric(data$Global_active_power)/500, ylab = 'Global Active Power (kilowatts)', xlab = '', type = 'l')
plot(x = datetime, y = as.numeric(data$Voltage)/4, ylab = 'Voltage', type = 'l', col = 'black')

with(data, { plot(x = datetime, y = as.numeric(gsub('\\?',0,Sub_metering_1)), xlab = '', ylab = 'Energy sub metering', type = 'n')
             points(x = datetime, y = as.numeric(gsub('\\?',0,Sub_metering_1)), xlab = '', type = 'l')
             points(x = datetime, y = as.numeric(gsub('\\?',0,Sub_metering_2)), xlab = '', type = 'l', col = 'red')
             points(x = datetime, y = as.numeric(gsub('\\?',0,Sub_metering_3)), xlab = '', type = 'l', col = 'blue')
})

plot(x = datetime, y = as.numeric(data$Global_reactive_power)/500, ylab = 'Global_reactive_power', type = 'l', col = 'black')

# create png file
dev.copy(png, file = "plot4.png") 
dev.off()
