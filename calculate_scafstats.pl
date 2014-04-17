#!/usr/bin/perl
use strict;
#use warnings;

#USAGE: perl ms_calculate_scafstats.pl <path/AhG2s.fa> <path/output_file> 50 90		#50 to calculate N50, 90 for N90;

open READ, "$ARGV[0]" or die "$!";
open WRITE, ">temp1.txt" or die "Cannot create such file!\n";

my $scaf_name = "";my $scaf_length = my $length = my $a = my $count_a = my $t = my $count_t = my $g = my $count_g = my $c = my $count_c = my $n = my $count_n = 0;
while(<READ>)
{
	chomp;
	if($_=~m/>/)
	{
		$scaf_name = $_;
	print WRITE "$scaf_name\t";
	}
	else
	{
		$scaf_length = length($_);
		$length += $scaf_length;
		my $a = $_=~tr/A/A/;
		$count_a += $a;
		my $t = $_=~tr/T/T/;
		$count_t += $t;
		my $g = $_=~tr/G/G/;
		$count_g += $g;
		my $c = $_=~tr/C/C/;
		$count_c += $c;
		my $n = $_=~tr/N/N/;
		$count_n += $n; 
	print WRITE "$scaf_length\t$a\t$t\t$g\t$c\t$n\n";
	}
}
close(READ);
close(WRITE);

#Statistics:
`cut -f2 temp1.txt > temp2.txt`;
`sort -nr temp2.txt > temp3.txt`;
chomp(my $longest_scaf = `head -1 temp3.txt`);

open READ,"temp3.txt" or die "$!\n";
open WRITE,">$ARGV[1]" or die "Cannot create such file!\n";

my $N50 = $ARGV[2]/100 * $length;
#print "$N50\n";
my $N90 = $ARGV[3]/100 * $length;
#print "$N90\n";

my $size = my $count = my $count1 = my $count2 = my $last_scaffold_length1 = my $last_scaffold_length2 = 0;
while(<READ>)
{
	chomp;
	unless ($size >= $N50)
	{
		$size += $_;
		chomp($last_scaffold_length1 = $_);
		$count1 = $count++;
	}
	unless ($size >= $N90)
	{
		$size += $_;
		chomp($last_scaffold_length2 = $_);
		$count2 = $count++;
	}
} 

print WRITE "Total assembly size = $length\n\nTotal number of bases:\nA\t$count_a\nT\t$count_t\nG\t$count_g\nC\t$count_c\nN\t$count_n\n\nLength of the longest scaffold = $longest_scaf\nN50 = $last_scaffold_length1\nNumber of scaffolds above N50 = $count1\nN90 = $last_scaffold_length2\nNumber of scaffolds above N90 = $count2\n";
close(WRITE);
#`cat >> $ARGV[1] temp3.txt`;
`sort -k2 -nr temp1.txt > transcript_index.txt`;
#`rm temp?.*`;
