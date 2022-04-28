
# Create the data for bar plot
Coverage <- c(4.78, 4.97, 4.97, 5.05, 4.85, 4.15, 4.60, 4.57, 4.87, 5.21)
Sequences <- c("SR_182","SR_183", "SR_184", "SR_185", "SR_186", 
       "SR_187", "SR_188", "SR_189", "SR_190", "SR_191")

# Plot bar plot 
barplot(Coverage, names.arg=Sequences, xlab="Sequences",ylab="Coverage",col="light blue",
        main="Individual Sequence Coverage",border="red")

# Average data
Average_Coverage <- c(4.80)
All_Sequences <- ("All Sequences")

# Average bar plot
png(filename="plot.png", width =235, height = 500)
barplot(Average_Coverage, names.arg=All_Sequences, xlab="Sequences",ylab="Average_Coverage",col="light blue",
        main="Average Sequence Coverage",border="red")
dev.off()



