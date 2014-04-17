#!/usr/bin/perl
use strict;
#use warnings;

=begin
#Converting ASCII character to its corresponding integral value
print "Enter an ASCII character\n";
chomp(my $char = <STDIN>);
my $num = ord($char);
print "Value of $char is $num\n";

#Converting an integer (from 32-126) to its corresponding ASCII character
print "Enter any integer from 32 to 126 to get its ASCII value\n";
chomp(my $num = <STDIN>);
my $char = chr($num);
print "Value of $num is $char\n";
=cut

#Taking inputs from the user
print "\nHi, this program will find if there are any low quality reads in your fastq file(s)!!\n\nDo you want to filter one file or many files? [Enter 1 for one file and 2 for many files]:\n";
chomp(my $input = <STDIN>);
my @filename=();

if ($input == 1)
{
	print "\nEnter the file name (with absolute path):\n";
	chomp($filename[0] = <STDIN>);
}

else
{
	print "\nEnter the file names (with their absolute paths) separated by space\n";
	chomp(my $filename = <STDIN>);
	@filename = split(/ /, $filename);
}

print "Enter the value of phred score for filtering:\n";
chomp(my $value1 = <STDIN>);

#Main code block
for (my $i=1;$i<=@filename;$i++)
{
	#### Managing file name(s) and path(s):
	my $pos_slash = rindex($filename[$i-1],'/');
	my $filepath = substr($filename[$i-1],0,$pos_slash);
	my $basename;
	if ($filename[$i-1] =~ m/./)
	{
		my $pos_dot = rindex($filename[$i-1], '.');
	#	print "pos_dot = $pos_dot\n";
		$basename = substr($filename[$i-1],$pos_slash+1,$pos_dot-$pos_slash-1);
	#	print "basename = $basename\n";
	}
	else
	{
		my $basename = substr($filename[$i-1],$pos_slash+1);
	}

	#### Filtering the fastq file(s)
	open (READFILE, "$filename[$i-1]") or die "Cannot open the file\n";
	
	print "\nCreating $basename.$value1.filtered ...\n";
	open (WRITEFILE, ">$filepath/$basename.$value1.filtered") or die "Cannot create such file\n";
	my $date1 = `date`;
	print WRITEFILE "Author: Meeta Sunil\nDate (of creation of file): $date1\n*****************************************************************************************************************************\n\n";

	my $count = my $count_read = my $count_base = my $count_low_read = my $value2 = 0; my @temp1 = my @temp2 = ();
	print "\nReading $basename ...\n";
	while (<READFILE>)
	{
			$count++;
			chomp(my $line = $_);
			#print "$line meeta\n";
			push (@temp1, $line);
			#print @temp1;
			if ($count==4)
			{
				$count_read++;
			#	print WRITEFILE "$count_read\t$temp1[0]\t";
				@temp2 =split(//,$temp1[3]);
				#print "@temp2\n";
				for (my $i=0;$i<=@temp2;$i++)
				{
					$value2 = ord($temp2[$i]);
					if($value2 < 64+$value1)
					{
						$count_base++;
					}
				}
#NOTE: Phred quality score for Illumina FASTQ format ranges from 0 to 40 and the corresponding ASCII values are from 64 to 104 => if $value1=35, corresponding ASCII value=99
				
				my $percent_base = ($count_base/@temp2)*100;
				if ($percent_base > 30)
				{
					$count_low_read++;
				}
	
				$count=0;
				@temp1 = ();
				@temp2 = ();
			}
	}

	print "\nWriting to $basename.$value1.filtered ...\n";
	print WRITEFILE "$count_low_read/$count_read reads have more than 30% of bases with phred quality score less than $value1\n\n";
	my $date2 = `date`;
	print WRITEFILE "Date (of completion of file): $date2";
	
	close(READFILE);
	close(WRITEFILE)
}
print "Done!! :)";

=begin
open (READFILE, "/media/Arun\ Patil/Meeta/AH_paired_end_fastq/PE_R1/xaa") or die "Cannot open the file!\n";
#print <READFILE>;

my $sizeofFile = 0;
while (<READFILE>)
{
	$sizeofFile++;		#counts the total number lines present in the file
}
print "The total number of lines in the fastq file is: $sizeofFile \n";
close (READFILE);

open (READFILE, "/media/Arun\ Patil/Meeta/AH_paired_end_fastq/PE_R1/xaa") or die "Cannot open the file!\n";
my $var1 = ""; my $var2 = ""; my $var3 = ""; my $var4 = ""; my $countRawReads = 0; my $countN = 0; my $countRead = 0;
for (my $i=0; $i < $sizeofFile/4; $i++)
{
	chomp ($var1 = <READFILE>);
		$countRawReads++;
		#print $countRawReads;
		#print "\n";
		#print $var1;
		#print "\n";
		if ($var1 =~ m/\D*:N:/)
		{
			$countN++;
			#print $countN;
			#print "\n";
			#print $var1;
			#print "\n";
		}
		chomp ($var2 = <READFILE>);
		if ($var1 =~ m/\D*:N:/)
		{
			unless ($var2 =~ m/NNNNNNN/)
			{
				$countRead++;
			}
		}
	chomp ($var3 = <READFILE>);
	chomp ($var4 = <READFILE>);
	#print $var1, $var2;
}
print "The total number of raw reads in the fastq file is: $countRawReads\n";
print "The total number of reads that are not junk is: $countN\n";
print "The total number of useful reads in the fastq file is: $countRead\n";

#my $readFileSize = @reads;
#print $readFileSize;
#print "\n";

#Pattern matching for stretches of 7 or more Ns!
#my $read = ""; my $count = 0; my $Ns = "";
#for ($i=0;$i<=$readFileSize;$i++)
#{
#	$read = substr($reads[$i],0,1);
	#print $read;
	#print "\n";

#	if ($read eq 'N' ||  $read eq 'A' || $read eq 'T' || $read eq 'G' || $read eq 'C')
#	{
		#print $read;
		#print "\n";
#		unless ($Ns =~ m/NNNNNNN/)
#		{
#			$count++;
#		}
#	}
	
#}
#print $count;
print "\n"; 

close (READFILE);
