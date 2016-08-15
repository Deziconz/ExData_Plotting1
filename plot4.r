plot4 <- function() {
  
  require("lubridate")
  alldata <- read.table("household_power_consumption.txt",
                        sep = ";",
                        header = TRUE,
                        na.strings = "?",
                        colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  data <- subset(alldata, Date == "1/2/2007"|Date == "2/2/2007")
  data$datetime <- paste(data$Date,data$Time, sep = " ")
  data$datetime <- dmy_hms(data$datetime)
  
  rm("alldata")
  dev.set(3)
  png(filename = "plot4.png", width = 480, height = 480,units = "px")
  par(mfrow = c(2, 2))
  plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (KiloWatts)", xlab = "")
  plot(data$datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  
  plot(data$datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "",col='black')
  lines(data$datetime,data$Sub_metering_2,type="l",col='red')
  lines(data$datetime,data$Sub_metering_3,type="l",col='blue')
  legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))
  
  plot(data$datetime, data$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "datetime")
  
  
  dev.off()
}