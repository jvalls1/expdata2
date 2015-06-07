# Assuming that we have a the file household_power_consumption.txt in our working directory
DF4 <- read.csv("household_power_consumption.txt",
                colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                stringsAsFactors=F,sep=";",na.strings="?")

# Les 2880 Obs. of 9 variables. Subseting the DataFrame
DF4Sub <- subset(DF4,Date=="1/2/2007" | Date=="2/2/2007")

# Opening a dispositive.
png("plot3.png")

plot(seq_along(DF4Sub$Time),DF4Sub$Sub_metering_1,type="line",xlab="",ylab="Energy sub metering",col="blue",xaxt="n")
axis(1,at=c(0,1440,2880),label=c("Thu","Fri","Sat"))
points(seq_along(DF4Sub$Time),DF4Sub$Sub_metering_1,type="line",col="black")
points(seq_along(DF4Sub$Time),DF4Sub$Sub_metering_2,type="line",col="red")
points(seq_along(DF4Sub$Time),DF4Sub$Sub_metering_3,type="line",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),text.col="black",cex=0.75,xjust=1,adj=c(0,0.5))


# Closing the file
dev.off()