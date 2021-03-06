# Coursera - Exploratory Analysis
# Project 1
# R script to produce fourth plot

# Read data
dt<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
               header=T,stringsAsFactors=F)
dt[,1]=as.Date(dt[,1],format="%d/%m/%Y")

# subset data
dt<-subset(dt,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
with(dt,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
             main="Global Active Power"))
# Define time axis
dt$time_axis<-strptime(paste(dt[,1],dt[,2],sep=" "),
                       format="%Y-%m-%d %H:%M:%S")
# open device for drawing
png(".//figures//plot4.png",width=480,height=480)
# fourth plot
par(mfrow=c(2,2),cex.lab=0.8,mar=c(3,5,2,2))
with(dt,{
  plot(time_axis,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(time_axis,Voltage,type="l",xlab="datetime",ylab="Volatage")
  plot(time_axis,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(time_axis,Sub_metering_2,col="red")
  lines(time_axis,Sub_metering_3,col="blue")
  legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),box.lty=0,lty="solid",
         col=c("black","red","blue"),cex=1, inset=c(0.01,0.01))
  plot(time_axis,Global_reactive_power,type="l",xlab="datetime",ylab="Global Active Power (kilowatts)")
})
#close device
dev.off()