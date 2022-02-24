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
script: [trimmomatic.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/2%20-%20Alignment%20of%20Sequence%20Reads%20to%20Referenc%20Genome/trimmomatic.sh)
## 2. Indexing and Alignment
######  Steven Kitchens
## 3. Coverage metrics, metrics summary
######  Chidozie Ugochukwu
## 4. GitHub Repository
######  Stephen Tansie
