#!/bin/bash

while IFS= read -r line; 
do 
  #git tag $line ;
  git branch -D $line;
  ((linenum++))
done < ~/Desktop/branchlist.txt


