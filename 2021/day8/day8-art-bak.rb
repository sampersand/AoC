$stdin=open('day8.txt')

require'set'
F=->l,&b{l.find &b}
S=->l,o{
  l=l.group_by &:size
  o.map(&{
    n=l[2][0]=>1,
    m=l[4][0]=>4,
    l[3][0]=>7,
    l[7][0]=>8,
    F[l[6]]{|_1|!(_1>n)}=>6,
    F[l[6]]{|_1|_1>m}=>9,
    F[l[6]]{|_1|_1>n&&!(_1>m)}=>0,
    F[l[5]]{|_1|_1>n}=>3,
    F[l[5]]{|_1|(_1&m).size==2}=>2,
    F[l[5]]{|_1|(_1&m).size==3&&!(_1>n)}=>5,
  }).map(&:to_s).join.to_i
}
i = $<.map{|x|S[*x.chomp.split(?|).map{|x|x.split.map{|_1|_1.chars.to_set}}]}
p i.flat_map(&:digits).count{|_1|[1,4,7,8].include?_1}
p i.sum
