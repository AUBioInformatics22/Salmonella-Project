#!/bin/bash

#This script will be used to align contigs to a reference genome
#This requires use of BWA, Samtools, and Picard
#Must have both reads for each sequence and reference genome downloaded into current working directory.
#If reference and samples are not downloaded, use script ref_sequences.sh
#
##########Queue Information Based on SampleTest Data###########
#Core=4 Mem=4gb
##########Make Sample List Array##
declare -a sample_list=("SRR10740748" "SRR10740747" "SRR10740746" "SRR10740745" "SRR10740744" "SRR10740743" "SRR10740742" "SRR10740741" "SRR10740740" "SRR10740739")

##########Variables###############
#Prefix name of reference genome file. Must be labeled as .fasta and not .fna
ref=salmonella
##################################
#
##########Setup Environment#######
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load bwa/0.7.12
module load samtools/1.3.1
module load picard/1.79
#
##########Commands################

#Make directory for all resulting files
mkdir ./bwa

#Index for the Burrows-Wheeler Align and is used to create the reference genome for the scripts that require BWA
        
bwa index -p $ref ${ref}.fasta
samtools faidx ${ref}.fasta
java -Xms2g -Xmx4g -jar /opt/asn/apps/picard_1.79/picard-tools-1.79/CreateSequenceDictionary.jar REFERENCE=${ref}.fasta OUTPUT=${ref}.dict
#
####Create variable genome_size for calculation later in script
genome_size=`awk '{sum+=$2} END {print sum}' ${ref}.fasta.fai`

#
######Move reference genome and index files to directory for resulting files
mv ${ref}.* ./bwa
cd ./bwa

#Command loop to align both reads to the reference genome
#BWA mem for alignment piped into Samtools view piped into Samtools sort and converted to .bam opposed to .sam file format.
        for sample in ${sample_list[@]}; do
            bwa mem -M -t 4 -R "@RG\tID:foo\tSM:bar" $ref ../${sample}_1.fastq.gz ../${sample}_2.fastq.gz | samtools view -Sb | samtools sort - -@ 4 -m 2GB >${sample}.sorted.bam
        
            samtools index ${sample}.sorted.bam

        done

#Index merged file and calculate metrics
        for sample in ${sample_list[@]}; do
            mv ${sample}.sorted.bam ${sample}.merged.sorted.bam #Re-name .sorted.bam files to .merge.sorted.bam # Files do not contain reads from multiple lanes, so no merging is necessary.
            samtools index ${sample}.merged.sorted.bam
            samtools depth ${sample}.merged.sorted.bam | awk "{sum+=\$3; sumsq+=\$3*\$3} END { print \"Average = \",sum/$genome_size; print \"Stdev = \",sqrt(sumsq/$genome_size - (sum/$genome_size)**2)}" > ${sample}.coverage_summary.txt 
            samtools flagstat ${sample}.merged.sorted.bam >${sample}.merged.sorted.flagstat
        done

#Clean-up files

            mv ${ref}.fasta ../ #Move reference genome back to original folder
           
          #Make directory and move temporary index files to directory
            mkdir index_files
            mv ${ref}.* ./index_files

          #Loop us to make directory for each sequence and move resulting file to directory        
        for sample in ${sample_list[@]}; do
            mkdir ${sample}
            mv ${sample}.* ./${sample}
        done

exit
