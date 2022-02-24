## Trimming and Filtering
We used trimmed and untrimmed data for analysis in order to compare the effect of trimming on downstream analysis. Trimming was done with [Trimmomatric](http://www.usadellab.org/cms/?page=trimmomatic) using the parameters below 

```
HEADCROP:7 \
ILLUMINACLIP:/data/results/NEB_adapter.fasta:2:30:8 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:20:20 \
MINLEN:40
```



## Indexing and Alignment
The reference genome (_Salmonella enterica_) was indexed and sequence reads of both trimmed and untrimmed data were aligned to it using the [2_alignment.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/2%20-%20Alignment%20of%20Sequence%20Reads%20to%20Referenc%20Genome/2_alignment.sh) script.




## Summary of Coverage Metrics
![Rplot02](https://user-images.githubusercontent.com/71617037/155406141-13dd3dcb-62ea-44b7-93c8-a50e985bd52b.png)



Fig. 1: This shows the aligned coverage of the samples with reference to the reference genome <p>&nbsp;</p>



  
  
  


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



Table 1 above shows the aligned coverage and percent mapped of the untrimmed data of our samples <p>&nbsp;</p>






Table 2: Table showing the coverage of the trimmed data after alignment 

| SRA_ID | Aligned_Coverage | Standard Deviation | Percent Mapped_flagstat | Raw_Coverage |
|--------| -----------------| -------------------| ----------------------- | -------------|
|SRR10740739| 91.15       |     38.62        |         95.56           | 5.21        |
|SRR10740740| 39.11      |      17.63        |         95.57           | 4.87        |
|SRR10740741| 72.77         |     30.27          |         95.51           | 4.15         |
|SRR10740742| 82.01 |       34.64 |         96.24| 4.60|
|SRR10740743| 80.29 | 34.43                  | 94.86 |         4.57 |
|SRR10740744| 86.07 | 36.90 | 95.51 | 4.85 |
|SRR10740745| 88.70|  98.68| 34.87 | 5.05 |
|SRR10740746| 80.58 | 35.54 | 93.07 | 4.97 |
|SRR10740747| 83.44 | 36.75| 95.52| 4.78|
|SRR10740748| 87.15| 38.47| 95.54| 4.97|  <p>&nbsp;</p>







Table 2 above shows the aligned coverage and percent mapped of the trimmed data of our samples<p>&nbsp;</p>




From Table 2, it evident that trimming reduced percent mapping. Depending on the goals of the experiment, such as differential expression using RNA-seq data, trimming may not be necessary when using modern aligners, because good reads could potentially be lost. Modern aligners such as BWA-MEM and HISAT2 will "soft-clip" non-matching sequences. 
