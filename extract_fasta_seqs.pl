#!/usr/bin/perl
use strict;
use warnings;

#USAGE: perl code.pl <path/input_file> <output_file>

my $input = $ARGV[0];
my $output = $ARGV[1];
my $pos_slash = rindex($input,"/");
my $filepath = substr($input,0,$pos_slash);

chomp ($input);
open(READFILE,"$input") or die "Cannot open the file!\n";
open (WRITEFILE,">$filepath/$output.fasta") or die "Cannot create such file!\n";

while (<READFILE>)
{
	if($_=~m/^>/)
	{
		print WRITEFILE $_;
		print WRITEFILE scalar <READFILE>;
	}
}

close (READFILE);
close (WRITEFILE);
$input = ();
