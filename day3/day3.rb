lines = open('day3.txt')
	.each_line
	.map(&:chomp)
	.drop(1)

[[1,1], [3,1], [5,1], [7,1], [1,2]]
	.map do |r, d|
		idx = 0
		lines
			.lazy
			.each_slice(d)
			.map(&:first)
			.count { _1[(idx += r) % _1.length] == '#' }
	end
	.reduce(&:*)
	.tap { puts "Part 1/2: #{_1}"  }
