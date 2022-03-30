# The Plan

We performed variant discovery and variant filtering. For variant discovery (or variant calling), we used GATK's Haplotype Caller Tool. For variant filtering, we used GATK's Select Variants and Variant Filtration Tools.

We performed an in depth quality analysis of the resulting VCF file. Some of the questions we addressed include how did the quality of our file changed from Step 1 when we did the FastQC, how the coverage of our BAM file change from Step 2 when we first generated an alignment to VCFtools depth calculation, and how the coverage of all our samples compare?


Quality Aspects of VCF files

IGV screen shots comparing regions of high SNP to low SNP quality.

# What happened

The [stats.txt](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/depth_stats.txt) output of our script for variant calling [6_GATK_variant_calling_example](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/6_GATK_variant_calling_example.sh) turned out empty for all samples.

## Troubleshooting
1. run all steps seperately to find the error. The very first step of haplotype calling [GATK_haplo.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/GATK_haplo.sh) already generated empty .g.vcf.gz files. </br>
`WARN: Annotation will not be calculated, genotype is not called or alleleLikelihoodMap is null` </br>
3. checking the input .bam files for errors by running [ValidateSamFiles](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/7_GATK_ValidateSam.sh) generated an [error for every sample.bam file](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Sam_Validation.SRR10740739.txt):</br>
`ERROR: Read name foo, A platform (PL) attribute was not found for read group`</br>
