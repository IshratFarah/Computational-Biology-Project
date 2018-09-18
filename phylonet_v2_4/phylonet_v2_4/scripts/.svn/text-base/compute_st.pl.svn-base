#!/usr/bin/perl -w


# This perl script will compute the best species tree based on an algorithm described in the paper
# "Accurate and efficient species tree reconstruction from genome-scale multi-locus data under the coalescent",
# by Cuong Than and Luay Nakhleh.


#################### Brief description of what the algorithm (and this script) does ####################
# 1. Generate species tree topologies, which requires the program 'maxclique' (bundled with this package).
# 2. Solve an MILP formulation for each species tree by using 'CPLEX'. 'CPLEX' must be installed, and is not
#    contained in this package.
# 3. Find the best one among these species trees by computing and comparing their eta values.
#
# ASSUMPTION: 'maxclique' and 'CPLEX' must be installed in addition to this Java package. For 'maxclique',
# use the source file contained in this package, because we already modified it to saves its output to a file.
# 
# OPTIONS: two strings $mc_file and $cplex_file are the names of the executable 'maxclique' and 'CPLEX'. You
# can change them to the appropriate locations in your computer. The strings $data_dir and $gt_file are the
# directory that has the file containing gene trees (and where you want to save results), and the file name
# of the file storing gene trees. You can also change them to the appropriate values.
########################################################################################################


use Cwd;


### VARIABLES THAT YOU MIGHT NEED TO MODIFY ###
$mc_file    = "maxclique/maxclique";  # Name and path of the executable 'maxclique' file.
$cplex_file = "cplex";                # Name and path of the executable 'cplex' program.
$data_dir   = "sample";                 # The directory that contains file $gt_file.
$gt_file    = "gt";                   # The file containing gene trees.
$phylo      = "phylonet_v1_5.jar";    # name and path of the latest version of PhyloNet. 
###############################################


# Generate species tree topologies.
$cmd = "java -jar $phylo genst $data_dir/$gt_file $mc_file $data_dir/st_topologies";
system($cmd);

# Run 'CPLEX' for each species tree, and compute its eta values.
$st_index = 1;
$min_eta = -1;
$min_index = -1;

open(ST_TOPOLOGIES, "$data_dir/st_topologies") || die("Cannot open file $data_dir/st_topologies");
open(RESULTS, ">$data_dir/results");

while (defined($line = <ST_TOPOLOGIES>)) {
    # Run 'CPLEX' for the species tree in $line.
    open(TEMP_ST, ">$data_dir/temp_st");
    printf(TEMP_ST $line);
    close(TEMP_ST);

    $cmd = "java -jar $phylo gencplex $data_dir/temp_st $data_dir/$gt_file 1 1";
    system($cmd);
    $cmd = "cat script0 | $cplex_file > output0";
    system($cmd);
    system("rm cplex.log");

    # Compute its eta values, and assign time to the tree.
    if (is_infeasible("output0")) {
        printf("CPLEX cannot find a solution for tree at line $st_index\n");
	printf(RESULTS "INFEASIBLE\n");
    }
    else {
	$missing_num = get_missing_num("var0");
        $deep_coals = get_deep_coals("output0");
	$no_coals = get_no_coals("output0");
	($timed_tree, $root_time) = assign_time("output0", "var0");
	
	printf(RESULTS "$timed_tree $root_time; $missing_num; $deep_coals; $no_coals\n");
    
	if ($min_eta == -1 || $min_eta > ($missing_num + $deep_coals + $no_coals)) {
	    $min_eta = $missing_num + $deep_coals + $no_coals;
	    $min_index = $st_index;
	}
    }

    $st_index = $st_index + 1;
}

printf("Best species tree is the tree at 1-indexed line: $min_index\n");
printf(RESULTS "Best species tree is the tree at 1-indexed line: $min_index\n");

close(RESULTS);
close(ST_TOPOLOGIES);

# Perform cleanup.
system("rm $data_dir/temp_st");
system("rm input0.lp");
system("rm script0");
system("rm var0");
system("rm output0");
system("rm maxclique.input");
system("rm maxclique.output");
system("rm $data_dir/st_topologies");

# Check if the current input to CPLEX is infeasible.
sub is_infeasible {
    my $output = $_[0];
    open(OUTPUT_FILE, $output);

    for ($i = 1; $i <= 30; $i++) {
	if (defined($output_line = <OUTPUT_FILE>)) {
	    if ($output_line =~ /infeasible/) {
		close(OUTPUT_FILE);
		return 1;
	    }
	}
    }

    close(OUTPUT_FILE);
    return 0;
}

# Get the number of deep coalescences.
sub get_deep_coals {
    my $output = $_[0];
    my $line = "";

    open(OUTPUT_FILE, $output);
    while (defined($line = <OUTPUT_FILE>)) {
	if ($line =~ /\'sf\'/) {
	    return 0;
	}
	elsif ($line =~ /sf\s+(d+)/) {
	    return $1;
	}
    }
    close(OUTPUT_FILE);
}

# Get the number of no coalescences.
sub get_no_coals {
    my $output = $_[0];
    my $line = "";

    open(OUTPUT_FILE, $output);
    while (defined($line = <OUTPUT_FILE>)) {
	if ($line =~ /\'sg\'/) {
	    return 0;
	}
	elsif ($line =~ /sg\s+(d+)/) {
	    return $1;
	}
    }
    close(OUTPUT_FILE);
}

# Get the number of missing clades.
sub get_missing_num {
    my $var_file = $_[0];

    # Go to section GENE VARIABLES
    open(VAR_FILE, "$var_file") || die("Could not open $var_file");
    
    my $done = 0;
    my $line = "";
    
    while ($done == 0) {
	if (defined($line = <VAR_FILE>)) {
	    if ($line =~ /GENE/) {
		$done = 1;
	    }
	}
	else {
	    printf("Error when processing the var file\n");
	    exit;
	}
    }

    # Calculate the number of missing clades.
    my $missing_num = 0;

    while (defined($line = <VAR_FILE>)) {
	$line =~ /f\d+:(\d+)/;
	$c = $1;
	$missing_num = $missing_num + (1 - $c);
    }

    close(VAR_FILE);
    return $missing_num;
}

# Assign time to the tree based on 'CPLEX' output.
sub assign_time {
    my $output_file = $_[0];
    my $var_file = $_[1];

    # Get the input tree first.
    open(VAR_FILE, "$var_file") || die("Could not open $var_file");
    
    my $var_line;
    my $input_tree;
    
    $var_line = <VAR_FILE>;
    $var_line = <VAR_FILE>;
    $input_tree = $var_line;

    # Go to the section of species variables in the var file.
    $var_line = <VAR_FILE>;
    $var_line = <VAR_FILE>;

    # Go to the section of variables in the output file.
    open(OUTPUT_FILE, "$output_file") || die("Could not open $output_file");

    my $output_line;
    my $delim = "Objective = ";
    while (defined($output_line = <OUTPUT_FILE>)) {
	if ($output_line =~ /$delim/) {
	    last;
	}
    }

    while (defined($output_line = <OUTPUT_FILE>)) {
	if ($output_line =~ /t\d+/) {
	    last;
	}
    }

    # Get the time.
    my @time_vars = ();
    my @time_values = ();
    my @node_names = ();
    my $done = 0;
    my $pos = 0;

    while ($done == 0) {
	if (!($var_line =~ /(t\d+):(\w+)/)) {
	    printf("Error when parsing the variable file at line: $var_line\n");
	    exit;
	}
	
	$var_line =~ /(t\d+):(\w+)/;
	$time_vars[$pos] = $1;
	$node_names[$pos] = $2;

	my $valid = 0;

	if (!($output_line =~ /t\d+/)) {
	    printf("Error when parsing the CPLEX output file at line: $output_line\n");
	    exit;
	}

	if ($output_line =~ /\'t\d+\'/) {
	    $time_values[$pos] = 0;
	} 
	elsif ($output_line =~ /t\d+/) {
	    chomp($output_line);
	    $output_line =~ /t\d+\s+(.+)/;
	    $time_values[$pos] = $1;
	}

	$pos = $pos + 1;
	
	$var_line = <VAR_FILE>;
	if ($var_line =~ /GENE/) {
	    $done = 1;
	}

	if ($done == 0) {
	    while ($valid == 0) {
		$output_line = <OUTPUT_FILE>;
		if ($output_line =~ /t\d+/ || !defined($output_line)) {
		    $valid = 1;
		}
	    }
	}
    }

    close(VAR_FILE);

    # Change the time in the tree.
    chomp($input_tree);
    for ($k = 0; $k < $pos - 1; $k++) {
	$replace_string = ":$time_values[$k]";
	$input_tree =~ s/$node_names[$k]/$replace_string/;
    }

    return ($input_tree, $time_values[$pos - 1]);
}
