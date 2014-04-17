#!/usr/bin/perl
use strict;
#use warnings;

print "\nEnter the absolute path where the assembly files are located (DO NOT PUT '/' AT THE END):\n";
chomp (my $filepath = <STDIN>);
print "\nEnter the input file name (.scafSeq):\n";
chomp(my $filename = <STDIN>);
open (READFILE, "$filepath/$filename") or die $!;
print <READFILE>;
chomp(my @line = <READFILE>);
print @line; #print $line[0];
close (READFILE);

print "\nWhat has been sequenced - 'genome' or 'transcritpome'?\n";
chomp(my $ome = <STDIN>);
print "\nEnter the size (in bases) of the $ome:\n";
chomp(my $ome_size = <STDIN>);
print "\nEnter the title line for your output statistics file (scafStats.txt):\n";
chomp(my $title = <STDIN>);

#`mkdir $filepath/Analysis`;
#open (WRITEFILE1, ">$filepath/Analysis/Scaffold_Seq.fasta") or die "\nCannot create such file!\n";
#open (WRITEFILE2, ">$filepath/Analysis/ScaffoldIndex.txt") or die "\nCannot create such file!\n";
open (WRITEFILE2, ">$filepath/Bv_ScaffoldIndex.txt") or die "\nCannot create such file!\n";
#open (WRITEFILE3, ">$filepath/Analysis/scafStats.txt") or die "\nCannot create such file!\n";
open (WRITEFILE3, ">$filepath/Bv_scafStats.txt") or die "\nCannot create such file!\n";

my $date = `date`;
print WRITEFILE2 "Scaffold_name\tScaffold_length\n";
print WRITEFILE3 "Author: soumya\nDate: $date#################################################################################################\n\n$title\n\n";
open(READFILE, "$filepath/$filename") or die $!;
my $tot_assembly_size = my $a = my $t = my $g = my $c = my $n = 0;
#for(my $i=0; $i < @line; $i++)
my $scaf_name = my $seq = my $scaf_length = "";
while(<READFILE>)
{
	if ($_ =~ m/\>/)
	{
		my $char = " ";		#white space character
		my $index = index($_,$char);	#returns the position of first occurrence of white space character in the string
		$scaf_name = substr($_,1,$index-1);
	}	
	#	while ($line[$x+1] !~ m/\>/ && $x < @line)
	#	{
	#		$seq .= $line[$x+1];
	#		$x++;
	#	}
	else		#for calculating n50 of Bv_nuc.fasta
	{				#for calculating n50 of Bv_nuc.fasta
		$seq=$_;	#for calculating n50 of Bv_nuc.fasta
					#for calculating n50 of Bv_nuc.fasta
	$a += ($seq =~ tr/A/A/); #translates A to A in $seq, counts the number of translations and stores in $a
	$t += $seq =~ tr/T/T/;
	$g+=$seq=~tr/G/G/;
	$c+=$seq=~tr/C/C/;
	$n+=$seq=~tr/N/N/;
		
	$scaf_length = length($seq);
	$tot_assembly_size += $scaf_length;
#print "dnqkwnckn =  $tot_assembly_size\n";
#print ":P = $scaf_length\n"; 
	}

		
#		print WRITEFILE1 ">$scaf_name"; print WRITEFILE1"_$scaf_length\n$seq\n";
		print WRITEFILE2 "$scaf_name\t$scaf_length\n";

}

my $tot_assembly_percent = ($tot_assembly_size/$ome_size)*100;	
my $actual_assembly_size = ($a+$t+$g+$c);
my $actual_assembly_percent = ($actual_assembly_size/$ome_size)*100;
my $percent_n = ($n/$tot_assembly_size)*100;
my $percent_at = (($a+$t)/$tot_assembly_size)*100;
my $percent_gc = (($g+$c)/$tot_assembly_size)*100;

print WRITEFILE3 "Total size of the assembly (including Ns) is $tot_assembly_size bases = $tot_assembly_percent\%\nActual size of the assembly (number of bases sequenced) is $actual_assembly_size bases = $actual_assembly_percent\%\n\nTotal number of As in the assembled $ome is $a\nTotal number of Ts in the assembled $ome is $t\nTotal number of Gs in the assembled $ome is $g\nTotal number of Cs in the assembled $ome is $c\nTotal number of Ns in the assembled $ome is $n\n\nPercentage N in the assembled $ome is $percent_n\%\nPercentage AT in the assembled $ome is $percent_at\%\nPercentage GC in the assembled $ome is $percent_gc\%\n\n";

#close (WRITEFILE1);
close (WRITEFILE2);

##### Creating sortedScaffoldIndex.txt
#sort -nr -k2 $filepath/Analysis/ScaffoldIndex.txt > $filepath/Analysis/sorted_ScaffoldIndex.txt`;
system(" touch $
##### Making an array of all the scaffold_sizes in decreasing order
open (SCAFFOLD_INDEX, "$filepath/Analysis/sorted_ScaffoldIndex.txt") or die "Cannot open the file!\n";
my @array; my $count = 1;	#since the file has headers (Scaffold_name and Scaffold_length) in one line
while (<SCAFFOLD_INDEX>)
{
	$count++;
	my $char = "\t";
	my $index = index($_,$char);
	my $value = substr($_,$index+1);
	push (@array, $value);
}
chomp(my $x = $array[0]); print WRITEFILE3 "The total number of scaffolds is $count\nLength of the longest scaffold is $x bases\n\n";
close (SCAFFOLD_INDEX);

##### Calculating total size of the assembly
my $sum1=0;
for (my $i=0; $i<@array; $i++)
{
	$sum1 += $array[$i];
} 
print WRITEFILE3 "Total size of the assembly is $sum1 bases\n";
my $N50_length = $sum1/2; my $last_scaffold_length;

##### Calculating N50
my $sum2=0; my $count=0;
for (my $i=0; $i<@array; $i++)
{
	unless ($sum2 >= $N50_length)
	{
		$sum2 += $array[$i];
		chomp($last_scaffold_length = $array[$i]);
		$count++;
	}
} 
print WRITEFILE3 "50% of the assembly is achieved at $sum2 bases\nN50 = $last_scaffold_length\nNumber of scaffolds above N50 (N) = $count\n\n";

##### Calculating NG50
my $NG50_length = $ome_size/2;
print WRITEFILE3 "Size of the $ome is approximately $ome_size bases\n50% of the $ome will be achieved at approximately $NG50_length bases\n";
if ($sum1 >= $NG50_length)
{
	my $sum=0; my $last_scaffold_length; my $count=0;
	for (my $i=0; $i<@array-1; $i++)
	{
		unless ($sum >= $NG50_length)
		{
			$sum += $array[$i];
			chomp($last_scaffold_length = $array[$i]);
			$count++;
		}
	}
	print WRITEFILE3 "NG50 = $last_scaffold_length\nNumber of scaffolds above NG50 (NG) = $count\n";
}
else
{
	print WRITEFILE3 "Size of the assembly is less than 50% of the size of the genome. Hence, NG50 cannot be calculated!";
}
print "\n\n";

my $date = `date`;
print WRITEFILE "End date: $date";

close (WRITEFILE3)
