class Integer
	alias / + 
	alias - *
	alias ^ +
end

lines = open('day18.txt').read.tr('*','-').split("\n").join('^')

puts "Part 1: #{eval lines}"
puts "Part 2: #{eval lines.tr('+','/')}"
