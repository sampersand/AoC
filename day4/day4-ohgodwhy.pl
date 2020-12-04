open STDIN, 'day4.txt';
$/='';
$"='|';

for (<>) {
	chomp;
	tr/: \n/  /;

	%_=split;
	delete $_{cid};

	next unless 7 == keys %_;
	++$part1;

	++$part2 if /byr (?:@{[1920..2002]})/ &&
	            /iyr (?:@{[2010..2020]})/ &&
	            /eyr (?:@{[2020..2030]})/ &&
	            /ecl (?:amb|blu|brn|gry|grn|hzl|oth)/ &&
	            /pid \d{9}/ &&
	            /hcl #[\da-f]/i &&
	            /hgt (?:(?:@{[150..193]})cm|(?:@{[59..76]})in)/;
}

print <<EOS
Part 1: $part1
Part 2: $part2
EOS
