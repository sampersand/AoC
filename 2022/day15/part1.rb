require '../../../ruby/aoc-utils/grid'
require '../../../ruby/aoc-utils/rangeset'
using Aoc
include Aoc

$stdin = DATA
$stdin = open 'day15.txt'

grid = Grid.new
$stdin.each_line do |line|
  line =~ /Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)/
  sensor = Coordinate[$1.to_i, $2.to_i]
  beacon = Coordinate[$3.to_i, $4.to_i]
  grid[sensor] = beacon

end

@grid = grid

ranges = Aoc::RangeSet.new

N = 10
@grid.each do |beacon, sensor|
  diff = sensor.taxi(beacon) - (sensor.y - N).abs
  ranges |= sensor.x-diff..sensor.x+diff
end

p ranges
p ranges.count - @grid.values.uniq.count { _1.y == N }

__END__
Sensor at x=2, y=18: closest beacon is at x=-2, y=15
Sensor at x=9, y=16: closest beacon is at x=10, y=16
Sensor at x=13, y=2: closest beacon is at x=15, y=3
Sensor at x=12, y=14: closest beacon is at x=10, y=16
Sensor at x=10, y=20: closest beacon is at x=10, y=16
Sensor at x=14, y=17: closest beacon is at x=10, y=16
Sensor at x=8, y=7: closest beacon is at x=2, y=10
Sensor at x=2, y=0: closest beacon is at x=2, y=10
Sensor at x=0, y=11: closest beacon is at x=2, y=10
Sensor at x=20, y=14: closest beacon is at x=25, y=17
Sensor at x=17, y=20: closest beacon is at x=21, y=22
Sensor at x=16, y=7: closest beacon is at x=15, y=3
Sensor at x=14, y=3: closest beacon is at x=15, y=3
Sensor at x=20, y=1: closest beacon is at x=15, y=3
