
###       #
####    ###
###### #####    
#############  ##
#################
################
__END__

$stdin = open('day9.txt')
H={}

$<.zip(0..){|l,x|l[..-2].chars.zip(0..){|c,y|c==?9||H[x+y.i]=c.to_i}}
A=->z{[z-1,z+1,z+1i,z-1i].select &H}
B=->x,f{A[x].reject(&f[x]=f).map{B[_1,f]};f.size}
l=H.select{_2<A[_1].map(&H).min}.keys

puts "part1: #{l.sum &H}"
puts "part2: #{l.map{B[_1,{}]}.max(3).reduce:*}"
