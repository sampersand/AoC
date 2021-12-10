# Day 8: we had to read digits off 7-segmented displays
$stdin=open('day8.txt') # omit if reading from stdin

require'set';M=->a,&b{a.map &b};i=M[$<]{|x|l,o=*M[x.chomp.split ?|]{|x|M[
x.split]{_1.chars.to_set}};l=l.group_by &:size;g=->a{l[a][0]};f=->n,&b{l[
00                                                                     +n
].    find      &b};         o.  map(      &{n=      g[2]              =>
1,  m=    g[  4]    =>      4,       g[  3]    =>        7,        g[  0+
7]  =>    8,  f[    +6     ]{        !(  _1    >n        )}        =>  6,
f[              06]{      _1     >=m}                =>9,              f[
6]  {n    <=  _1    &&   !(    _1        >m    )}  =>              0,  f[
5]  {n    <=  _1    ;}  =>     3,        f[    5]  {2              ==  (\
_1    &m).      size   ;}        =>2,      f[5]      {!(n              <=
_1                                                                     )\
&&3==(_1&m).size}=>5}).map(&:to_s).join.to_i};puts(%(part1: #{i.flat_map(
&:digits).count{[1,4,7,8].include?_1}}\npart2:#{i.sum}\nby @sampersand));
