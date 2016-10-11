
Data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")

Interested_Dates <- as.Date(c("2007-02-01","2007-02-02"))

Subset_Data <- Data[Data$Date>=as.Date("2007-02-01") & Data$Date<=as.Date("2007-02-02"),]

Subset_Data$Global_active_power <- as.numeric(Subset_Data$Global_active_power)

png(file = "plot1.png",width = 480, height = 480)
hist(Subset_Data$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")
dev.off()
