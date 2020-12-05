# NOT idiomatic Perl.
# I just wanted to see how asinine I could make it.
open STDIN, 'day4.txt';

$/='';
$"='|';

for (<>) {
	s/cid:\S+//;

	7 == split or next;
	$part1++;

	$part2++ if (join "", sort split) =~ /
		byr:(@{[1920..2002]})
		ecl:(amb|blu|brn|gr[yn]|hzl|oth)
		eyr:20(2\d|30)
		hcl:\#[0-9a-fA-F]{6}
		hgt:((@{[150..193]})cm|(@{[59..76]})in)
		iyr:20(1\d|20)
		pid:\d{9}
	/x;
}

print <<EOS
Part 1: $part1
Part 2: $part2
EOS
