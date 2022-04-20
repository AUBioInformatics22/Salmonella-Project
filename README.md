<p align=center>
<img src="https://i.pinimg.com/originals/e4/d3/e2/e4d3e27b8738c7d3e9f650105b8bd851.jpg" width="350" />


<h1 align=center>Salmonella-Project</h>

### Meet THE TEAM
Steven Kitchens <br/>
Chidozie Ugochuckwu <br/>
Stephen Tansie <br/>
Andrea Pietruska <br/>

### 1. Introduction

[Description of the project](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/project_proposal.txt)

### 2. Aim

Let's save the chicken world!

### 3. Samples

fastq of 10 samples <br/>
demultiplexed paired-end reads <br/>
Primer, primer sequences <br/>
linker or no linker, barcode whatever <br/>

Table 1: Table showing details of our samples. The sequence data comprised paired end reads of 10 samples of _Salmonella muenster_ sequenced on 1 ILLUMINA (Illumina MiSeq) platform. Sequences were not trimmed. Reference Genome (_Salmonella enterica_) size was 4707217


| SRA_ID |NCBI Coverage  | Average Read Length | Number of Reads |
|--------| --------------|---------------------|-----------------|
|SRR10740739| 99.4       |     40.70        |         95.49           | 5.21        |
|SRR10740740| 92.8      |      38.83        |         95.48           | 4.87        |
|SRR10740741| 79.3         |     31.83          |         95.42           | 4.15         |
|SRR10740742| 88 |       36.04 |         96.15| 4.60|
|SRR10740743| 86.4 | 35.90                  | 94.79 |         4.57 |
|SRR10740744| 92.4 | 38.42 | 95.43 | 4.85 |
|SRR10740745| 95.3|  40.32| 94.78 | 5.05 |
|SRR10740746| 91.6 | 37.70 | 92.99 | 4.97 |
|SRR10740747| 90.4 | 38.77| 95.34| 4.78|
|SRR10740748| 94.5| 40.49| 95.41| 4.97| <p>&nbsp;</p>  






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
