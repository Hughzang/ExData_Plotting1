## Load Data

HPC  <- read.csv("./Rdata/household_power_consumption.txt", 
                 sep = ";", na.strings = "?")
HPC$TimeTrans <- strptime(paste(HPC$Date, HPC$Time), "%d/%m/%Y %H:%M:%OS")
subHPC <- HPC[((HPC$TimeTrans > "2007-01-31 23:59:59") & (HPC$TimeTrans < "2007-02-03 00:00:00")), ]

## Launch PDF device

png(filename = "./Rdata/plot3.png", 
    width = 480, height = 480, units = "px")

## Plotting

with(subHPC, {plot(TimeTrans, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
              points(TimeTrans, Sub_metering_2, type = "l", col = "red")
              points(TimeTrans, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", pch = "___", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

## Close device

dev.off()
