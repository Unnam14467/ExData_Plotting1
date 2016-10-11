
Data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")

Interested_Dates <- as.Date(c("2007-02-01","2007-02-02"))

Subset_Data <- Data[Data$Date>=as.Date("2007-02-01") & Data$Date<=as.Date("2007-02-02"),]

Subset_Data$Global_active_power <- as.numeric(Subset_Data$Global_active_power)
Subset_Data$Day <- weekdays(Subset_Data$Date)

png(file = "plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))
{plot(Subset_Data$Global_active_power,type = "l",xlab="",ylab="Global Active Power(kilowatts)",xaxt="n");
  axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"));}

{plot(Subset_Data$Voltage,type = "l",xlab="datetime",ylab="Voltage",xaxt="n"); 
  axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"));}

{plot(Subset_Data$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering",xaxt="n");
  lines(Subset_Data$Sub_metering_2,type = "l",xlab="",ylab="",xaxt="n",col="red");
  lines(Subset_Data$Sub_metering_3,type = "l",xlab="",ylab="",xaxt="n",col="blue");
  axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"));
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty=1:2, cex=0.8);}

{plot(Subset_Data$Global_reactive_power,type = "l",xlab="datime",ylab="Global_reactive_power",xaxt="n");
  axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"));}

dev.off()
