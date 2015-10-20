#!/bin/bash  

# Separate tags into separate .html files  
# IFS="'"
while read line
do
 #echo $line | awk -F',' '{print $1}' >> ~/Desktop/awk/file.txt  
 hold=echo $line | awk -F',' '{print $1}'
 echo $hold
done < ~/Desktop/small.csv





