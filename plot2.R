## To read text file into R and reset headers
Feb1and2 <- read.table("~/Data Science Learning/Coursera/Exploratory Data Analysis/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, stringsAsFactors = FALSE)
names <- read.table("~/Data Science Learning/Coursera/Exploratory Data Analysis/household_power_consumption.txt", sep = ";", nrows = 1, stringsAsFactors = FALSE)
names(Feb1and2) <- as.character(names)

## To combine Time and Data columns and reclass as POSIXlt 
Feb1and2[,1] <- with(Feb1and2, as.Date(Feb1and2$Date, format = "%d/%m/%Y"))
dt <- paste(Feb1and2$Date,Feb1and2$Time)
dt_lt <- as.POSIXlt(dt)
Feb1and2$datetime <- paste(dt_lt)
Feb1and2[1:2] <- list(NULL)

## To create Plot 2
plot(as.POSIXlt(Feb1and2$datetime), Feb1and2$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.copy(png, width = 480, height = 480, file="plot2.png")
dev.off()