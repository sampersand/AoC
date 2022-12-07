
# Set standard in
$stdin = open 'day7.txt'

require'pathname'

F=[]
LINES = $stdin.read.lines

def doit
  a = 0
  LINES.each do |l|
    a += doit if l =~ ''
n=Pathname'';$<.map{
  _1.chop! # todo: figure out how to remove this
  _1=~/\$ cd /&&n/=$'
  (F[n]||=[])<<(_1=~/dir /?F[n/$']:_1.to_i)
}

s=->v{Integer===v ?v:v.sum(&s)};
p [o=F.select{_1<1e5}.sum,t=F.select{F[0]-4e7<=_1}.min]

fail unless o==919137 && t==2877389
