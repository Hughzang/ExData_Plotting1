## Load Data

HPC  <- read.csv("./Rdata/household_power_consumption.txt", 
                 sep = ";", na.strings = "?")
HPC$TimeTrans <- strptime(paste(HPC$Date, HPC$Time), "%d/%m/%Y %H:%M:%OS")
subHPC <- HPC[((HPC$TimeTrans > "2007-01-31 23:59:59") & (HPC$TimeTrans < "2007-02-03 00:00:00")), ]

## Launch PDF device

png(filename = "./Rdata/plot1.png", 
    width = 480, height = 480, units = "px")

## Plotting

hist(subHPC$Global_active_power, 
     col  = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency"
     )
par(cex.axis = 0.8, 
    cex.lab  = 0.8
    )

## Close device

dev.off()
