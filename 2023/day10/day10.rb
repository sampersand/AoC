# $stdin = open 'input.txt'
$stdin = DATA

GRID = {}

start = nil
# north: +1i, south: -1i, east: 1, west: -1
$stdin.each_with_index do |line, x|
  line.chars.each_with_index do |chr, y|
    start = x + y.i if chr == 'S'
    GRID[x + y.i] = {
      ?| => [ 1i, -1i],
      ?- => [  1, -1],
      ?L => [ 1i,  1],
      ?J => [ 1i, -1],
      ?7 => [-1i, -1],
      ?F => [-1i,  1],
      ?S => [0, 0],
    }[chr] || next
  end
end


GRID[start] = [-1i, 1] # TODO: just for the example

$map = {}
positions = GRID[start].map { start + _1 }

def traverse(pos, amnt)
  return if $map[pos] && $map[pos] < amnt
  $map[pos] = amnt
  a, b = GRID[pos]
  return if a.nil?
  traverse pos + a, amnt + 1
  traverse pos + b, amnt + 1
end

traverse start, 0

def pr_grid(grid, empty=' ')
  minx, maxx = grid.keys.map(&:real).minmax
  miny, maxy = grid.keys.map(&:imag).minmax
  (minx..maxx).each do |x|
    (miny..maxy).each do |y|
      print grid[x + y.i] || empty
    end
    puts
  end
end

# pr_grid GRID.transform_values { '%' }
pr_grid $map

=begin
__END__

loop do
  positions.each do |num|


map = {}
pos = start
GRID[start].each do |dir|
  pos += dir
  map[pos] ||= ma
end


p GRID
map['a'] = nil
p map.compact!
=end
__END__
..F7.
.FJ|.
SJ.L7
|F--J
LJ...
