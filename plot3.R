getData <- function(){
  dataPlace <- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE)
  dataPlace["Date"] <- as.Date(strptime(dataPlace[,"Date"], format="%d/%m/%Y"))
  dataPlace <- dataPlace[dataPlace[,"Date"]<="2007-02-02" & dataPlace[,"Date"]>="2007-02-01",]
  dataPlace$Time <-as.POSIXct( strptime(dataPlace[,"Time"],format="%H:%M:%S"), format = "%H:%M:%S")
  dataPlace
}
dataPlace<-getData()
dataPlace$Time <- as.POSIXct(strptime (paste (as.character(dataPlace$Date, format = "%Y-%m-%d"), as.character(dataPlace$Time, format = "%H:%M:%S")), format ="%Y-%m-%d %H:%M:%S"))
##drawing
png(file = "plot3.png", width = 480, height = 480)
par(cex.lab=0.8, cex.sub=0.5)
plot(dataPlace$Time, as.numeric(as.vector(dataPlace$Sub_metering_1)), type ="n", ylab="Energy sub metering", xlab="")
lines(dataPlace$Time, as.numeric(as.vector(dataPlace$Sub_metering_1)), col="black")
lines(dataPlace$Time, as.numeric(as.vector(dataPlace$Sub_metering_2)), col="red")
lines(dataPlace$Time, as.numeric(as.vector(dataPlace$Sub_metering_3)), col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8)
dev.off()