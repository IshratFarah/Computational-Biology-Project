for d in */Astral/sptree_with_max_quartet_consistency/ ; do (cd "$d" && cat * >>QS_); done
for d in */Astral/sptree_with_max_quartet_consistency/ ; do (cd "$d" && grep "Final quartet score is:" QS_>>temp;cut -d ' ' -f5 temp>>QS); done
for d in */Astral/sptree_with_max_quartet_consistency/ ; do (cd "$d" && perl /home/farah/Downloads/calculate_average_new.pl QS); done
