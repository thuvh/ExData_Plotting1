name <- "household_power_consumption.txt"
hpc_all <- read.table(name, header = TRUE, sep = ";", na.strings = "?")
hpc <- hpc_all[hpc_all$Date == '1/2/2007' | hpc_all$Date == '2/2/2007', ]
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

with(hpc, 
     plot(DateTime, 
          Global_active_power, 
          type = "l",
          xlab = "", 
          ylab = "Global Active Power (kilowatts)"))


dev.off()
