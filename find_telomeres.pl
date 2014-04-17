#!/usr/bin/perl
use strict;
use warnings;

# Accepting input file(s):
#user input
	print "Enter the filename with its absolute path:\n";	
	chomp (my $filename = <STDIN>);
	my $name = my $ext = "";
	my $pos_slash = rindex($filename,"/");
	my $filepath = substr($filename,0,$pos_slash);
	if ($filename =~ m/./)
	{
	        my $pos_dot = rindex($filename,".");
	        $name = substr($filename, $pos_slash+1, $pos_dot-$pos_slash-1);
	        $ext = substr ($filename,$pos_dot);
	}
	else
	{
	        $name = substr($filename,$pos_slash+1);
	}

print "Searching for telomeric regions...\n";

open (R1, "$filename") or die "$!\n";
my $count=0;
while(<R1>)
{
	if($_ =~ m/((g{3,5}.{1,7}){3}g{3,5})+/ig)
	{
		print "$1\n$2\n";
		$count++;
	print "Telomere Found!!\n";
	}
}

print "$count\n";
print "@+";
