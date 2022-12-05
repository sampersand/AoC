$stdin = open 'input.txt'

part = part2 = 0
$stdin.each do |line|
  x, y = line.split(',').map { |part| eval part.sub('-', '..') }

  part += 1 if x.cover?(y) || y.cover?(x)
  part2 += 1 unless (x.to_a & y.to_a).empty?
end

puts [part, part2]
