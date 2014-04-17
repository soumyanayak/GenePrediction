#!/usr/bin/perl
use strict;
#use warnings;

#my $usage = "USAGE: perl code.pl <path/input_file.fa> <pattern1> <pattern2> <pattern3> ...\n\twhere, pattern starts after '>' and ends before the first white space character in the header line of the input file\n";
my $usage = "USAGE: perl code.pl <path/input_file.fa> <pattern_file>\n\n";

if($ARGV[0] eq undef)
{
	die "\n$usage\n\n";
}

open f1,"$ARGV[1]" or die $!;
my @pattern = <f1>;

chomp ($ARGV[0]);
my $pos_slash = rindex($ARGV[0],"/");
my $filepath = substr($ARGV[0],0,$pos_slash);
my $name = my $ext = "";
if ($ARGV[0] =~ m/./)
{
        my $pos_dot = rindex($ARGV[0],".");
        $name = substr($ARGV[0], $pos_slash+1, $pos_dot-$pos_slash-1);
        $ext = substr ($ARGV[0],$pos_dot);
}
else
{
        $name = substr($ARGV[0],$pos_slash+1);
}

open(READFILE,"$ARGV[0]") or die "Cannot open the file!\n";
open (WRITEFILE,">$filepath/$name.matched.fasta") or die "Cannot create such file!\n";

#for(my $i=1;$i<=@ARGV;$i++){
	#my $output = $ARGV[$i];

#	open (WRITEFILE,">$filepath/$output.fasta") or die "Cannot create such file!\n";

while (<READFILE>)
{
	for(my $i=0;$i<@pattern;$i++)
	{
		chomp($pattern[$i]);
print "meeta $_";
		if($_=~m/$pattern[$i]/)
		{
			print WRITEFILE $_;
			print WRITEFILE scalar <READFILE>;
		}
	}

}
close (READFILE);
close (WRITEFILE)
