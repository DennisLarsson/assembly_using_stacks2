#!/bin/bash
Names=`grep -A 12 "BEGIN snps_per_loc_prefilters" populations*/populations.log.distribs | grep -v "BEGIN" | grep -v "#" |grep -v "\-\-" | cut -f 1 -d"/"`
NamesArray=(${Names})
snps=`grep -A 13 "BEGIN snps_per_loc_prefilters" populations*/populations.log.distribs | grep -v "BEGIN" | grep -v "#" |grep -v "\-\-" | grep -v "n_snps"| awk -F\- '{print $NF}'`
SnpsArray=(${snps})

echo "assembly	n_snps	n_loci" > snps_per_loci
i=0
x=0
while [ $x -lt ${#NamesArray[@]} ]
	do
	echo "${NamesArray[$x]}	${SnpsArray[$i]}	${SnpsArray[$i+1]}" >> snps_per_loci
	i=$(( $i + 2 ))
	x=$(( $x + 1 ))
done

