<?php
$input = intval(file_get_contents('day10.txt'));

ini_set('memory_limit','16G'); // lol.

$part1 = $part2 = null;

for ($i=0; $i < 50; $i++) { 
	preg_match_all('/(.)\1*/', $input, $matches) or die("whoops didnt match");

	$input = join(array_map(function ($l) { return strlen($l) . $l[0]; }, $matches[0]));

	if ($i == 39) {
		$part1 = strlen($input);
	}
}

$part2 = strlen($input);

echo "Part 1: $part1\nPart 2: $part2\n";

