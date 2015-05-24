## Read the files from the working directory ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## Subset the data for Balitmore City 
newdata <- NEI[ which(NEI$fips == "24510"), ]

##Aggregate the dataset for Baltimore City in PM2.5 emissions for all years  ##
aggdata <- aggregate(newdata$Emissions, by=list(newdata$year), FUN=sum)
library("ggplot2")

###  set device to png and Plot the graph by year and Emissions ##
png("C:/Users/skumar/Documents/R_working_site/exdata_data_NEI_data/plot2.png")
# plot bargraph
barplot(height=aggdata$x, 
        names.arg=aggdata$Group.1,
        main="Sum PM25 Balitmore emissions by year",
        ylab="Sum PM25 Baltimore emissions",
        xlab="Year",
        col= 'Red')

dev.off()