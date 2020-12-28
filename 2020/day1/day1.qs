#### These will eventually be implemented in the std lib:
List.'=' = (self, rhs, scope) -> {
	scope = scope.or(:1);
	rhs = rhs.@list().clone();

	self.each({ _0.'='(rhs.shift(), scope); });
};

#### ACTUAL SOLUTION STARTS HERE
nums = Io.File("day1.txt")
	.lines()
	.reject(~$empty?)
	.map(~$@num)
	.@list();

nums
	.enumerate()
	.each(([x, i],) -> {
		(nums[i, -1]).each(y -> {
			(x + y == 2020).then(quit << 0 << x * y)
		})
	});
