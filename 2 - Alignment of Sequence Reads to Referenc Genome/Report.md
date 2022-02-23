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
## Coverage Metrics, metric summary
![Rplot02](https://user-images.githubusercontent.com/71617037/155406141-13dd3dcb-62ea-44b7-93c8-a50e985bd52b.png)



SRA_ID	Aligned_Coverage	SD	%Mapped_flagstat	Raw_coverage
SRR10740739	98.0275	40.7035q	95.49	5.211887194
SRR10740740	91.8267	38.8267	95.48	4.869201059
SRR10740741	78.22228	31.8326	95.42	4.154042187
SRR10740742	87.1463	36.0414	96.15	4.599644546
SRR10740743	85.4172	35.9038	94.79	4.566328682
SRR10740744	91.4764	38.4173	95.43	4.851688376
SRR10740745	94.3406	40.3233	94.78	5.047004631
SRR10740746	87.3954	37.6939	92.99	4.968901582
SRR10740747	89.8188	38.7707	95.34	4.781653363
SRR10740748	93.5813	40.4887	95.41	4.968901582
![image](https://user-images.githubusercontent.com/71617037/155406710-23a3c063-e8f1-4684-bf31-a6f4e55965e2.png)

