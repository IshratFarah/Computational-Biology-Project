#!/bin/bash

for d in */Astral/sptree_with_max_quartet_consistency/ ; do (cd "$d";for i in {1..20};do perl /home/farah/Project/strip_edge_support.pl -i Res$((i)) -o Res$((i))_stripped;done); done
for d in */Astral/sptree_with_max_quartet_consistency/ ; do (cd "$d"; for i in {1..20};do java -jar /home/farah/PhyloNet/phylonet_v2_4/phylonet_v2_4.jar deep_coal_count /home/farah/Project/11-taxon_Bioinformatics/model_tree Res$((i))_stripped>EL$((i));done); done
for d in */Astral/sptree_with_max_quartet_consistency/ ;do (cd "$d" && for i in {1..20};do tail -1 EL$((i))|awk '{print $NF}'>>EL_$((i));done); done
for d in */Astral/sptree_with_max_quartet_consistency/ ; do (cd "$d" && cat EL_*>>EL); done
for d in */Astral/sptree_with_max_quartet_consistency/ ; do (cd "$d" && perl /home/farah/Downloads/calculate_average_new.pl EL); done




