plot2 <- function() {

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
                png(filename = "plot2.png", width = 480, height = 480,units = "px")
                plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (KiloWatts)", xlab = "")
                dev.off()
}