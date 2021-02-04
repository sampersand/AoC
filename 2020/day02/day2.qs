#### These will eventually be implemented in the std lib:
List.'=' = (self, rhs, scope) -> {
	scope = scope.or(:1);
	rhs = rhs.@list().clone();

	self.each({ _0.'='(rhs.shift(), scope); });
};

#### ACTUAL SOLUTION STARTS HERE

# The file to read is the first command line arg, but
# defaults to `day2.txt`.
FILE  = __args__.get(1).or("day2.txt");

lines =
	# Opens up a file
	Io.File(FILE)
	 	# Get a list of all its lines.
		.lines()
		# Apply the regex to each line, returning an array of matching groups.
		# The entire matched string is stored in index zero.
		.map(/^(\d+)-(\d+) (.): (.*)$/.match)
		# Ignore lines that don't match.
		.reject(~$empty?)
		# Convert the resulting types to usable values.
		.map(([_, min, max, chr, str],) -> {
			[str, chr, min.@num(), max.@num()]
		})
		.@list();

lines
	.count(([str, chr, min, max],) -> { str.count(chr).between?(min, max) })
	.tap(print << "Part1: ");

lines
	.count(([str, chr, min, max], ) -> { (chr == str[min - 1]) ^ (chr == str[max - 1]) })
	.tap(print << "Part2: ");
