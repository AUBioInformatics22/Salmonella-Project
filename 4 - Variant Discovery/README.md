We performed variant discovery and variant filtering. For variant discovery (or variant calling), we used GATK's Haplotype Caller Tool. For variant filtering, we used GATK's Select Variants and Variant Filtration Tools.

We performed an in depth quality analysis of the resulting VCF file. Some of the questions we addressed include how did the quality of our file changed from Step 1 when we did the FastQC, how the coverage of our BAM file change from Step 2 when we first generated an alignment to VCFtools depth calculation, and how the coverage of all our samples compare?


Quality Aspects of VCF files

IGV screen shots comparing regions of high SNP to low SNP quality.

