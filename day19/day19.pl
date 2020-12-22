# open STDIN, 'day19.txt';
# open STDIN, DATA;


while(<DATA>){
	/^$/&&last;
	$prog.="_$.:";
	print $prog, "\n";
}
exit;
$l='(?=';
$/="";
for(sort{"1$b"<=>"1$a"}split"\n",<DATA>){
	s/\d+(?!:)/\\g<x$&>/g;
	s/[\s:"]//g;
	m/\d+/;
	$l.="(?<x$&>$')";
}

print /$l/;
exit;

print keys %l;
	# ="(?=$_)?\\A\\g<x0>\\Z";

$/='';

$_=<DATA>;
s/8: 42/$& 8 |42/;
s/11: 42 31/$& | 42 11 31/;
print$x;
# exit;
undef$/;
m/$x/&&$c++while(<DATA>);
print;

__END__
2: 4 4 | 5 5
0: 4 1 5
1: 2 3 | 3 2
3: 4 5 | 5 4
4: "a"
5: "b"

ababbb
bababa
abbbab
aaabbb
aaaabbb
