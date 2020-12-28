open STDIN, 'day24.txt';

while(<>){$x=$y=0;s/(?<![sn])[ew]/$&$&/g;/[ew]/?$x:$y+=$_
cmp'o'for split"";$T{$x,$y}^=1}$T{$_}||delete$T{$_}for
keys%T;print"Part 1: ",0+keys%T;for(0..99){my%h;my%j;for(
keys%T){($x,$y)=split$;;$_++for@h{2+$x--.$;.$y,--$x.$;.$y--,
++$x.$;.$y++,$x++.$;.++$y,++$x.$;.$y--,$x++.$;.--$y}}($m=$h{
$_})==2||$m==1&&$T{$_}and$j{$_}=1 for keys%h;%T=%j}print"\nPart 2: ",
0+keys%T,"\n";
