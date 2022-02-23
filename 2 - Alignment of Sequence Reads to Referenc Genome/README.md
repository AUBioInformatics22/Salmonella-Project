# 2. Alignment of Seqence Reads to Reference Genome
## 1. Trimming and filtering
######  Andrea Pietruska
[Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic) <br/>
```
HEADCROP:7 \
ILLUMINACLIP:/data/results/NEB_adapter.fasta:2:30:8 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:20:20 \
MINLEN:40
```
script: [trimmomatic.sh](
## 2. Comparison of FASTQC Reports
######  Steven Kitchens
## 3. Indexing and Alignment
######  Steven Kitchens
## 4. Coverage metrics, metrics summary
######  Chidozie Ugochukwu
## 5. GitHub Repository
######  Stephen Tansie
