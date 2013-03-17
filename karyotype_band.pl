use Switch;
system ("clear");
open(READ,"band_input.txt") or die "can not open the file";
open(WRITE,">band_output.txt") or die "can not open the file";
@arr=<READ>;
$i=0;
@chr_end=(30427798,19698334,23459840,18585066,26975577);
@chr_name=("chr1","chr3","chr5","chr6","chr8");

$temp1=0;
while($i<@arr)
{
	@present=split("\t",$arr[$i]);
	@present_out=@present;
	@next=split("\t",$arr[$i+1]);
	$present_out[2]=$present_out[3]="blank";
	switch($present[1])
	{
		case "At1" {$present_out[6]=$chr_name[0];}	
		case "At2" {$present_out[6]=$chr_name[1];}
		case "At3" {$present_out[6]=$chr_name[2];}
		case "At4" {$present_out[6]=$chr_name[3];}
		case "At5" {$present_out[6]=$chr_name[4];}	
	}
	if($present[1] eq $next[1])
	{
		$temp2=$present_out[4];
		$present_out[4]=$temp1;
		$temp1=$present_out[5];
		$present_out[5]=$temp2;	
		print WRITE "@present_out\n";		
		print WRITE "@present";
		
		$i=$i+1;
	}
	#reset $present[4]
	else
	{
		$temp2=$present_out[4];
		$present_out[4]=$temp1;
		$temp1=$present_out[5];
		$present_out[5]=$temp2;
		print WRITE "@present_out\n";
		print WRITE "@present";
		$present_out[4]=$temp1;
		$temp1=0;
		switch($present[1])
		{
			case "At1" {$present_out[5]=$chr_end[0];}	
			case "At2" {$present_out[5]=$chr_end[1];}
			case "At3" {$present_out[5]=$chr_end[2];}
			case "At4" {$present_out[5]=$chr_end[3];}
			case "At5" {$present_out[5]=$chr_end[4];}	
		}
		print WRITE "@present_out\n";		
		$i=$i+1;
	}
}		
		
		
		











