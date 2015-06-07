
# Assuming that we have a the file household_power_consumption.txt in our working directory
DF4 <- read.csv("household_power_consumption.txt",
                colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                stringsAsFactors=F,sep=";",na.strings="?")

# Les 2880 Obs. of 9 variables. Subseting the DataFrame
DF4Sub <- subset(DF4,Date=="1/2/2007" | Date=="2/2/2007")

# Opening a dispositive.
png("plot1.png")

# Contructing the plot.
# Plot numero 1
hist(DF4Sub$Global_active_power,main="Global_active_power",col="red",xlab="Global Active Power (Kilowatts)")

# Closing the file
dev.off()
