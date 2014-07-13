# Plot3.R

# Change dates to english
Sys.setlocale("LC_TIME", "C")

# Load data handler function
source("data_setup.R") 

# Read data set
data <- data_setup()

# Set up file output
png(file = "./plot4.png")

# Create four plotting screens
par(mfrow = c(2,2))

# Plot data
with(data, {

  # Plot 1
  plot(Time, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",  type="l")
  
  # Plot 2
  plot(Time, Voltage, xlab = "dateTime", ylab = "Voltage",  type="l")
  
  plot(Time, Sub_metering_1,xlab = "", ylab = "Energy sub metering",  type="l", col = "black")
  points(Time, Sub_metering_2, type="l", col = "red")
  points(Time, Sub_metering_3, type="l", col = "blue") 
  legend("topright", bty = "n", lwd = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",  type="l", col = "black")
  

})

dev.off()