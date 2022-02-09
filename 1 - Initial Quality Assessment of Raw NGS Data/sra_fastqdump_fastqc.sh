ls#!/bin/bash

#This script will be used to download raw read data from the sequence read archive (SRA in NCBI) using SRR numbers availible for each sample.
#This requires use of SRA Toolkit on the ASC.
#
##########Queue Information Based on SampleTest Data###########
#Core=1 Mem=1gb (efficiency a for test_sample1 was 0.49% at 2gb) Wall time=Default (runtime for test_sample1 was 7 minutes)
##########Make Sample List Array##
declare -a sample_list=("SRR10740748" "SRR10740747" "SRR10740746" "SRR10740745" "SRR10740744" "SRR10740743" "SRR10740742" "SRR10740741" "SRR10740740" "SRR10740739")

##########Variables###############
#sample_list= assigned earlier by array in above script
#test_sample1=SRR10740748
##################################
#
##########Setup Environment#######
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load sra
vdb-config --interactive
module load fastqc/0.10.1
#
##########Commands################

#
##########FastQ_Dump##############
#path=/scratch/AU_BIOL_6860_Salmonella/genomes/
mkdir ./results_fastqdump_fastqc
path=./results_fastqdump_fastqc/
        for sample in ${sample_list[@]}; do
            fastq-dump --outdir $path --split-files --gzip $sample #Uses fastq-dump to retrieve raw read fastq files and split them based on paired-end data in compressed formats.
        done
#
##########FastQC####################

file=${path}*.fastq.gz
	for file in $file; do
	    fastqc $file --extract --outdir=${path}
	done

#
##########Clean-up_folders##########
            mkdir ${path}fastq_files
            mkdir ${path}fastqc_reports
            mv ${path}*.gz ${path}fastq_files/
            mv ${path}*_?_.fastqc* ${path}fastqc_reports/
 
exit
