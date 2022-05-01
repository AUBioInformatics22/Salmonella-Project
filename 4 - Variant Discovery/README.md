# 4. Variant Discovery

We performed an in depth quality analysis of the resulting VCF file. Some of the questions we addressed include: </br>
</br>
🥚 &nbsp; how did the quality of our file changed from Step 1 when we did the FastQC, </br>
🥚 &nbsp; how the coverage of our BAM file change from Step 2 when we first generated an alignment to VCFtools depth calculation, and </br>
🥚 &nbsp; how the coverage of all our samples compare.


## 1. Initial filtering 
We performed variant discovery and variant filtering. For variant discovery (or variant calling), we used [GATK's Haplotype Caller Tool](https://gatk.broadinstitute.org/hc/en-us/articles/360037225632-HaplotypeCaller) . For variant filtering, we used [GATK's Select Variants](https://gatk.broadinstitute.org/hc/en-us/articles/360037055952-SelectVariants) and [Variant Filtration Tools](https://gatk.broadinstitute.org/hc/en-us/articles/360037434691-VariantFiltration). The script [6_GATK_variant_calling.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/6_GATK_variant_calling.sh) was run with the following filtering parameters for the initial filtering: </br>

**Initial filtering parameters**
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
The [depths statistic](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/depth_stats.txt) created with the script [6a_idepth.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/6a_idepth.sh) shows values between 62.3986 and 77.1962.

To check if and how the parameters needed to be adjusted, plots for each parameter and for each sample were created using three scripts: </br>
</br>
🐣 &nbsp; [1_initial_filtering_plot.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/1_initial_filtering_plot.sh) </br>
🐣 &nbsp; [plotvcftable.R](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/plotvcftable.R) </br>
🐣 &nbsp; [vcf2table.py](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/vcf2table.py) </br>

The output .pdf file for each sample can be seen in the folder [Initial filtering plots](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/4%20-%20Variant%20Discovery/Initial%20filtering%20plots). 


## 2. Filtering with adjusted parameters
The results of the [Initial filtering plots](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/4%20-%20Variant%20Discovery/Initial%20filtering%20plots) were evaluated and the best adjusted parameters chosen to fit all samples. </br>

**Adjusted filtering parameters** </br>
```
gatk VariantFiltration -R $ref --variant $sample.SNPs.vcf \
--filter-expression "QD < 2.0" --filter-name "QD2" \
--filter-expression "QUAL < 30.0" --filter-name "QUAL30" \
--filter-expression "SOR > 6.0" --filter-name "SOR6" \
--filter-expression "FS > 30.0" --filter-name "FS30" \
--filter-expression "MQ < 50.0" --filter-name "MQ50" \
--filter-expression "MQRankSum < -10" --filter-name "MQRankSum-10" \
--filter-expression "ReadPosRankSum < -5.5" --filter-name "ReadPosRankSum-5.5" \
--output $sample.SNPs.filtered.vcf
```
The output .pdf file for each sample can be seen in the folder [Adjusted filtering plots](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/4%20-%20Variant%20Discovery/Adjusted%20filtering%20plots). Looking at [depth_stats.adjusted.txt](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/depth_stats.adjusted.txt), the depth values now range between 66.2844 and 108.875. But the plots show now that the curves for ReadPosRankSum, root mean square error (MQ), MQRankSum, and genotype quality (GQ) are off. 


## 3. Comparison of the three .vcf files

There are three different .vcf files for each sample: </br>
</br>
🐥 &nbsp; `$sample.SNPs.vcf.gz` </br>
🐥 &nbsp; `$sample.SNPs.filtered.vcf.gz` </br>
🐥 &nbsp; `$sample.SNPs.filtered.adjusted.vcf.gz` </br>
</br>

The script [7_store_vcf_files.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/7_store_vcf_files.sh) makes a new directory for each sample and copies these three files in it. Now [UpSetR.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/UpSetR.sh) will loop through all the $sample directories and compare the .vcf files. </br>
The script uses first [vcftools](https://vcftools.github.io/index.html) to remove all the files that were filtered out previously. Then [Samtools tabix](http://www.htslib.org/doc/tabix.html) compresses and indexes the vcf files to make them compatible with vcf-compare. Then 
This script will first use VCFtools to remove all of the sites that were filtered out (GATK only marks them, but does not remove them). It then properly compresses each VCF and indexed them for compatability with [vcf compare](https://vcftools.github.io/perl_module.html#vcf-compare). The .venn output files are in the folder [Venn files](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/4%20-%20Variant%20Discovery/Venn%diagrams/Venn%files)  </br>


## 4. Upset plots and venn diagrams

The values of the output files `$sample.4upsetR.venn` can now typed into [UpSet_plot.R](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/UpSetR_plot.R) in RStudio using the [UpSetR package](https://github.com/hms-dbmi/UpSetR)to generate [Upset plots](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/4%20-%20Variant%20Discovery/Upset%20plots). Two examples of such a plot are provided below. 

</br>
<img align="left" src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Upset%20plots/Upset39.png" width="450" height="350"/>
  <img align="center" src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Upset%20plots/Upset41.png" width="450" height="350"/> 
</br> 
</br>

For better visualization we chose venn diagrams. Therefore we calculated all required values in an [excel sheet](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Upset%20plots/UpsetR_values.xlsx).
We used the package [VennDiagram](https://cran.r-project.org/web/packages/VennDiagram/VennDiagram.pdf) to create our venn diagrams.
Based on these values the venn diagram can be created with the R script [venn.R](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/venn.R). 
Here you can see the diagram for the sample SRR10740739 and SRR10740741. The other diagrams can be found in the folder [Venn diagrams](https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/4%20-%20Variant%20Discovery/Venn%20diagrams). </br>
<br/>

 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  SRR1074039 &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; SRR1074041
<br/>
<br/>
<img align="left" src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Venn%20diagrams/SRR39_venn.png" width="450" height="300" />
  <img align="center" src="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Venn%20diagrams/SRR41_venn.png" width="450" height="300" /> 

</br>
The majority of the samples generated a venn diagram in the shape of the left one of sample SRR10740739. The adjusted filtering overlaps almost completely with the initial filtered area, but is significantly smaller. The samples SRR10740741, SRR10740745, and SRR10740746 venn diagrams are looking like the right figure. The area of initially filtered SNPs is almost completely overlapping with the unfiltered SNPs. After adjusted filtering, only a small amount of SNPs is left, overlapping only with the initially filtered ones. 

## 5. Visualization with [IGV](https://igv.org)

<p align="center">
<img src="IGV screenshots/igv_SNP_contig1.png" width="1400" height="600" />
</p>

The figure above highlights a segment on contig LHMO010000010.1 of SRR10740739 that show a SNP identified by GATK haplotype caller when the VCF track is loaded. 
For the identified SNP, T in the reference genome has been replaced by the alternate allele C at position 1614. With a mapping quality of 60 and FS score of 0, 
and low StrandOdds Ratio(SOR) of 0.742, the called SNP is likely a true SNP and not an artifact.</br> 

### Filtered vs non-filtered VCF
<p align="center">
<img src="IGV screenshots/filtered_vs_nonfiltered2.png" width="1400" height="600" />
</p>

The figure above highlights how variant filtering can improve variant calls. Displayed is a segment of on contig LHMO000006.1 showing the effect of hard filtering. 
In the top track (SRR10740739.SNP.filtered.vcf), the SNP at position 50529 which has  refence allele of T and an alternate of C has been filtered out 
(shown in faint red)  vs the unfiltered track(SRR10740739.SNP.vcf) shown in dark red (both SNPs are highlighted by blue arrow). The SNP was filtered out based 
on the SOR value which was 3.126, indicating a high likelihood of stand bias. </br>

### Adjusted vs Filtered VCF
<p align="center">
<img src="IGV screenshots/adj_fil.png" width="1400" height="600" />
</p>

The figure above highlights how changing quality parameters can affect called variants. Displayed is a segment of on contig LHMO0000015.1 showing the effect of 
ajusting filter parameters. The top track (Adjusted.filtered) shows how two SNPs have been filtred out (highligted in black circles) versus the initial filter 
(second track) at positions 57893. Overall, adjusting filter parameters reduced called SNPs from over 1500 to just 16. </br>

## 6. Conclusion
Adjusting the filtering parameters based on the plots of the initial filtering, increased the depth and reduced the number of relevant SNPs for each sample. The plots for adjusted filtering show some issues with the parameters, so the values for these parameters should be changed accordingly for a second adjusted filtering step. The venn diagrams show that the filtering was successful and that the adjusted filtering is stricter than the initial filtering. The IVG displays ...

## 7. What really happened ...

The [depth_stats.txt](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/depth_stats.txt) output of our script for variant calling [6_GATK_variant_calling.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/6_GATK_variant_calling_example.sh) turned out empty for all samples.


## 🤯 &nbsp; Troubleshooting

1. We ran all steps seperately to find the error. The very first step of haplotype calling [GATK_haplo.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/GATK_haplo.sh) already generated empty `sample.g.vcf.gz` files. </br>
> *WARN: Annotation will not be calculated, genotype is not called or alleleLikelihoodMap is null* </br>
</br>

2. Checking the input sample.mark.sorted.bam files for errors by running <a href="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/7_GATK_ValidateSam.sh" target="_top">GATK ValidateSamFiles</a> generated an <a href="https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Sam_Validation.SRR10740739.txt" target="_top">error</a> for every sample.mark.sorted.bam file. 
</br>

> *ERROR: Read name foo, A platform (PL) attribute was not found for read group* </br>
</br>
and also showed an IncompatibleClassChangeErrorin the queue output file. </br>
</br>

3. GATK issues were solved by running `module load GATK` followed by `conda init bash`and also add the correct calling for the GATK module in the script:
```
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load gatk/4.1.4.0
```

But we had to go back to [step 3](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/3%20-%20Post-alignment%20processing/README.md) where we used GATK the first time, to make sure that the files produced there were correct.</br>
</br>

4. We went back to step 3 and checked our parameters for the alignment. We had the idea, that the issues might be caused by the fact, that our little Salmonella is monoploid, but all settings are fitted for diploid organisms -> this idea was not the key to the solution. In fact, there is no reason to believe that GATK can't deal with monoploid organisms. </br>
Our problem was, that GATK requires the proper java version to run correctly. Our GATK and java version did not match, that's why we got the `IncompatibleClassError`. When loading the GATK version matching the java version (can easily be checked by running <code>which gatk</code> and <code>java -version</code> and comparing the results with the <a href="https://gatk.broadinstitute.org/hc/en-us/articles/360035889531-What-are-the-requirements-for-running-GATK-" target="_top">java requirements for GATK</a> the code works just fine. </br>
We also had to add the readgroups manually to our .bam files before running GATK. Code and more troubleshooting can be found in the <a href="https://github.com/AUBioInformatics22/Salmonella-Project/tree/main/3%20-%20Post-alignment%20processing" target="_top">README.md of 3 - Post-alignment Processing</a>.
</br>
</br>

5. Still, the haplotype caller produced empty .vcf files with only the header. We could run the class script on it, where we generated the graphs for all the parameter, to check if they were chosen properly. Our script runs with: 

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
6. Solution for the haplotype caller to run was to add the -f flag to gzip `gzip -f $sample.SNPs.vcf $sample.SNPs.filtered.vcf`, so the older files were overwritten correctly with the new generated ones. We also changed from GATK 4.1.4.0 to 4.1.0.0 to avoid a number of syntax warnings. 
Now we have our filtered .vcf files and are good to proceed with step 5!
Script [6_GATK_variant_calling.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/0177a6eb58ca2b35dc78a2b2ba63ba72b83f5b73/4%20-%20Variant%20Discovery/Scripts/6_GATK_variant_calling.sh) is the debugged one.

7. But then the last part of the script [6_GATK_variant_calling.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/6_GATK_variant_calling_example.sh), where the information of the `$sample.idepth` files is stored into [depth_stats.txt](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/depth_stats.txt) did not work. That's why [6a_idepth.sh](https://github.com/AUBioInformatics22/Salmonella-Project/blob/main/4%20-%20Variant%20Discovery/Scripts/6a_idepth.sh) was written. The trick was to integrate the variable ```depth=`awk 'NR>1 {print $3}' $sample.idepth``` into the loop and to change the '' to "" where the variables are called with `
echo`: </br>
```
for sample in ${sample_list[@]}; do
    depth=`awk 'NR>1 {print $3}' $sample.idepth`
    echo $sample >>depth_stats.txt
    echo $sample.idepth >>depth_stats.txt
    echo '......................' >>depth_stats.txt
    echo "Depth for $sample is $depth" >>depth_stats.txt
    echo ' ' >>depth_stats.txt
    echo '##########################' >>depth_stats.txt
    echo ' ' >>depth_stats.txt

done
```

## 7. Contributions
🐓&nbsp; Steven: first try to run the scripts, troubleshooting </br>
🐓&nbsp; Andrea: second try and finish, troubleshooting, GitHub repository </br>
🐓&nbsp; Chidozie: IGV analysis of result files
