#!/bin/sh
#Script for runing spades with user input
#### Make sure the --threads argument (-t) matches the number of CPUs requested

###List for Automated SPAdes assembly
#declare -a sample_list=("SRR10740748" "SRR10740747" "SRR10740746" "SRR10740745" "SRR10740744" "SRR10740743" "SRR10740742" "SRR10740741" "SRR10740740" "SRR10740739")


####   submit job to class queue as "this_script_name"   ####
####       request 16 CPU, and dmc as the cluster        ####
##########Setup Environment###########
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load spades/3.13.0


###Commands for user prompts when not utilizing queue system

###Define sample variable as SRR read for assembly
sample=SRR_read_number

	spades.py -o ./${sample}_spades_assembly -1 ${sample}_1.fastq.gz -2 ${sample}_2.fastq.gz -k 21,33,55,77 --careful -t 16



######################################################################################
#Below is a queue option


#Commands for Automated SPAdes assembly
#    for sample in ${sample_list[@]}; do
#            spades.py -o ./${sample}_spades_assembly -1 ${sample}_1.fastq.gz -2 ${sample}_2.fastq.gz -k 21,33,55,77 --careful -t 16
#    done
exit
