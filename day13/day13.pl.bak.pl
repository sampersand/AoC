$e=<DATA>;
@t=split',',<DATA>=~tr/x\n/1 /r;
$m=inf;
$m>($x=int($e/$_+1)*$_)and$m=$x,$i=$_ for grep!/1/,@t;
print"Part 1: ",($m-$e)*$i,"\n";

@sorted=sort{$b<=>$a}map{$_.' '.$u++}@t;
@idx=map{(split)[1]}@sorted;
@num=map{(split)[0]}@sorted;
$curr=-$idx[0] % $num[0];
$acc = $num[0];
for $i(1..$#num) {
	$curr += $acc until ($curr % $num[$i]) == (-$idx[$i] % $num[$i]);
	$acc *= $num[$i];
}
print "Part 2: $curr\n";
__END__
1000390
23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,383,x,x,x,x,x,x,x,x,x,x,x,x,13,17,x,x,x,x,19,x,x,x,x,x,x,x,x,x,29,x,503,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,37
