#!/bin/bash
#This script creates a paramfile if more than one CASTEP .cell file is found

#Remove paramfile.txt if already existing
if [ -f "paramfile.txt" ]; then
  rm paramfile.txt
fi

#Get number of .cell files are exit if there is only one file.
num_files=$(ls *.cell | wc -l)
[[ "$num_files" == 1 ]] && exit 0

touch paramfile.txt #Initialise paramfile.txt
i=1 #Counter
#Iterate over CASTEP .cell files
for file in *.cell
do
  seed=$(basename $file .cell)
  echo -e "$i $seed" >> paramfile.txt
  i=$((i + 1))
done
