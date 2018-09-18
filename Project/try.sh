#!/bin/bash

:'for i in {1..20};do getFpFn.py -t /home/farah/Project/mammals-course-project/true.tree -e SP$((i))_stripped_edge_support>>SP$((i))_FN;done

for i in {1..20};do java -jar /home/farah/PhyloNet/phylonet_v2_4/phylonet_v2_4.jar deep_coal_count SP$((i))_stripped_edge_support Rep$((i))>EL$((i));done

for i in {1..20};do tail -1 EL$((i))|awk '{print $NF}'>>EL_$((i));done #extracts lineage number from deep_coal_count output files (sp trees) 

perl /home/farah/Downloads/calculate_average_new.pl <file containing the scores>  '  

:'
grep "[0-9]*[/(/)/;/:/,]" Rep1_result > temp1
	

cut -d ' ' -f2 Rep$((i))_result>>R$((i))_EL	#extracts only the no. of lineage from Phylonet sp tree file	


cut -d ' ' -f1 simtrees_$((i))_result>>simtrees_$((i))_result_stripped       #extracts only the tree part from Phylonet sp tree file

grep "Final quartet score is:" log$((i))>>temp$((i));cut -d ' ' -f5 temp$((i))>score$((i))  #extract final quartet score

for i in {1..20};do grep "Final quartet score is:" log$((i))>>temp$((i));cut -d ' ' -f5 temp$((i))>score$((i));done

for i in {1..20};do perl /home/farah/Project/strip_edge_support.pl -i Rep$((i))_result_stripped -o Rep$((i))_stripped_edge_support;done

perl calculate_missingbranchrate_python.pl <file containing the output of FN rate>

perl /home/farah/Downloads/calculate_missingbranchrate_python.pl <file containing the output of FN rate>

'

for i in {1..20};do java -jar /home/farah/Downloads/ASTRAL-master/Astral.5.5.12/Astral/astral.5.5.12.jar -q Rep$((i))_stripped_edge_support -i Rep$((i)) -o temp$((i)) 2> log$((i));done

for i in {1..20};do grep "Final quartet score is:" log$((i))>>temp$((i));cut -d ' ' -f5 temp$((i))>QS$((i));done  #extract quartet score


for i in {1..20}; do shuf -n 5 Rep$((i))>>Rep$((i))_5genes;done  #random line select from text file



for dir in */Astral/;do mkdir -- "$dir/quartet_count_from_gt_consistent_with _sptree";done  #making recursive directories

for file in */Astral/quartet_count_from_gt_consistent_with_sptree/*;do cat $file >>QS;done

for d in */Astral/quartet_count_from_gt_consistent_with_sptree/ ; do (cd "$d" && cat * >>QS_); done

for d in */Astral/quartet_count_from_gt_consistent_with_sptree/ ; do (cd "$d" && grep "Final quartet score is:" QS_>>temp;cut -d ' ' -f5 temp>>QS;rm QS_); done



/home/farah/Project/run_command.sh

find . -name 'QS' -delete   #delete files from multiple directories

















