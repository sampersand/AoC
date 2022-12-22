require_relative '../submitter'
require 'set'
require 'matrix'
$stdin = open 'day18.txt'

NEIGHBORS = [
  [ 1, 0, 0], [0,  1, 0], [0, 0,  1],
  [-1, 0, 0], [0, -1, 0], [0, 0, -1],
]

LAVA = $stdin.each_line.map { _1.split(',').map(&:to_i) }.to_set

minx,maxx = LAVA.map{_1[0]}.minmax
miny,maxy = LAVA.map{_1[1]}.minmax
minz,maxz = LAVA.map{_1[2]}.minmax

ALL = [*minx..maxx].product([*miny..maxy],[*minz..maxz]).map{ _1 }

def neighbors(v)
  NEIGHBORS.filter_map{ ALL.include?(x = _1 + v) && x  }
end

p neighbors LAVA.to_a.first
exit
# inc = LAVA.method(:include?)
p1 = LAVA.flat_map { neighbors(_1).reject(&inc) }

p p1
exit
found = [*minx..maxx].product([miny,maxy],[minz,maxz]).map{[*_1]} + 
  [*miny..maxy].product([minx,maxx],[minz,maxz]).map{[_2,_1,_3]} + 
  [*minz..maxz].product([minx,maxx],[miny,maxy]).map{[_2,_3,_1]}

while (t = found.flat_map { [_1, *neighbors(_1)] }.reject { LAVA.include? _1 }.to_set) != found
  p found.count
  found = t
end

p q
p LAVA.flat_map { neighbors _1 }.reject { LAVA.include? _1 }.count - 
  q.flat_map { neighbors _1 }.select { LAVA.include? _1 }.count
# p (all.to_a - found.to_a - lava.to_a).count
#lava.to_a
=begin
outer = [*minx..maxx].product([miny,maxy],[minz,maxz]) + 
  [*miny..maxy].product([minx,maxx],[minz,maxz]).map{[_2,_1,_3]} + 
  [*minz..maxz].product([minx,maxx],[miny,maxy]).map{[_2,_3,_1]}

while (t = outer.flat_map { neighbors _1 }.reject { lava.include? _1 }.select{
  (minx..maxx).include?(_1) && (miny..maxy).include?(_2) && (minz..maxz).include?(_3)
}.uniq) != outer
  p outer.count
  outer = t
end
# p [*min_x..max_x].product([*min_y..max_y],[*min_z..max_z]).select { |p|
#   neighbors(p).any? { lava.include? _1 }
# }.include? [2,2,5] #- p1 - lava.to_a
=end
__END__
2,2,2
1,2,2
3,2,2
2,1,2
2,3,2
2,2,1
2,2,3
2,2,4
2,2,6
1,2,5
3,2,5
2,1,5
2,3,5
