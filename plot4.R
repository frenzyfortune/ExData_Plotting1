# Extract the data for the required dates
dataFile <- paste0(getwd(),"/household_power_consumption.txt")
startIndex <- grep("1/2/2007", readLines(dataFile))[1]
endIndex <- grep("3/2/2007", readLines(dataFile))[1]
data <- read.table(dataFile,
                    header=FALSE,sep=";",na.strings="?",stringsAsFactors=FALSE,
                   skip=startIndex-1,nrows=endIndex-startIndex)
attr(data,"names") <- read.table(dataFile,
                         header=FALSE,sep=";",na.strings="?",stringsAsFactors=FALSE,
                         nrows=1)

# Create a png file for the fourth plot
png(filename=paste0(getwd(),"/ExData_Plotting1/plot4.png"))
par(mfrow=c(2,2)) # create a 2 by 2 grid for the plots
# Top left plot
plot(data$Global_active_power,pch=NA_integer_,xaxt="n",ylab="Global active power (kilowatts)"
     ,xlab="")
lines(data$Global_active_power)
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
# Top right plot
plot(data$Voltage,pch=NA_integer_,xaxt="n",ylab="Voltage"
     ,xlab="datetime")
lines(data$Voltage)
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
# Bottom left plot
plot(data$Sub_metering_1,pch=NA_integer_,xaxt="n",ylab="Energy sub metering"
     ,xlab="",ylim=c(0,38))
lines(data$Sub_metering_1,col="black")
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=rep(1,3),bty="n")
# Bottom right plot
plot(data$Global_reactive_power,pch=NA_integer_,xaxt="n",ylab="Global_reactive_power"
     ,xlab="datetime")
lines(data$Global_reactive_power)
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()