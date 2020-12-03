# Helper method until i get patterns working
List.countx = (self, fn) -> { self.count(fn.apply) };
List.mapx   = (self, fn) -> { self.map(fn.apply) };

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
		.reject(List::empty?)
		# Convert the resulting types to usable values.
		.mapx((_, min, max, chr, str) -> {
			[str, chr, min.@num(), max.@num()]
		});

lines
	.countx((str, chr, min, max) -> {
		str.count(chr).between?(min, max)
	})
	.tap(print << "Part1: ");

lines
	.countx((str, chr, min, max) -> {
		(str.get(min - 1) == chr) ^ (str.get(max - 1) == chr)
	})
	.tap(print << "Part2: ");
