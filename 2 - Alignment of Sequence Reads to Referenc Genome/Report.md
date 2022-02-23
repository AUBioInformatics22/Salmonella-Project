# Trimming and Filtering
We used trimmed and untrimmed data for analysis in order to compare the effect of trimming on downstream analysis. Trimming was done with [Trimmomatric](http://www.usadellab.org/cms/?page=trimmomatic) using the parameter below 

HEADCROP:7 \
ILLUMINACLIP:/data/results/NEB_adapter.fasta:2:30:8 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:20:20 \
MINLEN:40.
