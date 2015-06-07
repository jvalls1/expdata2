# Assuming that we have a the file household_power_consumption.txt in our working directory
DF4 <- read.csv("household_power_consumption.txt",
                colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                stringsAsFactors=F,sep=";",na.strings="?")

# Les 2880 Obs. of 9 variables. Subseting the DataFrame
DF4Sub <- subset(DF4,Date=="1/2/2007" | Date=="2/2/2007")

# Opening a dispositive.
png("plot2.png")

plot(seq_along(DF4Sub$Time),DF4Sub$Global_active_power,type="line",xlab="",ylab="Global Active Power (Kilowatts)",xaxt="n")
axis(1,at=c(0,1440,2880),label=c("Thu","Fri","Sat"))

# Closing the file
dev.off()