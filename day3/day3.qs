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
