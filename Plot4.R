# This is the code for plot4.png

# Determine column classes and headnames, classes to speed up reading
trydata = read.table("household_power_consumption.txt",header=TRUE, sep=";",nrows=5)  # read first 5 rows
classes<-sapply(trydata,class)   # classes is the class of all the column
headnames<-names(trydata)

# Only read data from 2/1/2007 to 2/2/2007, 2 days data
mydata = read.table("household_power_consumption.txt",header=FALSE, sep=";",nrows=2880,
 skip=66637, colClasses=classes)  # read text file
names(mydata)<-headnames

DT<-strptime(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")

library(datasets) #add package

# Plotting to plot3.png file
png(filename = "plot4.png",width = 480, height = 480, units = "px", bg = "white")

par(mfrow=c(2,2))
with(mydata,{
  with(mydata, plot(DT,Global_active_power,type='l',xlab=" ",ylab="Global Active Power (kilowatts)"))

  with(mydata, plot(DT,Voltage,type='l',xlab="datetime ",ylab="Voltage"))

  with(mydata, plot(DT,Sub_metering_1,type='l',col="black", xlab=" ",ylab="Energy sub metering"))
  with(mydata, lines(DT,Sub_metering_2,col="red"))
  with(mydata, lines(DT,Sub_metering_3,col="blue"))
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"), legend=headnames[7:9],bty='n')

  with(mydata, plot(DT,Global_reactive_power,type='l',xlab="datetime ",ylab="Global_reactive_power"))
})

dev.off()
