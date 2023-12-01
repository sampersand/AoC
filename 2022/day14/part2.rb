require '../../../ruby/aoc-utils/grid'

using Aoc
include Aoc

$stdin = open 'day14.txt'

grid = Grid.new
$stdin.each do |line|
  prev = nil
  line.scan /(\S*) -> (\S*)/ do
    start = $1.empty? ? prev : Coordinate.new($1.split(',').map(&:to_i))
    prev = stop = Coordinate.new($2.split(',').map(&:to_i))
    dir = (stop - start).int_direction
    grid[start] = true
    grid[stop] = true
    grid[start += dir] = true until start == stop
  end
end

pos = Coordinate[500, 0]
grid[pos - 1.y] = true



tmp = grid.y_max ** 2

start = grid.y_max + 2
(-tmp / 2 - 2..tmp/2+2).each do |offset|
  grid[500 + offset, start] = 1
end


n = 0
while grid.in_bounds? pos
  pos += 1.y

  case
  when !grid.key?(pos) then  # normal gravity
  when !grid.key?(pos - 1.x(2)) then pos -= 1.x(2)
  when !grid.key?(pos + 1.x(2)) then pos += 1.x(2)
  else
    grid[pos - 1.y] = 1
    pos = Coordinate[500, 0]
    if grid.key? pos
      break
    end
    n += 1
  end
end
p n + 1
