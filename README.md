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

Table 1: Table showing the coverage of the untrimmed data after alignment 

| SRA_ID | Aligned_Coverage | Standard Deviation | Percent Mapped_flagstat | Raw_Coverage |
|--------| -----------------| -------------------| ----------------------- | -------------|
|SRR10740739| 98.03       |     40.70        |         95.49           | 5.21        |
|SRR10740740| 91.83      |      38.83        |         95.48           | 4.87        |
|SRR10740741| 78.22         |     31.83          |         95.42           | 4.15         |
|SRR10740742| 87.15 |       36.04 |         96.15| 4.60|
|SRR10740743| 85.42 | 35.90                  | 94.79 |         4.57 |
|SRR10740744| 91.48 | 38.42 | 95.43 | 4.85 |
|SRR10740745| 94.34|  40.32| 94.78 | 5.05 |
|SRR10740746| 87.40 | 37.70 | 92.99 | 4.97 |
|SRR10740747| 89.82 | 38.77| 95.34| 4.78|
|SRR10740748| 93.58| 40.49| 95.41| 4.97| <p>&nbsp;</p>  






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
