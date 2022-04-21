<p align=center>
<img src="https://i.pinimg.com/originals/e4/d3/e2/e4d3e27b8738c7d3e9f650105b8bd851.jpg" width="350" />


<h1 align=center>Salmonella-Project</h>

### Meet THE TEAM
Steven Kitchens <br/>
Chidozie Ugochuckwu <br/>
Stephen Tansie <br/>
Andrea Pietruska <br/>

### 1. Introduction

[Description of the project](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/project_proposal.md)

### 2. Aim

The general aim of this project is to develop a pipeline for veterinary teaching hospitals to use to process raw whole genome sequence data for epidemiological studies. The specific aim for this project is to determine the genetic variability among isolates from these ten samples.

### 3. Samples
The samples were collected from dairy herd, equine barns, food animal barn, dairy barn and equine reproduction center at the Auburn University College of Veterinary Medicine over a seven-year period. 
Table 1: Table showing details of our samples. The sequence data comprised demultiplexed paired end reads of 10 samples of _Salmonella muenster_ sequenced on 1 ILLUMINA (Illumina MiSeq) platform. The raw sequences were not trimmed. Reference Genome (_Salmonella enterica_) size was 4707217


| SRA_ID    |NCBI Coverage| Average Read Length | Number of Reads |Sample source|
|-----------| ------------|---------------------|-----------------|-------------|
|SRR10740739| 99.4        |  228                |   1053590       |Necropsy Calf|
|SRR10740740| 92.8        |  223                |   1042044       |Calf Feces   |
|SRR10740741| 79.3        |  223                |   999592        |Cow Feces    | 
|SRR10740742| 88          |  225                |   1051202       |Drain Swab   |
|SRR10740743| 86.4        |  225                |   1015015       |Water on Dairy Road|
|SRR10740744| 92.4        |  225                |   955320        |Water Sample in Equine Barn|
|SRR10740745| 95.3        |  226                |   962288        |Water Sample in Equine Barn|
|SRR10740746| 91.6        |  222                |   876854        |Water Sample in Dairy Barn|
|SRR10740747| 90.4        |  216                |   1027813       |Water Sample in Food Animal Barn|
|SRR10740748| 94.5        |  222                |   1076023       |Hay Sample in Equine Barn| <p>&nbsp;</p>  






### 4. Quality Assessment
* Commandline FASTQ analysis <br/>
[FASTQ Reports](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/fastqc_reports) <br/>
[Script for SRA-tool fastdump](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/sra_fastqdump_fastqc.sh)
* Galaxy FASTQ analysis
* Data presentation and report <br/>
[R Script for Data Presentation](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/Report_1.R) <br/>
[Quality Report](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/Quality_Report.md)


### 5. Pre-processing

Trimming <br/>
Truncating <br/>
Filtering <br/>
