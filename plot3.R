# Plot3.R

# Change dates to english
Sys.setlocale("LC_TIME", "C")

# Load data handler function
source("data_setup.R") 

# Read data set
data <- data_setup()

# Set up file output
png(file = "./plot3.png")

# Plot data
with(data, { 
  plot(Time, Sub_metering_1,xlab = "", ylab = "Energy sub metering",  type="l", col = "black")
  points(Time, Sub_metering_2, type="l", col = "red")
  points(Time, Sub_metering_3, type="l", col = "blue")
  legend("topright", lwd = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Close output device
dev.off()