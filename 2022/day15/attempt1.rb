require 'set'

$stdin = open 'day15.txt'
# $stdin = DATA

cannot_be = Set[]
beacons = Set[]

$stdin.each_line do |line|
  line =~ /Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)/
  sensor = $1.to_i + $2.to_i.i
  beacon = $3.to_i + $4.to_i.i
  beacons.add beacon
  dist = (sensor.real - beacon.real).abs + (sensor.imag - beacon.imag).abs
  p dist
  (-dist..dist).each do |x|
    diff = (dist - x.abs)
    (-diff..diff).each do |y|
      cannot_be.add sensor + x + y.i
    end
  end
end

exit

amnt = 0
Range.new(*cannot_be.map(&:real).minmax).each do |x|
  amnt += 1 if cannot_be.include? x + 10i and !beacons.include? x+10i
end
p amnt

__END__
Sensor at x=8, y=7: closest beacon is at x=2, y=10
Sensor at x=2, y=18: closest beacon is at x=-2, y=15
Sensor at x=9, y=16: closest beacon is at x=10, y=16
Sensor at x=13, y=2: closest beacon is at x=15, y=3
Sensor at x=12, y=14: closest beacon is at x=10, y=16
Sensor at x=10, y=20: closest beacon is at x=10, y=16
Sensor at x=14, y=17: closest beacon is at x=10, y=16
Sensor at x=2, y=0: closest beacon is at x=2, y=10
Sensor at x=0, y=11: closest beacon is at x=2, y=10
Sensor at x=20, y=14: closest beacon is at x=25, y=17
Sensor at x=17, y=20: closest beacon is at x=21, y=22
Sensor at x=16, y=7: closest beacon is at x=15, y=3
Sensor at x=14, y=3: closest beacon is at x=15, y=3
Sensor at x=20, y=1: closest beacon is at x=15, y=3
