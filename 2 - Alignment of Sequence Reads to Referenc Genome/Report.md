## Trimming and Filtering
We used trimmed and untrimmed data for analysis in order to compare the effect of trimming on downstream analysis. Trimming was done with [Trimmomatric](http://www.usadellab.org/cms/?page=trimmomatic) using the parameter below 

```
HEADCROP:7 \
ILLUMINACLIP:/data/results/NEB_adapter.fasta:2:30:8 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:20:20 \
MINLEN:40
```

## Comparison of Trimmed and Untrimmed FASTQ Reports
## Indexing and Alignment
## Summary of Coverage Metrics
![Rplot02](https://user-images.githubusercontent.com/71617037/155406141-13dd3dcb-62ea-44b7-93c8-a50e985bd52b.png)
                                                                                                         Fig. 1




Table 1

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




![image](https://user-images.githubusercontent.com/71617037/155443485-8fe5adb7-fc4c-4654-96cb-4d1a44a03df7.png)


![image](https://user-images.githubusercontent.com/71617037/155406710-23a3c063-e8f1-4684-bf31-a6f4e55965e2.png)

