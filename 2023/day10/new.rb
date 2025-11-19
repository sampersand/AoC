require_relative '../utils2/grid'
include Aoc

# $stdin = open 'input.txt'
$stdin = DATA

GRID = Grid.new

start = nil
# north: +1i, south: -1i, east: 1, west: -1
$stdin.each_with_index do |line, x|
  line.chars.each_with_index do |chr, y|
    point = Point.new x, y
    start = point if chr == 'S'
    GRID[point] = {
      ?| => [Point2D::NORTH, Point2D::SOUTH],
      ?- => [Point2D::WEST,  Point2D::EAST],
      ?L => [Point2D::NORTH, Point2D::EAST],
      ?J => [Point2D::NORTH, Point2D::WEST],
      ?7 => [Point2D::SOUTH, Point2D::WEST],
      ?F => [Point2D::SOUTH, Point2D::EAST],
      ?S => [Point2D::ORIGIN, Point2D::ORIGIN],
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
