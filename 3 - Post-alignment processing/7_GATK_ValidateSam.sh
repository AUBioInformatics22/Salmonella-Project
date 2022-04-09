#!/bin/sh

#use this script to troubleshoot any issues you may be having. It will basically run a validation of your input bam files
#if you are getting errors, this should help you figure out what files are problematic or what steps in your pipeline.

#load modules needed for this job
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load gatk/4.1.0.0
source activate gatk

###VARIABLES######
declare -a sample_list=("SRR10740739" "SRR10740740" "SRR10740741" "SRR10740742" "SRR10740743" "SRR10740744" "SRR10740745" "SRR10740746" "SRR10740747" "SRR10740748")

bam="merged.sorted.bam"
ref="salmonella.fasta"
#####

for sample in ${sample_list[@]}; do

#### COMMAND LINE FOR GATK BELOW ####
gatk --java-options "-Xmx1G" ValidateSamFile -I $sample.$bam -R $ref -O Sam_Validation.$sample.txt

done
