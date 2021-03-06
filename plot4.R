install.packages("lubridate")
library(lubridate)
data<-read.table(file="household_power_consumption.txt",sep=";",header = T,na.strings = "?")
datetime<-dmy(data$Date)+hms(data$Time)
data<-cbind(data,datetime)
data<-subset(x = data,subset = (datetime > "2007-02-01 00:00:00 UTC" & datetime < "2007-02-03 00:00:00 UTC"))
Sys.setlocale("LC_TIME","en_US.UTF-8")
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(data$datetime,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(data$datetime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(data$datetime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",names(data)[7:9],col=c("black","red","blue"),lty=1)
plot(data$datetime,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
