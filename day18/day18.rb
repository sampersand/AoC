class Integer
	alias / + 
	alias - *
end

lines = open('day18.txt').read.tr('*','-').lines

puts "Part 1: #{lines.map { eval _1 }.sum}"
puts "Part 2: #{lines.map { eval _1.tr('+','/') }.sum}"
