#!/usr/bin/perl
use strict;
use warnings;

my @files = </home/group1/cgi-bin/biop/misr/dbs/*>;	#file globbing
my @filenames = ();
for(my $i=0;$i<@files;$i++)
{
	my $rindex1 = rindex($files[$i],"/");
	$filenames[$i] = substr($files[$i],$rindex1+1);
	`ln -s $files[$i] /home/group1/cgi-bin/biop/misr/$filenames[$i]`; 
}
