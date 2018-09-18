#!/bin/bash

for i in {1..20};do grep "Final quartet score is:" log$((i))>>temp$((i));cut -d ' ' -f5 temp$((i))>score$((i));done

:'
grep "[0-9]*[/(/)/;/:/,]" Rep1_result > temp1
	

cut -d ' ' -f2 Rep1_result	#extracts only the no. of lineage from Phylonet sp tree file	


cut -d ' ' -f1 simtrees_$((i))_result>>simtrees_$((i))_result_stripped       #extracts only the tree part from Phylonet sp tree file
'

