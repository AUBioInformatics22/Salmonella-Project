
# 5. Data Analysis for Peer Review

In order to generate phylogenetic trees, three approaches were taken. It was necessary for assembly of genomes for all three approaches. This was accomplished with [SPAdes](https://github.com/ablab/spades#sec1.2). A quality report of assemblies was generated with [QUAST](http://quast.sourceforge.net/quast.html). The first approach used [Prokka](https://github.com/tseemann/prokka) for genome annotation of fasta assemblies. Once this was completed, [Roary](https://sanger-pathogens.github.io/Roary/) used the annotated assemblies in gff format to build pan genomes, identifying the core and accessory genes. A Newick file is generated based on the presence and absence of genes in accessory genome. The second and third approach utilized two services found on the webpage for the [Center for Genomic Epidemiology](http://genomicepidemiology.org/). The tool [MINTyper](https://cge.food.dtu.dk/services/MINTyper/) used fasta assemblies to identify SNP differences between the isolates and perform hierarchical clustering using the Neighbor-Joining algorithm to generate Newick files. The third approach was with the tool [CSI Phylogeny](https://cge.food.dtu.dk/services/CSIPhylogeny/). CSI Phylogeny CSI Phylogeny calls SNPs, filters the SNPs, does site validation and infers a phylogeny based on the concatenated alignment of the high quality SNPs. A maximum likelihood tree is created from the alignment. [Mega](https://megasoftware.net/) was used to generate trees from Newick files from all three approaches. A heatmap of SNPs between isolates was generated in Excel from the SNP matrix file from CSI Phylogeny. </br>

## Steps
## 1. De novo sequencing with [SPAdes](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/scripts/spades.sh), which is designed to assemble small genomes from MDA single-cell and standard bacterial data sets. </br>
SPAdes assembly required troubleshooting. Assembly files behind the first assembly (SRR10740739) were not completed when utilizing a for, do, done loop in the script submitted to queue system. Each assembly had to be submitted individually. SRR10740739-SRR10740746 assemblies were completed without k-mer (-k option) being specified. SRR10740747 and SRR10740748 did not complete the output file contigs.fasta. After investigating the output, both contained empty directories for kmers 99 and 127. K-mer option -k 21,33,55,77 was used and resulted in the contigs.fasta file for both of these sequeunces.

## 2. Quality evaluation of the genome assembly using [QUAST](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/scripts/quast_ind.sh) </br>
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/quast_report.png" width="1200" /> </br>

## 3. Prokaryotic genome annotation with [Prokka](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/scripts/prokka.sh) </br>
Included in the [prokka.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/scripts/prokka.sh) script, Prodigal was used to generate a base reference genome for annotation from the Salmonella reference sequence. Prokka then utilizes prokaryotic genus genome databases (ie. Salmonella database) to annotate fasta files from SPAdes to produce .gff files. Roary must use .gff files produced from Prokka in order to perform pan genome analysis to output Newick file.

## 4a. Phylogenetic tree using [Roary](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/scripts/roary.sh) </br>
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/roary_mega.png" />  </br>
## 4b. Phylogenetic tree using [MINTyper](https://cge.food.dtu.dk/services/MINTyper/) </br>
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/mintyper_mega.png" />  </br>
## 4c. Phylogenetic tree using [CSI Phylogeny](https://cge.food.dtu.dk/services/CSIPhylogeny/) </br>
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/csi_mega.png" />  </br>

All the trees are rooted to SRR10740739, the oldest sample from a 2012 necropsy calf. </br>

## 5. Heatmaps of SNPs [CSI Phylogeny](https://cge.food.dtu.dk/services/CSIPhylogeny/) </br>
### 5a. Heatmap of SNPs sorted by year

<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/heatmap_by_year.png" width="1200" />  </br>

Interestingly, the highest number of SNPs (43) was found between samples collected just a year apart from each other. Also, samples collected in the same year and from units close to each other had as many as SNPs between them.</br>

### 5a. Heatmap of SNPs sorted by hospital section

<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/5%20-%20Data%20Analysis%20for%20Peer%20Review/Images/heatmap_by_unit.png" width="1200" />  </br>
## 6. Comparing SNP counts from the GATK and CSIPhylogeny
<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/e241f3acb27476a925fa0d2f1ab88494b20497b1/5%20%20Data%20Analysis%20for%20Peer%20Review/Images/SNPs_GATK_CSI.png" />

### 7. Contributions
Steven Kitchens: QUAST, SPAdes, Prokka, Roary, MINTyper, CSI Phylogeny, Mega, GitHub repository </br>
Andrea Pietruska: GitHub repository</br>
Stephen Tansie: GitHub repository
