plot1<-function() {
 require("lubridate")
    alldata <- read.table("household_power_consumption.txt",
                          sep = ";",
                         header = TRUE,
                        na.strings = "?",
                       colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        alldata$Date <- dmy(alldata$Date)
        alldata$Time <- hms(alldata$Time)
        data <- subset(alldata, Date == ymd("2007-02-01")| Date == ymd("2007-02-02"))
        rm("alldata")
        dev.set(3)
        png(filename = "plot1.png", width = 480, height = 480,units = "px")
        hist(data$Global_active_power, col = "red",main = "Global Active Power", xlab = "Global Active Power (kiloWatts)")
        dev.off()
}