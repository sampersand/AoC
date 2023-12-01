require '../../../ruby/aoc-utils/grid'
require '../../../ruby/aoc-utils/rangeset'
using Aoc
include Aoc

$stdin = DATA
$stdin = open 'day15.txt'

grid = Grid.new
$stdin.each_line do |line|
  line =~ /Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)/ or break
  sensor = Coordinate[$1.to_i, $2.to_i]
  beacon = Coordinate[$3.to_i, $4.to_i]
  grid[sensor] = beacon
end

@grid = grid

MIN = 0
MAX = 4000000
ranges = Array.new(MAX+1) { RangeSet.new }

# grid2 = grid.dup
@grid.each do |beacon, sensor|
  taxi = sensor.taxi beacon
  (-taxi..taxi).each do |y|
    next unless (MIN..MAX).include? sensor.y + y 
    diff = (taxi - y.abs).abs
    range = (sensor.x-diff).clamp(MIN, MAX)..(sensor.x+diff).clamp(MIN, MAX)
#     p range
# puts grid2.to_s_clean(translate: ->x{x.is_a?(Coordinate) ? 'C' : x.to_s})
    # range.each do |x|
    #   grid2[x, sensor.y + y] ||= 1
    # end

    ranges[sensor.y + y].add! range
  end
end
# puts grid2.to_s_clean(translate: ->x{x.is_a?(Coordinate) ? 'C' : x.to_s})
bounds = RangeSet.new MIN..MAX
p ranges.each_with_index.find { _2; _1 != bounds  }

# [RangeSet(3403961..4000000 | 0..3403959), 3289729]
p 3403960 * 4000000 + 3289729

__END__
Sensor at x=13, y=2: closest beacon is at x=15, y=3
Sensor at x=2, y=18: closest beacon is at x=-2, y=15
Sensor at x=9, y=16: closest beacon is at x=10, y=16
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
