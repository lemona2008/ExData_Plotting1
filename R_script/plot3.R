url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
f <- file.path(getwd(), "house_power_consumption")
download <- download.file(url,f)
unzip(zipfile="house_power_consumption")


readtxt<- read.table("household_power_consumption.txt",header=T, sep=";",na.strings="?")
extract<- readtxt[(readtxt$Date == '1/2/2007'|readtxt$Date == '2/2/2007'),]
transfer <- strptime(paste(extract$Date,extract$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
final <- cbind(transfer, extract)
final$transfer <- as.POSIXct(transfer)
plot(final$Sub_metering_1~final$transfer,type="l",ylab="Global Active Power (kilowatts)", xlab=" ")
lines(final$Sub_metering_2~final$transfer, type="l",col="red")
lines(final$Sub_metering_3~final$transfer, type="l",col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1))
# above are all for plot 3