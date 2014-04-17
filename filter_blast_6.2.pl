#!/usr/bin/perl
use strict;
use warnings;

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

print "Enter value for filtering % identity:\n";
chomp (my $value2 = <STDIN>);
print "Enter value for filtering alignment length:\n";
chomp (my $value3 = <STDIN>);
print "Enter e-value for filtering:\n";
chomp(my $evalue = <STDIN>);

open(READFILE,"$filename") or die "Cannot open the file!\n";
open(WRITEFILE,">$filepath/temp.csv") or die "Cannot create such file!\n";

my $count1= my$count2 =0;my $line="";
while(<READFILE>)
{
	chomp($_);
	$count1++;
	$line = $_;
	
	my @temp = split("\t",$line); 
	if ($temp[-2] <= $evalue)
	{
		if ($temp[2] >=$value2 and $temp[3] >= $value3 )
		{
			print WRITEFILE "$line\n";
			$count2++;
		}
	}
}
close(READFILE);
close(WRITEFILE);

`sort -t\$'\t' -k3nr,3 -k4nr,4 -k5nr,5 -k10nr,10 -k12r,12 $filepath/temp.csv -o $filepath/temp1.csv`;
`cut -f1-4,7-11 $filepath/temp1.csv > $filepath/temp2.csv`;

open(READFILE,"$filepath/temp2.csv") or die "Cannot open the file!\n";
my $writefile = $name."_filtered.csv";
open(WRITEFILE,">$filepath/$writefile") or die "Cannot create such file!\n";
my $count_percent = $count2/$count1 *100;
#print WRITEFILE "Total $count2 of $count1 ($count_percent %) queries were filtered\nFilters: >= $value1 % identity and >= $value2 alignment length\n *************************************************************************************************************************************\n\n";
print WRITEFILE "Query_id\tSubject_id\t% Identity\tAlign_len\tQ_start\tQ_end\tS_start\tS_end\tEvalue\n";

while (<READFILE>)
{
	print WRITEFILE $_;
}
close(READFILE);
close(WRITEFILE);

`rm $filepath/temp.csv $filepath/temp1.csv $filepath/temp2.csv`
