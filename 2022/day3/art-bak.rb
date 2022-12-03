$stdin = open 'day3.txt'

lines = $stdin.map(&:chars)
r = ->a,b=0{[?1,*?a..?z,*?A..?Z].index a}
t = lines.each_slice(3).sum { r[*_1.reduce(:&)] }
o = lines.sum{r[*_1&_1.slice!(..._1.size/2)]}

part1 = lines.sum { |items| 
  first = items[...items.size/2]
  second = items[items.size/2..]
  common_item = (first & second)[0]
  prioritize(common_item)
}

__END__



##################
##################
##################
##################
