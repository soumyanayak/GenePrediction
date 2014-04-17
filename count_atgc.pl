#!/usr/bin/perl
use strict;
#use warnings;

my @file = ('/home/interns/Plant_Genomics/Beta_vulgaris/Beta_vulgaris_vulgaris/Beta_vulgaris_genome/RefBeet-0.9.fasta');

#print "Enter the filename with its absolute path:\n";
#chomp(my $filename = <STDIN>);
for(my$i=0;$i<@file;$i++){
my $filename = $file[$i];
my $basename=my $ext = "";
my $pos_slash = rindex($filename,"/");
my $filepath = substr($filename,0,$pos_slash);
if ($filename =~ m/./)
{
	my $pos_dot = rindex($filename,".");
	$basename = substr($filename, $pos_slash+1, $pos_dot-$pos_slash-1);
	chomp($ext = substr($filename,$pos_dot+1));
}
else
{
	$basename = substr($filename,$pos_slash+1);
}

#print "Enter the genome size (in bases):\n";
#chomp (my $genome_size = <STDIN>);
open (READFILE, "$filename") or die "Cannot open the file!";
open (WRITEFILE, ">/home/interns/Plant_Genomics/atgc_content/$basename.atgc") or die "Cannot create such file!";

my $date = `date`;
print WRITEFILE "Author: soumya Rath\nDate: $date#################################################################################################\n\nSTATISTICS FILE FOR BASE COMPOSITION IN ASSEMBLY\n\nInput file is: $filename\nOutput file is: /home/interns/Plant_Genomics/Amaranthus/IBAB_Sequencing_work/atgc_content/$basename.atgc\n\n";

my $a=my$t=my$g=my$c=my$n_all=my$n=my$size=0;
my @seq = (); my $seq = "";

print "\nReading $basename.$ext...\n\n";

while (<READFILE>)
{
	chomp($_);
	if ($_ !~ m/\>/)
	{
		$a += ($_ =~ tr/A/A/); #translates A to A in $seq, counts the number of translations and stores in $a
		$t += $_ =~ tr/T/T/;
		$g+=$_=~tr/G/G/;
		$c+=$_=~tr/C/C/;
		$n_all+=$_=~tr/N/N/;
		$size += length($_);
#		@seq = split(//,$_);
#		my $array_length = @seq;
		#print "@seq\n";
		#print @seq;
#		print "meeta@seq\nsunil";
#		print "$array_length\n:P :P :P :P\n";
#		$size += @seq;
=begin		print "mommy\n$size\npapa";
#		for (my $i=0;$i<=@seq;$i++)
#		{
#			if ($seq[$i]='N' && $seq[$i+1] ne 'N')
#			{
				$n+=1;
			}
			elsif ($seq[$i]=$seq[$i+1]='N' && $seq[$i+2]ne'N')
			{
				$n+=2;
			}
			elsif ($seq[$i]=$seq[$i+1]=$seq[$i+2]='N' && $seq[$i+3]ne'N')
			{
				$n+=3;
			}
			elsif ($seq[$i]=$seq[$i+1]=$seq[$i+2]=$seq[$i+3]='N' && $seq[$i+4]ne'N')
			{
				$n+=4;
			}
			elsif ($seq[$i]=$seq[$i+1]=$seq[$i+2]=$seq[$i+3]=$seq[$i+4]='N' && $seq[$i+5]ne'N')
			{
				$n+=5;
			}
			elsif ($seq[$i]=$seq[$i+1]=$seq[$i+2]=$seq[$i+3]=$seq[$i+4]=$seq[$i+5]='N' && $seq[$i+6]ne'N')
			{
				$n+=6;
			}
=cut		}
	}
}

close (READFILE);

print "Calculating the statistics...\n\n";

#my $assembly_percent = ($size/$genome_size)*100;	
my $base_assembly_size = ($a+$t+$g+$c);
#my $base_assembly_percent = ($base_assembly_size/$genome_size)*100;
#my $nStretch = $n_all-$n;
#my $percent_nStretch = (($n_all-$n)/$size)*100;
my $percent_at = (($a+$t)/$base_assembly_size)*100;
my $percent_gc = (($g+$c)/$base_assembly_size)*100;
#my $coverage_percent = ($a+$t+$g+$c+$n)/$genome_size *100;

print "Writing to $basename.atgc...\n\n";

#print WRITEFILE "Size of the genome (from literature) = $genome_size bases\n\nSize of the assembly (including Ns) = $size bases = $assembly_percent\%\nNumber of ATGCs sequenced = $base_assembly_size bases = $base_assembly_percent\%\nCoverage achieved (ATGCs + Ns up to a stretch of 6 bases) = \%\n\nTotal number of As in the assembly = $a\nTotal number of Ts in the assembly = $t\nTotal number of Gs in the assembly = $g\nTotal number of Cs in the assembly = $c\nTotal number of Ns (in stretches >6 bases) in the assembly = \%\n\nPercentage AT in the assembly = $percent_at\%\nPercentage GC in the assembly = $percent_gc\%\n\n";

print WRITEFILE "\nSize of the assembly (including Ns) = $size bases\nNumber of ATGCs sequenced = $base_assembly_size bases\n\nTotal number of As in the assembly = $a\nTotal number of Ts in the assembly = $t\nTotal number of Gs in the assembly = $g\nTotal number of Cs in the assembly = $c\nTotal number of Ns in the assembly =$n_all\n\nAT content as precentage of assembly = $percent_at\%\nGC content as percentage of assembly = $percent_gc\%\n\n";

close (WRITEFILE);

print "MISSION ACCOMPLISHED!! :)\n\nThe output file created is /home/interns/Plant_Genomics/atgc_content/$basename.atgc\n\n";
}
