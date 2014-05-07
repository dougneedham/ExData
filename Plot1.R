filename <- "household_power_consumption.txt"
alldata <- read.table(filename,sep=";",header=TRUE,colClasses= c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric') ,skip=0,na.strings="?")
mindate <- as.Date("2007-02-01",format="%Y-%m-%d")
maxdate <- as.Date("2007-02-02",format="%Y-%m-%d")
full.DF <- alldata[as.Date(alldata$Date,format="%d/%m/%Y") >= mindate & as.Date(alldata$Date,format="%d/%m/%Y") <=maxdate,]
rm(alldata)
full.DF$Date <- as.Date(full.DF$Date,format="%m/%d/%Y")
png("plot1.png")
hist(full.DF$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",main="Global Active Power")
dev.off()