$;=';';
open A, "day11.txt";

while (<A>) {
	chomp,y/L/0/,@_=split '';
	$_[$_]eq'.'or$M{$.,$_}=$_[$_]for 0..($length=$#_);
}
$.=$#_ if$#_>$.;

sub step(&) {
	$m=0,%N=%M;
	$m=0,%N=%M;
	($r,$c)=(split$;),$c=$_[0]->(),($e=$M{$_})?$c>=3+$PART:!$c and$m=1,$N{$_}=!$e for keys%M;
	%M=%N,$m
}

$PART=1;
%B=%M;
$"='+';
0 while step{eval("@{[<\$M\\{$r+{-1,0,1},$c+{-1,0,1}\}>]}")-$M{$r,$c}};
print "Part 1: " . grep(/1/, values(%M)), "\n";
%M=%B;
$"=' ';
# exit;
$PART=2;
0 while step {
	@d=();
	$x=0,eval"@{[glob '$d\[$x++]//=\$M\{$r+{$_,-$_,0},$c+{$_,-$_,0}};']}"for 1..$.;
	grep(/1/, @d) - $M{$r,$c};
};

print "Part 2: " . grep(/1/, values(%M)), "\n";
# for$x(0..$.){
# 	print $M{$x,$_} for(0..$.);
# 	print "\n";
# }

__DATA__
L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL
