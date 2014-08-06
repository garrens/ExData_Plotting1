setwd("~/Exp Data Analysis/project 1")
if( !exists("power_data")) {
  print("reading data")
  power_data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", as.is=TRUE)
  power2<-power_data[power_data$Date=="2/2/2007"|power_data$Date=="1/2/2007",]
  power2$Date<-as.Date(power2$Date,format="%d/%m/%Y")
  power2$DateTime<-strptime(paste(power2$Date, power2$Time),format = "%Y-%m-%d %H:%M:%S")
}
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

plot(power2$DateTime, power2$Global_active_power,  type="l", ylab= "Global Active Power (killowatts)",xlab="")

plot(power2$DateTime, power2$Sub_metering_1,  type="l", ylab= "Energy sub metering",xlab="")
lines(power2$DateTime, power2$Sub_metering_2,  type="l",col="red")
lines(power2$DateTime, power2$Sub_metering_3,  type="l",col="blue")
legend( x="topright", 
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        col=c("black","red","blue"), lwd=1, merge=FALSE )

plot(power2$DateTime, power2$Voltage,  type="l", ylab= "Voltage",xlab="datetime")

plot(power2$DateTime, power2$Global_reactive_power,  type="l", ylab= "Global_reactive_power",xlab="datetime")
dev.off()

