# Step 3: Post - Alignment - Processing
1. Check the input files if they meet the [requirements for GATK](https://gatk.broadinstitute.org/hc/en-us/articles/360035890791-SAM-or-BAM-or-CRAM-Mapped-sequence-data-formats) </br>
`samtools view -H samplename.bam` </br>
`samtools view -H samplename.bam | grep '^@RG'` </br>
Output for our files: `@RG	ID:foo	SM:bar` instead of the required individual ID for each sample </br>
To fix this issue we used `java -jar picard.jar AddOrReplaceReadGroups \ I=input.bam \ O=output.bam \ RGID=4 \ RGLB=lib1 \ RGPL=ILLUMINA \ RGPU=unit1 \ RGSM=20` for each sample to add the readgroup parameters manually. More information about AddOrReplaceGroups can be found [here](https://gatk.broadinstitute.org/hc/en-us/articles/360037226472-AddOrReplaceReadGroups-Picard-). </br>

6. Check the output files with ValidateSamFiles and in the IGV viewer
