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
	.reduce([0, 10+1i]){ |(ship, waypoint), (cmd,num)|
		case cmd
		when 'N' then waypoint += 1i*num
		when 'S' then waypoint -= 1i*num
		when 'E' then waypoint += num
		when 'W' then waypoint -= num
		when 'L' then waypoint *= 1i**(num/90)
		when 'R' then waypoint *= 1i**(-num/90)
		when 'F' then ship += num * waypoint
		end
		[ship, waypoint]
	}.first.rectangular.map(&:abs).sum.tap { puts "Part 2: #{_1}"} 
