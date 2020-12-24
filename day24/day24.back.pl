open STDIN, 'day24.txt';

while(<>){
	$x=$y=0;
	s/(?<![sn])[ew]/$&$&/g;
	/[ew]/?$x:$y+=$_ cmp'o'for split"";
	$T{$x,$y}^=1
}

$T{$_}||delete$T{$_}for keys%T;
print"Part 1: ",0+keys%T;

for(0..99){
	my%h;my%j;
	for (keys %T) {
		my($x,$y)=split$;;
		$h{$x+2,$y}++;
		$h{$x-2,$y}++;
		$h{$x+1,$y+1}++;
		$h{$x+1,$y-1}++;
		$h{$x-1,$y+1}++;
		$h{$x-1,$y-1}++;
	}
	($m=$h{$_})==2||$m==1&&$T{$_}and$j{$_}=1 for keys%h;
	%T=%j;
}
print"\nPart 2: ",0+keys%T,"\n";
# 226
# 274
# 256
# 323
# 285

