The PhyloNet package requires Java 1.5 (or higher) installed on your computer. All commands in this README file

are assumed to be typed from the directory containing the file 'phylonet_vx_y.jar'. The suffix 'x_y' in the file

name stands for the version of the package. The latest version of PhyloNet is @MAJOR_VERSION@_@MINOR_VERSION@.







1. countcoal

============

The command



	java -jar phylonet_vx_y.jar countcoal -f countcoal1.txt



computes the total number of coalescent scenarios that explain the incongruence present between the two trees

in file countcoal1.txt.  The result is printed to standard out as:



	4





2. lca

======

The command



	java -jar phylonet_vx_y.jar lca -t lca-tree.txt -n lca-node.txt



computes least common ancestors for sets of nodes stored in the file lca-node.txt. The tool outputs:



	((e,(f,g)I3)I4,((a,(b,c)I0)I1,d)I2)I5;

	f

	I2

	I5







3. mast

=======

The command



	java -jar phylonet_vx_y.jar mast -i mast.txt



The command computes a maximum agreement tree (mast) for two trees stored in the file mast.txt.

The result is the tree:	



	((c,b),d);





	java -jar phylonet_vx_y.jar mast -a -i mast.txt



This commands computes all possible MASTs trees for the two trees stored in the file mast.txt.

The tool outputs:



	Number of MASTs: 3

	((a,c),d);

	(d,(b,c));

	((a,b),d);







4. rf

=====

The command



	java -jar phylonet_vx_y.jar rf -m rf-model.txt -e rf-experimental.txt



computes the Robinson-Foulds distance between a model tree and experimental tree. The tool prints four numbers--

the number of false-negavtive edges, the number of false-positive edges, the number of internal edges in the

model tree, and the number of internal edges in the experimental tree--as follows:



	2 2 4 4







5. recomp

=========

The command



	java -jar phylonet_vx_y.jar recomp -w 3 -s 1 -d RF -i recomp1.txt PLAIN -c MAX <paup_path> 20 50 2



runs RECOMP on the sequences in file recomp1.txt.  Window size is 3; step size is 1; Robinson-Foulds is 

used as the distance measure; and the max distance tree set measure is used.  Note that for RECOMP to run

PAUP must be installed locally.  Replace <paup_path> with the absolute filename of the PAUP executable

on your local system.



The output, too long to list here, is written to standard out.  The output has the format:



...

10      1.0

11      0.6703296703296701

12      0.3846153846153847

13      0.3846153846153847

...



Column 1 is the position of the break between the left window and the right window.  The second column is the

tree set distance as measured by the MAX function.







6. riatahgt

===========

	java -jar phylonet_vx_y.jar riatahgt -i ritatahgt.txt



This command reads three trees from the file riatahgt.txt, assuming the first one is the species

tree (st), and the last two are gene trees (gt1, gt2). It then computes HGT solutions for two pairs

(st, gt1) and (st, gt2). The tool's output:


	species tree: ((e,(f,g)I3:0.63)I4,((a,(b,c)I1:0.5)I2:0.5,d)I0)I5;
	gene tree: (((a,b):0.5,c):0.6,(((e,f):0.4,g),d));
	There are 3 component(s), which account(s) for 27 solution(s), each of size 3
	-----------------------------------------------------------------------------------------------------
	Component I5:
	Subsolution1:
		d -> I4 (70.0)
	Subsolution2:
		I4 -> d (80.0)
	Subsolution3:
		I5 -> I2 (70.0) [time violation?]
	-----------------------------------------------------------------------------------------------------
		Component I4:
		Subsolution1:
			I4 -> g  [time violation?]
		Subsolution2:
			e -> f 
		Subsolution3:
			f -> e 
	-----------------------------------------------------------------------------------------------------
		Component I2:
		Subsolution1:
			I2 -> c  [time violation?]
		Subsolution2:
			b -> a 
		Subsolution3:
			a -> b 
	*****************************************************************************************************
	species tree: ((e,(f,g)I3:0.63)I4,((a,(b,c)I0:0.5)I1:0.5,d)I2:0.6)I5;
	gene tree: ((e,(f,g):0.5)I4:0.6,((a,b):0.5,(c,d):0.5):0.57);
	There are 1 component(s), which account(s) for 1 solution(s), each of size 1
	-----------------------------------------------------------------------------------------------------
		Component I2:
		Subsolution1:
			d -> c 
	*****************************************************************************************************
	Consensus network for this set of gene trees
	((e,(f,g)I3:0.63)I4,((a,(b,c)I0:0.5)I1:0.5,d)I2:0.6)I5;


The solutions for each pair of species and gene trees are separated by a line of stars (*). For each

pair, HGT solutions are grouped into components. Therefore, a final solution for a pair of trees consists

of events from sub-solutions of each component. For example, {I5 -> I2, I4 -> g, b -> a} is an HGT

solution for the pair (st, gt1).

You can instruct RIATA-HGT to display full solutions by using the option -e (for eNewick). Below is the output of
Riata when it is invoked with the command:
	
	java -jar phylonet_vx_y.jar riatahgt -i ritatahgt.txt -e

species tree: ((e,(f,g)I3:0.63)I4,((a,(b,c)I1:0.5)I2:0.5,d)I0)I5;
gene tree: (((a,b):0.5,c):0.6,(((e,f):0.4,g),d));
Solution 1
I5=(((d,I6)I7,((a,(b,I10)I1:0.5)I2,I10)I8)I0,I6);
I11=(g);
I6=(((e,(f,I11)I3:0.63)I4,I11)I9);
I10=(c);
-----------------------------------------------------------------------------------------------------
Solution 2
I5=((((c,(b,I9)I11)I1:0.5,I9)I2:0.5,(d,I6)I7)I0,I6);
I9=(a);
I10=(g);
I6=(((e,(f,I10)I3:0.63)I4,I10)I8);
-----------------------------------------------------------------------------------------------------
Solution 3
I5=((((c,I11)I1:0.5,(a,I11)I9)I2:0.5,(d,I6)I7)I0,I6);
I11=(b);
I10=(g);
I6=(((e,(f,I10)I3:0.63)I4,I10)I8);
-----------------------------------------------------------------------------------------------------
Solution 4
I5=(((d,I6)I7,((a,(b,I9)I1:0.5)I2,I9)I8)I0,I6);
I11=(f);
I6=(((g,I11)I3:0.63,(e,I11)I10)I4);
I9=(c);
-----------------------------------------------------------------------------------------------------
Solution 5
I5=((((c,(b,I8)I10)I1:0.5,I8)I2:0.5,(d,I6)I7)I0,I6);
I8=(a);
I11=(f);
I6=(((g,I11)I3:0.63,(e,I11)I9)I4);
-----------------------------------------------------------------------------------------------------
Solution 6
I5=((((c,I10)I1:0.5,(a,I10)I8)I2:0.5,(d,I6)I7)I0,I6);
I10=(b);
I11=(f);
I6=(((g,I11)I3:0.63,(e,I11)I9)I4);
-----------------------------------------------------------------------------------------------------
Solution 7
I5=(((d,I6)I7,((a,(b,I9)I1:0.5)I2,I9)I8)I0,I6);
I10=(e);
I6=(((g,(f,I10)I11)I3:0.63,I10)I4);
I9=(c);
-----------------------------------------------------------------------------------------------------
Solution 8
I5=((((c,(b,I8)I10)I1:0.5,I8)I2:0.5,(d,I6)I7)I0,I6);
I8=(a);
I9=(e);
I6=(((g,(f,I9)I11)I3:0.63,I9)I4);
-----------------------------------------------------------------------------------------------------
Solution 9
I5=((((c,I10)I1:0.5,(a,I10)I8)I2:0.5,(d,I6)I7)I0,I6);
I10=(b);
I9=(e);
I6=(((g,(f,I9)I11)I3:0.63,I9)I4);
-----------------------------------------------------------------------------------------------------
Solution 10
I5=((I7,((a,(b,I10)I1:0.5)I2,I10)I8)I0,(I7,((e,(f,I11)I3:0.63)I4,I11)I9)I6);
I7=(d);
I10=(c);
I11=(g);
-----------------------------------------------------------------------------------------------------
Solution 11
I5=((((c,(b,I9)I11)I1:0.5,I9)I2:0.5,I7)I0,(I7,((e,(f,I10)I3:0.63)I4,I10)I8)I6);
I9=(a);
I7=(d);
I10=(g);
-----------------------------------------------------------------------------------------------------
Solution 12
I5=((((c,I11)I1:0.5,(a,I11)I9)I2:0.5,I7)I0,(I7,((e,(f,I10)I3:0.63)I4,I10)I8)I6);
I11=(b);
I7=(d);
I10=(g);
-----------------------------------------------------------------------------------------------------
Solution 13
I5=((I7,((a,(b,I9)I1:0.5)I2,I9)I8)I0,(((g,I11)I3:0.63,(e,I11)I10)I4,I7)I6);
I7=(d);
I9=(c);
I11=(f);
-----------------------------------------------------------------------------------------------------
Solution 14
I5=((((c,(b,I8)I10)I1:0.5,I8)I2:0.5,I7)I0,(((g,I11)I3:0.63,(e,I11)I9)I4,I7)I6);
I8=(a);
I7=(d);
I11=(f);
-----------------------------------------------------------------------------------------------------
Solution 15
I5=((((c,I10)I1:0.5,(a,I10)I8)I2:0.5,I7)I0,(((g,I11)I3:0.63,(e,I11)I9)I4,I7)I6);
I10=(b);
I7=(d);
I11=(f);
-----------------------------------------------------------------------------------------------------
Solution 16
I5=((I7,((a,(b,I9)I1:0.5)I2,I9)I8)I0,(((g,(f,I10)I11)I3:0.63,I10)I4,I7)I6);
I7=(d);
I9=(c);
I10=(e);
-----------------------------------------------------------------------------------------------------
Solution 17
I5=((((c,(b,I8)I10)I1:0.5,I8)I2:0.5,I7)I0,(((g,(f,I9)I11)I3:0.63,I9)I4,I7)I6);
I8=(a);
I7=(d);
I9=(e);
-----------------------------------------------------------------------------------------------------
Solution 18
I5=((((c,I10)I1:0.5,(a,I10)I8)I2:0.5,I7)I0,(((g,(f,I9)I11)I3:0.63,I9)I4,I7)I6);
I10=(b);
I7=(d);
I9=(e);
-----------------------------------------------------------------------------------------------------
Solution 19
ROOT=(((d,I6)I0,I6,((e,(f,I9)I3:0.63)I4,I9)I7)I5);
I10=(c);
I6=(((a,(b,I10)I1:0.5)I2,I10)I8);
I9=(g);
-----------------------------------------------------------------------------------------------------
Solution 20
ROOT=(((d,I6)I0,I6,((e,(f,I8)I3:0.63)I4,I8)I7)I5);
I9=(a);
I6=(((c,(b,I9)I10)I1:0.5,I9)I2);
I8=(g);
-----------------------------------------------------------------------------------------------------
Solution 21
ROOT=(((d,I6)I0,I6,((e,(f,I8)I3:0.63)I4,I8)I7)I5);
I10=(b);
I6=(((c,I10)I1:0.5,(a,I10)I9)I2);
I8=(g);
-----------------------------------------------------------------------------------------------------
Solution 22
ROOT=((((g,I9)I3:0.63,(e,I9)I7)I4,(d,I6)I0,I6)I5);
I9=(f);
I10=(c);
I6=(((a,(b,I10)I1:0.5)I2,I10)I8);
-----------------------------------------------------------------------------------------------------
Solution 23
ROOT=((((g,I8)I3:0.63,(e,I8)I7)I4,(d,I6)I0,I6)I5);
I8=(f);
I9=(a);
I6=(((c,(b,I9)I10)I1:0.5,I9)I2);
-----------------------------------------------------------------------------------------------------
Solution 24
ROOT=((((g,I8)I3:0.63,(e,I8)I7)I4,(d,I6)I0,I6)I5);
I8=(f);
I10=(b);
I6=(((c,I10)I1:0.5,(a,I10)I9)I2);
-----------------------------------------------------------------------------------------------------
Solution 25
ROOT=((((g,(f,I7)I9)I3:0.63,I7)I4,(d,I6)I0,I6)I5);
I7=(e);
I10=(c);
I6=(((a,(b,I10)I1:0.5)I2,I10)I8);
-----------------------------------------------------------------------------------------------------
Solution 26
ROOT=((((g,(f,I7)I8)I3:0.63,I7)I4,(d,I6)I0,I6)I5);
I7=(e);
I9=(a);
I6=(((c,(b,I9)I10)I1:0.5,I9)I2);
-----------------------------------------------------------------------------------------------------
Solution 27
ROOT=((((g,(f,I7)I8)I3:0.63,I7)I4,(d,I6)I0,I6)I5);
I7=(e);
I10=(b);
I6=(((c,I10)I1:0.5,(a,I10)I9)I2);
*****************************************************************************************************
species tree: ((e,(f,g)I3:0.63)I4,((a,(b,c)I0:0.5)I1:0.5,d)I2:0.6)I5;
gene tree: ((e,(f,g):0.5)I4:0.6,((a,b):0.5,(c,d):0.5):0.57);
Solution 1
I5=((e,(f,g)I3:0.63)I4,((a,(b,I7)I0:0.5)I1:0.5,(d,I7)I6)I2:0.6);
I7=(c);
*****************************************************************************************************
Consensus network for this set of gene trees
((e,(f,g)I3:0.63)I4,((a,(b,c)I0:0.5)I1:0.5,d)I2:0.6)I5;


7. charnet

==========

	java -jar phylonet_vx_y.jar charnet -i charnet.txt -m cluster



This command finds all non-trivial clusters in the network specified in the eNewick format in the file

charnet.txt. A cluster is defined as trivial if it contains just one leaf, or all the leaves in the 

network. Below is the tool's output:



	cluster

	a b c

	e d

	b c

	a b

	e d c

	d c



There are 6 non-trivial clusters in this network, each is on a separate line. Leaves in a cluster are

separated by a blank character.





The command	



	java -jar phylonet_vx_y.jar charnet -i charnet.txt -m tri



computes all tripartitions for all internal nodes, except the root, in the network. Below is the tool's

output



	tri

	a b; c; e d

	e d; c; a b

	b; c; a e d

	d; c; a e b

	c; ; a e b d

	c; ; a e b d



There are also 6 tripartitions for this network. A tripartition for an edge (u, v) has three components: 

A, B, C (in this order), where A is the set of all leaves that are reachable from the root only through

v; B the set of all leaves that are reachable from the root through v, but not necessarily; and C the set

of all leaves that are not reachable from the root through v. The sets A, B, or C can be empty. For example,

the tripartition 'c; ; a e b d' has B as an empty set.





The command



	java -jar phylonet_vx_y.jar charnet -i charnet.txt -m tree



computes trees induced from the network. The network in the file charnet.txt has two trees as follows:



	tree

	((a,(b,c)),(e,d));

	((a,b),((d,c),e));







8. cmpnets

==========

The sample input files include four files for illustrating cmpnets. The three files 'cmpnets-cluster-net1.txt',

'cmpnets-tree-net1.txt' and 'cmpnets-net1.txt' contain the same network, but in different types of representation

(induced clusters, trees, and eNewick format). The other file, 'cmpnets-net2.txt' contains the eNewick

representation of the second network.



The command



	java -jar phylonet_vx_y.jar cmpnets -i cmpnets-net1.txt cmpnets-net2.txt -m cluster



computes the cluster-based distance between the two networks. The output is:



	The cluster-based distance between two networks: 0.8333333333333334 0.8 0.8166666666666667



where 0.833(3), 0.8, and 0.8166(6) are the false-negative, false-positive rates, and average distance, respectively.





The same output is printed when the command



	java -jar phylonet_vx_y.jar cmpnets -i cmpnets-cluster-net1.txt cmpnets-net2.txt



This command still computes the cluster-distance between the two networks. However, the first network are entered

as a list of clusters, so the option '-m cluster' is not necessary.





Both commands



	java -jar phylonet_vx_y.jar cmpnets -i cmpnets-net1.txt cmpnets-net2.txt -m tree

	java -jar phylonet_vx_y.jar cmpnets -i cmpnets-tree-net1.txt cmpnets-net2.txt



compute the tree-distance between the two networks. The tool's output is:



	The tree-based distance between two networks: 1.0 1.0 1.0





The command



	java -jar phylonet_vx_y.jar cmpnets -i cmpnets-net1.txt cmpnets-net2.txt -m tri



computes the tripartition-based distance between two networks. The tool's output is:



	The tripartition-based distance between two networks: 0.5 0.5 0.5



The numbers computed corresponds to the false-negative, false-positive rate, and average distance, respectively.







9. netpars

==========

The command



	java -jar phylonet_vx_y.jar netpars -i netpars-net.txt netpars-sequence.txt -b 3



computes the parsimony of the network stored in the file netpars-net1.txt netpars-net2.txt on the sequence stored in the file

netpars-sequence.txt. The tool's output is:

	The parsimonies for the two neworks: 13.0, 13.0








10. gencplex
============
The command

	java -jar phylonet_vx_y.jar gencplex st gt

generates CPLEX input for species trees in the st file and gene trees in the gt file.







11. coal_infer_st
=================
The command

	java -jar phylonet_vx_y.jar coal_infer_st cplexpath gt
	
infers the species tree from gene trees in file 'gt' by using the Minimize Deep Coalescence criterion. 'cplexpath'
is the path to the executable CPLEX file. The inferred tree will be written to the standard output.







12. infer_st
===================
-------------------
1) MDC
-------------------
The command

	java -jar phylonet_vx_y.jar infer_st -m mdc -i infer_st_mdc1.txt
	
infers the species tree from rooted gene trees in file 'infer_st_mdc1.txt' by using the Minimize Deep Coalescence criterion. This commands infers the species tree by using the dynamic programming approach. The inferred tree is printed to the standard output.

The tool's output is:

	(e:0,(d:0,(c:0,(a:0,b:0):1):2):4):0; 7 extra lineages in total


In the case we sample multiple individuals per species, then in order to infer the species tree, we need to provide
an additional map file that associates each gene tree taxon to a species tree taxon. The command in this case is:

	java -jar phylonet_vx_y.jar infer_st -m mdc -i infer_st_mdc2.txt -a mapfile.txt

The tool's output is:

	(a:1,(c:2,b:2):2):0; 7 extra lineages in total


-------------------
2) MDC with time
-------------------
The command

	java -jar phylonet_vx_y.jar infer_st -m mdc_time -i infer_st_mdc_time.txt
	
infers the species tree from rooted gene trees in file 'infer_st_mdc_time.txt' by using the Minimize Deep Coalescence criterion taking branch lengths of the gene trees into account. This commands infers the species tree by using the dynamic programming approach. The inferred tree is printed to the standard output.

The tool's output is:

	(e:0,(d:0,(c:0,(a:0,b:0):1):2):5):0; 8 extra lineages in total


-------------------
3) MDC on unrooted
-------------------
The command

	java -jar phylonet_vx_y.jar infer_st -m mdc_ur -i infer_st_mdc1.txt
	
infers the species tree from unrooted gene trees in file 'infer_st_mdc1.txt' by using the Minimize Deep Coalescence criterion. This commands infers the species tree by using the dynamic programming approach. The inferred tree is printed to the standard output.

The tool's output is:

	(c:0,((a:0,b:0):1,(d:0,e:0):2):0):0; 3 extra lineages in total


-------------------
4) GLASS
-------------------
The command

	java -jar phylonet_vx_y.jar infer_st -m glass -i infer_st_glass_tree.txt -t tree
	
infers the species tree from gene trees in file 'infer_st_glass_tree.txt' by GLASS. Option '-t' specifies the input file to be trees.

The tool's output is:

	(e,(d,(c,(a,b))));


The command

	java -jar phylonet_vx_y.jar infer_st -m glass -i infer_st_glass_matrix.txt -t matrix
	
infers the species tree from distance matrix in file 'infer_st_glass_matrix.txt' by GLASS. Option '-t' specifies the input file to be distance matrix

The tool's output is:

	(a,(b,(c,d)));


-------------------
5) Majority consensus
-------------------
The command

	java -jar phylonet_vx_y.jar infer_st -m mc -i infer_st_mc.txt
	
infers the species tree from gene trees in file 'infer_st_mc.txt' by using majority consensus. The inferred tree is printed to the standard output.

The tool's output is:

	(e,(d,(c,(a,b))));



-------------------
6) Democratic Vote
-------------------
The command

	java -jar phylonet_vx_y.jar infer_st -m dv -i infer_st_dv.txt
	
infers the species tree from gene trees in file 'infer_st_mc.txt' by using majority consensus. The inferred tree is printed to the standard output.

The tool's output is:

	1 tree(s) has(have) the frequency of 57%
	((((a,b),c),d),e);







13. deep_coal_count
===================
The command

	java -jar phylonet_vx_y.jar deep_coal_count deep_coal_count_stfile.txt deep_coal_count_gtfile.txt
	
counts the number of extra lineages contributed by reconciling gene trees in file 'deep_coal_count_gtfile' into the species tree in file 'deep_coal_count_stfile'.

The tool's output is:

	Species_Tree#1 = ((((a:0,b:0):1,c:0):2,d:0):4,e:0):0;
	Total number of extra lineages: 7






14. process_gt
===================
The command

	java -jar phylonet_vx_y.jar process_gt process_gt_stfile.txt process_gt_gtfile.txt -u
	
refines and roots gene trees in file 'process_gt_gtfile' with respect to the species tree in file 'process_gt_stfile'.

The tool's output is:
	Species_Tree#1 = ((((a,b),c),d),e);
	Resulting gene trees: 
	(e,((c,(a,b)),d));
	(e,(d,(c,(a,b))));
	(e,(d,((a,b),c)));






15. infer_st_bootstrap
===================
The command

	java -jar phylonet_vx_y.jar infer_st_bootstrap -n 10 -s 0.6 -m mdc -i infer_st_bootstrap.txt
	
infers the species tree from gene trees in file 'infer_st_bootstrap.txt' using MDC with bootstrap. The number of repetition is set to 10 and the threshold is set to 0.6.

The tool's output is:
	(e:1.0,(((a:1.0,b:1.0):1.0,c:1.0):0.9,d:1.0):0.9);





16. cal_gtprobinnet
===================
The command

	java -jar phylonet_vx_y.jar cal_gtprobinnet -n cal_gtprobinnet_network.txt -t -n cal_gtprobinnet_gts.txt
	
calculates the probabilities of gene trees in file 'cal_gtprobinnet_gts.txt' in the network in file 'cal_gtprobinnet_network.txt'

The tool's output is:
	((a,b),(c,d));: 0.027223718337197274
	((a,c),(b,d));: 0.027223718337197274
	((b,c),(a,d));: 0.015016158756225514
	(((b,c),a),d);: 0.2652495731550275
	(((b,c),d),a);: 0.6105940397913217
	total probability:0.9453072083769692









