$stdin=open('day4.txt') # omit if reading from stdin

require'set'
$/=""
N=gets.split(',').map &:to_i
G=$<.map{|l|g=l.split("\n").map{
  _1.split.map &:to_i};[*g,*g.transpose].map &:to_set
}

o=p;s=Set.new
N.map{|n|
  s<<n
  G.reject!{|g|
    g.none?{s>=_1}&&next
    s=n*(g.reduce(&:|)-s).sum
    G.one?&&puts"p2: #{s}";o||puts"p1: #{s}"
    o=1
  }
}
