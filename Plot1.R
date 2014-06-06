# Coursera - Exploratory Analysis
# Project 1
# R script to produce first plot

# read data
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
png(".//figures//plot1.png",width=480,height=480)
#plot
with(dt,hist(Global_active_power,col="red",main="Global active power",
             xlab="Global Active power (kilowatts)",cex=0.8))
#close device
dev.off()
