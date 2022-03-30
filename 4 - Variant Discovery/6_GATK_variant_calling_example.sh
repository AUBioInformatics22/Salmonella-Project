#!/bin/sh

####IMPORTANT: Carefully read the hpcdocs entry for GATK4: https://hpcdocs.asc.edu/content/gatk-0

#first, configure your environment to run GATK
#run this command outside the script and logout then back in again:
#conda init bash

##############Make Sample List Array##
declare -a sample_list=("SRR10740739" "SRR10740740" "SRR10740741" "SRR10740742" "SRR10740743" "SRR10740744" "SRR10740745" "SRR10740746" "SRR10740747" "SRR10740748")

#load modules needed for this job
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load gatk/4.1.4.0
source activate gatk

###VARIABLES######
ref="salmonella.fasta"
bam="mark.sorted.bam"
#####


#### COMMAND LINE FOR GATK BELOW ####

for sample in ${sample_list[@]}; do

#Build Bam Index
gatk --java-options "-Xmx1G" BuildBamIndex -I $sample.$bam -R $ref

#Short Variant Discovery; this step can be multithreaded if you request more cores (try 4 first, then up to 8 if needed)
gatk --java-options "-Xmx4G" HaplotypeCaller -R $ref -I $sample.$bam --sample-ploidy 1 -O $sample.g.vcf.gz -ERC GVCF

#Joint Genotyping
gatk --java-options "-Xmx4G" GenotypeGVCFs -R $ref -V $sample.g.vcf.gz -O $sample.vcf.gz

#Extract only SNPs
gatk SelectVariants -R $ref --variant $sample.vcf.gz --select-type-to-include SNP --output $sample.SNPs.vcf

#Perform variant filtering
gatk VariantFiltration -R $ref --variant $sample.SNPs.vcf \
--filter-expression "QD < 2.0" --filter-name "QD2" \
--filter-expression "QUAL < 30.0" --filter-name "QUAL30" \
--filter-expression "SOR > 3.0" --filter-name "SOR3" \
--filter-expression "FS > 60.0" --filter-name "FS60" \
--filter-expression "MQ < 40.0" --filter-name "MQ40" \
--filter-expression "MQRankSum < -12.5" --filter-name "MQRankSum-12.5" \
--filter-expression "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8" \
--output $sample.SNPs.filtered.vcf

gzip $sample.SNPs.vcf $sample.SNPs.filtered.vcf

#get depth statistics
module load vcftools
vcftools --gzvcf $sample.SNPs.filtered.vcf.gz --depth --out $sample #output will be called $sample.idepth

#print QC metrics to a file
depth=`awk 'NR>1 {print $3}' $sample.idepth`

echo Depth for $sample is $depth

done

    for sample in ${sample_list[@]}; do
        echo $sample >>depth_stats.txt
        echo $sample.idepth >>depth_stats.txt
        echo '......................' >>depth_stats.txt
        echo 'Depth for ${sample} is ${depth}' >>depth_stats.txt
        echo ' ' >>depth_stats.txt
        echo '##########################' >>depth_stats.txt
        echo ' ' >>depth_stats.txt

    done

exit
#deactivate GATK; not required?
#conda deactivate gatk





