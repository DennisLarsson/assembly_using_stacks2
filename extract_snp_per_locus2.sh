#!/bin/bash
#Version 1.3
Names=`grep -A 12 "BEGIN snps_per_loc_postfilters" populations*/populations.log.distribs | grep -v "BEGIN" | grep -v "#" |grep -v "\-\-" | cut -f 1 -d"/"`
NamesArray=(${Names})
snps=`grep -A 13 "BEGIN snps_per_loc_postfilters" populations*/populations.log.distribs | grep -v "BEGIN" | grep -v "#" |grep -v "\-\-" | grep -v "n_snps"| awk -F\- '{print $NF}'`
SnpsArray=(${snps})

echo "assembly	1	2	3	4	5	6	7	8	9	10" > snps_per_loci.tsv
i=0
x=0
while [ $x -lt ${#NamesArray[@]} ]
	do
	echo "${NamesArray[$x]}	${SnpsArray[$i+3]}	${SnpsArray[$i+5]}	${SnpsArray[$i+7]}	${SnpsArray[$i+9]}	${SnpsArray[$i+11]}	${SnpsArray[$i+13]}	${SnpsArray[$i+15]}	${SnpsArray[$i+17]}	${SnpsArray[$i+19]}	${SnpsArray[$i+21]}" >> snps_per_loci.tsv
	i=$(( $i + 22 ))
	x=$(( $x + 11 ))
done

