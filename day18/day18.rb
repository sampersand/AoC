class Integer
	alias / + 
	alias - *
end

lines = open('day18.txt').each_line.map(&:chomp).tr('*','-')

puts "Part 1: #{lines.map { eval _1 }.sum}"
puts "Part 2: #{lines.map { eval _1.tr('+','/') }.sum}"
