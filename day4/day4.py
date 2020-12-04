import sys, itertools, re

file = 'day4.txt' if len(sys.argv) < 2 else sys.argv[1]
part1 = 0
part2 = 0

with open(file) as f:
	acc = {}
	for line in itertools.chain(map(str.strip, f), ['']):
		if line:
			acc.update(ele.split(':') for ele in line.split(' '))
			continue

		passport, acc = acc, {}

		if {'pid', 'hgt', 'ecl', 'byr', 'eyr', 'iyr', 'hcl'} - set(passport):
			continue

		part1 += 1

		if int(passport['byr']) not in range(1920, 2004):
			continue

		if int(passport['iyr']) not in range(2010, 2021):
			continue

		if int(passport['eyr']) not in range(2020, 2031):
			continue

		if passport['ecl'] not in {'amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'}:
			continue

		if not re.match(r'\d{9}', passport['pid']):
			continue

		if not re.match(r'#[\da-fA-F]', passport['hcl']):
			continue

		m = re.match(r'(\d+)(cm|in)', passport['hgt'])
		if m and int(m[1]) in (range(150, 194) if m[2] == 'cm' else range(59, 77)):
			part2 += 1

print('Part 1:', part1)
print('Part 2:', part2)
