#### These will eventually be implemented in the std lib:

# Min and max
List.min = self -> { self.fold { ifl (_0 < _1, _0, _1) } };
List.max = self -> { self.fold { ifl (_0 > _1, _0, _1) } };

#### ACTUAL SOLUTION STARTS HERE
xs = Io.File('day5.txt')
	.lines()
	.reject(Text::empty?)
	.map(line -> { line.gsub(/[FL]/, '0').gsub(/[BR]/, '1').@num(2) })
	.@list();

print("Part 1: ", xs.max());
print("Part 2: ", (xs.min().upto(xs.max()) - xs)[0]);
