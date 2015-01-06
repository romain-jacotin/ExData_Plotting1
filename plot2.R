##
## plot2.R
##
## Construct the plot and save it to a PNG file with a width of 480 and a height of 480 pixels
##


## Read the dataset
data = read.csv( "household_power_consumption.txt",
                 sep=";",
                 na.strings=c("?"),
                 as.is=c(1,2))

## Convert column "Date" to date
data$TimeSeries = paste(data$Date,data$Time)
data$TimeSeries = strptime(data$TimeSeries, format="%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$Time = strptime(data$Time, format="T")

## Only use data from the dates 2007-02-01 and 2007-02-02
tidy = data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

## Save PNG images 480 x 480 pixels
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## Plot the Global active power's time series
plot( tidy$TimeSeries,
      tidy$Global_active_power,
      type="l",
      xlab="",
      ylab="Global Active Power (kilowatts)")
dev.off()

