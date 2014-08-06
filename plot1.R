## set working directory
setwd("~/Exp Data Analysis/project 1")
##read data file
power<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", as.is=TRUE)
##select assigned dates
power2<-power[power$Date=="2/2/2007"|power$Date=="1/2/2007",]
##convert Date and Time to Date and Time data types from text
power2$Date<-as.Date(power2$Date,format="%d/%m/%Y")
power2$Time<-strptime(power2$Time,"%H:%M:%S")
##select PNG as plot output type
png(filename = "plot1.png", width = 480, height = 480, units = "px")
##draw histogram
hist(power2$Global_active_power,col="red",xlab= "Global Active Power (killowatts)",ylab="Frequency",main = "Global Active Power")
##close graphics device
dev.off()
