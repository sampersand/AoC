List.include? = (self, ele) -> { self.index(ele) != null };
List.'=' = (self, rhs, scope) -> {
	scope = scope.or(:1);
	rhs = rhs.@list().clone();

	self.each({ _0.'='(rhs.shift(), scope); });
};

Io.File('day4.txt')
	.lines()
	.chunk_while(Text::@bool)
	.map(lines -> {
		passport = :0;
		/\w+:[^ ]+/
			.scan(lines.reject(Text::empty?).join(' '))
			.map({ _0.split(':') })
			.each({ passport.(_0[0]) = _0[1] });
		:0
	})
	.tap(stream -> {
		stream.map(Pristine::__keys__)
			.map({ ['byr', 'ecl', 'eyr', 'hcl', 'hgt', 'iyr', 'pid'] - _0 })
			.select(List::empty?)
			.len()
			.tap(print << "Part 1: ")
	})
	.select({ _0.?byr.or(0).@num().between?(1920, 2002) })
	.select({ _0.?iyr.or(0).@num().between?(2010, 2020) })
	.select({ _0.?eyr.or(0).@num().between?(2020, 2030) })
	.select(pp -> {
		(_, scale, unit) = pp.?hgt.then_into(/(\d+)(cm|in)/.match).else(return);
		scale.@num().between?.apply(ifl(unit == "cm", [150, 193], [59, 76]))
	})
	.select({ _0.?hcl.then_into(/#[\da-f]{6}/.match?) })
	.select({ _0.?ecl.then_into(['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include?) })
	.select({ _0.?pid.then_into(/\d{9}/.match?) })
	.len()
	.tap(print << "Part 2: ");
