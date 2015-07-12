name <- "household_power_consumption_filterd.txt"
hpc <- read.table(name, header = TRUE, sep = ";", na.strings = "?")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

with(hpc, 
     plot(DateTime, 
          Global_active_power, 
          type = "l",
          xlab = "", 
          ylab = "Global Active Power (kilowatts)"))


dev.off()
