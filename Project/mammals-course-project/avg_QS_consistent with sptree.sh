for d in */all_*/Astral\ Results/quartet_count_from_gt_consistent_with\ _sptree/log/ ; do (cd "$d" && cat * >>QS_); done
for d in */all_*/Astral\ Results/quartet_count_from_gt_consistent_with\ _sptree/log/ ; do (cd "$d" && grep "Final quartet score is:" QS_>>temp;cut -d ' ' -f5 temp>>QS); done
for d in */all_*/Astral\ Results/quartet_count_from_gt_consistent_with\ _sptree/log/ ; do (cd "$d" && perl /home/farah/Downloads/calculate_average_new.pl QS); done
