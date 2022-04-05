# Step 3: Post - Alignment - Processing
### Troubleshooting
Looking at the output files from the queue jobs we get an error message:
> *WARNING 2022-04-04 22:21:50     AbstractOpticalDuplicateFinderCommandLineProgram        A field field parsed out of a read name was expected to contain an integer and did not. Read name: SRR10740741.1004. Cause: String 'SRR10740741.1004' did not start with a parsable number.* </br>

1. Check the input files if they meet the [requirements for GATK](https://gatk.broadinstitute.org/hc/en-us/articles/360035890791-SAM-or-BAM-or-CRAM-Mapped-sequence-data-formats) with: </br>
`samtools view -H samplename.bam` or </br>
`samtools view -H samplename.bam | grep '^@RG'` </br>

Output for our files: 
> *@RG	ID:foo	SM:bar* </br>

instead of the required individual ID for each sample </br>
To fix this issue we use </br>
`java -jar picard.jar AddOrReplaceReadGroups \ I=input.bam \ O=output.bam \ RGID=4 \ RGLB=lib1 \ RGPL=ILLUMINA \ RGPU=unit1 \ RGSM=20` </br>
for each sample to add the readgroup parameters manually. More information about AddOrReplaceGroups can be found [here](https://gatk.broadinstitute.org/hc/en-us/articles/360037226472-AddOrReplaceReadGroups-Picard-). </br>

6. Check the output files with ValidateSamFiles and in the IGV viewer
