
open(handle1, "$ARGV[0]") or die "can not open the file";
@file1= <handle1>;
system("touch $ARGV[1]");
open(handle_new, ">$ARGV[1]") or die "can not open the file";
$count=0;
$threshold=400;
$n=@file1;
while($count < $n+1)
{
	while($file1[$count] =~ m/GENSCAN_predicted_CDS/)
	{
			chomp($eachline);
			@firstline=split('\|',$file1[$count]);
			print 'ouch0';
			@length=split('\_',$firstline[2]);
			print 'ouch1';
			if (@length[0]>$threshold){
				print 'ouch2';
				while (!($file1[$count] =~ m/GENSCAN\s1.0/))
				{
						if (!($file1[$count]=~ m/^\s+/))
						{
							if (!($file1[$count]=~ m/NO\sPEPTIDES\sPREDICTED/ ))
							{
								print $file1[$count];
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





