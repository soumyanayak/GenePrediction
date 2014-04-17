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
 
open(READFILE,"$filename") or die "Cannot open the file!\n";
open(WRITEFILE,">$filename.uniq") or die "Cannot create such file!\n";
my $count=0; my $line = '';
while(<READFILE>)
{
	chomp($_);

	#For separating At id and isoform number separated by '.' when At id is in col 1
	if ($_=~m/./)
	{
		my $pos_tab1 = index($_,"\t");
		my $column1 = substr($_,0,$pos_tab1);
		my $column2 = substr($_,$pos_tab1+1,);
		$count += ($column1 =~ (tr/./\t/));
		$line = $column1." ".$column2;
		print WRITEFILE "$line\n";
	}
	

	else
	{
		#$count++;
		$line = $_;
		print WRITEFILE $line;
	}
}
print WRITEFILE "\n$count substitutions were made!\n";
