## set working directory
setwd("~/Exp Data Analysis/project 1")
##if data does not exist read it in and convert date and times to proper data types
if( !exists("power_data")) {
  print("reading data")
  power_data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", as.is=TRUE)
  power2<-power_data[power_data$Date=="2/2/2007"|power_data$Date=="1/2/2007",]
  power2$Date<-as.Date(power2$Date,format="%d/%m/%Y")
  power2$DateTime<-strptime(paste(power2$Date, power2$Time),format = "%Y-%m-%d %H:%M:%S")
}
##select PNG as plot output type
png(filename = "plot1.png", width = 480, height = 480, units = "px")
##draw histogram
hist(power2$Global_active_power,col="red",xlab= "Global Active Power (killowatts)",ylab="Frequency",main = "Global Active Power")
##close graphics device
dev.off()
