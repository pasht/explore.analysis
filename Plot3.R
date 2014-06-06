# Coursera - Exploratory Analysis
# Project 1
# R script to produce third plot

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
png(".//figures//plot3.png",width=480,height=480)
#third plot
with(dt,{
  plot(time_axis,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(time_axis,Sub_metering_2,col="red")
  lines(time_axis,Sub_metering_3,col="blue")
  legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty="solid",col=c("black","red","blue"))
})
#close device
dev.off()