<p align=center>
<img src="https://i.pinimg.com/originals/e4/d3/e2/e4d3e27b8738c7d3e9f650105b8bd851.jpg" width="350" />


<h1 align=center>Salmonella-Project</h>

# Meet THE TEAM
**Steven Kitchens**: PhD Candidate, Department of Pathobiology <br/>
**Chidozie Ugochuckwu**: PhD student, Department of Chemistry and Biochemistry <br/>
**Stephen Tansie**: PhD student, Department of Biological Sciences <br/>
**Andrea Pietruska**: PhD student, Department of Pathobiology <br/>

# Introduction

Veterinary teaching hospitals have many different species of animals in close proximity to one another. The environment can be a potential source and reservoir for the transmission of _Salmonella_ in a veterinary hospital. _Salmonella_ is the most commonly associated agent responsible for nosocomial outbreaks among veterinary teaching hospitals. A study of the Auburn University College of Veterinary Medicine (AUCVM) Veterinary Teaching Hospital was conducted to better understand the dynamics of _Salmonella_ in the environment and prevalence of _Salmonella_ within a multi-species animal facility. Additional studies were conducted to evaluate _Salmonella_ in the on-site dairy herd and among the environment of the Equine Reproduction Center. A total of 1395 samples were collected over the different surveillance projects. From those projects, ten samples were sent to the NVSL for WGS. It is important to determine whether these isolates are the same strain or derived from a common ancestor. This project’s aim is to develop a pipeline to process the raw WGS data from the NVSL. Other veterinary teaching hospitals can utilize this set of scripts and procedures for epidemiological studies using WGS data.

[Detailed Description of the project](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/project_proposal.md) </br>


# Aim

The general aim of this project is to develop a pipeline for veterinary teaching hospitals to use to process raw whole genome sequence data for epidemiological studies. The specific aim for this project is to determine the genetic variability among isolates from these ten samples.

# Samples
The samples were collected from dairy herd, equine barns, food animal barn, dairy barn and equine reproduction center at the Auburn University College of Veterinary Medicine over a seven-year period. 
Table 1: Table showing details of our samples. The sequence data comprised demultiplexed paired end reads of 10 samples of _Salmonella muenster_ sequenced on 1 ILLUMINA ([Illumina MiSeq](https://www.illumina.com/systems/sequencing-platforms/miseq.html)) platform. The raw sequences were not trimmed. Reference Genome (_Salmonella enterica_) size was 4707217


| SRA_ID    |NCBI Coverage|Average Read Length  |Number of Reads  |Sample source| Year Sample Collected |
|-----------| ------------|---------------------|-----------------|-------------|-----------------------|
|SRR10740739| 99.4        |  222                |   1053590       |Necropsy Calf|                   2012|     
|SRR10740740| 92.8        |  216                |   1042044       |Calf Feces   |                   2017|
|SRR10740741| 79.3        |  225                |   999592        |Cow Feces    |                   2016| 
|SRR10740742| 88          |  225                |   1051202       |Drain Swab   |                   2019|
|SRR10740743| 86.4        |  225                |   1015015       |Water on Dairy Road|             2016|
|SRR10740744| 92.4        |  225                |   955320        |Water Sample in Equine Barn|     2016|
|SRR10740745| 95.3        |  224                |   962288        |Water Sample in Equine Barn|     2015|
|SRR10740746| 91.6        |  223                |   876854        |Water Sample in Dairy Barn |     2015|
|SRR10740747| 90.4        |  223                |   1027813       |Water Sample in Food Animal Barn|2014|
|SRR10740748| 94.5        |  228                |   1076023       |Hay Sample in Equine Barn|      2014 |<p>&nbsp;</p>  

The following image shows the different locations at the College of Vetereinary Medicine where samples were collected:

<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/Images/Sample%20Locations.png" />

# Workflow

<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/Images/Workflow.png" />

## [1. Initial Quality Assessment of Raw NGS Data](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data)<br/>
The raw data was downloaded from the NCBI website with the [SRA toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc). We used the command line and [Galaxy web tool](https://usegalaxy.org/) to assess the quality of our reads. The bar graph for the sequence coverage was plotted in R. 

## [2. Alignment of Seqence Reads to Reference Genome](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/2%20-%20Alignment%20of%20Sequence%20Reads%20to%20Referenc%20Genome)

Here, we used [BWA](https://gitlab.citius.usc.es/github/bigbwa) and [samtools](http://www.htslib.org) to index our reference genome and [BWA-MEM](http://bio-bwa.sourceforge.net/bwa.shtml) to align our sequence reads to the reference genome.<br/> 
<br/>

## [3. Post Alignment Processing](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/3%20-%20Post-alignment%20processing)<br/>
Here, we used [GATK](https://gatk.broadinstitute.org/hc/en-us) to mark duplictates. After that we used [Samtools flagstat](http://www.htslib.org/doc/samtools-flagstat.html) to sort and index the duplicated reads. We then used the [Integrated Genomics Viewer (IGV)](https://igv.org) to graphically view the outputs before and after marking the duplicates.<br/>

## [4. Variant Discovery](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/4%20-%20Variant%20Discovery)<br/>
Here, we used [GATK tools](https://gatk.broadinstitute.org/hc/en-us), [vcftools](https://vcftools.github.io), and [samtools](http://www.htslib.org) to call and filter variants, and then obtained the depth of each sample before and after adjustment.<br/> 

## [5. Data Analysis for Peer Review](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/5%20-%20Data%20Analysis%20for%20Peer%20Review)<br/>
Here, we used [SPAdes](https://github.com/ablab/spades#sec1.2) to assemble the genomes, [QUAST](http://quast.sourceforge.net/quast.html) for quality evaluation, and then [Prokka](https://github.com/tseemann/prokka) to annotate these genome assemblies. [Roary](https://sanger-pathogens.github.io/Roary/), [MINTyper](https://cge.food.dtu.dk/services/MINTyper/), and [CSI Phylogeny](https://cge.food.dtu.dk/services/CSIPhylogeny/) were used to generate Newick files. Phylogenetic trees were created by [Mega](https://megasoftware.net) for each approach.<br/>

## [6. Conclusion](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/6%20-%20Conclusion)<br/>
Our main objective for this study was to determine whether our samples were the same strain or from a common ancestor. Our phylogenetic trees show that they were from a common ancestor. Further, as we set out to achieve, we believe that our methodology can serve as a basic pipeline that veterinary teaching hospitals can use to process raw WGS data in order to make epidemiologic conclusions.</br>

## 7. Contribution
Steven Kitchens: Project proposal, aim, samples, workflow, GitHub repository </br>
Andrea Pietruska: GitHub repository </br>
Stephen Tansie: GitHub repository
