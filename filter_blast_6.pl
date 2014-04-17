#!/usr/bin/perl
use strict;
#use warnings;

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
chomp (my $value1 = <STDIN>);
print "Enter value for filtering alignment length:\n";
chomp(my $value2 = <STDIN>);

open(READFILE,"$filename") or die "Cannot open the file!\n";
open(WRITEFILE,">$filepath/temp.csv") or die "Cannot create such file!\n";
my $count1= my$count2 =0;my $line="";	
while(<READFILE>)
{
	chomp($_);
=begin
	#For separating Scaffold number and scaffold length when scaffolds of White are used (Scaffold#_length)
	if ($_=~m/_/)
	{
		my $pos_tab1 = index($_,"\t");
		my $temp_string = substr($_,$pos_tab1+1);
		my $pos_tab2 = index($temp_string,"\t");

		my $column1 = substr($_,0,$pos_tab1);
		my $column2 = substr($_,$pos_tab1+1,$pos_tab2);
		my $column3 = substr($_,$pos_tab2+$pos_tab1+2);
		$count1 += ($column2 =~ (tr/_/\t/));
		$line = $column1."\t".$column2."\t".$column3;
	}
	else
	{
		$count1++;
		$line = $_;
	}
=cut
	my @temp = split("\t",$_); 
#	if ($temp[3] >= $value1)	#when white scaffolds are used
	if ($temp[2] >= $value1)
	{
#		if ($temp[4] >=$value2)	#when white scaffolds are used
		if ($temp[3] >=$value2)
		{
			print WRITEFILE "$_\n";
			$count2++;
		}
	}
}
close(READFILE);
close(WRITEFILE);

#`sort -t\$'\t' -k3nr,3 -k4nr,4 -k5nr,5 -k10nr,10 -k12r,12 $filepath/temp.csv -o $filepath/temp1.csv`; #when white scaffolds are used
`sort -t\$'\t' -k3nr,3 -k4nr,4 -k9nr,9 -k11r,11 $filepath/temp.csv -o $filepath/temp1.csv`;

#`cut -f1-5,8-12 $filepath/temp1.csv > $filepath/temp2.csv`;	#when white scaffolds are used
`cut -f1-4,7-11 $filepath/temp1.csv > $filepath/temp2.csv`;

open(READFILE,"$filepath/temp2.csv") or die "Cannot open the file!\n";
my $writefile = $name."_filtered.csv";
open(WRITEFILE,">$filepath/$writefile") or die "Cannot create such file!\n";
#my $count_percent = $count2/$count1 *100;	#when white scaffolds are used
#print WRITEFILE "Total $count2 of $count1 ($count_percent %) queries were filtered\nFilters: >= $value1 % identity and >= $value2 alignment length\n *************************************************************************************************************************************\n\n";	#when white scaffolds are used
print WRITEFILE "Filters: >= $value1 % identity and >= $value2 alignment length\n *************************************************************************************************************************************\n\n";
#print WRITEFILE "Query_id\tSubject_id\tS_length\t% Identity\tAlign_len\tQ_start\tQ_end\tS_start\tS_end\tEvalue\n"; #when white scaffolds are used
print WRITEFILE "Query_id\tSubject_id\t% Identity\tAlign_len\tQ_start\tQ_end\tS_start\tS_end\tEvalue\n";

while (<READFILE>)
{
	print WRITEFILE $_;
}
close(READFILE);
close(WRITEFILE);

`rm $filepath/temp.csv $filepath/temp1.csv $filepath/temp2.csv`
