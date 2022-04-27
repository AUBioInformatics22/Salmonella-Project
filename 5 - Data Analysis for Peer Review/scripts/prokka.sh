#!/bin/sh
#Script for runing spades with user input
#### Make sure the --threads argument (-t) matches the number of CPUs requested

declare -a sample_list=("SRR10740748" "SRR10740747" "SRR10740746" "SRR10740745" "SRR10740744" "SRR10740743" "SRR10740742" "SRR10740741" "SRR10740740" "SRR10740739")
reference=/scratch/AU_BIOL_6960_Salmonella/spades_assembly/reference/

####   submit job to class queue as "this_script_name"   ####
####       request 4 CPU, and dmc as the cluster        ####
##########Setup Environment###########
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load anaconda/3-5.2.0

###Commands for user prompts when not utilizing queue system
#exit


######################################################################################
#Below is a queue option
prokka --prodigaltf ${reference}.fasta

    for sample in ${sample_list[@]}; do
            prokka ${sample}_contigs.fasta --genus Salmonella -o ${sample}_prokka
    done

exit
