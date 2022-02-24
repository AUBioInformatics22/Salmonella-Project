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




 Fig. 1: This shows the aligned coverage of the samples with reference to the reference genome. 



  
  
  


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
|SRR10740748| 93.58| 40.49| 95.41| 4.97|. <br />-   
<br />-  




Table 1 above shows the aligned coverage and percent mapped of the trimmed data of our samples.

We also compared the results of both trimmed and untrimmed data. The results show that
