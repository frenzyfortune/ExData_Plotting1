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

# Create a png file for the first plot
png(filename=paste0(getwd(),"/ExData_Plotting1/plot1.png"))
hist(data$Global_active_power,col="red",main="Global active power",
     xlab="Global active power (kilowatts)")
dev.off()