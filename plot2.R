# Plot2.R

# Change dates to english
Sys.setlocale("LC_TIME", "C")

# Load data handler function
source("data_setup.R") 

# Read data set
data <- data_setup()

# Set up file output
png(file = "./plot2.png")

# Plot data
with(data, plot(Time, Global_active_power, ylab = "Global Active Power (kilowatts)",  type="l")) 

# Close device
dev.off()