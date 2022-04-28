
# 5. Data Analysis for Peer Review

In order to generate phylogenetic trees, three approaches were taken. It was necessary for assembly of genomes for all three approaches. This was accomplished with SPAdes. The first approach used Prokka for genome annotation of fasta assemblies. Once this was completed, [Roary](https://sanger-pathogens.github.io/Roary/) used the annotated assemblies in gff format to build pan genomes, identifying the core and accessory genes. A Newick file is generated based on the presence and absence of genes in accessory genome. The second and third approach utilized two services found on the webpage for the [Center for Genomic Epidemiology](http://genomicepidemiology.org/). The tool [MINTyper](https://cge.food.dtu.dk/services/MINTyper/) used fasta assemblies to identify SNP differences between the isolates and perform hierarchical clustering using the Neighbor-Joining algorithm to generate Newick files. The third approach was with the tool [CSI Phylogeny](https://cge.food.dtu.dk/services/CSIPhylogeny/). CSI Phylogeny CSI Phylogeny calls SNPs, filters the SNPs, does site validation and infers a phylogeny based on the concatenated alignment of the high quality SNPs. A maximum likelihood tree is created from the alignment. [FigTree](http://tree.bio.ed.ac.uk/software/figtree/) was used to generate trees from Newick files from all three approaches. A heatmap of SNPs between isolates was generated in Excel from the SNP matrix file from CSI Phylogeny. </br>

## Steps planned
## 1. De novo sequencing with [SPAdes](https://github.com/ablab/spades#sec1.2), which is designed to assemble small genomes from MDA single-cell and standard bacterial data sets. </br>
## 2. Quality evaluation of the genome assembly using [QUAST](http://quast.sourceforge.net/quast.html) </br>
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/quast_report.png" width="1200" /> </br>
## 3. Prokaryotik genome annotation with [Prokka](https://github.com/tseemann/prokka) </br>
## 4a. Phylogenetic tree using [Roary](https://sanger-pathogens.github.io/Roary/) </br>
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/roary.png" />  </br>
## 4b. Phylogenetic tree using [MINTyper](https://cge.food.dtu.dk/services/MINTyper/) </br>
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/mintyper.png" />  </br>
## 4c. Phylogenetic tree using [CSI Phylogeny](https://cge.food.dtu.dk/services/CSIPhylogeny/) </br>
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/csi.png" />  </br>

All the trees are rooted, suggesting that all the samples have a common ancestor. </br>

## 5. Heatmap of SNPs [CSI Phylogeny](https://cge.food.dtu.dk/services/CSIPhylogeny/) </br>
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/SNP_Heatmap_year_sample.png" />  </br>

### 6. Contributions
Steven: QUAST, SPAdes, Prokka, Roary, MINTyper, CSI Phylogeny, FigTree </br>
Andrea: GitHub repo
