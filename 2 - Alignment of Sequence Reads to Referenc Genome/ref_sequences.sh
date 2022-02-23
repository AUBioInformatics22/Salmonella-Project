#!/bin/bash

#This script will be used to download raw read data from the sequence read archive (SRA in NCBI) using SRR numbers availible for each sample.
#This requires use of SRA Toolkit on the ASC.
#
##########Queue Information Based on SampleTest Data###########
#Core=1 Mem=1gb (efficiency a for test_sample1 was 0.49% at 2gb) Wall time=Default (runtime for test_sample1 was 7 minutes)
##########Make Sample List Array##########
declare -a sample_list=("SRR10740748" "SRR10740747" "SRR10740746" "SRR10740745" "SRR10740744" "SRR10740743" "SRR10740742" "SRR10740741" "SRR10740740" "SRR10740739")
##########Variables########################
sequence=GCA_001246125.1_Salmonella_enterica_CVM_N51250_v1.0

#
#############Setup Environment#############
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load sra
vdb-config --interactive
#
#################Commands##################

#
##########Download Reference Genome########
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/001/246/125/${sequence}/${sequence}_genomic.fna.gz
gunzip ${sequence}_genomic.fna.gz
mv ${sequence}_genomic.fna salmonella.fasta #Re-name reference sequence to salmonella.fasta

#
##Download Sequences Listed in List Array##
###############FastQ_Dump##################
        for sample in ${sample_list[@]}; do
            fastq-dump --split-files --gzip $sample #Uses fastq-dump to retrieve raw read fastq files and split them based on paired-end data in compressed formats.
        done 
exit
