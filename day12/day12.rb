LINES = open('day12.txt').map { [_1.slice!(0), _1.to_i] }

LINES
	.each_with_object([0, 0]){ |(c, n), o|
		case c
		when 'N' then o[0] += 1i*n
		when 'S' then o[0] -= 1i*n
		when 'E' then o[0] += n
		when 'W' then o[0] -= n
		when 'L' then o[1] += n/90
		when 'R' then o[1] -= n/90
		when 'F' then o[0] += n*(1i)**o[1]
		end
	}.first.rectangular.map(&:abs).sum.tap { puts "Part 1: #{_1}" }

LINES
	.each_with_object([10+1i,0]){ |(c,n), o|
		case c
		when 'N' then o[0] += 1i*n
		when 'S' then o[0] -= 1i*n
		when 'E' then o[0] += n
		when 'W' then o[0] -= n
		when 'L' then o[0] *= 1i**(n/90)
		when 'R' then o[0] *= 1i**(-n/90)
		when 'F' then o[1] += n * o[0]
		end
	}.last.rectangular.map(&:abs).sum.tap { puts "Part 2: #{_1}"} 
