x= y = 0;
List.'=' = (self, rhs, scope) -> {
	scope = scope.or(:1);
	rhs = rhs.@list().clone();

	self.each({ _0.'='(rhs.shift(), scope); });
};

Io.File('day1.txt')
	.read()
	.split(', ')
	.map(~$split)
	.each(((l, r),) -> {
		print(l);
	});
