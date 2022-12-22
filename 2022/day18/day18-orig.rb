require_relative '../submitter'
require 'set'
$stdin = open 'day18.txt'

def neighbors((x,y,z))
  [[x-1,y,z],[x+1,y,z],[x,y-1,z],[x,y+1,z],[x,y,z-1],[x,y,z+1]]
  # (l=*-1..1).product(l, l).reject { _1.uniq == [0] }.map { [_1+x, _2+y, _3+z] }
end

lava = $stdin.each_line.map { _1.split(',').map(&:to_i) }.to_set
p lava.flat_map { neighbors _1 }.reject { lava.include? _1 }.count
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
