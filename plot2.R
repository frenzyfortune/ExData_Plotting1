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

# Create second plot as png file
png(filename=paste0(getwd(),"/ExData_Plotting1/plot2.png"))
plot(data$Global_active_power,pch=NA_integer_,xaxt="n",ylab="Global active power (kilowatts)"
     ,xlab="")
lines(data$Global_active_power)
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()