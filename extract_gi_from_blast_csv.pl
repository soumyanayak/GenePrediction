#! /usr/bin/perl -w
use strict;

my $var = '/home/workshop/Meeta/blast_files/AhT5s_vs_nr_nt/csv_out.txt';

open(r1,"/home/workshop/Meeta/blast_files/AhT5s_vs_nr_nt/AhT5s_vs_nr_nt.csv") or die $!;
open(w1,">$var") or die "\nCannot create such file!\n\n";
#open(w2,">/home/workshop/Meeta/blast_files/AhT5s_vs_nr_nt/test.txt") or die "\nCannot create such file!\n\n";
open(w3,">/home/workshop/Meeta/blast_files/AhT5s_vs_nr_nt/gi.txt") or die "\nCannot create such file!\n\n";

my @gi = ();
while(<r1>)
{
	chomp $_;
	my @a1 = split(/\t/,$_);
	my @a2 = split(/\|/,$a1[1]);
	print w1 $a1[0]; print w1 "\t"; print w1 $a2[1]; print w1 "\t"; print w1 $a1[2]; print w1 "\t"; print w1 $a1[3]; print w1 "\n";
	#push(@gi,$a2[1]);
	print w3 $a2[1]; print w3 "\n";
}
close(r1);
close(w1);
close(w3);
`sort -n /home/workshop/Meeta/blast_files/AhT5s_vs_nr_nt/gi.txt | uniq  > /home/workshop/Meeta/blast_files/AhT5s_vs_nr_nt/gi_uniq.txt`;

=begin
my %gi = @gi; my %nr_nt_gi = (); my $key; my $val;
open(r2,"/home/workshop/Databases/NCBI-BLAST_Databases/nr_nt/gi_entries_in_nr_nt.txt") or die $!;
while(<r2>)
{
	chomp($_);
	($key, $val)  = split(/\t/,$_);
	$gi{$key}=$val;
#	print"$key\t$val\n";
	#%gi = ($line[0]=>$line[1]);
	#$gi{$key} .= exist $gi{$key} ? ",$val" : $val;	#This walks through every line splitting on tab and either adds an entry or appends to an existing entry in the hash table.
}
#print %gi;

foreach $key(%gi)
{
	print w2 $key; print w2 "\t"; print w2 $gi{$key}; print w2 "\n";
}
=begin
if(exists $gi{437103})
{
	print "yes!\n";
}

