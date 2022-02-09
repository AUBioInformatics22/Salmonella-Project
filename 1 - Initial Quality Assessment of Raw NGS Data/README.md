# 1. Initial Quality Assessment of Raw NGS Data
### 1. Commandline FASTQ analysis
Steven Kitchens <br/>
[FASTQ Reports](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/fastqc_reports) <br/>
[Script for SRA-tool fastdump](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/sra_fastqdump_fastqc.sh)
### 2. Galaxy FASTQ analysis
Chidozie Ugochukwu
### 3. Data presentation and report
Stephen Tansie <br/>
[R Script for Data Presentaion](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/1%20-%20Initial%20Quality%20Assessment%20of%20Raw%20NGS%20Data/Report_1.R) <br/>
[Quality Report]

The goal of this step was to assess the quality of our data using both command line and web-based tools. After downloading data from NCBI (using the sra_fastqdump_fastqc.sh script), we assessed their quality using Galaxy (https://usegalaxy.org/) and on the command line using the Alabama Supercomputer.  Below are representative graphs generated from using both approaches for quality assessment. Ten sequences (SRS5863182, SRS5863183, SRS5863184, SRS5863185, SRS5863186, SRS5863187, SRS5863188, SRS5863189, SRS5863190 and SRS5863191) of paired end whole genome sequences of Salmonella enterica serotype Muenster were analyzed but results are hereby presented for both the forward and reverse reads of the SRS5863191 sequence. 

Per Base Sequence Quality

Below are graphs showing the quality of bases in each sequence read

Forward Read

Graph for Galaxy Assessment
<p align="center">
<img src="1.jpg" width="700" height="400" />
</p>
Fig.1

Graph for Command line Assessment
<p align="center">
<img src="2.jpg" width="700" height="400" />
</p>
Fig.2

Reverse Read

Graph for Galaxy Assessment
<p align="center">
<img src="3.jpg" width="700" height="400" />
</p>
Fig.3

Graph for Command line Assessment
<p align="center">
<img src="4.jpg" width="700" height="400" />
</p>
Fig.4

The results above suggest that the command line analysis trimmed off the last ten poor quality sequences. While this may improve the quality of sequences, vital data may also be lost, coupled with the fact that the benefit of trimming may not be significant. The quality scores for all our sequences look very similar to the above results. However, the command line FASTQ analysis was faster, and the results were readily available, compared to the Galaxy assessment which took longer to download the data. We decided not to trim because the graphs suggest that the average quality score falls largely in the “green” quality score range, suggesting that our sequences are of high quality.




Per Sequence Quality Scores
Forward Read

Graph for Galaxy Assessment
<p align="center">
<img src="5.jpg" width="700" height="400" />
</p>
Fig.5

Graph for Command line Assessment
<p align="center">
<img src="6.jpg" width="700" height="400" />
</p>
Fig.6

Reverse Read

Graph for Galaxy Assessment

<p align="center">
<img src="7.jpg" width="700" height="400" />
</p>  
Fig. 7  







Graph for Command line Assessment
<p align="center">
<img src="8.jpg" width="700" height="400" />
</p> 
Fig. 8

Fig 4 to 8 show that the results generated from both Galaxy and Command quality assessment are the same. The sequences (especially of the forward read) are of high quality. As a result, we intend to use the forward reads for downstream analysis.


Sequence Coverage
<p align="center">
<img src="Coverage.jpg" width="700" height="400" />
</p>

Panel B shows the coverage of the individual sequences in our data set. Panel A of Fig 5 shows that the average coverage for all sequences is 4.8X. which is high.
<p align="center">
<img src="Calculations.png" width="700" height="400" />
</p>

Team Members:
Steven Kitchens: Command line FASTQ Analysis

Chidozie Ugochukwu: Galaxy FASTQ Analysis

Stephen Tansie: Data Presentation and Report

Andrea Pietruska: GitHub Repository
