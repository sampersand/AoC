extension IsBetween on num {
	bool isBetween(num lhs, num rhs) => lhs <= this && this <= rhs;
}

main() {
	var input = File("day4.txt").readAsStringSync().replaceAll(" ", "\n");
	var groups = [Map()];

	for (var line in input.split("\n")) {
		if (line.isEmpty) {
			groups.add(Map());
			continue;
		}
		
		var split = line.split(':');
		groups.last[split[0]] = split[1];
	}
	
	var part1 = 0;
	var part2 = 0;
	
	for (var group in groups) {
		group.remove("cid");

		if (group.length != 7)
			continue;

		++part1;

		if (!int.parse(group['byr']).isBetween(1920, 2002))
			continue;

		if (!int.parse(group['iyr']).isBetween(2010, 2020))
			continue;

		if (!int.parse(group['eyr']).isBetween(2020, 2030))
			continue;

		if (!['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].contains(group['ecl']))
			continue;

		if (!RegExp(r"\d{9}").hasMatch(group['pid']))
			continue;

		if (!RegExp(r"#[\da-fA-F]{6}").hasMatch(group['hcl']))
			continue;

		var m = RegExp(r"(\d+)(cm|in)").firstMatch(group['hgt']);
		if (m == null)
			continue;

		var num = int.parse(m[1]);
		if ((m[2] == 'cm' && num.isBetween(150, 193)) || (m[2] == 'in' && num.isBetween(59, 76)))
			++part2;
	}

	print("Part 1: $part1\nPart 2: $part2");
}

	
