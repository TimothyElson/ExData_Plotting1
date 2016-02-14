##The scrip below creates plot 3 for assignment 1 in Exploratory Data Analysis

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

## the code for producing the plot 3 png
png("plot3.png", width = 480, height =  480)
##adds the submeter 1 to the plot
plot(elc2$timestamp,elc2$Sub_metering_1, 
     type = "l", 
     col ="black", 
     xlab ="",
     ylab="Energy sub metering")
#adds the submeter 2 and 3 lines
lines(elc2$timestamp,elc2$Sub_metering_2, type = "l", col ="red")
lines(elc2$timestamp,elc2$Sub_metering_3, type = "l", col ="blue")
##adds the legend
legend("topright", lty=c(1,1),
       col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()