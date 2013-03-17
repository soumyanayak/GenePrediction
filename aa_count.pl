use POSIX;
open(handle1,"test1.txt") or die "can not open the file";
@file1= <handle1>;

open(handle_new,">aa_count.txt") or die "can not open the file";
$count=0;
foreach $eachline (@file1)
	{
	$count=$count+1;
		if ($eachline =~ m/GENSCAN_predicted_peptide/)
		{
			chomp($eachline);
			@varfile=split(/\|/,$eachline);
			#print "$eachline\n";
			#print "$count\n";
			#print "$varfile[2]\n";
			@aa_len=split(/\_/,$varfile[2]);
			#print "$aa_len[0]\n";
			$x=$aa_len[0];
			@arr=($varfile[0],$varfile[1],$x);
			print "@arr\n";
			$output_vec=join("\t",@arr);
			print handle_new "$output_vec\n";
							
				
			
		}
		
	}
