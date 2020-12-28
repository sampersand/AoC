<?php
error_reporting(E_ALL);

$input = preg_replace('/\s+/', '', file_get_contents('day1.txt'));


// print $input;
$part1 = 0;
$part2 = null;

for ($i=0; $i < strlen($input); $i++) { 
	if ($input[$i] == '(') {
		++$part1;
	} elseif (--$part1 < 0 && is_null($part2)) {
		$part2 = $i + 1;
	}
}

echo "Part 1: $part1\nPart 2: $part2\n";
