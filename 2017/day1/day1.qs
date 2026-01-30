# TO IMPLEMENT IN THE STDLIB
List.'=' = (self, rhs, scope) -> {
	scope = scope.or(:1);
	rhs = rhs.@list().clone();

	self.each({ _0.'='(rhs.shift(), scope); });
};

# SOLUTION
Iterable.aoc2017day1 = self -> {
	self
		.select({ _0.reduce(~$==) })
		.map(~$first)
		.map(~$@list)
		.reduce(~$+)
		.sum()
};

list = Io.File('input.txt')
	.read()
	.strip()
	.map(~$@num)
	.@list();


(list + [list[-1]])
	.windows(2)
	.aoc2017day1()
	.tap(print << "Part 1: ");

list
	.enumerate()
	.map([[num, idx]] -> { [num, list[(idx + list.len() / 2) % list.len()]] })
	.aoc2017day1()
	.tap(print << "Part 2: ");


