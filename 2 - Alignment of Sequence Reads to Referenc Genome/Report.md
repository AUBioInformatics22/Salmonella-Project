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
--------- ------------------ -------------------- ------------------------- -------------
![image](https://user-images.githubusercontent.com/71617037/155406710-23a3c063-e8f1-4684-bf31-a6f4e55965e2.png)

