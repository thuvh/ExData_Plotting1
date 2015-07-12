name <- "household_power_consumption_filterd.txt"
hpc <- read.table(name, header = TRUE, sep = ";", na.strings = "?")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

#plot 2
with(hpc, 
     plot(DateTime, 
          Global_active_power, 
          type = "l",
          xlab = "", 
          ylab = "Global Active Power (kilowatts)"))

#same as plot 2
with(hpc, 
     plot(DateTime, 
          Voltage, 
          type = "l",
          xlab = "datetime", 
          ylab = "Voltage"))

#plot 3
with(hpc, 
     plot(DateTime, 
          Sub_metering_1, 
          type = "l",
          xlab = "", 
          ylab = "Energy sub metering"))

with(hpc, 
     points(DateTime,
            Sub_metering_2,
            type = "l",
            xlab = "",
            ylab = "Energy sub metering",
            col = "red"))

with(hpc, 
     points(DateTime,
            Sub_metering_3,
            type = "l",
            xlab = "",
            ylab = "Energy sub metering",
            col = "blue"))

legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

#same as plot 2
with(hpc, 
     plot(DateTime, 
          Global_reactive_power, 
          type = "l",
          xlab = "datetime", 
          ylab = "Global_reactive_power"))

dev.off()