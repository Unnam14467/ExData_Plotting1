
Data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")

Interested_Dates <- as.Date(c("2007-02-01","2007-02-02"))

Subset_Data <- Data[Data$Date>=as.Date("2007-02-01") & Data$Date<=as.Date("2007-02-02"),]

Subset_Data$Global_active_power <- as.numeric(Subset_Data$Global_active_power)
Subset_Data$Day <- weekdays(Subset_Data$Date)

png(file = "plot2.png",width = 480, height = 480)
plot(Subset_Data$Global_active_power,type = "l",xlab="",ylab="Global Active Power(kilowatts)",xaxt="n")
axis(side = 1, at = c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.off()
