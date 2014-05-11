getData <- function(){
dataPlace <- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE)
dataPlace["Date"] <- as.Date(strptime(dataPlace[,"Date"], format="%d/%m/%Y"))
dataPlace <- dataPlace[dataPlace[,"Date"]<="2007-02-02" & dataPlace[,"Date"]>="2007-02-01",]
dataPlace$Time <-as.POSIXct( strptime(dataPlace[,"Time"],format="%H:%M:%S"), format = "%H:%M:%S")
dataPlace
}
dataPlace<-getData()
png(file = "plot1.png", width = 480, height = 480)
par(mar=c(5,3,3,3), cex.main=0.9)
hist(as.numeric(as.vector(dataPlace$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
result<-"plot1.png"

