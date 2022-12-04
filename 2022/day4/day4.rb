$stdin = open 'day4.txt'

p1 = p2 = 0
$stdin.each do |line|
  x, y = line.split(',').map { |part| eval part.sub('-', '..') }

  p1 += 1 if x.cover?(y) || y.cover?(x)
  p2 += 1 unless (x.to_a & y.to_a).empty?
end

puts [p1, p2]
