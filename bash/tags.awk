#!/bin/bash  

# Separate tags into separate .html files  
awk -f
BEGIN {FS=,}
"{print $1 \n $2 \n }" 






