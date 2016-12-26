url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
f <- file.path(getwd(), "house_power_consumption")
download <- download.file(url,f)
unzip(zipfile="house_power_consumption")


readtxt<- read.table("household_power_consumption.txt",header=T, sep=";",na.strings="?")
extract<- readtxt[(readtxt$Date == '1/2/2007'|readtxt$Date == '2/2/2007'),]
transfer <- strptime(paste(extract$Date,extract$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
final <- cbind(transfer, extract)
final$transfer <- as.POSIXct(transfer)

hist(final$Global_active_power,col="red",main="Global Active Power",xlab ="Global Active Power (kilowatts)")
# print plot 1