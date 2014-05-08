filename <- "household_power_consumption.txt"
alldata <- read.table(filename,sep=";",header=TRUE,colClasses= c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric') ,skip=0,na.strings="?")
mindate <- as.Date("2007-02-01",format="%Y-%m-%d")
maxdate <- as.Date("2007-02-02",format="%Y-%m-%d")
full.DF <- alldata[as.Date(alldata$Date,format="%d/%m/%Y") >= mindate & as.Date(alldata$Date,format="%d/%m/%Y") <=maxdate,]
rm(alldata)
full.DF$Date <- as.Date(full.DF$Date,format="%d/%m/%Y")
full.DF$DateTime <- strptime(paste(full.DF$Date, full.DF$Time), format="%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(full.DF$DateTime,full.DF$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()