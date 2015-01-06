##
## plot4.R
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
png(filename = "plot4.png", width = 480, height = 480, units = "px")

## Divide the graphics device in 2x2 parts
par( mfcol=c(2,2))

## Plot the Global active power's time series at top left
plot( tidy$TimeSeries,
      tidy$Global_active_power,
      type="l",
      xlab="",
      ylab="Global Active Power")

## Draw the 3 sub metering plots at bottom left
plot( tidy$TimeSeries,
      tidy$Sub_metering_1,
      col="black",
      type="l",
      xlab="",
      ylab="Energy sub metering")

lines( tidy$TimeSeries,
       tidy$Sub_metering_2,
       col="red",
       type="l",
       xlab="",
       ylab="Energy sub metering")

lines( tidy$TimeSeries,
       tidy$Sub_metering_3,
       col="blue",
       type="l",
       xlab="",
       ylab="Energy sub metering")

legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       box.lty=0,
       legend = c( "Sub_metering_1",
                   "Sub_metering_2",
                   "Sub_metering_3"))

## Plot Voltage at top right
plot( tidy$TimeSeries,
      tidy$Voltage,
      col="black",
      type="l",
      xlab="datetime",
      ylab="Voltage")

## Plot Global_reactive_power at bottom right
plot( tidy$TimeSeries,
      tidy$Global_reactive_power,
      col="black",
      type="l",
      xlab="datetime",
      ylab="Global_reactive_power")

dev.off()

