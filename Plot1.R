# This is the code for plot1.png

# Determine column classes and headnames, classes to speed up reading
trydata = read.table("household_power_consumption.txt",header=TRUE, sep=";",nrows=5)  # read first 5 rows
classes<-sapply(trydata,class)   # classes is the class of all the column
headnames<-names(trydata)

# Only read data from 2/1/2007 to 2/2/2007, 2 days data
mydata = read.table("household_power_consumption.txt",header=FALSE, sep=";",nrows=2880,
 skip=66637, colClasses=classes)  # read text file
names(mydata)<-headnames

# DT<-strptime(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")

library(datasets) #add package
#hist(mydata$Global_active_power,col='red',main="Global Active Power", 
#xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Plotting to plot1.png file
png(filename = "plot1.png",width = 480, height = 480, units = "px", bg = "white")
hist(mydata$Global_active_power,col='red',main="Global Active Power", 
xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
