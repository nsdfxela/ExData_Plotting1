
getData <- function(){
  dataPlace <- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE)
  dataPlace["Date"] <- as.Date(strptime(dataPlace[,"Date"], format="%d/%m/%Y"))
  dataPlace <- dataPlace[dataPlace[,"Date"]<="2007-02-02" & dataPlace[,"Date"]>="2007-02-01",]
  dataPlace$Time <-as.POSIXct( strptime(dataPlace[,"Time"],format="%H:%M:%S"), format = "%H:%M:%S")
  dataPlace
}
dataPlace<-getData()
dataPlace$Time <- as.POSIXct(strptime (paste (as.character(dataPlace$Date, format = "%Y-%m-%d"), as.character(dataPlace$Time, format = "%H:%M:%S")), format ="%Y-%m-%d %H:%M:%S"))
png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2), mar=c(4,4,1,1), bg="transparent")

  with(dataPlace,{
    ##1
    plot(dataPlace$Time, as.numeric(as.vector(dataPlace$Global_active_power)), type ="l", ylab="Global Active Power", xlab="") 
    ##2
    plot(dataPlace$Time, as.numeric(as.vector(dataPlace$Sub_metering_1)), type ="n", ylab="Energy sub metering", xlab="")
    lines(dataPlace$Time, as.numeric(as.vector(dataPlace$Sub_metering_1)), col="black")
    lines(dataPlace$Time, as.numeric(as.vector(dataPlace$Sub_metering_2)), col="red")
    lines(dataPlace$Time, as.numeric(as.vector(dataPlace$Sub_metering_3)), col="blue")
    legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, bty="n")
    ##3
    plot(dataPlace$Time, as.numeric(as.vector(dataPlace$Voltage)), type ="l", ylab="Voltage", xlab="datetime") 
    ##4
    plot(dataPlace$Time, as.numeric(as.vector(dataPlace$Global_reactive_power)), type ="l", ylab="Global_reactive_power", xlab="datetime") 
    
  })
dev.off()
