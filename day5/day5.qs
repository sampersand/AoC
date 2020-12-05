#### These will eventually be implemented in the std lib:
# Reducing for Lists.
List.reduce = (self, acc, func) -> {
	unless (func) {
		:1.func = :1::acc;
		:1.acc = self[0];
	};

	self.each(n -> { :1.acc = func(acc, n) });
	acc
};

# Min and max
List.min = self -> { self.reduce { ifl (_0 < _1, _0, _1) } };
List.max = self -> { self.reduce { ifl (_0 > _1, _0, _1) } };

#### ACTUAL SOLUTION STARTS HERE
xs = Io.File('day5.txt')
	.lines()
	.reject(Text::empty?)
	.map(line -> { line.gsub(/[FL]/, '0').gsub(/[BR]/, '1').@num(2) });

print("Part 1: ", xs.max());
print("Part 2: ", (xs.min().upto(xs.max()) - xs)[0]);
