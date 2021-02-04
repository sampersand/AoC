<?php

$file = fopen('day5.txt', 'r') or die('cant read file');

$nice1 = 0;
$nice2 = 0;

while (!feof($file)) {
	$line = fgets($file);

	if (preg_match_all('/[aeiou]/', $line) >= 3 &&
		preg_match('/(.)\1/', $line) &&
		!preg_match('/ab|cd|pq|xy/', $line)
	) {
		$nice1++;
	}

	if (preg_match('/(.)(.).*\1\2/', $line) && preg_match('/(.).\1/', $line)) {
		$nice2++;
	}
}

echo "Part 1: $nice1\nPart 2: $nice2\n";
