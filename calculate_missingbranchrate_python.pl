$file = $ARGV[0]; # directory path of input file


sub badInput {
  my $message = "Usage: perl $0
	give the input file. it will append to its last the missing branch rate (average) and standard error.\n
	example: 1 1 2 2  it should have such pattern of 4 numbers\n ";
  print STDERR $message;
  die "\n";
}
badInput() if not defined $file;


#$file = 'accumulated_igtp_mdc';		# Name the file

open(INFO, $file);		# Open the file
@lines = <INFO>;		# Read it into an array
close(INFO);			# Close the file
#print "@lines";			# Print the array

my $total_missing = 0;
my $count = 0;
my $mbr = 0;
my $avg_mbr = 0;

$FILTER = "a-zA-Z0-9";
$num = "0-9";

foreach $line (@lines){

$test = $line;   # to test if it is a nonemty file
$test =~ s/[^$FILTER]//go;

if($test){
 #$line =~ /(.*)(^[0-9]*)(\d+)(^[0-9]*)(\d+)(^[0-9]*)(\d+)(^[0-9]*)(\d+)/;


 if ($line =~ /(\()(\d+(\.\d+)?)([^$num]+)(\d+(\.\d+)?)([^$num]+)(\d+(\.\d+)?)(\))/) # (FP, FN, RF) ta decimal number er pattern thakte hobe
		{
		# kheal koro (\d+(\.\d+)?) eta te kintu $2 and $3 chole gese 1.23 hole $2 = 1.23 and $3 = .23
		#print "\n$2 || $5 || $8";		
		$mbr = $5;
		$total_missing = $total_missing + $mbr;
		#print "\nmbr: $mbr";

		$count++;
		}
	}
}

$avg_mbr = $total_missing/$count;
#print "\ntotal: $total_missing";
#print "\ncount: $count";

#print "\n\n missing branch rate: $avg_mbr";

#$output_file = 'accumulated_igtp_mdc';		# Name the file
open(OUT, ">>", $file) or die "can't open $file: $!";
print OUT "\n\ntotal number of valid numbers:\t $count";
print OUT "\naverage missing branch rate:\t $avg_mbr";
# print OUT $avg_mbr;



############### newly added ############## standard error

my $error;
foreach $line (@lines){

$test = $line;   # to test if it is a nonemty file
$test =~ s/[^$FILTER]//go;

if($test){
 #$line =~ /(.*)(^[0-9]*)(\d+)(^[0-9]*)(\d+)(^[0-9]*)(\d+)(^[0-9]*)(\d+)/;

 if ($line =~ /(\()(\d+(\.\d+)?)([^$num]+)(\d+(\.\d+)?)([^$num]+)(\d+(\.\d+)?)(\))/) # 3 ta decimal number er pattern thakte hobe
		{
		
		$mbr = $5;
		$error = $mbr - $avg_mbr;
		#print OUT "\n mbr: $mbr error: $error";
		$error = $error * $error;
		$total_error = $total_error + $error;
		#$total_missing = $total_missing + $mbr;
		#print "\nmbr: $mbr";

		#$count++;
		}
	}
}


	#print "\n total error: $total_error";
	
	$std_dev = $total_error/$count;
	$std_dev = sqrt ($std_dev);
	my $standard_error = $std_dev/ (sqrt($count));
	print OUT "\nstandard error: $standard_error";

close(OUT);
