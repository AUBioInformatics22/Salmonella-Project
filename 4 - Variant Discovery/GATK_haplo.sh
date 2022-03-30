#!/bin/bash

######IMPORTANT: Carefully read the hpcdocs entry for GATK4: https://hpcdocs.asc.edu/content/gatk-0

#first, configure your environment to run GATK
#run this command outside the script and logout then back in again:
#conda init bash

##############Make Sample List Array##
declare -a sample_list=("SRR10740739" "SRR10740740" "SRR10740741" "SRR10740742" "SRR10740743" "SRR10
740744" "SRR10740745" "SRR10740746" "SRR10740747" "SRR10740748")

#load modules needed for this job
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load gatk/4.1.4.0
source activate gatk

###VARIABLES######
ref="salmonella.fasta"
bam="mark.sorted.bam"


#### COMMAND LINE FOR GATK BELOW ####

for sample in ${sample_list[@]}; do

#Build Bam Index
#gatk --java-options "-Xmx1G" BuildBamIndex -I $sample.$bam -R $ref

#Short Variant Discovery; this step can be multithreaded if you request more cores (try 4 first, then up to 8 if needed)
	gatk --java-options "-Xmx4G" HaplotypeCaller -R $ref -I $sample.$bam --sample-ploidy 1 -O $sample.g.vcf.gz -ERC GVCF

done
