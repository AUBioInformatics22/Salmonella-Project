#!/bin/sh

#queue parameters
#time = 45 minutes
# 1 CPU
# ram = 150mb
#use class queue

#LOAD MODULES HERE#######################################
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load tabix
module load vcftools
#########################################################

##############Make Sample List Array##
declare -a sample_list=("SRR10740739" "SRR10740740" "SRR10740741" "SRR10740742" "SRR10740743" "SRR10740744" "SRR10740745" "SRR10740746" "SRR10740747" "SRR10740748")

# loop through the $sample direcories
for sample in ${sample_list[@]}; do

# hop into the $sample directory
    cd $sample

# unzip the *vcf.gz files
    gunzip *vcf.gz

##ASSIGN VARIABLE
#array of VCF files in this directory, there should be 3 - the RAW SNPs, the GATK filtered SNPs, and the Adjusted filtered SNPs
    #my_vcfs=(`ls *.vcf`)
    my_vcfs=("$sample.SNPs.vcf" "$sample.SNPs.filtered.vcf" "$sample.SNPs.filtered.adjusted.vcf")
    echo VCF files: ${my_vcfs[@]}

#first need to remove non-PASS sites from your VCFs
#then, you need to compress and create a tabix index for each compressed VCF file

#let's use a nested loop!
    for i in ${my_vcfs[@]}; do

        echo Removing non-PASS sites from $i
        vcftools --vcf $i --remove-filtered-all --recode --recode-INFO-all --out $i.filtered

        echo "Now compressing $i with Bgzip"
        bgzip -f $i.filtered.recode.vcf

        echo Now building a tabix index for $i
        tabix -p vcf $i.filtered.recode.vcf.gz
    done

    echo "Done. Now getting intersection of sites using vcf-compare"
    vcf-compare ${my_vcfs[0]}.filtered.recode.vcf.gz ${my_vcfs[1]}.filtered.recode.vcf.gz ${my_vcfs[2]}.filtered.recode.vcf.gz >$sample.4upsetR.txt

    grep ^VN $sample.4upsetR.txt | cut -f 2- >$sample.4upsetR.venn

# zip the files
    gzip *.vcf

# hop out of the $sample directory
    cd ..

# end the main loop
done

#paste numbers from resulting file into R script on Canvas. Run R script on your own computer.
