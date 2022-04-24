#!/usr/bin/env sh

###ASC QUEUE INFO###
#edit your .asc_queue file to the following parameters
#use the class queue
#memory_pref=150mb
#cpu_time_pref=01:00:00
#num_cpus_pref=1
##############


#####################################################################################
##modules
module load anaconda/3-2019.07
module load R/3.3.3
#####################################################################################

#####################################################################################
##variables
#copy this file over from Sample_NGS_Workflow folder
vcf=SRR10740742.SNPs.filtered.vcf
#####################################################################################

#####################################################################################
##commands

#unzip the file!
gunzip ${vcf}.gz

#convert VCF files to table format
python vcf2table.py ${vcf} ${vcf}_table

##plot SNPs 
./plotvcftable.R -I ${vcf}_table -O ${vcf}_initial.pdf

## aaaaand zip it!
gzip ${vcf}
#####################################################################################
