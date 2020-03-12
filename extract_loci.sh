#!/bin/bash
Names=`grep "Kept" populations*/populations.log | cut -f 1 -d"/"` #Extracts the names of the assemblies
NamesArray=(${Names})
Loci=`grep "Kept" populations*/populations.log | cut -f 2 -d" "` #extracts the locus count for each assembly
LociArray=(${Loci})

echo "assembly	locus_count" > locus_count

i=0
while [ $i -lt ${#NamesArray[@]} ]
	do
	echo "${NamesArray[$i]}	${LociArray[$i]}" >> locus_count #Prints name and locus count to file
	i=$(( $i + 1 ))
done
