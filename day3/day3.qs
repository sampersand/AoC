#### These will eventually be implemented in the std lib:
# Destructuring for Lists
List.'=' = (self, rhs, scope) -> {
	scope = scope.or(:1);
	rhs = rhs.@list().clone();

	self.each({
		value = if (_0.get(0) == '*', { _0.shift(); rhs }, rhs.shift);
		_0.'='(value, scope);
	});
};

# Reducing for Lists.
List.reduce = (self, func) -> {
	self = self.clone();
	acc = self.shift();
	self.each(n -> { :1.acc = func(acc, n) });
	acc
};

#### ACTUAL SOLUTION STARTS HERE
lines = Io.File('day3.txt')
	.lines()
	.reject(Text::empty?);

[[1,1], [3,1], [5,1], [7,1], [1,2]]
	.map([(right, down)] -> {
		lines
			.enumerate((line, idx) -> { [line, idx] })
			.reject( ([_, idx],) -> { (idx + 1) % down })
			.select( ([line, idx],) -> { '#' == line[(idx * right) % line.len()] })
			.len()
			.tap(count -> { (right == 3).then(print << "Part 1: " << count) })
	})
	.reduce(Number::'*')
	.tap(print << "Part 2: ")

##__EOF__##
90
Part 1: 244
244
97
92
49
Part 2: 9602580960

List.selectx = (self, fn) -> { self.select(fn.apply) };
List.rejectx = (self, fn) -> { self.reject(fn.apply) };
List.countx  = (self, fn) -> { self.count(fn.apply) };
List.mapx    = (self, fn) -> { self.map(fn.apply) };
List.eachx   = (self, fn) -> { self.each(fn.apply) };

lines = Io.File('day3.txt').lines().select(Text::@bool).get(1, -1);

[[1,1], [3,1], [5,1], [7,1], [1,2]]
	.mapx((right, down) -> {
		lines
			.enumerate({ __args__ })
			.eachx((_, idx) -> { idx += 1 })
			.rejectx((_, idx) -> { idx % down })
			.selectx((line, idx) -> { '#' == line[(idx * right) % line.len()] })
			.len()
			.tap(self -> { (right == 3).then(print << "Part 1: " << self) })
	})
	# .reduce(Number::'*')
	.tap(print << "Part 2: ")
