#!/bin/bash
# This bash script was written by Kourosh Banaeianzadeh (LabNext, University of Calgary) on 14 October 2017. It runs chiasmusScript.bash on all files that end with .txt in the directory
for i in *.txt
do sh chiasmusScript.bash $i
done
echo "It worked!"
