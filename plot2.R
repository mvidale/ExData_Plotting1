# load data file
dt <- read.csv2("household_power_consumption.txt",header = T,sep = ";")

# get global reactive power

dates <- as.Date(dt$Date, "%d/%m/%Y")
range <- dates >= '2007-02-01' & dates <= '2007-02-02'
data <- subset(dt, range)
dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M")

# display
plot(x = dateTime, y = as.numeric(data$Global_active_power)/500, ylab = 'Global Active Power (kilowatts)', xlab = '', type = 'l')

# create png file
dev.copy(png, file = "plot2.png") 
dev.off()