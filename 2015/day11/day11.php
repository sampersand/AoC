<?php
$input = chop(file_get_contents('day11.txt'));

function has_straight(string $x) {
	return preg_match(
		'/abc|bcd|cde|def|efg|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz/',
		$x
	);
}

function has_diff(string $x): bool {
	return preg_match('/(.)\1.*?(.)\2/', $x);
}

function next_password($input) {
	while (1) {
		$input = strtr($input, 'lio', 'mjp');

		if (!has_diff($input)) {
			while (!has_diff($input))
				++$input;
			continue;
		}

		if (!has_straight($input)) {
			while (!has_straight($input))
				++$input;
			continue;
		}

		return $input;
	}
}

$part1 = next_password($input);
$tmp = $part1;
++$tmp;
$part2 = next_password($tmp);
echo "Part 1: $part1\nPart 2: $part2\n";
