data <- read.csv(file = "./data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
data$Date <-as.Date(data$Date, format="%d/%m/%Y")
valid_data <- subset(data, data$Date >="2007-02-01" &  data$Date <="2007-02-02")
datetime <- paste(valid_data$Date, valid_data$Time, sep = " ")
valid_data$datetime <- as.POSIXct(datetime)
png("plot2.png", width =480, height = 480 )
plot(valid_data$Global_active_power~valid_data$datetime, type = "l", xlab = "", ylab = "Global Active Power (killowatts)")
dev.off()

