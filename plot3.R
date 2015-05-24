## Read the files from the working directory ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## Subset the data for Balitmore City and aggregate ##
newdata <- NEI[ which(NEI$fips == "24510"), ]
aggdata<- aggregate(newdata$Emissions, by=list(year=newdata$year,type=newdata$type), FUN=sum)
library("ggplot2")

###  set device to png and Plot the graph by year and Emissions ##
## Use ggplot and line graph indicating by 'type'
png("C:/Users/skumar/Documents/R_working_site/exdata_data_NEI_data/plot3.png")
# plot bargraph
ggplot(aggdata, aes(x=year, y=Emissions, group=type))+ geom_line(aes(x=year, y=x ,colour=type))+labs(title= "Total Emissions Baltimore")

dev.off()



