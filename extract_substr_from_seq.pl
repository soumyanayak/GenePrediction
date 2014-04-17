#!/usr/bin/perl
use strict;
use warnings;

#USAGE: perl code.pl <path/input_file.fa> <start_pos> <end_pos> ...

my $input = $ARGV[0];

chomp $input;
my $name = my $ext = "";
my $pos_slash = rindex($input,"/");
my $filepath = substr($input,0,$pos_slash);
if ($input =~ m/./)
{
        my $pos_dot = rindex($input,".");
        $name = substr($input, $pos_slash+1, $pos_dot-$pos_slash-1);
        $ext = substr ($input,$pos_dot);

}
else
{
        $name = substr($input,$pos_slash+1);
}

open(READFILE,"$input") or die "Cannot open the file!\n";
open (WRITEFILE,">$filepath/$name.substr.fa") or die "Cannot create such file!\n";

while (<READFILE>)
{
	if($_!~m/^>/)
	{
		print WRITEFILE ">Sequence in $name from position $ARGV[1] to $ARGV[2] is:\n";
		print WRITEFILE substr($_,$ARGV[1],($ARGV[2]-$ARGV[1])+1);
		print WRITEFILE "\n"
	}
}

close (READFILE);
close (WRITEFILE)

