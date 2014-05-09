filename <- "household_power_consumption.txt"
alldata <- read.table(filename,sep=";",header=TRUE,colClasses= c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric') ,skip=0,na.strings="?")
mindate <- as.Date("2007-02-01",format="%Y-%m-%d")
maxdate <- as.Date("2007-02-02",format="%Y-%m-%d")
full.DF <- alldata[as.Date(alldata$Date,format="%d/%m/%Y") >= mindate & as.Date(alldata$Date,format="%d/%m/%Y") <=maxdate,]
rm(alldata)
full.DF$Date <- as.Date(full.DF$Date,format="%d/%m/%Y")
full.DF$DateTime <- strptime(paste(full.DF$Date, full.DF$Time), format="%Y-%m-%d %H:%M:%S")
png("plot3.png")
plot(full.DF$DateTime,full.DF$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)",xlab="",col="blue")
lines(full.DF$DateTime,full.DF$Sub_metering_2,col="red")
lines(full.DF$DateTime,full.DF$Sub_metering_3,col="green")
legend("topright", c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), 
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),col=c("blue","red","green"))
dev.off()