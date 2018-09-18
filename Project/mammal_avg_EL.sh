#!/bin/bash

for d in */all_*/Phylonet\ Results/deepcoal_count_*/ ;do (cd $d && for i in {1..20};do tail -1 R$((i))_res|awk '{print $NF}'>>EL_$((i));done); done
for d in */all_*/Phylonet\ Results/deepcoal_count_*/ ; do (cd "$d" && cat EL_*>>EL); done
for d in */all_*/Phylonet\ Results/deepcoal_count_*/ ; do (cd "$d" && perl /home/farah/Downloads/calculate_average_new.pl EL); done


