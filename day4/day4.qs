Kernel.object = { {:0}() };
List.include? = (self, ele) -> { self.index(ele) != null };
List.'=' = (self, rhs, scope) -> {
	scope = scope.or(:1);
	rhs = rhs.@list().clone();

	self.each({ _0.'='(rhs.shift(), scope); });
};

#### ACTUAL SOLUTION STARTS HERE
Io.File('day4.txt')
	.lines()
	.chunk_while(Text::@bool)
	.map(lines -> {
		passport = object();

		lines.reject(Text::empty?)
			.join(' ')
			.tap_into(/\w+:[^ ]+/.scan)
			.map(line -> { line.split(':') })
			.each(passport.'.='.apply);

		passport
	})
	.tap(stream -> {
		stream.map(Pristine::__keys__)
			.map(['byr', 'ecl', 'eyr', 'hcl', 'hgt', 'iyr', 'pid'].'-')
			.select(List::empty?)
			.len()
			.tap(print << "Part 1: ")
	})
	.select(ppt -> { ppt.?byr.@num().between?(1920, 2002) })
	.select(ppt -> { ppt.?iyr.@num().between?(2010, 2020) })
	.select(ppt -> { ppt.?eyr.@num().between?(2020, 2030) })
	.select(ppt -> {
		(_, scale, unit) = ppt.?hgt.then_into(/(\d+)(cm|in)/.match).else(return);
		scale.@num().between?.apply(ifl(unit == "cm", [150, 193], [59, 76]))
	})
	.select(ppt -> { ppt.?hcl.then_into(/#[\da-f]{6}/.match?) })
	.select(ppt -> { ppt.?ecl.then_into('amb blu brn gry grn hzl oth'.split(' ').include?) })
	.select(ppt -> { ppt.?pid.then_into(/\d{9}/.match?) })
	.len()
	.tap(print << "Part 2: ");
