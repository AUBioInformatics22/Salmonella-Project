# Plotting histogram

library(Sleuth3)
library(ggplot2)

dup <- read.csv("dup.csv")
View(dup)

par(mar = c(6, 6, 4, 2))
hist(dup$Percent_Duplication, 
     main="Percent Duplication in Samples", 
     xlab="Percent Duplication",
     col="slateblue1",
     cex.lab=2.5,
     cex.main=3,
     cex.axis=1.5)

# Plotting bar plot

data = read.csv("coverage.csv")
data = t(data)
View(data)
colnames(data) = data[1,]

new.table = data[2:3,]
new.table = apply(new.table, 2, as.numeric)

row.names(new.table)=c("Percent_Raw_Coverage","Percent_Mapped_Coverage")

par(mar=c(10, 6, 5, 11), xpd=TRUE)
barplot(height = new.table, 
        beside = T, 
        las=3, 
        col=c("slateblue1", "darkgoldenrod2"),
        main = "Raw Coverage vs. Mapped Coverage", 
        ylab = "Coverage",
        cex.lab=2.5, 
        cex.main=3,
        cex.axis=1.5,
        cex.names=1.5)
legend(31, 95, legend=c("Raw", "Mapped"),
       col=c("slateblue1", "darkgoldenrod2"), pch=15, bty="n", pt.cex=4, 
       cex=1.5)

set.seed(123)
origin <-c(2, 3.5, 5, 7.9, 8.8, 12.3)
x<-sample(origin, 100, replace=T)
b<-barplot(table(x),ylim=c(0,22))
text(x=b, y= table(x)+1, labels=as.character(table(x)))
