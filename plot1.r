name <- "household_power_consumption.txt"
hpc_all <- read.table(name, header = TRUE, sep = ";", na.strings = "?")
hpc <- hpc_all[hpc_all$Date == '1/2/2007' | hpc_all$Date == '2/2/2007', ]
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot1.png", width = 480, height = 480)

hist(hpc$Global_active_power, 
     col = "red", 
     breaks = 13,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     xlim = c(0, 6),
     ylab = "Frequency",
     ylim = c(0, 1200), 
     xaxp = c(0, 6, 3))

dev.off()
