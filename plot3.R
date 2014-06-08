##
# Coursera
# Exploratory Data Analysis
# Course Project 1
# Plot 3
#

# Load data
df <- read.table("household_power_consumption.txt", header=T, sep=";",
                 stringsAsFactors=F, dec=".")
# Subset for 2007-02-01 and 2007-02-02 only
df <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert variables
df$Date <- strptime(df$Date,"%d/%m/%Y")
df$Time <- strptime(paste(df$Date, df$Time), "%F %T")
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

# Set locale to format weekdays in english
Sys.setlocale("LC_TIME", "C")

# Plots
png(filename="plot3.png", width=480, height=480)
plot(df$Time, df$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(df$Time, df$Sub_metering_2, col="red")
lines(df$Time, df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()