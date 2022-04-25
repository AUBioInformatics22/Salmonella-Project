#!/bin/sh

declare -a sample_list=("SRR10740739" "SRR10740740" "SRR10740741" "SRR10740742" "SRR10740743" "SRR10740744" "SRR10740745" "SRR10740746" "SRR10740747" "SRR10740748")

#print QC metrics to a file
#depth=$(awk 'NR>1 {print $3}' $sample.idepth)

touch depth_stats.txt

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






