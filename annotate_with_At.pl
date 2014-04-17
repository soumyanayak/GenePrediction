##This code will help in finding syntenic regions in Ah by sorting the At proteins homologous to Ah scaffolds (at protein level) in the increasing order of their respective loci in At genome

#!/usr/bin/perl
use strict;
#use warnings;

open(READFILE1, "/home/interns/Plant_Genomics/At/parsed_TAIRpep.txt") or die $!;
open(READFILE2, "/home/interns/Plant_Genomics/temp/tblastn_At_vs_Ah_filtered.csv") or die $!;
#open(READFILE2, "/home/interns/Plant_Genomics/Blast_results/TAIRpep_vs_AhG2s_genscan/blastp_AhG2p_vs_Atp_filtered.csv") or die $!;
open(WRITEFILE, ">/home/interns/Plant_Genomics/temp/synteny_At") or die "Cannot create such file\n";
#open(WRITEFILE, ">/home/interns/Plant_Genomics/Blast_results/TAIRpep_vs_AhG2s_genscan/blastp_AhG2p_vs_Atp_annotated.csv") or die "Cannot create such file\n";
#print WRITEFILE "At_Protein_id\tHomologous_Ah_scaffold\tscaffold_length\t\%_identity\tAlignment_length\tAt_start(aa)\tAt_end(aa)\tAh_start(nuc)\tAh_end(nuc)\tevalue\tAt_chr_no.\tAt_start(nuc)\tAt_end(nuc)\tAt_direction(nuc)\tAt_protein_size\tAt_protein_name\n";

#Storing annotation and gene co-ordinates in array
my @pattern = my @append = ();	#@pattern = gene names; @append = annotation and gene co-ordinates' info
while(<READFILE1>)
{
	push(@pattern,substr($_,0,11));
	push(@append, substr($_,12));
}
close(READFILE1);

#creating the output file for identifying synteny
while(<READFILE2>)
{
	chomp $_;
	for(my $i=0; $i<@pattern; $i++)
	{
		if ($_ =~ m/$pattern[$i]/)
		{
			print WRITEFILE "$_\t$append[$i]";
		}
	}
}
close(READFILE2);
close(WRITEFILE)
