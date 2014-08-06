setwd("~/Exp Data Analysis/project 1")
power<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", as.is=TRUE)
power2<-power[power$Date=="2/2/2007"|power$Date=="1/2/2007",]
first=power2[1,1]
power2$Date<-as.Date(power2$Date,format="%d/%m/%Y")
power2$Time<-strptime(power2$Time,"%H:%M:%S")
hist(power2$Global_active_power)
