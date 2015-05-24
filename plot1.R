## Read the files from the working directory ##

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## Aggregate the dataset combine PM2.5 emissions for all years  ##
aggdata <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
library("ggplot2")

# set options scipen to force Y labels out of scientific notation
options("scipen"=100)
###  set device to png and Plot the graph by year and Emissions ##
png("C:/Users/skumar/Documents/R_working_site/exdata_data_NEI_data/plot1.png")
# plot bargraph
barplot(height=aggdata$x, 
        names.arg=aggdata$Group.1,
        main="Sum PM25 emissions by year",
        ylab="Sum PM25 emissions",
        xlab="Year",
        col= 'blue')

dev.off()
