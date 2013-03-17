#@author Soumya Rath, 24 Feb 2013, IBAB
#----------------------------------------
open(handle1, "$ARGV[0]") or die "can not open the file";
@file1= <handle1>;
system("touch $ARGV[1]");
open(handle_new, ">$ARGV[1]") or die "can not open the file";
$count=0;
#change it 
$threshold=200;
$n=@file1;
@outfile;
$count_new=0;
while($count < $n+1)
{
#identify start location ">gene_"
	if($file1[$count] =~ m/^scaffold/){
	@scaffold_line=split("\t",$file1[$count]);
	#extract scaffold no.
	$scaffold_id='>'.$scaffold_line[0];
	$outfile[$count_new]=$scaffold_id;
	$start=$count_new;
	}
	#beginning identifier
	while($file1[$count] =~ m/protein\ssequence/)
	{
				$length=0;
				$count_new=$count_new+1;
				#end identifier
				while (!($file1[$count] =~ m/end\sgene/))
				{
								
					#first line: [ elimination
					if($file1[$count] =~ m/protein\ssequence/){
					@arr_temp=split(/ /,$file1[$count]);
					$temp=$arr_temp[4];
					# handle ']'
					$temp =~ s/[^a-zA-Z0-9]*//g;
					#compute length 	
					$length=$length+length($temp);
					$outfile[$count_new]=$temp."\n";
				}
								#last line: ] elimination
								elsif($file1[$count] =~ m/\]/){
									@arr_temp=split(/ /,$file1[$count]);
									$temp=$arr_temp[1];
									# handle ']'
									#print "this is tmp $temp";
									$temp =~ s/[^a-zA-Z0-9]*//g;
									#compute length 
									$length=$length+length($temp);
									$file1[$count]=$temp;
									$outfile[$count_new]=$file1[$count]."\n"
									#print handle_new $temp."\n";
								}
								#intermediate lines
								else {
									#handle '#'
									@arr_temp=split(/ /,$file1[$count]);
									$outfile[$count_new]=$arr_temp[1];
									#compute length 
									$length=$length+length($arr_temp[1]);
									}
						$count=$count+1;
						$count_new=$count_new+1;					
						if($count==$n)
						{
						last;
						}
				}
				#concatenate length to scaffold
				$outfile[$start]=$outfile[$start].'|'.$length."\n";
				if($length>$threshold){
				while($start<$count_new){
					print handle_new $outfile[$start];
					$start=$start+1;
					}
				}
				last;
		}				
	$count=$count+1;
}
#$arr_length=@outfile;
#$arr_count=0;
#while($arr_count < $arr_length){
#print handle_new $outfile[$arr_count];
#$arr_count=$arr_count+1;


