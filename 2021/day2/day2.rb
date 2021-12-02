lines = open('day2.txt')

horiz = depth = 0

lines.each do |line|
  case line
  when /forward (\d+)/ then horiz += $1.to_i
  when /down (\d+)/    then depth += $1.to_i
  when /up (\d+)/      then depth -= $1.to_i
  end
end

puts "part1: #{horiz * depth}"

horiz = depth = aim = 0
lines.each do |line|
  case line
  when /forward (\d+)/ then horiz += $1.to_i ; depth += aim * $1.to_i
  when /down (\d+)/    then aim += $1.to_i
  when /up (\d+)/      then aim -= $1.to_i
  end
end
puts "part2: #{horiz * depth}"
