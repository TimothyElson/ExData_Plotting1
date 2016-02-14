##The scrip below creates plot 2 for assignment 1 in Exploratory Data Analysis

#reads the data from the txt file from you working directory
electric_cons_data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

library(dplyr)
##The below subsets the electric_cons_data into two parts corresponding to the 1st and 2nd of February 2007
elc_date1 <- filter(electric_cons_data,as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y")) 
elc_date2 <- filter(electric_cons_data,as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))
#below joins to two parts together
elc_date <- rbind(elc_date1,elc_date2)

##This adds a datetime column to the dataset
elc2 <- within(elc_date, { timestamp=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") })

##The commented out code will create plot 2 
#plot(elc2$timestamp, elc2$Global_active_power, type = "l", col = "black", xlab="", ylab ="Global Active Power (kilowatts)")

## the code for producing the plot 2 png
png("plot2.png", width = 480, height =  480)
plot(elc2$timestamp, elc2$Global_active_power, 
     type = "l",  
     col = "black",  
     xlab="", 
     ylab ="Global Active Power (kilowatts)")
dev.off()
