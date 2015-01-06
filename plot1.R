##
## plot1.R
##
## Construct the plot and save it to a PNG file with a width of 480 and a height of 480 pixels
##


## Read the dataset
data = read.csv( "household_power_consumption.txt",
                 sep=";",
                 na.strings=c("?"),
                 as.is=c(1,2))

## Convert column "Date" to date
data$Date = as.Date(data$Date, format="%d/%m/%Y")

## Convert column "Time" to time
data$Time = strptime(data$Time, format="%T")

## Only use data from the dates 2007-02-01 and 2007-02-02
tidy = data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

## Save PNG images 480 x 480 pixels
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## Draw the red histogram of Global active power
hist(tidy$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

