$stdin=open('day8.txt')

require'set'
i = $<.map{|x|l,o=*x.chomp.split(?|).map{|x|x.split.map{|_1|_1.chars.to_set}}
  l=l.group_by &:size
  f=->n,&b{l[n].find &b}
  g=->a{l[a][0]}
  o.map(&{
    n=l[2][0]=>1,
    m=l[4][0]=>4,
    l[3][0]=>7,
    l[7][0]=>8,
    f[6]{|_1|!(_1>n)}=>6,
    f[6]{|_1|_1>m}=>9,
    f[6]{|_1|_1>n&&!(_1>m)}=>0,
    f[5]{|_1|_1>n}=>3,
    f[5]{|_1|(_1&m).size==2}=>2,
    f[5]{|_1|(_1&m).size==3&&!(_1>n)}=>5,
  }).map(&:to_s).join.to_i
}
p i.flat_map(&:digits).count{|_1|[1,4,7,8].include?_1}
p i.sum
