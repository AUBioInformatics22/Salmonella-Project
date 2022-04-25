# Venn diagram for .venn files from VCF compare

# load Venn diagram package
install.packages("VennDiagram")
library("VennDiagram")

# move to new plotting page
grid.newpage()

# create Venn diagram with the values from the excel file
venn.plot <- draw.triple.venn(
  area1 = 1794,
  area2 = 1678,
  area3 = 106,
  n12 = 1678,
  n23 = 94,
  n13 = 106,
  n123 = 94,
  category = c("Raw", "Filtered", "Adjusted"),
  fill = c("slateblue1", "chartreuse4", "darkgoldenrod2"),
  col = "white",
  cex = 3,
  cat.cex = 3,
  fontfamily = "sans",
  cat.fontfamily = "sans"
);
grid.draw(venn.plot);
