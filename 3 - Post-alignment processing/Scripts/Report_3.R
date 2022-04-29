# Plotting histogram

library(Sleuth3)
library(ggplot2)

dup <- read.csv("dup.csv")

hist(dup$Percent_Duplication, 
     main="Percent Dupliction in Samples", xlab="Percent Duplication")


# Plotting bar plot

data = read.csv("coverage.csv")

data = t(data)

colnames(data) = data[1,]

new.table = data[2:3,]
new.table = apply(new.table, 2, as.numeric)

row.names(new.table)=c("Percent_Raw_Coverage","Percent_Mapped_Coverage")

par(mar=c(8, 4, 4.5, 8.1), xpd=TRUE)
barplot(height = new.table, beside = T, legend.text = c("Raw","Mapped"), 
        args.legend = list(x = "topright", inset = c(-0.4, -0.3)), las=3, main = "Raw Coverage vs. Mapped Coverage
After Post-Alignment Processing", ylab = "Coverage")
