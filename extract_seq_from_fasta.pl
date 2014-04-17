#!/usr/bin/perl
use strict;
#use warnings;

my $usage = "USAGE: perl code.pl <path/input_file.fa> <pattern1> <pattern2> <pattern3> ...\n\twhere, pattern starts after '>' and ends before the first white space character in the header line of the input file\n";

if($ARGV[0] eq undef)
{
	die "\n$usage\n\n";
}

for(my $i=1;$i<=@ARGV;$i++){
my $input = $ARGV[0];
my $output = $ARGV[$i];
#print "$ARGV[0]\n";
#print "$ARGV[1]\n";

chomp ($input);
#my $name = my $ext = "";
my $pos_slash = rindex($input,"/");
my $filepath = substr($input,0,$pos_slash);
=c
if ($input =~ m/./)
{
        my $pos_dot = rindex($input,".");
        $name = substr($input, $pos_slash+1, $pos_dot-$pos_slash-1);
        $ext = substr ($input,$pos_dot);
}
elsif
{
        $name = substr($input,$pos_slash+1);
}
=cut
open(READFILE,"$input") or die "Cannot open the file!\n";
open (WRITEFILE,">$filepath/$output.fasta") or die "Cannot create such file!\n";

while (<READFILE>)
{
	if(($_=~m/^>$output/) or ($_=~m/^>$output\_/))
	{
		print WRITEFILE $_;
		print WRITEFILE scalar <READFILE>;
	}
}

close (READFILE);
close (WRITEFILE)
}
