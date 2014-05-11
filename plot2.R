getData <- function(){
  dataPlace <- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE)
  dataPlace["Date"] <- as.Date(strptime(dataPlace[,"Date"], format="%d/%m/%Y"))
  dataPlace <- dataPlace[dataPlace[,"Date"]<="2007-02-02" & dataPlace[,"Date"]>="2007-02-01",]
  dataPlace$Time <-as.POSIXct( strptime(dataPlace[,"Time"],format="%H:%M:%S"), format = "%H:%M:%S")
  dataPlace
}
dataPlace<-getData()
par(cex.lab=0.9)
png(file = "plot2.png", width = 480, height = 480)
dataPlace$Time <- as.POSIXct(strptime (paste (as.character(dataPlace$Date, format = "%Y-%m-%d"), as.character(dataPlace$Time, format = "%H:%M:%S")), format ="%Y-%m-%d %H:%M:%S"))
plot(dataPlace$Time, as.numeric(as.vector(dataPlace$Global_active_power)), type ="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()