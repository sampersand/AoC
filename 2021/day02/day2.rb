# note that `aim` in part 2 is simply the depth from part 1
horiz = depth1 = depth2 = 0

open('day2.txt').each do |line|
  case line
  when /forward (\d+)/ then horiz += $1.to_i; depth2 += depth1 * $1.to_i
  when /down (\d+)/    then depth1 += $1.to_i
  when /up (\d+)/      then depth1 -= $1.to_i
  end
end

puts "part1: #{horiz * depth1}"
puts "part2: #{horiz * depth2}"
