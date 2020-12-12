DATA
	.map { [_1.slice!(0), _1.to_i] }
	.reduce([0+0i, 10+1i]){ |(c, n), (ship, waypoint)|
		p [c, o]
		case c
		when 'N' then waypoint += 1i*n
		when 'S' then waypoint -= 1i*n
		when 'E' then waypoint += n
		when 'W' then waypoint -= n
		when 'L' then waypoint = waypoint.rect.
		when 'R' then o[1] -= n/90
		when 'F' then o[0] += n*(1i)**o[1]
		end
		[ship, waypoint]
	}.first.rectangular.map(&:abs).sum.display
__END__
F10
N3
F7
R90
F11
