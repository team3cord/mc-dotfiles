#!/bin/bash

echo "################################"
linenum=1
while read line 
do 
  # works echo $line | awk 'BEGIN {FS =","}; {print $1}'
  var1="$( echo $line | cut -d ',' -f1)";
  var2="$( echo $line | cut -d ',' -f2)";
  echo "################################" >>~/Desktop/awk/$var1;
  echo "TAGNAME: " $var1 >> ~/Desktop/awk/$var1;
  echo "<==============================>" >> ~/Desktop/awk/$var1;
  echo "TAG Description: " $var2  >> ~/Desktop/awk/$var1;
  echo "<==============================>" >> ~/Desktop/awk/$var1;
  echo "TAG Content: "  >> ~/Desktop/awk/$var1;
  echo " "  >> ~/Desktop/awk/$var1;
  echo "################################" >> ~/Desktop/awk/$var1;
  ((linenum++))
done < ~/Desktop/small.csv
echo "Total number of lines in file: $linenum"


