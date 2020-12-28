$/='';
open STDIN,"day16.txt";
%R=();

for(split"\n",<>){
	my($l,$x,$y,$z,$w)=m/([^:]+): (\d+)-(\d+) or (\d+)-(\d+)/;
	$R{$l}=sub{$q=$_[0];$x<=$q&&$q<=$y||$z<=$q&&$q<=$w};
}

@C=map{[]}0..$#{[@M=split",",${[split"\n",<>]}[1]]};
@tmp=split"\n",<>;shift@tmp;
for $t(map{[split',']}@tmp){
	@t=@$t;for$f(@t){grep{$_->($f)}values%R or($s+=$f),goto d}push$C[$_],$t[$_]for 0..$#t;d:
}

die unless $s == 19093;
print "Part 1: $s\n";

for(0..$#C){
	@c=@{$C[$_]};$m=[];
	for$k(keys%R){$R{$k}->($_)||goto n for@c;push$m,$k;n:}
	$T{$_}=$m;
}

$s{$a{$_}=$x=${[grep{!exists$s{$_}}@{$T{$_}}]}[0]}=1 for sort{$#{[@{$T{$a}}]}<=>$#{[@{$T{$b}}]}}keys%T;

$S=1;
$a{$_}=~/departure/ and$S*=$M[$_]for keys%a;
print "Part 2: $S";
die unless $S == 5311123569883;
