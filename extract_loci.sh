#!/bin/bash
#version 1.3

echo "assembly	nr_locus" > locus_count2

Names=`grep "Kept" populations*/populations.log | cut -f 1 -d"/"` #Extracts the names of the assemblies
NamesArray=(${Names})

for i in ${NamesArray[@]}
do
	Loci=`grep -v "#" ./$i/populations.sumstats.tsv | cut -f 1 |  uniq | wc -l` #extracts the locus count for each assembly
	echo "${i}	$Loci" >> locus_count2
done
