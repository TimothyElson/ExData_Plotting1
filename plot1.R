##The scrip below creates plot 1 for assignment 1 in Exploratory Data Analysis

#reads the data from the txt file from you working directory
electric_cons_data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

library(dplyr)
##The below subsets the electric_cons_data into two parts corresponding to the 1st and 2nd of February 2007
elc_date1 <- filter(electric_cons_data,as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y")) 
elc_date2 <- filter(electric_cons_data,as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))
#below joins to two parts together
elc_date <- rbind(elc_date1,elc_date2)

#The commented out code will create the plot 1 histogram by itself
#hist(elc_date$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


# the code for producing the plot 1 png
png("plot1.png", width = 480, height =  480)
hist(elc_date$Global_active_power, 
     col ="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()