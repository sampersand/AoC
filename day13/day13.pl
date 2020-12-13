$e=<DATA>;
@t=split',',<DATA>;
$m=inf;
($x=int($e/$_+1)*$_)<$m and$m=$x,$i=$_ for grep!/x/,@t;

print "Part 1: ", ($m - $e) * $i;
print @x;
__END__
939
7,13,x,x,59,x,31,19
