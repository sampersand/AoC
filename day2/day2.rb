lines = open('day2.txt').each_line
  .map { _1 =~ /^(\d+)-(\d+) (.): / and [$', $3, $1.to_i, $2.to_i] }
  .compact

part1 = lines.count { (_3.._4).include? _1.count(_2) }
part2 = lines.count { (_1[_3 - 1] == _2) ^ (_1[_4 - 1] == _2) }

puts "Part1: #{part1}"
puts "Part1: #{part2}"
