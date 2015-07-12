name <- "household_power_consumption.txt"
hpc_all <- read.table(name, header = TRUE, sep = ";", na.strings = "?")
hpc <- hpc_all[hpc_all$Date == '1/2/2007' | hpc_all$Date == '2/2/2007', ]
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

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
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()