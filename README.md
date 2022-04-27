<p align=center>
<img src="https://i.pinimg.com/originals/e4/d3/e2/e4d3e27b8738c7d3e9f650105b8bd851.jpg" width="350" />


<h1 align=center>Salmonella-Project</h>

### Meet THE TEAM
Steven Kitchens <br/>
Chidozie Ugochuckwu <br/>
Stephen Tansie <br/>
Andrea Pietruska <br/>

# Introduction

Veterinary teaching hospitals have many different species of animals in close proximity to one another. The environment can be a potential source and reservoir for the transmission of _Salmonella_ in a veterinary hospital. _Salmonella_ is the most commonly associated agent responsible for nosocomial outbreaks among veterinary teaching hospitals. A study of the Auburn University College of Veterinary Medicine (AUCVM) Veterinary Teaching Hospital was conducted to better understand the dynamics of _Salmonella_ in the environment and prevalence of _Salmonella_ within a multi-species animal facility. Additional studies were conducted to evaluate _Salmonella_ in the on-site dairy herd and among the environment of the Equine Reproduction Center. A total of 1395 samples were collected over the different surveillance projects. From those projects, ten samples were sent to the NVSL for WGS. It is important to determine whether these isolates are the same strain or derived from a common ancestor. This project’s aim is to develop a pipeline to process the raw WGS data from the NVSL. Other veterinary teaching hospitals can utilize this set of scripts and procedures for epidemiological studies using WGS data.

[Detailed Description of the project](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/project_proposal.md) </br>


# Aim

The general aim of this project is to develop a pipeline for veterinary teaching hospitals to use to process raw whole genome sequence data for epidemiological studies. The specific aim for this project is to determine the genetic variability among isolates from these ten samples.

# Samples
The samples were collected from dairy herd, equine barns, food animal barn, dairy barn and equine reproduction center at the Auburn University College of Veterinary Medicine over a seven-year period. 
Table 1: Table showing details of our samples. The sequence data comprised demultiplexed paired end reads of 10 samples of _Salmonella muenster_ sequenced on 1 ILLUMINA (Illumina MiSeq) platform. The raw sequences were not trimmed. Reference Genome (_Salmonella enterica_) size was 4707217


| SRA_ID    |NCBI Coverage|Average Read Length  |Number of Reads  |Sample source| Year Sample Collected |
|-----------| ------------|---------------------|-----------------|-------------|-----------------------|
|SRR10740739| 99.4        |  228                |   1053590       |Necropsy Calf|                   2012|     
|SRR10740740| 92.8        |  223                |   1042044       |Calf Feces   |                   2017|
|SRR10740741| 79.3        |  223                |   999592        |Cow Feces    |                   2016| 
|SRR10740742| 88          |  225                |   1051202       |Drain Swab   |                   2019|
|SRR10740743| 86.4        |  225                |   1015015       |Water on Dairy Road|             2016|
|SRR10740744| 92.4        |  225                |   955320        |Water Sample in Equine Barn|     2016|
|SRR10740745| 95.3        |  226                |   962288        |Water Sample in Equine Barn|     2015|
|SRR10740746| 91.6        |  222                |   876854        |Water Sample in Dairy Barn |     2015|
|SRR10740747| 90.4        |  216                |   1027813       |Water Sample in Food Animal Barn|2014|
|SRR10740748| 94.5        |  222                |   1076023       |Hay Sample in Equine Barn|      2014 |<p>&nbsp;</p>  

The following image shows the different locations at the College of Vetereinary Medicine where samples were collected:

<img src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/Images/Sample%20Locations.png" />

# Workflow

**HERE picture of the workflow**

### [1. Initial Quality Assessment of Raw NGS Data](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data) 
* Commandline FASTQ analysis <br/>
[FASTQ Reports](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/fastqc_reports) <br/>
[Script for SRA-tool fastdump](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/sra_fastqdump_fastqc.sh)
* Galaxy FASTQ analysis
* Data presentation and report <br/>
[R Script for Data Presentation](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/Report_1.R) <br/>
[Quality Report](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/Quality_Report.md)


### [2. Alignment of Seqence Reads to Reference Genome](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/2%20-%20Alignment%20of%20Sequence%20Reads%20to%20Referenc%20Genome)

Trimming <br/>
Truncating <br/>
Filtering <br/>

### [3. Post Alignment Processing](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/3%20-%20Post-alignment%20processing)
### [4. Variant Discovery](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/4%20-%20Variant%20Discovery)
### [5. Data Analysis for Peer Review](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/5%20-%20Data%20Analysis%20for%20Peer%20Review)
### [6. Conclusion](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/6%20-%20Conclusion)
### 7. Contribution
Steven Kitchens: Project proposal, aim, samples, workflow, GitHub Repository </br>
Andrea Pietruska: GitHub Repository </br>
Stephen Tansie: GitHub Repository
