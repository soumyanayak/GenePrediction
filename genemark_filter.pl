#@author Soumya Rath, 24 Feb 2013, IBAB
#----------------------------------------
open(handle1, "$ARGV[0]") or die "can not open the file";
@file1= <handle1>;
system("touch $ARGV[1]");
open(handle_new, ">$ARGV[1]") or die "can not open the file";
$count=0;
#change it 
$threshold=0;
$n=@file1;
while($count < $n+1)
{
#identify start location ">gene_"
	if($file1[$count] =~ m/The\sname\sof\sthe\sseq\sis/){
	
	@scaffold_line=split(/ /,$file1[$count]);
	#@scaffold_name=split(//,$scaffold_line[6]);
	$temp=$scaffold_line[6];
	$temp=substr($temp,1);	
	#$scaffold_name=substr($scaffold_name[1],1);
	#$scaffold=join(
	}
	while($file1[$count] =~ m/>gene_/)
	{
			#chomp($file1[$count]);s
			@firstline=split('\|',$file1[$count]);
			#print 'ouch0';
			@length=split('\_',$firstline[2]);
			#print 'ouch1';
			if (@length[0]>$threshold){
				#print 'ouch2';

				#end identifier
				while (!($file1[$count] =~ m/The\sname\sof\sthe\sseq\sis/))
				{
						if (!($file1[$count]=~ m/^\s+/))
						{
								if($file1[$count] =~ m/gene_/){
								chomp($file1[$count]);
								$file1[$count]=$file1[$count].'|'.$temp;					
								print handle_new $file1[$count];
								}
								else{
								#print $file1[$count];
								print handle_new $file1[$count];
						}
						}
						else
						{
							last;
						}
						$count=$count+1;					
						if($count==$n)
						{
						last;
						}
				}
				

				last;
			}
			else
			{
				last;
			}
	}		
$count=$count+1;

}





