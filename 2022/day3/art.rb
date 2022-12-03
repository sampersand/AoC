$stdin = open 'day3.txt'

data = $stdin.map(&:chars)
r = ->a,b=0{[?1,*?a..?z,*?A..?Z].index a}
t = data.each_slice(3).sum { r[*_1.reduce(:&)] }
o = data.sum{r[*_1&_1.slice!(..._1.size/2)]}

__END__

########
###########
########  
########
########
########
########
