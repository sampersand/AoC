class Integer
	alias / + 
	alias ^ +
	alias - *
end

lines = open('day18.txt', &:read).chomp.tr("*\n",'-^')

puts "Part 1: #{eval lines}"
puts "Part 2: #{eval lines.tr('+','/')}"
