$* << 'input.txt' if $*.empty?

$g=Set[]
x=0;$<.map{|l|x+=1;y=0;l.chars{|c|y+=1;c==?@&&$g<< x+y.i}}
def n(k)=[-1-1i,-1,-1+1i,-1i,1i,1-1i,1,1+1i].count{$g.include?k+it}
o=t=0
(
  r=$g.select{n(it)<4};x=r.size
  0==o&&o=x
  t+=x
  l=$g.size
  $g-=r
)while$g.size!=l
p [o, t]

fail unless t == 8277
fail unless o == 1349
