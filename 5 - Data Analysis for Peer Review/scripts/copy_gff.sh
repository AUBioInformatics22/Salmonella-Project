#!/bin/bash

#variables
declare -a sample_list=("SRR10740748" "SRR10740747" "SRR10740746" "SRR10740745" "SRR10740744" "SRR10740743" "SRR10740742" "SRR10740741" "SRR10740740" "SRR10740739")

dir=roary_gff_files

##################################

#Commands to make a directory and move files to new directory

mkdir ./${dir}
        for sample in ${sample_list[@]}; do
             cp ./${sample}_prokka/*.gff ./${dir}/${sample}_prokka.gff
        done
exit
