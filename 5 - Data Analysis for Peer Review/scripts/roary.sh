#!/bin/sh
#

####   submit job to class queue as "this_script_name"   ####
####       request 8 CPU, and any as the cluster        ####

#  load the module
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load roary/3.13.0
#
pwddir=`pwd`

#  edit the roary command as needed
#  But ALWAYS include -p flag to set how many processor cores
#example: roary -p 2 -f ${pwddir}/demo -e -n -v ${pwddir}/*.gff
###     Move all gff files to same directory 

    roary -p 8 -f ${pwddir}/roary_results_2 -e -n -r -v ${pwddir}/*.gff

exit
