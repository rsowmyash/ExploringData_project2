## Read the files from the working directory ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## Subset the data for coal combustion-related sources and aggregate ##
# fetch all NEIxSCC records with Short.Name (SCC) Coal
NEISCC <- merge(NEI, SCC, by="SCC")
DFMatches_coal  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
DF_NEISCC <- NEISCC[DFMatches_coal, ]

aggregatedNEISCCByYear <- aggregate(Emissions ~ year, DF_NEISCC, sum)

# set options scipen to force Y labels out of scientific notation
options("scipen"=100)

png("C:/Users/skumar/Documents/R_working_site/exdata_data_NEI_data/plot4.png")
# plot bargraph
barplot(height=aggregatedNEISCCByYear$Emissions, 
        names.arg=aggregatedNEISCCByYear$year,
        main="Sum Coal emissions by year",
        ylab="Sum Coal emissions",
        xlab="Year",
        col= 'red')

dev.off()