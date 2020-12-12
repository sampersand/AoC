# Part 1: 1457
# Part 2: 106860
# [Finished in 0.3s]

$o[2]=1;
@t[2..3]=(10,1);

open A, "day12.txt";
for (<A>) {
	/./;$n=$';$n*=-1 if/[SWR]/;$n/=90 if/[LR]/;
	$o[/[NS]/]+=$n,$t[2+/[NS]/]+=$n if/^[EWNS]/;

	if(/^[LR]/) {
		@o[2..3]=((0<=>$n)*$o[3],($n<=>0)*$o[2]),
		@t[2..3]=((0<=>$n)*$t[3],($n<=>0)*$t[2])for(1..abs$n);
	}
	@o[0..1]=map{$o[$_]+$n*$o[2+$_]}0..1,@t[0..1]=map{$t[$_]+$n*$t[2+$_]}0..1 if/^F/
}

print "Part 1: ", abs($o[0])+abs($o[1]), "\n";
print "Part 2: ", abs($t[0])+abs($t[1]), "\n";
# print "@o\n@t\n";
__END__
F10
N3
F7
R90
F11
