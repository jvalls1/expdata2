# Assuming that we have a the file household_power_consumption.txt in our working directory
DF4 <- read.csv("household_power_consumption.txt",
                colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                stringsAsFactors=F,sep=";",na.strings="?")

# Les 2880 Obs. of 9 variables. Subseting the DataFrame
DF4Sub <- subset(DF4,Date=="1/2/2007" | Date=="2/2/2007")

# Opening a dispositive.
png("plot4.png")

# Empazamos el plot numero 4
par(mfrow=c(2,2))
# Plot 1,1 Global Active Voltage versus time
# plot(seq_along(DF4Sub$Time),DF4Sub$Global_active_power,type="line",xaxt="n")
plot(seq_along(DF4Sub$Time),DF4Sub$Global_active_power,type="line",xlab="",ylab="Global Active Power (Kilowatts)",xaxt="n")
axis(1,at=c(0,1440,2880),label=c("Thu","Fri","Sat"))
# Plot 1,2 Voltage versus datetime
plot(seq_along(DF4Sub$Time),DF4Sub$Voltage,type="line",xlab="datetime",ylab="Voltage",xaxt="n")
axis(1,at=c(0,1440,2880),label=c("Thu","Fri","Sat"))
# Plot 2,1 Energy sub metering.
plot(seq_along(DF4Sub$Time),DF4Sub$Sub_metering_1,type="line",xlab="",ylab="Energy sub metering",col="blue",xaxt="n")
axis(1,at=c(0,1440,2880),label=c("Thu","Fri","Sat"))
points(seq_along(DF4Sub$Time),DF4Sub$Sub_metering_1,type="line",col="black")
points(seq_along(DF4Sub$Time),DF4Sub$Sub_metering_2,type="line",col="red")
points(seq_along(DF4Sub$Time),DF4Sub$Sub_metering_3,type="line",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),text.col="black",cex=0.75,xjust=1,adj=c(0,0.5))
# Plot 2,2, Global reactive power
plot(seq_along(DF4Sub$Time),DF4Sub$Global_reactive_power,type="line",xlab="datetime",ylab="Global_reactive_power",xaxt="n")
axis(1,at=c(0,1440,2880),label=c("Thu","Fri","Sat"))

# Closing the file
dev.off()