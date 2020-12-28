open STDIN,"day14.txt";

sub b36{split"",sprintf"%036b",pop}
for(<>){
	m/k = /?($M=$',next):m/(\d+)] =/;
	$_=$M;$v=$';$x=$1;
	s/X/%d/g;s/0|1/$&%.0s/g;$o{$x}=oct(sprintf"0b$_",b36$v);
	$_=$M;
	s/0/%d/g;s/1|X/$&%.0s/g;$_=sprintf$_,b36$x;for$i(1..2**s/X/%d/g){$t{sprintf$_,reverse b36$i}=$v}
}

print"Part 1: ",eval(join'+',values%o),"\nPart 2: ",eval(join'+',values%t),"\n";
die unless 12135523360904 == eval join '+', values %o; 
die unless 2741969047858 == eval join '+', values %t; 
