# Step 3: Post - Alignment - Processing
1. Check the input files if they meet the [requirements for GATK](https://gatk.broadinstitute.org/hc/en-us/articles/360035890791-SAM-or-BAM-or-CRAM-Mapped-sequence-data-formats) </br>
`samtools view -H samplename.bam` </br>
`samtools view -H samplename.bam | grep '^@RG'`
