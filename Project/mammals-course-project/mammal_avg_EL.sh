*/all_*/Phylonet*/deepcoal*/

#!/bin/bash

for d in */Phylonet/deepcoal_count/ ;do (cd $d && for i in {1..20};do tail -1 Res$((i))_deepcoal|awk '{print $NF}'>>EL_$((i));done); done
for d in */Phylonet/deepcoal_count/ ; do (cd "$d" && cat EL_*>>EL); done
for d in */Phylonet/deepcoal_count/ ; do (cd "$d" && perl /home/farah/Downloads/calculate_average_new.pl EL); done
