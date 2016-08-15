plot3 <- function() {
  
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
  png(filename = "plot3.png", width = 480, height = 480,units = "px")
  plot(data$datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "",col='black')
  lines(data$datetime,data$Sub_metering_2,type="l",col='red')
  lines(data$datetime,data$Sub_metering_3,type="l",col='blue')
  legend('topright', # places a legend at the appropriate place 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
         
         lty=c(1,1), # gives the legend appropriate symbols (lines)
         
         lwd=c(2.5,2.5),col=c("black","red","blue")) # gives the legend lines the correct color and width
  dev.off()
}