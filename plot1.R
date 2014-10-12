# load data file
dt <- read.csv2("household_power_consumption.txt",header = T,sep = ";")

# get global reactive power
dates <- as.Date(dt$Date, "%d/%m/%Y")
data <- subset(dt, dates >= '2007-02-01' & dates <= '2007-02-02',  select=c(Date,Global_active_power))

# display
hist(as.numeric(data$Global_active_power)/500, main="Global Active Power", xlab = 'Global Active Power (kilowatts)', col = 'red')

# create png file
dev.copy(png, file = "plot1.png") 
dev.off()