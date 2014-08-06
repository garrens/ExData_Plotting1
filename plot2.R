##set working directory
setwd("~/Exp Data Analysis/project 1")
##if data does not already exist read it in and process
if( !exists("power_data")) {
  print("reading data")
  power_data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", as.is=TRUE)
  power2<-power_data[power_data$Date=="2/2/2007"|power_data$Date=="1/2/2007",]
  power2$Date<-as.Date(power2$Date,format="%d/%m/%Y")
  power2$DateTime<-strptime(paste(power2$Date, power2$Time),format = "%Y-%m-%d %H:%M:%S")
}
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(power2$DateTime, power2$Global_active_power,  type="l", ylab= "Global Active Power (killowatts)",xlab="",main = "Global Active Power")
dev.off()

