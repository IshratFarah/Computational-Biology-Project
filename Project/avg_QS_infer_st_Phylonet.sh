#!/bin/bash

for d in */Phylonet/infer_st/ ; do (cd "$d" && cat log* >>QS_); done
for d in */Phylonet/infer_st/ ; do (cd "$d" && grep "Final quartet score is:" QS_>>temp;cut -d ' ' -f5 temp>>QS); done
for d in */Phylonet/infer_st/ ; do (cd "$d" && perl /home/farah/Downloads/calculate_average_new.pl QS); done

