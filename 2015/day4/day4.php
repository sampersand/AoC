<?php
error_reporting(E_ALL);

$input = chop(file_get_contents('day4.txt'));

$part1 = null;
$part2 = null;

for ($i=0; !isset($part1) || !isset($part2); $i++) { 
	$md5 = md5($input . $i);

	if (!isset($part1) && substr($md5, 0, 5) === '00000') {
		$part1 = $i;
	}

	if (!isset($part2) && substr($md5, 0, 6) === '000000') {
		$part2 = $i;
	}
}

echo "Part 1: $part1\nPart 2: $part2\n";
