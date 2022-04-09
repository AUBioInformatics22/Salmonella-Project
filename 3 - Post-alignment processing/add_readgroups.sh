#!/bin/bash

# source /opt/asn/etc/asn-bash-profiles-special/modules.sh
# module load picard/2.24.0

source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load gatk/4.1.4.0

# what we have to add to our .bam files:
#Run	ID	LB	PL	SM	PU
#SRR10740739	19-037946-Calf112-3-15-2012	19-037946-Calf112-3-15-2012	ILLUMINA	Calf112-3-15-2012	1
#SRR10740740	19-037946-Calf703-8-8-2017	19-037946-Calf703-8-8-2017	ILLUMINA	Calf703-8-8-2017	1
#SRR10740741	19-037946-Cow318E2016	19-037946-Cow318E2016	ILLUMINA	Cow318E2016	1
#SRR10740742	19-037946-AUVER19-1	19-037946-AUVER19-1	ILLUMINA	AUVER19-1	1
#SRR10740743	19-037946-AUCVM16-178	19-037946-AUCVM16-178	ILLUMINA	AUCVM16-178	1
#SRR10740744	19-037946-AUCVM16-5	19-037946-AUCVM16-5	ILLUMINA	AUCVM16-5	1
#SRR10740745	19-037946-AUCVM15-155	19-037946-AUCVM15-155	ILLUMINA	AUCVM15-155	1
#SRR10740746	19-037946-AUCVM15-107	19-037946-AUCVM15-107	ILLUMINA	AUCVM15-107	1
#SRR10740747	19-037946-AUCVM14-257	19-037946-AUCVM14-257	ILLUMINA	AUCVM14-257	1
#SRR10740748	19-037946-AUCVM14-126	19-037946-AUCVM14-126	ILLUMINA	AUCVM14-126	1

#sample names
#SRR10740739.merged.sorted.bam

# gatk AddOrReplaceReadGroups -I Example.bam -O Test.bam --RGID 4 --RGLB Lib1 --RGPL Illumina --RGPU unit1 --RGSM 20

gatk AddOrReplaceReadGroups -I SRR10740739.merged.sorted.bam -O SRR10740739.rg.merged.sorted.bam -RGID 19-037946-Calf112-3-15-2012 -RGLB 19-037946-Calf112-3-15-2012 -RGPL ILLUMINA -RGPU 1 -RGSM Calf112-3-15-2012

gatk AddOrReplaceReadGroups -I SRR10740740.merged.sorted.bam -O SRR10740740.rg.merged.sorted.bam -RGID 19-037946-Calf703-8-8-2017 -RGLB 19-037946-Calf703-8-8-2017 -RGPL ILLUMINA -RGPU 1 -RGSM Calf703-8-8-2017
 
gatk AddOrReplaceReadGroups -I SRR10740741.merged.sorted.bam -O SRR10740741.rg.merged.sorted.bam -RGID 19-037946-Cow318E2016 -RGLB 19-037946-Cow318E2016 -RGPL ILLUMINA -RGPU 1 -RGSM Cow318E2016
 
gatk AddOrReplaceReadGroups -I SRR10740742.merged.sorted.bam -O SRR10740742.rg.merged.sorted.bam -RGID 19-037946-AUVER19-1 -RGLB 19-037946-AUVER19-1 -RGPL ILLUMINA -RGPU 1 -RGSM AUVER19-1
 
gatk AddOrReplaceReadGroups -I SRR10740743.merged.sorted.bam -O SRR10740743.rg.merged.sorted.bam -RGID 19-037946-AUVER16-178 -RGLB 19-037946-AUVER16-178 -RGPL ILLUMINA -RGPU 1 -RGSM AUVER16-178
 
gatk AddOrReplaceReadGroups -I SRR10740744.merged.sorted.bam -O SRR10740744.rg.merged.sorted.bam -RGID 19-037946-AUVER16-5 -RGLB 19-037946-AUVER16-5 -RGPL ILLUMINA -RGPU 1 -RGSM AUVER16-5
 
gatk AddOrReplaceReadGroups -I SRR10740745.merged.sorted.bam -O SRR10740745.rg.merged.sorted.bam -RGID 19-037946-AUVER15-155 -RGLB 19-037946-AUVER15-155 -RGPL ILLUMINA -RGPU 1 -RGSM AUVER15-155
 
gatk AddOrReplaceReadGroups -I SRR10740746.merged.sorted.bam -O SRR10740746.rg.merged.sorted.bam -RGID 19-037946-AUVER15-107 -RGLB 19-037946-AUVER15-107 -RGPL ILLUMINA -RGPU 1 -RGSM AUVER15-107
 
gatk AddOrReplaceReadGroups -I SRR10740747.merged.sorted.bam -O SRR10740747.rg.merged.sorted.bam -RGID 19-037946-AUVER14-257 -RGLB 19-037946-AUVER14-257 -RGPL ILLUMINA -RGPU 1 -RGSM AUVER14-257
 
gatk AddOrReplaceReadGroups -I SRR10740748.merged.sorted.bam -O SRR10740748.rg.merged.sorted.bam -RGID 19-037946-AUVER14-126 -RGLB 19-037946-AUVER14-126 -RGPL ILLUMINA -RGPU 1 -RGSM AUVER14-126
