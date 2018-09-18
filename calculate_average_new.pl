$file = $ARGV[0]; # directory path of input file
$col_n = $ARGV[1]; # numbers are in which column?
##!!!!!!! COLUMN NUMBER STARTS FROM 0. SO GIVE THE ORIGINAL NUMBER -1;

sub badInput {
  my $message = "Usage: perl $0
	give the input file and the column (column -1 since column starts from 0) to be considered. it will append to its last the average of the values in column $col.\n
	example: \n ";
  print STDERR $message;
  die "\n";
}
badInput() if not defined $file;
print STDERR "warning: COLUMN NUMBER STARTS FROM 0. SO GIVE THE ORIGINAL NUMBER -1\n";

open(INFO, $file);		# Open the file
@lines = <INFO>;		# Read it into an array
close(INFO);	

#print "\n lines: @lines";

open(OUT, ">>", $file) or die "can't open $file: $!";

my $num = "0-9";
$FILTER = "a-zA-Z0-9";

	my $cost = 0;
	my $line_count = 0;

	foreach  $line (@lines){

		$test = $line;   # to test if it is a nonemty file
		$test =~ s/[^$FILTER]//go;
		if ($test){
			@col=split(/ /,$line);
			#print "\nthis is the col: $col[$col_n]";
			$sum += $col[$col_n];
			$line_count++;
		}
	}

	my $avg = $sum/$line_count;

	
	print OUT "\naverage value: $avg";
	print OUT "\ntotal number considered: $line_count";
	
	

#now standard error

my $error = 0;
my $total_error = 0;
my $std_dev = 0;
$line_count = 0;
$count = 0;
	foreach  $line (@lines){

		$test = $line;   # to test if it is a nonemty file
		$test =~ s/[^$FILTER]//go;
		if ($test){
			@col=split(/ /,$line);
			$error = $col[$col_n] - $avg;
			$error = $error * $error;
			$total_error = $total_error + $error;
			$line_count++;
			}
			
		}

	$std_dev = $total_error/$line_count;
	$std_dev = sqrt ($std_dev);
	my $standard_error = $std_dev/ (sqrt($line_count));
	print OUT "\nstandard error: $standard_error";


