#!/bin/bash

for i in {1..20};do java -jar /home/farah/PhyloNet/phylonet_v2_4/phylonet_v2_4.jar infer_st -m mdc -x -i Rep$((i))_* -o Res$((i));done
mv Res* Phylonet/infer_st
for i in {1..20};do java -jar /home/farah/PhyloNet/phylonet_v2_4/phylonet_v2_4.jar deep_coal_count /home/farah/Project/11-taxon_Bioinformatics/model_tree Rep$((i))_*>Res$((i))_deepcoal;done
mv *_deepcoal Phylonet/deepcoal_count
for i in {1..20};do java -jar /home/farah/Downloads/ASTRAL-master/Astral.5.5.12/Astral/astral.5.5.12.jar -q /home/farah/Project/11-taxon_Bioinformatics/model_tree -i Rep$((i))_* -o temp$((i)) 2> log$((i))_QS;done
rm temp*
mv log*_QS Astral/quartet_count_from_gt_consistent_with_sptree
for i in {1..20};do java -jar /home/farah/Downloads/ASTRAL-master/Astral.5.5.12/Astral/astral.5.5.12.jar -i Rep$((i))_* -o Res$((i)) 2> log$((i));done
mv log* Astral/sptree_with_max_quartet_consistency
mv Res* Astral/sptree_with_max_quartet_consistency
