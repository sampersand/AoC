#### These will eventually be implemented in the std lib:
# Destructuring for Lists
List.'=' = (self, rhs, scope) -> {
	scope = scope.or(:1);
	rhs = rhs.@list().clone();

	self.each({ _0.'='(rhs.shift(), scope); });
};



#### ACTUAL SOLUTION STARTS HERE
lines = Io.File('day3.txt')
	.lines()
	.reject(~$empty?)
	.@list();

[[1,1], [3,1], [5,1], [7,1], [1,2]]
	.map( ([right, down],) -> {
		lines
			.enumerate()
			.reject( ([_, idx],) -> { (idx + 1) % down } )
			.select( ([line, idx],) -> { '#' == line[(idx * right) % line.len()] } )
			.len()
			.tap(count -> { (right == 3).then(print << "Part 1: " << count) })
	})
	.prod()
	.tap(print << "Part 2: ")
