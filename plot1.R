# Plot1.R

# Change dates to english
Sys.setlocale("LC_TIME", "C")

# Load data handler function
source("data_setup.R") 

# Read data set
data <- data_setup()

# Set up file output
png(file = "./plot1.png")

# Plot data
with(data, hist(Global_active_power, main = "Global Active Power", ylab = "Frequency" ,xlab = "Global Active Power (kilowatts)", col = "red"))

# Close device
dev.off()