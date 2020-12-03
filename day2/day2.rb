lines = open('day2.txt')
  .each_line
  .map { |line| line =~ /^(\d+)-(\d+) (.): / and [$', $3, $1.to_i, $2.to_i] }
  .compact

part1 = lines.count { |str, chr, min, max| (min..max).include? str.count(chr) }
part2 = lines.count { |str, chr, min, max| (str[min - 1] == chr) ^ (str[max - 1] == chr) }

puts "Part1: #{part1}"
puts "Part1: #{part2}"
