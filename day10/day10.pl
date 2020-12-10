# Day 10 in perl.
# "A block (of code) a day keeps the doctor away".

       $"='+';@_=(0,(@_=sort{$a<=>$b}
       <DATA>),$_[-1]+3);$_{$_[$_++]-
       $_[$_]}++for 0..$#_-1;shift@_;
       print"Part 1: ",$_{-1}*$_{-3};
       chomp@_;@m=(1,(0)x$_[$#_]);sub
       x{@_=sort{$a<=>$b}@_;pop}$m[$_
       ]=eval"@m[x(0,$_-3)..($_-1)]",
       for@_;print"\nPart 2: ",$m[-1]

__END__
28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3
