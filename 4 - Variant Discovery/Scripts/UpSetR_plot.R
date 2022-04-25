#upsetr
library(UpSetR)

#replace numbers in following expression with results from vcf-compare
expressionInput<-c(`Raw` = 129,
                   `Raw&Filtered` = 1573,
                   `Raw&Adjusted` = 1,
                   `Raw&Filtered&Adjusted` = 15)

png(file="~/downloads/SRR39_UpSet_Plot.png",
    height=5.5,width=9, res=300,pointsize=9,units="in")

upset(fromExpression(expressionInput),
      order.by = "degree", 
      mainbar.y.label = "Intersection of PASS Sites", 
      sets.x.label = "No. of PASS Sites", 
      number.angles = 30, 
      point.size = 3, 
      line.size = 1, 
      empty.intersections = "on",
      shade.color="lightblue", 
      text.scale=c(2,1.5,1.25,0.9,2.5,0.85))
dev.off()


