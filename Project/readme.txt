Datasets for "Weighted Statistical Binning: enabling statistically consistent genome-scale phylogenetic analyses"
Md. Shamsuzzoha Bayzid, Siavash Mirarab, Bastien Boussau and Tandy Warnow, PLoS ONE, 2015.
____________________________________________________________________________________________________________________________________________

10-taxon datasets: 20 replicates, 200 genes, 100bp

File contents:

   1. Perl script for simulating indelible alignments: post_stidsim.pl
   2. True species trees (Higher ILS): 10-taxon/higher-ILS/true-speciestrees/R<X>.true.tre - where X is the replicate number (1...20).
   3. True species trees (Lower ILS): 10-taxon/lower-ILS/true-speciestrees/R<X>.true.tre - where X is the replicate number (1...20).
   4. True gene tree (Higer ILS): 10-taxon/higher-ILS/true-genetrees/R<X>/<Y>/true.gt - where X is the replicate number (1...20), and Y is the gene id (0001...0200).
   5. True gene trees (Lower ILS): 10-taxon/lower-ILS/true-genetrees/R<X>/<Y>/true.gt - where X is the replicate number (1...20), and Y is the gene id (0001...0200).
   6. Gene alignments (Higer ILS): 10-taxon/higher-ILS/estimated-genetrees/R<X>/<Y>/truegene.phy - where X is the replicate number (1...20), and Y is the gene id (0001...0200).
   7. Gene alignments (Lower ILS): 10-taxon/lower-ILS/estimated-genetrees/R<X>/<Y>/truegene.phy - where X is the replicate number (1...20), and Y is the gene id (0001...0200).
   8. Estimated BestML gene trees (Higher ILS): 10-taxon/higher-ILS/estimated-genetrees/R<X>/<Y>/RAxML_bipartitions.final.f200 - where X is the replicate number (1...20), and Y is the gene id (0001...0200).
   9. Estimated bootstrap gene trees (Higher ILS): 10-taxon/higher-ILS/estimated-genetrees/R<X>/<Y>/RAxML_bootstrap.all - where X is the replicate number (1...20), and Y is the gene id (0001...0200).
  10. Estimated BestML gene trees (Lower ILS): 10-taxon/lower-ILS/estimated-genetrees/R<X>/<Y>/RAxML_bipartitions.final.f200 - where X is the replicate number (1...20), and Y is the gene id (0001...0200).
  11. Estimated bootstrap gene trees (Lower ILS): 10-taxon/lower-ILS/estimated-genetrees/R<X>/<Y>/RAxML_bootstrap.all - where X is the replicate number (1...20), and Y is the gene id (0001...0200).
  12. Estimated BestML supergene trees (Higher ILS): 10-taxon/higher-ILS/estimated-supergenetrees/supergenes-<T>/R<X>/bin.<Z>.txt/RAxML_bipartitions.final.f200 - where X is the replicate number (1...20), T is binning threshold (50 or 75), and Z is the bin id.
  13. Estimated bootstrap supergene trees (Higher ILS): 10-taxon/higher-ILS/estimated-supergenetrees/supergenes-<T>/R<X>/bin.<Z>.txt/RAxML_bootstrap.all - where X is the replicate number (1...20), T is binning threshold (50 or 75), and Z is the bin id.
  14  Estimated BestML supergene trees (Lower ILS): 10-taxon/lower-ILS/estimated-supergenetrees/supergenes-<T>/R<X>/bin.<Z>.txt/RAxML_bipartitions.final.f200 - where X is the replicate number (1...20), T is binning threshold (50 or 75), and Z is the bin id.
  15. Estimated bootstrap supergene trees (Lower ILS): 10-taxon/lower-ILS/estimated-supergenetrees/supergenes-<T>/R<X>/bin.<Z>.txt/RAxML_bootstrap.all - where X is the replicate number (1...20), T is binning threshold (50 or 75), and Z is the bin id.
____________________________________________________________________________________________________________________________________________

15-taxon datasets: 10 replicates (four model conditions: 100gene-100bp, 100gene-1000bp, 1000gene-100bp, 1000gene-1000bp)

File contents:

  1. True species trees: 15-taxon/true-species.tre
  2. True gene trees: 15-taxon/true-genetrees/R<X>/<Y>/<Y>.tre - where X is the replicate number (1...10), and Y is the gene id (1...1000).
  3. Gene alignments: 15-taxon/<model-condition>/estimated-genetrees/R<X>/<Y>/<Y>.fasta - where X is the replicate number (1...10), Y is the gene id  (1...1000), and <model-condition> = 100gene-100bp, 100gene-1000bp, 1000gene-100bp, 1000gene-1000bp.
  4. Estimated BestML gene trees: 15-taxon/<model-condition>/estimated-genetrees/R<X>/<Y>/RAxML_bipartitions.final.f100 - where X is the replicate number (1...10), Y is the gene id  (1...1000), and <model-condition> = 100gene-100bp, 100gene-1000bp, 1000gene-100bp, 1000gene-1000bp.
  5. Estimated bootstrap gene trees: 15-taxon/<model-condition>/estimated-genetrees/R<X>/<Y>/RAxML_bootstrap.all - where X is the replicate number (1...10), Y is the gene id  (1...1000), and <model-condition> = 100gene-100bp, 100gene-1000bp, 1000gene-100bp, 1000gene-1000bp.
  6. Estimated BestML supergene trees: 15-taxon/<model-condition>/estimated-supergenetrees/supergenes-<B>/R<X>/bin.<Z>.txt/RAxML_bipartitions.final.f100 - where B is the binning threshold (50 and 75), X is the replicate number (1...10), Y is the gene id  (1...1000), Z is the bin id and <model-condition> = 100gene-100bp, 100gene-1000bp, 1000gene-100bp, 1000gene-1000bp.
  7. Estimated bootstrap supergene trees: 15-taxon/<model-condition>/estimated-supergenetrees/supergenes-<B>/R<X>/bin.<Z>.txt/RAxML_bootstrap.all - where B is the binning threshold (50 and 75), X is the replicate number (1...10), Y is the gene id (1...1000), Z is the bin id, and <model-condition> = 100gene-100bp, 100gene-1000bp, 1000gene-100bp, 1000gene-1000bp.
____________________________________________________________________________________________________________________________________________

Avian and Mammalian datasets (Siavash et al., Science, 2014): Avian and mammalian simulated datasets, except for the 250bp mammalian model condition, are available at https://www.ideals.illinois.edu/handle/2142/55319
____________________________________________________________________________________________________________________________________________

Mammalian (250bp model condition): 20 replicates, 200 genes, 250bp

File contents:

  1. Gene alignments: mammalian-250bp/estimated-genetrees/R<X>/<Y>/<Y>.fasta - where X is the replicate number (1...20), and Y is the gene id.
  2. Estimated BestML gene trees: mammalian-250bp/estimated-genetrees/R<X>/<Y>/RAxML_bipartitions.final.f200 - where X is the replicate number (1...20), and Y is the gene id.
  3. Estimated bootstrap gene trees: mammalian-250bp/estimated-genetrees/R<X>/<Y>/RAxML_bootstrap.all - where X is the replicate number (1...20), and Y is the gene id.
  4. Estimated BestML supergene trees: mammalian-250bp/estimated-supergenetrees/R<X>/<Y>/RAxML_bipartitions.final.f200 - where X is the replicate number (1...20), and Y is the gene id.
  5. Estimated bootstrap supergene trees: mammalian-250bp/estimated-supergenetrees/R<X>/<Y>/RAxML_bootstrap.all - where X is the replicate number (1...20), and Y is the gene id.
____________________________________________________________________________________________________________________________________________

Please email bayzid AT cs.utexas.edu if you have any questions.
