#!/bin/sh

# script to run UpSetR.sh on all three files for each sample

##############Make Sample List Array##
declare -a sample_list=("SRR10740739" "SRR10740740" "SRR10740741" "SRR10740742" "SRR10740743" "SRR10740744" "SRR10740745" "SRR10740746" "SRR10740747" "SRR10740748")

# make a new directory for each sample and copy the three SNPs files in there

for sample in ${sample_list[@]}; do
    mkdir $sample
    cp $sample.SNPs.vcf.gz $sample/$sample.SNPs.vcf.gz    
    cp $sample.SNPs.filtered.vcf.gz $sample/$sample.SNPs.filtered.vcf.gz
    cp $sample.SNPs.filtered.adjusted.vcf.gz $sample/$sample.SNPs.filtered.adjusted.vcf.gz
done

