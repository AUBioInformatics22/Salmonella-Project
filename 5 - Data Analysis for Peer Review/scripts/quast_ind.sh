#!/bin/bash

#basename -s _spades_assembly *_spades_assembly > sequences_quast.txt
declare -a sample_list=("SRR10740748" "SRR10740747" "SRR10740746" "SRR10740745" "SRR10740744" "SRR10740743" "SRR10740742" "SRR10740741" "SRR10740740" "SRR10740739")
#
####   submit job to class queue as "this_script_name"   ####
####       request 2 CPU, and dmc as the cluster        ####
#  load the module
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load quast/4.6.3
#
##### Path for directory for SPAdes assemblies
path=/scratch/AU_BIOL_6960_Salmonella/spades_assembly

##### Path for reference Salmonella Muenster for comparison of assembly analysis
pathref=/scratch/AU_BIOL_6960_Salmonella/spades_assembly/reference

# place command here
# For Do Done Loop of all SRR read assemblies

        for sample in ${sample_list[@]}; do
            quast.py -R ${pathref}/salmonella.fasta -t 2 --fragmented -o ${sample}_quast ${path}${sample}_spades_assembly/contigs.fasta
        done

exit
