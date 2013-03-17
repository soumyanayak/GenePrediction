open(handle1,"test2.pl") or die "can not open the file";
#open(handle_out, ">outputfile_new2.fa")or die "cannot open the file";

@file1= <handle1>;
$n=@file1;

for($i=0;$i<$n-1;$i=$i+2)
{
#print handle_out;
open(handle_out, "+>outputfile_new2.fa")or die "cannot open the file";
$output1=@file1[$i];
$output2=@file1[$i+1];
print handle_out "$output1";
print handle_out "$output2";
close(handle_out);
#system("rm outputfile_new2.fa");
#system("touch outputfile_new2.fa");

}
