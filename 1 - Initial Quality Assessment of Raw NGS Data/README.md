# 1. Quality Assessment of Raw NGS Data

## 1. Quality assessment
We assessed the quality of our data using both the command line the [Galaxy web tool](https://usegalaxy.org/) to see whether they will give different quality reports <br/>

### a. Download raw data and command line FASTQ analysis
The script [sra_fastqdump_fastqc.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/Scripts/sra_fastqdump_fastqc.sh) uses the [SRA toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc) to download the files from the NCBI database ([PRJNA548885](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA548885/)). In a second step the script assesses the quality of our reads and produces [FASTQ Reports](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/fastqc_reports) as output. <br/>

### b. Galaxy FASTQ analysis
We also assessed the quality of our reads using the Galaxy web tool <br/>

## 2. Data presentation and quality report
Please find below a link to the script that was used to present our data. <br/>
[R Script for Data Presentation](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/Scripts/Report_1.R) <br/>


### Quality report

The goal of this step was to assess the quality of our data using both command line and web-based tools. After downloading data from NCBI (using the [sra_fastqdump_fastqc.sh script](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/Scripts/sra_fastqdump_fastqc.sh)), we assessed their quality using [Galaxy](https://usegalaxy.org/) and on the command line using the [Alabama Supercomputer](https://www.asc.edu).  Below are representative graphs generated from using both approaches for quality assessment. Ten (10) of paired-end whole genome sequences (SRS5863182, SRS5863183, SRS5863184, SRS5863185, SRS5863186, SRS5863187, SRS5863188, SRS5863189, SRS5863190 and SRS5863191) of _Salmonella enterica serotype Muenster_ were analyzed but results are hereby presented for both the forward and reverse reads of the SRS5863191 sequence.  

_Per Base Sequence Quality_</br>
Below are representative graphs showing the quality of the forward and reverse sequences

_Forward Read_</br>
Graph for Galaxy Assessment
<p align="center">
<img src="Quality Report Figures/1.jpg" width="700" height="400" />
</p>
Fig.1

Graph for Command line Assessment
<p align="center">
<img src="Quality Report Figures/2.jpg" width="700" height="400" />
</p>
Fig.2

_Reverse Read_</br>
Graph for Galaxy Assessment
<p align="center">
<img src="Quality Report Figures/3.jpg" width="700" height="400" />
</p>
Fig.3

Graph for Command line Assessment
<p align="center">
<img src="Quality Report Figures/4.jpg" width="700" height="400" />
</p>
Fig.4

The results above suggest that the command line analysis trimmed off the last ten poor quality bases. While this may improve the quality of sequences, vital data may also be lost, coupled with the fact that the benefit of trimming may not be significant. The quality scores for all our sequences look very similar to thosenpresented here. However, the command line FASTQ analysis was faster, and the results were readily available, compared to the Galaxy assessment where it took longer to download the results data. We decided not to trim because the graphs suggest that the average quality score falls largely in the “green” quality score range, suggesting that our sequences are of high quality.

_Per Sequence Quality Scores_</br>
Forward Read

Graph for Galaxy Assessment
<p align="center">
<img src="Quality Report Figures/5.jpg" width="700" height="400" />
</p>
Fig.5

Graph for Command line Assessment
<p align="center">
<img src="Quality Report Figures/6.jpg" width="700" height="400" />
</p>
Fig.6

Reverse Read
Graph for Galaxy Assessment

<p align="center">
<img src="Quality Report Figures/7.jpg" width="700" height="400" />
</p>  
Fig. 7  


Graph for Command line Assessment
<p align="center">
<img src="Quality Report Figures/8.jpg" width="700" height="400" />
</p> 
Fig. 8

Fig 4 to 8 show that the results generated from both Galaxy and Command quality assessment are the same. The sequences (especially of the forward read) are of high quality. As a result, we intend to use the forward reads for downstream analysis.


Sequence Coverage
<p align="center">
<img src="Quality Report Figures/Coverage.jpg" width="700" height="400" />
</p>

Panel B shows the coverage of the individual sequences in our data set. Panel A of Fig 8 shows that the average coverage for all sequences is 4.8X. which is high.

| SRA_ID    |Layout       |Average Read Length  |Number of Reads  |Calculated Coverage|
|-----------| ------------|---------------------|-----------------|-------------------|
|SRR10740739| Paired      |  222                |   1053590       |4.97               |     
|SRR10740740| Paired      |  216                |   1042044       |4.78               |
|SRR10740741| Paired      |  225                |   999592        |4.97               | 
|SRR10740742| Paired      |  225                |   1051202       |5.05               |
|SRR10740743| Paired      |  225                |   1015015       |4.85               |
|SRR10740744| Paired      |  225                |   955320        |4.57               | 
|SRR10740745| Paired      |  224                |   962288        |4.60               |   
|SRR10740746| Paired      |  223                |   876854        |4.15               |     
|SRR10740747| Paired      |  223                |   1027813       |4.87               |
|SRR10740748| Paired      |  228                |   1076023       |5.21               | 
|Average Coverage| = 4.80 |



## 3. Contributions
Steven: Commandline FASTQ analysis </br>
Stephen: Data presentation, quality report </br>
Chidozie: Galaxy FASTQ analysis </br>
Andrea: GitHub repository
