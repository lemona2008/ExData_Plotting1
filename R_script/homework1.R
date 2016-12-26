url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
f <- file.path(getwd(), "house_power_consumption")
download <- download.file(url,f)
unzip(zipfile="house_power_consumption")


readtxt<- read.table("household_power_consumption.txt",header=T, sep=";",na.strings="?")
extract<- readtxt[(readtxt$Date == '1/2/2007'|readtxt$Date == '2/2/2007'),]
transfer <- strptime(paste(extract$Date,extract$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
final <- cbind(transfer, extract)
final$transfer <- as.POSIXct(transfer)

# %in% will provide a series logical value result of TRUE or FALSE, but if using readtxt [],then True means choose
# False means not to use it. THe final result will be corresponding context of the column
hist(final$Global_active_power,col="red",main="Global Active Power",xlab ="Global Active Power (kilowatts)")
# print plot 1

plot(final$transfer,final$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab=" ")
# print plot 2

plot(final$Sub_metering_1~final$transfer,type="l",ylab="Global Active Power (kilowatts)", xlab=" ")
lines(final$Sub_metering_2~final$transfer, type="l",col="red")
lines(final$Sub_metering_3~final$transfer, type="l",col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1))
# above are all for plot 3

par(mfrow=c(2,2))
plot(final$transfer,final$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab=" ")
#print plot 2 and put in location (1,1)

plot(final$Voltage~final$transfer,type="l",xlab=" ",ylab="Voltage(volt)")  # plot 4 and put in location (1,2)

plot(final$Sub_metering_1~final$transfer,type="l",ylab="Global Active Power (kilowatts)", xlab=" ")
lines(final$Sub_metering_2~final$transfer, type="l",col="red")
lines(final$Sub_metering_3~final$transfer, type="l",col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),bty="n")
# plot 3 and put in location (2,1)

plot(final$Global_reactive_power~final$transfer,type="l",ylab="Global Reactive Power (kilowatts)",xlab=" ")
#final plot and put in location(2,2)





