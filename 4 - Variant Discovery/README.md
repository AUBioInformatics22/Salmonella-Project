# The Plan

We performed variant discovery and variant filtering. For variant discovery (or variant calling), we used GATK's Haplotype Caller Tool. For variant filtering, we used GATK's Select Variants and Variant Filtration Tools.

We performed an in depth quality analysis of the resulting VCF file. Some of the questions we addressed include how did the quality of our file changed from Step 1 when we did the FastQC, how the coverage of our BAM file change from Step 2 when we first generated an alignment to VCFtools depth calculation, and how the coverage of all our samples compare?


Quality Aspects of VCF files

IGV screen shots comparing regions of high SNP to low SNP quality.

# What happened

The [depth_stats.txt](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/depth_stats.txt) output of our script for variant calling [6_GATK_variant_calling_example](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/6_GATK_variant_calling_example.sh) turned out empty for all samples.

## Troubleshooting
1. run all steps seperately to find the error. The very first step of haplotype calling [GATK_haplo.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/GATK_haplo.sh) already generated empty `sample.g.vcf.gz` files. </br>
> `WARN: Annotation will not be calculated, genotype is not called or alleleLikelihoodMap is null` </br>
</br>
2. checking the input sample.mark.sorted.bam files for errors by running <a href="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/7_GATK_ValidateSam.sh" target="_top">GATK ValidateSamFiles</a> generated an <a href="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Sam_Validation.SRR10740739.txt" target="_top">error</a> for every sample.mark.sorted.bam file. 
</br>

> *ERROR: Read name foo, A platform (PL) attribute was not found for read group* </br>
</br>
and also showed an IncompatibleClassChangeErrorin the queue output file. </br>

3. GATK issues were solved by running `module load GATK` followed by `conda init bash`and also add the correct calling for the GATK module in the script:
```
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load gatk/4.1.4.0
```

But we had to go back to [step 3](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/3%20-%20Post-alignment%20processing/README.md) where we used GATK the first time, to make sure that the files produced there were correct.


3. checking the sample.mark.sorted.bam files with the <a href="https://software.broadinstitute.org/software/igv/" target="_top">Integrated Genomics Viewer</a> </br>
</br>

4. going back to step 3 and check our parameters for the alignment. We have the idea, that the issues might be caused by the fact, that our little Salmonella is monoploid, but all settings are fitted for diploid organisms -> this idea was not the key to the solution. In fact, there is no reason to believe that GATK can't deal with monoploid organisms. </br>
Our problem was, that GATK requires the proper java version. Our gatk and java did not match, that's why we got the IncompatibleClassError. When loading the GATK version matching the java version (can easily be checked by running <code>which gatk</code> and <code>java -version</code> and comparing the results with the <a href="https://gatk.broadinstitute.org/hc/en-us/articles/360035889531-What-are-the-requirements-for-running-GATK-" target="_top">java requirements for GATK</a> the code works just fine. </br>
We also had to add the readgroups manually to our .bam files before running GATK. Code and more troubleshooting can be found in the <a href="https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/3%20-%20Post-alignment%20processing" target="_top">README.md of 3 - Post-alignment Processing</a>.
</br>
</br>

5. Still, the haplotype caller produces empty .vcf files with only the header. We could run the class script on it, where we generated the graphs for all the parameter, to check if they were chosen properly. Our script runs with: 

```
gatk VariantFiltration -R $ref --variant $sample.SNPs.vcf \
--filter-expression "QD < 2.0" --filter-name "QD2" \
--filter-expression "QUAL < 30.0" --filter-name "QUAL30" \
--filter-expression "SOR > 3.0" --filter-name "SOR3" \
--filter-expression "FS > 60.0" --filter-name "FS60" \
--filter-expression "MQ < 40.0" --filter-name "MQ40" \
--filter-expression "MQRankSum < -12.5" --filter-name "MQRankSum-12.5" \
--filter-expression "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8" \
--output $sample.SNPs.filtered.vcf
```
