# This function performs data subsetting and caching;
# The plot{n}.R scripts call this functions, and the data reading is done only
# once, making the plots faster instead of reading the same data set everytime

data_setup <- function() {
  file_url<- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  hpc_df <- data.frame()
  
  # Download zip file if not found
  if(file.exists("./hpc.zip") == FALSE) {
    download.file(file_url,"./hpc.zip")  
  }
  
  # Unzip data set if not done already
  if(file.exists("./household_power_consumption.txt") == FALSE) {
    unzip("./hpc.zip")
  }
  
  # Check if cached data frame is available
  if(file.exists("./hpc_df.csv") == FALSE) {
    #hpc_df <- read.csv2.sql("./household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='01/02/2007' OR Date='02/02/2007'",sep=";",na.strings="?" )
    
    #hpc_df <- read.table(pipe('grep ^[1-2]/2/2007 "./household_power_consumption.txt"'), header=F, sep=";")
    #colnames(hpc_df) <-names(read.table('./household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
    
    hpc_df <- read.csv("./household_power_consumption.txt", sep=";", na.strings=c("NA", "?"), stringsAsFactors=FALSE)
    # Convert to Date type
    hpc_df$Date <- as.Date(hpc_df$Date, "%d/%m/%Y")
    
    # Convert to Date type
    hpc_df$Time <- strptime(paste(hpc_df$Date, hpc_df$Time), "%Y-%m-%d %H:%M:%S")
    
    
    dates <- as.Date(c("01/02/2007",  "02/02/2007"), "%d/%m/%Y")
    
    hpc_df <- subset(hpc_df, Date == dates[1] | Date == dates[2])
    
    # Save cache
    write.csv(hpc_df, file = "./hpc_df.csv", row.names = FALSE)
    
    return(hpc_df)
  }
  # Restore R cached data frame
  else {
    hpc_df <- read.csv("./hpc_df.csv")
    hpc_df$Time <- strptime(hpc_df$Time, "%Y-%m-%d %H:%M:%S")
    return(hpc_df)
  }
}

remove_cache <- function() {
  if(file.exists("./hpc_df.csv")) {
    file.remove("./hpc_df.csv")  
  }
}