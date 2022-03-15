#!/bin/sh

####IMPORTANT: Carefully read the hpcdocs entry for GATK4: https://hpcdocs.asc.edu/content/gatk-0
####Important: Folder must contain reference salmonella.fasta file and alignment bam files (*.merged.sorted.bam)

#first, configure your environment to run GATK
#run this command outside the script and logout then back in again:
#conda init bash - this command no longer has to be used, "source activate gatk" command loads python environment

##########Queue Information Based on SampleTest Data###########
#Core=4 Mem=4gb
##########Make Sample List Array##
declare -a sample_list=("SRR10740748" "SRR10740747" "SRR10740746" "SRR10740745" "SRR10740744" "SRR10740743" "SRR10740742" "SRR10740741" "SRR10740740" "SRR10740739")

#load modules needed for this job
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load gatk/4.1.0.0
source activate gatk

##########Variables###############
#Prefix name of reference genome file. Must be labeled as .fasta and not .fna
ref=salmonella
bam=merged.sorted.bam
genome_size=`awk '{sum+=$2} END {print sum}' ${ref}.fasta.fai`
#####

#gatk
#### COMMAND LINE FOR GATK BELOW ####
        for sample in ${sample_list[@]}; do
            gatk --java-options "-Xmx1G" BuildBamIndex -I ${sample}.${bam} -R ${ref}.fasta
            gatk --java-options "-Xmx1G" MarkDuplicates -R ${ref}.fasta -I ${sample}.${bam} -M ${sample}.dup_metrics -O ${sample}.markdup.bam
        done

#deactivate GATK
source deactivate gatk

        for sample in ${sample_list[@]}; do
            samtools view -Sb ${sample}.markdup.bam | samtools sort - -@ 4 -m 2GB >${sample}.mark.sorted.bam
            #mv ${sample}.sorted.bam ${sample}.mark.sorted.bam #Re-name .sorted.bam files to .merge.sorted.bam # Files do not contain reads from multiple lanes, so no merging is necessary.
            samtools index ${sample}.mark.sorted.bam
            #samtools depth ${sample}.mark.sorted.bam | awk "{sum+=\$3; sumsq+=\$3*\$3} END { print \"Average = \",sum/$genome_size; print \"Stdev = \",sqrt(sumsq/$genome_size - (sum/$genome_size)**2)}" > ${sample}.markdup.coverage_summary.txt 
            samtools flagstat ${sample}.mark.sorted.bam >${sample}.mark.sorted.flagstat
        done

#Generate combined text file
dateum=$(date +%Y_%m_%d)

date %c > ${dateum}_markdup_stat.txt
stat=${dateum}_markdup_stat.txt

        for sample in ${sample_list[@]}; do
            echo ${sample} >>$stat
            cat ${sample}.markdup.coverage_summary.txt >>$stat
            echo ' ' >>$stat
            cat ${sample}.mark.sorted.flagstat >>$stat
            echo '##################' >>$stat
            echo ' ' >>$stat
            echo '##################' >>$stat
            echo '##################' >>$stat
            echo ' ' >>$stat
        done


#Clean-up files

           #mv ${ref}.fasta ../ #Move reference genome back to original folder
           mkdir markd_sorted_bam_files
           cp *.mark.sorted.bam ./markd_sorted_bam_files

          #Make directory and move temporary index files to directory
            mkdir markd_files
            mv ${ref}.* ./markd_files

          #Loop us to make directory for each sequence and move resulting file to directory        
        for sample in ${sample_list[@]}; do
            mkdir ${sample}
            mv ${sample}.* ./${sample}
        done

exit


#### submit job to class queue as "run_script this_script_name"     ####
#### and request 4 CPU, and 4gb of memory       ####
